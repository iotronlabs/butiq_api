<?php

namespace App\Models;

use App\Models\State;
use App\Models\Traits\HasPrice;
use Illuminate\Database\Eloquent\Model;

class ShippingMethod extends Model
{
    use HasPrice;

    public function states()
    {
        return $this->belongsToMany(State::class);
    }
}
