<?php

namespace App\Http\Controllers\Api\Orders;

use App\Cart\Cart;
use App\Models\Order;
use Illuminate\Http\Request;
use App\Events\Order\OrderCreated;
use App\Http\Controllers\Controller;
use App\Http\Resources\OrderResource;
use App\Http\Requests\Orders\OrderStoreRequest;

class OrderController extends Controller
{
    protected $cart;
    public  function __construct(){

        $this->middleware(['auth:api']);


    }
    public function store(OrderStoreRequest $request, Cart $cart)
    {
        $cart->sync();
        if($cart->isEmpty()){
         return response(null, 400);
        }

        $order  = $this->createOrder($request, $cart );

        $order->products()->sync($cart->products()->forSyncing());



    //    $order->load(['products']);
    //    $order->load(['address']);
    //    $order->load(['shippingMethod']);    // showing the details of order product

       event(new OrderCreated($order));
        return new OrderResource($order);
    }

    public function createOrder(Request $request, Cart $cart)
    {

      return $request->user('api')->orders()->create(

       array_merge($request->only(['address_id', 'shipping_method_id']),
       [
           'subtotal' => $cart->subtotal()->amount()

       ])

      );

    }
}
