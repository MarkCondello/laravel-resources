<?php

namespace App\Http\Traits;
use App\Models\User;

trait Likables {
    //Morph to Many
    public function like($user = null){
        $user = $user ?: auth()->user();
        //this will set the user_id and the Model reference to the likeables table
        return $this->likes()->attach($user);
    }

    public function likes(){
        //$this->morphToMany($related, $name, $bale, $fkeyPivotKey);
        return $this->morphToMany(User::class, 'likable')->withTimestamps();
    }
}