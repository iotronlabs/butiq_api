<?php

namespace App\Providers;


use App\Cart\Cart;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
    $this->app->singleton(Cart::class, function($app){

       // dd(auth('api')->user());
        return new Cart(auth('api')->user());

    });
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);
    }
}
