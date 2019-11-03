<?php

namespace App\Models;

use App\User;
use App\Models\State;
use Illuminate\Database\Eloquent\Model;

class Address extends Model
{
    protected $fillable = [

        'name',
        'address_1',
        'city',
        'postal_code',
        'state_id',
        'default'
    ];
 
    public static function boot(){

        parent::boot();

        static::creating(function ($address){

            if($address->default) {

                $address->user->addresses()->update([

                    'default' => false
                ]);
            }

        });
     
    }

    public function setDefaultAttribute($value)
    {
        $this->attributes['default'] = ($value === 'true' || $value ? true : false);
    }

    public function user()
    {
        return $this->belongsTo(User::class); 
    }

    public function state()
    {
        return $this->hasOne(State::class,'id','state_id');
    }
}
