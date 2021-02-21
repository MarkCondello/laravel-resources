<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    use HasFactory;

    public function posts(){
        return $this->belongsToMany(Post::class)->withTimestamps();
    }
    // Note: We can use the attach() method to add Posts to a tag through the pivot table post_tag like so
    // Tag->posts()->attach(4); 

     //Note: we can also use detach to remove the item

     //withTimestamps will save those details to the pivot table
}
