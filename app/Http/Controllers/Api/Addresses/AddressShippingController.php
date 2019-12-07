<?php

namespace App\Http\Controllers\Api\Addresses;

use App\Models\Address;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\ShippingMethodResource;

class AddressShippingController extends Controller
{

    public function __construct()
    {
        $this->middleware(['auth:api']);
    }
  
    public function action(Address $address)
    {
       
        $this->authorize('show', $address);
       
        return ShippingMethodResource::collection(

            $address->state->shippingMethods
        );
    }
}
