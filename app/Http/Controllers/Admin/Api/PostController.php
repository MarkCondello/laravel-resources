<?php

namespace App\Http\Controllers\Admin\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Http\Resources\Admin\Api\PostResource;
 
class PostController extends Controller
{
    
    public function list()
    {

        return PostResource::collection(
            Post::all()
        );
    }
}
