<?php

namespace App\Http\Resources\Admin\Api;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Carbon;

class PostResource extends JsonResource
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
        $resource['title'] = $this->title;
        $resource['author'] = $this->user->name;
        $resource['tag'] = $this->tags()->first()->name;
        $resource['created'] =  Carbon::parse($this->created_at)->format('d/m/Y');  
        $resource['actions'] = [
            [
                'label' => "Edit",
                // 'icon' => 'fa fa-pencil',
                'class' => 'button is-primary is-outlined',
                'url' => route('admin.post.update', $this->id),  
            ],  
            [
                'type' => 'delete',
                'label' => "Delete task",
                // 'icon' => 'fa fa-trash',
                'url' => route('admin.post.destroy', $this->id),  
            ],
        ];
        return $resource;
    }
}
