<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Contracts\Auth\MustVerifyEmail;

class OTPVerify extends Model
{

    protected $guarded = [];

    protected $commands = [
        \App\Console\Commands\Inspire::class,
    ];


}
