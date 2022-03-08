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

    public function tableList(Request $request)
    {
         return PostTableResource::collection(
            Post::where(function($query){
                // $query->where('search_field_key', 'like', '%' . request()->query('search') . '%');
            })
            ->when($request->input('sort'), function($query, $sort) use($request) {
                $query->when($request->input('dir'), function($query, $dir) use ($sort) {
                    $query->orderBy($sort, $dir);
                });
            })
            ->paginate(5)
        );
     
    }
}
