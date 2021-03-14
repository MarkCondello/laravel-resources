<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\File;
use App\Services\File\FileService;

class ImageController extends Controller
{
    public function create()
    {
        return view('admin.images.upload');
    }

    public function store(Request $request )
    {
        // Hard coded the File uploadable to a Post
        //dd($request->file());
        FileService::save($request, null, "App\Models\Post", 1);
        return redirect()->back();
     }

    public function show(File $image)
    {
        return view('admin.images.show')->with(compact('image'));
        //show show a view
    }
}
