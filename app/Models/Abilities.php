<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Abilities extends Model
{
    protected $fillable = ['name', 'label'];

    use HasFactory;

    public function role()
    {
        return $this->belongsToMany(Role::class);
    }
}
