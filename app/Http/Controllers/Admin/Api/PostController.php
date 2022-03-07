<?php

namespace App\Http\Controllers\Admin\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Http\Resources\Admin\Api\PostResource;
use App\Http\Resources\Admin\Api\PostTableResource;
// use App\Http\Resources\Admin\Api\PostTableHeadResource;
 
class PostController extends Controller
{
    
    public function list()
    {
        return PostResource::collection(
            Post::paginate(2)
        );
    }

    public function tableList()
    {
        // $postHead = new PostTableHeadResource();
        return PostTableResource::collection(Post::paginate(5));
        // return response()->json(
        //     [
        //         'table_ths' => $postHead->head(),
        //         'table_rows' => PostTableResource::collection(Post::paginate(5))
        //     ]
        // );
    }
}
