<?php

namespace App\Models;

use App\Models\Product;
use App\Models\Traits\HasChildren;
use App\Models\Traits\IsOrderable;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{   
    use HasChildren, IsOrderable;

    protected $fillable = [
        'name',
        'slug',
        'parent_id',
        'order'
    ];
  

    public function children()
    {
        return $this->hasMany(Category::class, 'parent_id', 'id'); 
    }
    public function product()
    {
        return $this->belongsToMany(Product::class);
        
    }


}
