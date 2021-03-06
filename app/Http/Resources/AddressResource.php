<?php

namespace App\Http\Resources;

use App\Http\Resources\StateResource;
use Illuminate\Http\Resources\Json\JsonResource;

class AddressResource extends JsonResource
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
            'address_1' => $this->address_1,
            'city' => $this->city,
            'postal_code'=> $this->postal_code,
            'state' => new StateResource($this->state),
            'default'=> $this->default
        ];
    }
}
