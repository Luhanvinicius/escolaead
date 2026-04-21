<?php

namespace App\Http\Controllers\frontend;

use App\Http\Controllers\Controller;
use App\Models\Language;
use Illuminate\Http\Request;

class LanguageController extends Controller
{
    public function select_lng(Request $request, $language = null)
    {
        $requestedLanguage = $language ?? $request->query('language', $request->input('language'));
        $normalizedLanguage = normalize_language_name($requestedLanguage);

        $languageExists = false;
        foreach (language_name_candidates($normalizedLanguage) as $languageNameCandidate) {
            if (Language::whereRaw('LOWER(name) = ?', [$languageNameCandidate])->exists()) {
                $languageExists = true;
                break;
            }
        }

        if (! $languageExists && ! in_array($normalizedLanguage, ['english', 'pt-br'], true)) {
            $normalizedLanguage = normalize_language_name(get_settings('language'));
        }

        session(['language' => $normalizedLanguage]);
        app()->setLocale($normalizedLanguage == 'pt-br' ? 'pt_BR' : 'en');

        return redirect()->back();
    }
}
