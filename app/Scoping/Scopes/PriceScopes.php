<?php

namespace App\Scoping\Scopes;

use App\Scoping\Contracts\Scope;
use Illuminate\Database\Eloquent\Builder;

class PriceScopes implements Scope
{
    public function apply(Builder $builder,$value)
    {
       if($value == 'top')
        return $builder->whereHas('categories')->orderBy('price','asc')->get();
       if($value == 'down')
        return $builder->whereHas('categories')->orderBy('price','desc')->get(); 

    }
}