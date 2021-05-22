<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\File;
use App\Services\File\FileService;
use Illuminate\Support\Facades\Validator;

use App\Http\Requests\Admin\ImagesRequest;

class ImageController extends Controller
{
    public function create()
    {
        return view('admin.images.upload');
    }

    public function store(ImagesRequest $request)
    {
        $paths = [];
        $files = $request->file('files');

        foreach($files as $file):
            $fileName = 'profile-'.time().'.'.$file->getClientOriginalExtension();
            $paths[] = $file->storeAs('profiles', $fileName);
        endforeach;
        //dd($paths);
        // Hard coded the File uploadable type to Post
       // FileService::save($request, null, "App\Models\Post", 1);
        return redirect()->back();
     }

    public function show(File $image)
    {
        return view('admin.images.show')->with(compact('image'));
      
    }
}
