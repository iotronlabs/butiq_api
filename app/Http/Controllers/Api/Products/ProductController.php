<?php

namespace App\Http\Controllers\Api\Products;

use App\Models\Product;

use Illuminate\Http\Request;
use App\Models\ProductVariation;
use App\Scoping\Scopes\SizeScopes;
use Illuminate\Support\Facades\DB;
use App\Scoping\Scopes\ColorScopes;
use App\Scoping\Scopes\PriceScopes;
use App\Http\Controllers\Controller;

use App\Models\ProductVariationType;
use App\Scoping\Scopes\CategoryScopes;
use App\Http\Resources\ProductResource;
use App\Http\Resources\ProductIndexResource;


class ProductController extends Controller
{
   public function Index()
    {
        $products = Product::with(['variations.stock'])->withScopes($this->scopes())->paginate(10);

        return ProductIndexResource::collection($products);
    }

    public function show(Product $product)
    {
        $product->load(['variations.type','variations.stock', 'variations.product']);
        return new ProductResource(
            $product
        );
    }

    protected function scopes()
    {
        return [
            
            'category' => new CategoryScopes(),
            'price' => new PriceScopes(),
            'color' => new ColorScopes(),
            'size' => new SizeScopes()

        ];
    }

    public function addProduct(Request $request)
    {
        $data = Product::create([
            'name' => $request->product_name,
            'slug' => $request->product_slug,
            'price' => $request->product_price,
            'description' => $request->product_descriptions,
           


        ]);

        return $data;

    }
    public function addProductVariations(Request  $request, $id)
    {       
        $product_id = $id;

        $variationName = $request->variationName;
        $variationTypeID = ProductVariationType::where('name', $variationName)->get();
       // dd($variationTypeID);
      // dd($variationTypeID[0]['id']);
       $data = ProductVariation::create([
           'product_id' => $product_id,
           'name' => $request->pro_var_name,
           'price' => $request->pro_var_price,
           'order' => $request->pro_var_order,
           'product_variation_type_id' => $variationTypeID[0]['id'],



       ]);

        return ProductIndexResource::collection($data);

    }

    public function addCategoryProduct(Request $request,$productId, $categoryId)
    {
            $product_id = $productId;
            $category_id = $categoryId;
        DB::table('category_product')->insert(
            ['category_id' => $category_id, 'product_id' => $product_id]
        );

        

    }


}
