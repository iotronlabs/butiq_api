<?php
namespace App\Http\Controllers\Api\Cart;



// use App\Cart\Cart;

use App\Cart\Cart;
use App\Http\Controllers\Controller;
use App\Http\Requests\Cart\CartStoreRequest;
use App\Models\ProductVariation;
use Zend\Diactoros\Request;

class CartController extends Controller
{       
   
    public function __construct()
    {   
        $this->middleware(['auth:api']);  
    }
    
    public function store(CartStoreRequest $request, Cart $cart)
    {
        $cart->add($request->products);
    }

    public function update(ProductVariation  $productVariation, Request $request, Cart $cart)
    {
        $cart->update($productVariation->id, $request->quantity);
    }
    
}