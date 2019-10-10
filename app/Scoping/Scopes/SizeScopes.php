<?php
namespace App\Scoping\Scopes;

use App\Scoping\Contracts\Scope;
use Illuminate\Database\Eloquent\Builder;

class SizeScopes implements Scope
{
    public function apply(Builder $builder,$value)
    {

        return $builder->whereHas('variations',function($builder) use($value){

            $builder->where('name',$value);

        });

    }
}