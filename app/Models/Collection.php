<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Collection extends Model
{
    use HasFactory;

    public function videos(){
        //$this->morphMany($related, $name);
        return $this->morphMany(Video::class, 'watchable');
         //Note:  $name needs to be the same as that stored in the database for the morphs columns
    }
}
