<?php

namespace App\Providers;

use App\Billing\BankPaymentGateway;
use App\Billing\CreditPaymentGateway;
use App\Billing\PaymentGatewayContract;
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


        app()->singleton(PaymentGatewayContract::class, function(){
            if(request()->has('credit')){
                return new CreditPaymentGateway('USD');
            }
            else return new BankPaymentGateway('AUD');
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
