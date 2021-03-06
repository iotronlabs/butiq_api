<?php

namespace App\Models;

use App\User;
use App\Models\Address;
use App\Models\ShippingMethod;
use App\Models\ProductVariation;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    const PENDING = 'pending';
    const COMPLETE = 'complete';
    const PAYMENT_FAILED = 'payment_failed';
    const  PROCESSING = 'processing';

    protected $fillable = [
        'status',
        'shipping_method_id',
        'address_id',
        'subtotal',

    ];

    public static function  boot(){
        parent::boot();

        static:: creating(function ($order){
            $order->status= self::PENDING;

        });


    }

   public function user(){

       return $this->belongsTo(User::class);

   }

   public function address(){

    return $this->belongsTo(Address::class);

    }

    public function shippingMethod(){
        return $this->belongsTo(ShippingMethod::class);
    }

    public function products()
    {
        return $this->belongsToMany(ProductVariation::class, 'product_variation_order')
        ->withPivot(['quantity'])
        ->withTimestamps();


    }
}
