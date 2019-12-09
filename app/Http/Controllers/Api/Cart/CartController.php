<?php
namespace App\Http\Controllers\Api\Cart;



// use App\Cart\Cart;

use App\Cart\Cart;
use Illuminate\Http\Request;
use App\Models\ProductVariation;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Cart\CartUpdateRequest;
use App\Http\Requests\Cart\CartStoreRequest;
use App\Http\Resources\Cart\CartResource;

class CartController extends Controller
{

    public function __construct()
    {
        $this->middleware(['auth:api']);
    }

    public function index(Request $request, Cart $cart)
    {
        $cart->sync();
        $request->user('api')->load(['cart.product', 'cart.product.variations.stock', 'cart.stock', 'cart.type'


        ]);

        return (new CartResource($request->user('api')))
                    ->additional([
                        'meta' =>$this->meta($cart,$request)

                    ]);
    }

    protected function meta(Cart $cart, Request $request)
    {
        return [
            'empty' => $cart->IsEmpty(),
            'subtotal' => $cart->subtotal()->formatted(),
            'total' => $cart->withShipping($request->shipping_method_id)->total()->formatted(),
            'changed' => $cart->hasChanged(),
        ];
    }

    public function store(CartStoreRequest $request, Cart $cart)
    {
        $cart->add($request->products);

        $cart->sync();
    }

    public function update(ProductVariation  $productVariation, CartUpdateRequest $request, Cart $cart)
    {
        $cart->update($productVariation->id, $request->quantity);
    }

    public function destroy (ProductVariation  $productVariation,  Cart $cart)
    {
        $cart->delete($productVariation->id);
    }



}
