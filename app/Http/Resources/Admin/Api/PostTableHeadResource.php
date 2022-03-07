<?php

namespace App\Http\Resources\Admin\Api;

use Illuminate\Http\Resources\Json\JsonResource;

class PostTableHeadResource
{
    public function head()
    {
      $resource = [
        (object) [
          'label' => 'Id',
          'key' => 'id',
          'sortable' => true,
          'type' => 'Number'
        ],
        (object) [
          'label' => 'Title',
          'key' => 'title',
          'sortable' => true,
          'type' => 'String'
        ],
        (object) [
          'label' => 'Author',
          'key' => 'author',
          'sortable' => true,
          'type' => 'String'
        ],
        (object) [
          'label' => 'Tag',
          'key' => 'tag',
          'sortable' => false,
          'type' => 'String'
        ],
        (object) [
          'label' => 'Created At',
          'key' => 'created',
          'sortable' => true,
          'type' => 'Date'
        ],
        (object) [
          'label' => null,
          'key' => 'actions',
          'sortable' => false,
          'type' => 'Component'
        ],
      ];
      return $resource;
    }
}
