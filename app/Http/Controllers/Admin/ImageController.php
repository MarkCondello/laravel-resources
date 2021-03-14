<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\File;

class ImageController extends Controller
{
    public function create()
    {
        return view('admin.images.upload');
    }

    public function store(Request $request )
    {
 
        $fileUpload = $request->file('imageUpload');

        $file = new File();

        $file->original_name = $fileUpload->getClientOriginalName();
        $file->hash_name     = $fileUpload->hashName();
        $file->size          = $fileUpload->getSize();
        $file->file_type     = $fileUpload->guessClientExtension();
        $file->user_id       = auth()->id();
        $file->post_id      = 1;

        //Store image in database
        $file->save();

        $fileUpload->storeAs('', $fileUpload->getClientOriginalName());

        //$fileUpload->store('');

        return redirect()->back();
     }

    public function show(File $image)
    {

        return view('admin.images.show')->with(compact('image'));
        //show show a view
    }
}
