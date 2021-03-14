<?php

namespace App\Http\Controllers\Admin\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Tag;
use App\Http\Resources\Admin\Api\TagResource;
 
class TagController extends Controller
{
    
    public function list()
    {
        return TagResource::collection(
            Tag::all()
        );
    }
}
