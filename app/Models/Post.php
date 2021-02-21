<?php

namespace App\Models;

use App\Http\Traits\Likables;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;
    use Likables;

    protected $fillable = ['user_id', 'title', 'body'];

    public function user(){
        //$this->hasOne($related, $fk, $localKey);
        return $this->hasOne(User::class, 'id', 'user_id');
    }

    public function comments(){
        return $this->hasMany(Comment::class);
    }

    public function tags(){
        return $this->belongsToMany(Tag::class)->withTimestamps();
    }
    // Note: We can use the attach() method to add Tags to a tag through the pivot table post_tag like so
    // Post->tags()->attach(4); 

    //Note: we can also use detach to remove the item
     //withTimestamps will save those details to the pivot table

    //tables required
    //tags
    //post_tag weak entity or pivot table

    public function videos(){
        return $this->morphMany(Video::class, 'watchable');
    }




    public function share($user = null){
        $user = $user ?: auth()->user();
        return $this->sharable()->attach($user);
    }

    public function sharable(){
        return $this->morphToMany(User::class, 'sharable');
 
    }
}
