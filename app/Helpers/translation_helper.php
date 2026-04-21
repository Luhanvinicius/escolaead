<?php

if (! function_exists('t')) {
    function t($key)
    {
        return get_phrase($key);
    }
}
