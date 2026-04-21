<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class SyncLanguagePhrases extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'language:sync-phrases
                            {--path=* : Paths to scan (default: resources/views)}
                            {--language=* : Specific language names to sync (default: all non-English)}
                            {--seed-pt-br-home : Seed PT-BR translations for critical HOME phrases}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Synchronize get_phrase()/t() keys from source files to language_phrases.';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $scanPaths = $this->resolveScanPaths($this->option('path'));
        if (empty($scanPaths)) {
            $this->error('No valid paths to scan.');
            return self::FAILURE;
        }

        $phrases = $this->collectPhrasesFromPaths($scanPaths);
        if (empty($phrases)) {
            $this->warn('No get_phrase()/t() keys found in the scanned paths.');
            return self::SUCCESS;
        }

        $englishLanguageId = $this->ensureLanguageId('english');
        $englishPhraseMap = $this->syncEnglishPhrases($englishLanguageId, $phrases);

        $targetLanguageIds = $this->resolveTargetLanguageIds($this->option('language'), $englishLanguageId);
        $syncedPerLanguage = [];

        foreach ($targetLanguageIds as $languageName => $languageId) {
            $insertedCount = $this->syncLanguagePhrases($languageId, $phrases, $englishPhraseMap);
            $syncedPerLanguage[$languageName] = $insertedCount;
        }

        $seededPtBrCount = 0;
        if ($this->option('seed-pt-br-home')) {
            $ptBrLanguageId = $this->ensureLanguageId('pt-br');
            $seededPtBrCount = $this->seedPtBrHomePhrases($ptBrLanguageId);
        }

        $this->line('');
        $this->info('Language sync completed.');
        $this->line('Scanned files: ' . count($scanPaths));
        $this->line('Detected phrases: ' . count($phrases));
        $this->line('Languages synced: ' . count($targetLanguageIds));

        foreach ($syncedPerLanguage as $languageName => $insertedCount) {
            $this->line("- {$languageName}: {$insertedCount} new phrase(s)");
        }

        if ($this->option('seed-pt-br-home')) {
            $this->line("PT-BR HOME seed updated: {$seededPtBrCount} phrase(s)");
        }

        return self::SUCCESS;
    }

    /**
     * @param array<int, string> $pathsOption
     * @return array<int, string>
     */
    private function resolveScanPaths(array $pathsOption): array
    {
        $requestedPaths = empty($pathsOption) ? ['resources/views'] : $pathsOption;
        $resolvedPaths = [];

        foreach ($requestedPaths as $path) {
            $normalizedPath = trim((string) $path);
            if ($normalizedPath === '') {
                continue;
            }

            $absolutePath = $this->isAbsolutePath($normalizedPath)
                ? $normalizedPath
                : base_path($normalizedPath);

            if (! File::exists($absolutePath)) {
                $this->warn("Skipping missing path: {$normalizedPath}");
                continue;
            }

            $resolvedPaths[] = $absolutePath;
        }

        return array_values(array_unique($resolvedPaths));
    }

    private function isAbsolutePath(string $path): bool
    {
        return (bool) preg_match('/^(?:[A-Za-z]:\\\\|\/|\\\\\\\\)/', $path);
    }

    /**
     * @param array<int, string> $paths
     * @return array<int, string>
     */
    private function collectPhrasesFromPaths(array $paths): array
    {
        $phrases = [];

        foreach ($paths as $path) {
            $files = File::isDirectory($path) ? File::allFiles($path) : [new \SplFileInfo($path)];

            foreach ($files as $file) {
                if (! $file->isFile()) {
                    continue;
                }

                $extension = strtolower($file->getExtension());
                if (! in_array($extension, ['php', 'blade.php'], true) && ! str_ends_with(strtolower($file->getFilename()), '.blade.php')) {
                    continue;
                }

                $content = File::get($file->getPathname());
                foreach ($this->extractPhrases($content) as $phrase) {
                    if ($phrase !== '') {
                        $phrases[$phrase] = $phrase;
                    }
                }
            }
        }

        ksort($phrases);
        return array_values($phrases);
    }

    /**
     * @return array<int, string>
     */
    private function extractPhrases(string $content): array
    {
        $results = [];
        $patterns = [
            "/\\b(?:get_phrase|t)\\(\\s*'((?:\\\\\\\\'|[^'])*)'/s",
            '/\\b(?:get_phrase|t)\\(\\s*"((?:\\\\\\\\"|[^"])*)"/s',
        ];

        foreach ($patterns as $pattern) {
            if (preg_match_all($pattern, $content, $matches)) {
                foreach ($matches[1] as $rawPhrase) {
                    $decoded = str_replace(
                        ["\\\\'", '\\"', '\\\\'],
                        ["'", '"', '\\'],
                        (string) $rawPhrase
                    );
                    $decoded = trim($decoded);
                    if ($decoded !== '') {
                        $results[] = $decoded;
                    }
                }
            }
        }

        return $results;
    }

    private function ensureLanguageId(string $language): int
    {
        $languageId = language_id_by_name($language);
        if ($languageId) {
            return (int) $languageId;
        }

        $normalizedLanguage = normalize_language_name($language);
        return (int) DB::table('languages')->insertGetId([
            'name' => $normalizedLanguage,
            'direction' => 'ltr',
            'created_at' => now(),
        ]);
    }

    /**
     * @param array<int, string> $phrases
     * @return array<string, string>
     */
    private function syncEnglishPhrases(int $englishLanguageId, array $phrases): array
    {
        $existingEnglish = DB::table('language_phrases')
            ->where('language_id', $englishLanguageId)
            ->pluck('translated', 'phrase')
            ->toArray();

        $newRows = [];
        foreach ($phrases as $phrase) {
            if (! array_key_exists($phrase, $existingEnglish)) {
                $newRows[] = [
                    'language_id' => $englishLanguageId,
                    'phrase' => $phrase,
                    'translated' => $phrase,
                ];
                $existingEnglish[$phrase] = $phrase;
            }
        }

        if (! empty($newRows)) {
            foreach (array_chunk($newRows, 300) as $chunk) {
                DB::table('language_phrases')->insert($chunk);
            }
        }

        return $existingEnglish;
    }

    /**
     * @param array<int, string> $languageOptions
     * @return array<string, int>
     */
    private function resolveTargetLanguageIds(array $languageOptions, int $englishLanguageId): array
    {
        $targetLanguageIds = [];

        if (! empty($languageOptions)) {
            foreach ($languageOptions as $languageOption) {
                $normalizedLanguage = normalize_language_name($languageOption);
                $languageId = $this->ensureLanguageId($normalizedLanguage);
                if ($languageId === $englishLanguageId) {
                    continue;
                }
                $targetLanguageIds[$normalizedLanguage] = $languageId;
            }

            return $targetLanguageIds;
        }

        $languages = DB::table('languages')->select('id', 'name')->get();
        foreach ($languages as $language) {
            $normalizedLanguage = normalize_language_name($language->name);
            if ((int) $language->id === $englishLanguageId || $normalizedLanguage === 'english') {
                continue;
            }

            $targetLanguageIds[$normalizedLanguage] = (int) $language->id;
        }

        return $targetLanguageIds;
    }

    /**
     * @param array<int, string> $phrases
     * @param array<string, string> $englishPhraseMap
     */
    private function syncLanguagePhrases(int $languageId, array $phrases, array $englishPhraseMap): int
    {
        $existingPhrases = DB::table('language_phrases')
            ->where('language_id', $languageId)
            ->pluck('phrase')
            ->toArray();

        $existingLookup = array_fill_keys($existingPhrases, true);
        $newRows = [];

        foreach ($phrases as $phrase) {
            if (! isset($existingLookup[$phrase])) {
                $newRows[] = [
                    'language_id' => $languageId,
                    'phrase' => $phrase,
                    'translated' => $englishPhraseMap[$phrase] ?? $phrase,
                ];
            }
        }

        if (! empty($newRows)) {
            foreach (array_chunk($newRows, 300) as $chunk) {
                DB::table('language_phrases')->insert($chunk);
            }
        }

        return count($newRows);
    }

    private function seedPtBrHomePhrases(int $ptBrLanguageId): int
    {
        $ptBrHomePhrases = [
            'The Leader in online learning' => 'A lider em aprendizado online',
            "Start learning from the world's pro" => 'Comece a aprender com os melhores',
            'instructors' => 'instrutores do mundo',
            "Start learning from the world's pro instructors" => 'Comece a aprender com os melhores instrutores do mundo',
            'We invites learners to explore courses designed by industry experts, offering cutting-edge content for skill development.' => 'Convidamos os alunos a explorar cursos criados por especialistas do setor, com conteudo de ponta para o desenvolvimento de habilidades.',
            'Get Started' => 'Comecar agora',
            'Learn More' => 'Saiba Mais',
            'Our Blog' => 'Nosso Blog',
            'Have a look on our news' => 'Confira nossas novidades',
            'Testimonial' => 'Depoimentos',
            'What our clients says about us' => 'O que nossos clientes dizem sobre nos',
            'Enter a title' => 'Digite um titulo',
            'Enter a video url' => 'Digite a URL do video',
            'e.g. 40.689880, -74.045203' => 'ex.: 40.689880, -74.045203',
            'Canonical Url' => 'URL canonica',
            'Custom Url' => 'URL personalizada',
            'Meta keywords' => 'Palavras-chave meta',
            'e.g. https://example.com/courses' => 'ex.: https://example.com/courses',
            'e.g. https://example.com/dresses/courses' => 'ex.: https://example.com/dresses/courses',
            'smtp or ssmtp or mail' => 'smtp ou ssmtp ou mail',
            'ssl or tls' => 'ssl ou tls',
        ];

        $updatedCount = 0;
        foreach ($ptBrHomePhrases as $phrase => $translated) {
            // Keep case variants aligned because legacy rows may exist with different casing.
            DB::table('language_phrases')
                ->where('language_id', $ptBrLanguageId)
                ->whereRaw('LOWER(phrase) = LOWER(?)', [$phrase])
                ->update(['translated' => $translated]);

            DB::table('language_phrases')->updateOrInsert(
                ['language_id' => $ptBrLanguageId, 'phrase' => $phrase],
                ['translated' => $translated]
            );
            $updatedCount++;
        }

        return $updatedCount;
    }
}
