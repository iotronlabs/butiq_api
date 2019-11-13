<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductIndexResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [

        'id' => $this->id,
        'name' => $this->name,
        'slug' =>$this->slug,
        'description' =>$this->description,
        'price' => $this->formattedPrice,
        'stock_count' => $this->stockCount(),
        'in_stock' => $this->inStock(),
        'seller_name' => $this->seller_name,
        'color' => $this->color,
        'image_1' => $this->image_1,
        'image_2' => $this->image_2,
        'image_3' => $this->image_3,
        'image_4' => $this->image_4,
        'image_5' => $this->image_5,

        ];
    }
}
