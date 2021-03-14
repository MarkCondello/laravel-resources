<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\User;

class WelcomeController extends Controller
{
    public function home()
    {

        //get first user
        $u1 = User::first();
        //create a post for them
        $post = $u1->posts()->create([
            'user_id' => $u1->id,
            'title' => 'Test 123',
            'body' => 'description for test 123',
        ]);
        //add a tag to that post using attach
        $post->tags()->attach(1);

        $posts = Post::all();
        return view('site.welcome')->with(compact('posts'));

    }
}
