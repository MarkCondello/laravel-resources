<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
// use Illuminate\Http\Request;
// use App\Models\Post;
// use App\Models\User;
use App\Models\Tag;
use Illuminate\Support\Facades\View;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    // should this be an invoke instead??
    public function home()
    {
        // return Request()->input('name');
        $tags = Tag::all();
        return View::make('site.home')->with(compact('tags'));
    }
}
