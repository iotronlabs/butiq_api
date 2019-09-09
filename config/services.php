<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Third Party Services
    |--------------------------------------------------------------------------
    |
    | This file is for storing the credentials for third party services such
    | as Mailgun, Postmark, AWS and more. This file provides the de facto
    | location for this type of information, allowing packages to have
    | a conventional file to locate the various service credentials.
    |
    */

    'mailgun' => [
        'domain' => env('MAILGUN_DOMAIN'),
        'secret' => env('MAILGUN_SECRET'),
        'endpoint' => env('MAILGUN_ENDPOINT', 'api.mailgun.net'),
    ],

    'postmark' => [
        'token' => env('POSTMARK_TOKEN'),
    ],

    'ses' => [
        'key' => env('AWS_ACCESS_KEY_ID'),
        'secret' => env('AWS_SECRET_ACCESS_KEY'),
        'region' => env('AWS_DEFAULT_REGION', 'us-east-1'),
    ],

    'facebook' => [
        'client_id' => '2442813762714926',
        'client_secret' => 'b1b608bf28ef43f441dd8df9af356cff',
        'redirect' => 'http://localhost:8000/api/login/facebook/callback',
    ],

    'google' => [
        'client_id' => '65499674864-bmdbllh9f7315ne72vnbd2cdts1ov2is.apps.googleusercontent.com',
        'client_secret' => 'CrTLF7myE_p89XK07PijiLP2',
        'redirect' => 'http://localhost:8000/api/login/google/callback',
    ],

    


    

];
