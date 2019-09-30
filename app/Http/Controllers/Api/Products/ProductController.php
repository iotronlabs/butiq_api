<?php

namespace App\Http\Controllers\Api\Products;

use App\Models\Product;

use App\Http\Controllers\Controller;
use App\Scoping\Scopes\CategoryScopes;
use App\Http\Resources\ProductResource;
use App\Http\Resources\ProductIndexResource;

class ProductController extends Controller
{
   public function Index()
    {
        $products = Product::withScopes($this->scopes())->paginate(10);

        return ProductIndexResource::collection($products);
    }

    public function show(Product $product)
    {
        return new ProductResource(
            $product
        );
    }

    protected function scopes()
    {
        return [
            'category' => new CategoryScopes()
        ];
    }
}
