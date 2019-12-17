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
use Illuminate\Support\Facades\Storage;
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
        $path1 = $request->file('image_1')->store('BaseProducts');
        $path2 = $request->file('image_2')->store('BaseProducts');
        $path3 = $request->file('image_3')->store('BaseProducts');
        $path4 = $request->file('image_4')->store('BaseProducts');
        $path5 = $request->file('image_5')->store('BaseProducts');
        $data = Product::create([
            'name' => $request->product_name,
            'slug' => $request->product_slug,
            'price' => $request->product_price,
            'description' => $request->product_description,
            'color' => $request->product_color,
            'seller_id' => '1',
            'image_1' => $path1,
            'image_2' => $path2,
            'image_3' => $path3,
            'image_4' => $path4,
            'image_5' => $path5,

        ]);

        return new ProductResource(
            $data
        );

    }

    // public function addProductVariations(Request  $request, $id)
    // {
    //     $product_id = $id;
    //     $path1 = $request->file('pv_image_1')->store('ProductsVariations');
    //     $path3 = $request->file('pv_image_3')->store('ProductsVariations');
    //     $path2 = $request->file('pv_image_2')->store('ProductsVariations');
    //     $path4 = $request->file('pv_image_4')->store('ProductsVariations');
    //     $path5 = $request->file('pv_image_5')->store('ProductsVariations');
    //     $variationName = $request->variationName;
    //     $variationTypeID = ProductVariationType::where('name', $variationName)->get();
    //    // dd($variationTypeID);
    //   // dd($variationTypeID[0]['id']);
    //    $data = ProductVariation::create([
    //        'product_id' => $product_id,
    //        'name' => $request->pro_var_name,
    //        'price' => $request->pro_var_price,
    //        'order' => $request->pro_var_order,
    //        'product_variation_type_id' => $variationTypeID[0]['id'],
    //        'pv_image_1' => $path1,
    //        'pv_image_2' => $path2,
    //        'pv_image_3' => $path3,
    //        'pv_image_4' => $path4,
    //        'pv_image_5' => $path5,
    //    ]);

    //     return ProductIndexResource::collection($data);

    // }

    // public function addCategoryProduct(Request $request,$productId, $categoryId)
    // {
    //         $product_id = $productId;
    //         $category_id = $categoryId;
    //     DB::table('category_product')->insert(
    //         ['category_id' => $category_id, 'product_id' => $product_id]
    //     );

    // }


    public function addVariations(Request $request,$id)
    {
        $types=array();

       foreach($request->products as $product)
        {
          $existid = ProductVariationType::where('name',$product['variationtype'])->first('id');
          if($existid != null)
          {
              $typeid = $existid->id;
          }
          else
          {
                $type = ProductVariationType::create(['name' => $product['variationtype']]);
                $typeid = $type->id;
          }

                foreach($product['variations'] as $variation)
                {
                    $types[] = ProductVariation::create([
                        'name' => $variation['name'],
                        'price' => $variation['price'],
                        'order' => $variation['order'],
                        'product_id' => $id,
                        'product_variation_type_id' => $typeid
                    ]);
                }


        }

    return response()->json([
        'success' => true
    ], 200);


    }




}
