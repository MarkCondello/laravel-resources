<?php

namespace App\Models\Presenters;

trait PostPresenter
{
    public function table_ths(): array
    {
        return [
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
            'sortable' => false,
            'type' => 'String'
          ],
          (object) [
            'label' => 'Tag',
            'key' => 'tag',
            'sortable' => false,
            'type' => 'String'
          ],
          (object) [
            'label' => 'Created',
            'key' => 'created_at',
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
      }
    }