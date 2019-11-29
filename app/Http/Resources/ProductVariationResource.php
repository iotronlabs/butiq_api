<?php

namespace App\Http\Resources;

use Illuminate\Support\Collection;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductVariationResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        if ($this->resource instanceof Collection) {
            return ProductVariationResource::collection($this->resource);
        }
        return [

            'id' => $this->id,
            'name' => $this->name,
            'price' => $this->formattedPrice,
            'price_varies' => $this->priceVaries(),
            'stock_count' =>(int) $this->stockCount(),
            'type'=>$this.type.name,
            'in_stock' => $this->inStock(),
            'pv_image_1' => $this->pv_image_1,
            'pv_image_2' => $this->pv_image_2,
            'pv_image_3' => $this->pv_image_3,
            'pv_image_4' => $this->pv_image_4,
            'pv_image_5' => $this->pv_image_5,
        ];
    }
}
