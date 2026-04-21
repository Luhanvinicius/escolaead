<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class SetLocale
{
    /**
     * Handle an incoming request.
     */
    public function handle(Request $request, Closure $next)
    {
        $lang = session('language') ?? get_settings('language') ?? 'english';
        $lang = normalize_language_name($lang);

        if (! session()->has('language')) {
            session(['language' => $lang]);
        }

        switch ($lang) {
            case 'pt-br':
                app()->setLocale('pt_BR');
                break;
            default:
                app()->setLocale('en');
                break;
        }

        return $next($request);
    }
}
