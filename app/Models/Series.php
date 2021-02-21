<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Series extends Model
{
    use HasFactory;

    public function videos(){
        //morphMany($related, $name);
        return $this->morphMany(Video::class, 'watchable');
         //Note:  Name needs to be the same as that stored in the database for the morphs columns
    }
}
