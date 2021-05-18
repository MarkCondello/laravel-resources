<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function profile(){
        return $this->hasOne(Profile::class);
    }

    public function posts(){
        return $this->hasMany(Post::class);
    }

    //Polymorphic comment likes
    public function likedComments(){
        return $this->morphedByMany(Comment::class, 'likable' );
    }

    public function likedPosts(){
        return $this->morphedByMany(Post::class, 'likable');
    }

    public function roles()
    {
        return $this->belongsToMany(Role::class);
    }
    public function assignRole($role)
    {
        if(is_string($role)){
            $role = Role::whereName($role)->firstOrFail();
        } else {
            return $this->roles()->sync($role, false);
        }
    }

    public function abilities()
    {
        return $this->roles->map->abilities->flatten()->pluck('name')->unique();
    }

}
