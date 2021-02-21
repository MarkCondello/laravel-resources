<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Video extends Model
{
    use HasFactory;

    protected $fillable = ['title', 'description', 'url'];
    //Note: Method name needs to be the same as that stored in the database for the morphs columns
    public function watchable(){
        return $this->morphTo();
    }

    //Note: We can use a different method name but the morph name needs to be included in the morphTo method
    // public function views(){
    //     return $this->morphTo('watchable');
    // }
}
