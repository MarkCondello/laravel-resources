<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\User;
use App\Models\Tag;


class HomeController extends Controller
{
    // should this be an invoke instead??
    public function home()
    {
        $tags = Tag::all();
        return view('site.home')->with(compact('tags'));
    }
}
