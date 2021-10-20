<?php

namespace App\Http\Resources;
use App\Http\Resources\Admin\Api\PostResource;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        //return parent::toArray($request);

        // dd($request);
        return [
            'name' => $this->name,
            'email' => $this->email,
            'posts' => PostResource::collection($this->posts),
        ];
    }

    public function with($request)
    {
        return [
            'foo' => 'barr',
        ];
    }
 
}
