<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    protected $fillable = ['name', 'label'];

    use HasFactory;

    public function allowTo($ability)
    {
        return $this->abilities()->sync($ability, true);
    } 

    public function abilities()
    {
        return $this->belongsToMany(Abilities::class);
    }
}
