<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\File;
use App\Services\File\FileService;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;

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
            $item = new File();
            $item->original_name = $file->getClientOriginalName();
            $item->hash_name     = $file->hashName();
            $item->size          = $file->getSize();
            $item->file_type     = $file->getClientOriginalExtension();
            $item->user_id       = auth()->id();
            //Store image in database
            $item->save();

            $fileName = 'profile-' . $item->original_name;
            $paths[] = $file->storeAs('profiles', $fileName, 's3');
        endforeach;
        return redirect()->back();
     }

    public function show(File $image)
    {

        return view('admin.images.show')->with(compact('image'));
    }
}
