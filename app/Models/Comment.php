<?php

namespace App\Models;

use App\Http\Traits\Likables;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    use HasFactory;
    use Likables;

    public function post(){
        return $this->hasOne(Post::class, 'id');
    }


    // //Morph to Many
    // public function like($user = null){
    //     $user = $user ?: auth()->user();
    //     //this will set the user_id and the Model reference to the likeables table
    //     return $this->likes()->attach($user);
    // }

    // public function likes(){
    //     //$this->morphToMany($related, $name, $bale, $fkeyPivotKey);
    //     return $this->morphToMany(User::class, 'likable')->withTimestamps();
    // }
}
