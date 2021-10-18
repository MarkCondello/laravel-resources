<?php

namespace App\Http\Controllers;

use App\Billing\PaymentGatewayContract;
use App\Orders\OrderDetails;
use Illuminate\Http\Request;

class PayOrderController extends Controller
{
    //
    public function store(OrderDetails $orderDetails, PaymentGatewayContract $paymentGateway)
    //public function store()
    {
        $order = $orderDetails->all();
        # code...
        // $paymentGateway = new PaymentGateway('AUD');
        dd($paymentGateway->charge(2500));
    }
}
