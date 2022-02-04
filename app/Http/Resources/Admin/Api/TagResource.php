<?php

namespace App\Http\Resources\Admin\Api;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Carbon;

class TagResource extends JsonResource
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
        $resource = [];
        $resource['id'] = $this->id;
        $resource['name'] = $this->name;
     
        $resource['actions'] = [
            [
                'label' => "Edit",
                // 'icon' => 'fa fa-pencil',
                'class' => 'button is-primary is-outlined',
                'url' => route('admin.tag.update', $this->id),  
            ],  
            [
                'type' => 'delete',
                'label' => "Delete task",
                // 'icon' => 'fa fa-trash',
                'url' => route('admin.tag.destroy', $this->id),  
             ],
        ];

        return $resource;
    }
}
