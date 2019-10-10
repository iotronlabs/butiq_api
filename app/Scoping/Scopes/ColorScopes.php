<?php
namespace App\Scoping\Scopes;

use App\Scoping\Contracts\Scope;
use App\Models\ProductVariationType;
use Illuminate\Database\Eloquent\Builder;

class ColorScopes implements Scope
{
    public function apply(Builder $builder,$value)
    {
        $id = ProductVariationType::where('name',$value)->first('id');


        return $builder->whereHas('variations',function($builder) use($id) {

            $builder->where('product_variation_type_id',$id['id']);

        });

    }
}