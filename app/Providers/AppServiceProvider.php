<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Example;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        app()->singleton('App\Example', function(){
            $foo = config('services.foo.key');
            return new Example($foo);
        });
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
