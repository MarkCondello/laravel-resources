<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests\Admin\Tag\TagRequest;
use App\Models\Tag;
use App\Models\File;
  
use App\Services\File\FileService; //ToDo: Add option to save an icon to a Tag

class TagController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $columns = Tag::columns();
        return view('admin.tag.index')->with(compact('columns'));
    }

    public function create()
    {
         return view('admin.tag.edit');    
    }

    public function update(Tag $tag)
    {
        return view('admin.tag.edit')
            ->with(compact( 'tag'));
    }

    public function edit(TagRequest $request, Tag $tag)
    {
        $tag->update( $request->except('uploadFile') );
        if($request->file('uploadFile')){
            // Delete the previous image if it exists
            if($tag->image->first()){
                $storedFile = $tag->image->first()->delete();
            }
            FileService::save($request, null, "App\Models\Tag", $tag->id);
        }
        return redirect(route('admin.tag.index'))
            ->with('FlashMessage', "Tag {$tag->name} was succesfully updated.");
    }

    public function destroy(Tag $tag)
    {        
        $tag->delete();
        return redirect(route('admin.tag.index'))
            ->with('FlashMessage', "Tag {$tag->name} was succesfully deleted.");
    }
    
    public function store(TagRequest $request)
    {
        $tag = Tag::create($request->except('uploadFile'));

        if($request->file('uploadFile')){
            FileService::save($request, null, "App\Models\Tag", $tag->id);
        }
   
        return redirect(route('admin.tag.index'))
        ->with('FlashMessage', "Tag {$tag->name} was succesfully created.");
    }

}
