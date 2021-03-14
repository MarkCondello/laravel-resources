<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\Tag;
use App\Http\Requests\Admin\Post\PostRequest;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Request as StorageRequest;
use App\Services\File\FileService;

class PostController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $columns = Post::columns();
        return view('admin.post.index')->with(compact('columns'));
    }

    public function create()
    {
        $tags = Tag::all()->pluck('name', 'id');
        return view('admin.post.edit')
            ->with(compact('tags'));    
    }

    public function update(Post $post)
    {
       $tags = Tag::all()->pluck('name', 'id');
       return view('admin.post.edit')
            ->with(compact('post', 'tags'));
    }

    public function edit(PostRequest $request, Post $post)
    {
        $linkNames = request()->input('link_name');
        $linkUrls = request()->input('link_url');

        if(isset($linkNames) && isset($linkUrls)){
            $jsonLinks = (object)[
                "links" => []
            ];
    
            foreach($linkNames as $key=>$name){
                if($name != null && $linkUrls[$key] != null){
                    $jsonLinks->links[] = (object)[
                        "name" => $name,
                        "url" => $linkUrls[$key],
                    ];
                 }
            }
            $post->links = json_encode($jsonLinks);
            $post->save();
        }

        $post->update($request->except('tags', 'link_name', 'link_url'));

        $post->tags()->sync( request()->input('tags') );
        return redirect(route('admin.post.index'))
            ->with('FlashMessage', "Post {$post->name} was succesfully updated.");
    }

    public function destroy(Post $post)
    {        
        $post->delete();
        return redirect(route('admin.post.index'))
            ->with('FlashMessage', "Post {$post->name} was succesfully deleted.");
    }
    
    public function store(PostRequest $request)
    {
        //ToDo, should be added to a service
        $post = Post::create($request->except('tags', 'link_name', 'link_url'));
        $post->user_id = auth()->user()->id;
        $post->save();
        $post->tags()->sync( request()->input('tags') );

        return redirect(route('admin.post.index'))
        ->with('FlashMessage', "Post {$post->name} was succesfully created.");
    }

    public function saveBlockImg(Request $request)
    {
        $file= FileService::save($request); 

        return response()->json([
            'success' => 1,
            'file'    => [
                'url' => asset('images/' . $file->original_name),  
             ],
        ]);
    }


}
