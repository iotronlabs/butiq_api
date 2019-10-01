<?php

namespace App\Models;


use App\Models\Category;
use App\Models\Traits\HasPrice;
use App\Models\ProductVariation;
use App\Models\Traits\canBeScoped;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{   
    use canBeScoped,HasPrice;
    public function getRouteKeyName()
    {
            return 'slug';
    }

    
   

    public function categories()
    {
        return $this->belongsToMany(Category::class);
    }

    public function variations()
    {
        return $this->hasMany(ProductVariation::class)->orderBy('order','asc');
    }
}
