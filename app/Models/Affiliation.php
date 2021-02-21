<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Affiliation extends Model
{
    use HasFactory;

    //If a User has an affiliation, get thier Posts. 
    public function posts(){
        //return $this->hasManyThrough($related, $through, $firstKey, $secondKey); 
        return $this->hasManyThrough(Post::class, User::class, 'affiliation_id', 'user_id'); 

        //Note: There is no post id column on affiliates, but there is on user. 
        //We can connect the tables through the users table and get their posts which equates to doing an inner join.
    }

}
