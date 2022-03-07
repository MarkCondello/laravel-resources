<?php

namespace App\Http\Resources\Admin\Api;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Carbon;

class PostTableResource extends JsonResource
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
      $resource = [
        (object) [
          'key' => 'id',
          'value' => $this->id,
        ],
        (object) [
          'key' => 'title',
          'value' => $this->title,
        ],
        (object) [
          'key' => 'author',
          'value' => $this->user->name,
        ],
        (object) [
          'key' => 'tag',
          'value' => $this->tags()->first()->name,
        ],
        (object) [
          'key' => 'created',
          'value' =>  $this->created_at->format('d/m/Y'),
        ],
        (object) [
          'key' => 'actions',
          'component_name' => 'Ellipsis',
          'component_data' => (object)[
            'actions' => [
              [
                'type' => 'link',
                'label' => "Edit Post",
                // 'icon' => 'fa fa-pencil',
                'class' => 'button is-primary is-outlined',
                'url' => route('admin.post.update', $this->id),
              ],
              [
                'type' => 'delete',
                'label' => "Delete Post",
                // 'icon' => 'fa fa-trash',
                'url' => route('admin.post.destroy', $this->id),
              ],
            ],
          ],
        ]
      ];
      return $resource;
    }
}
