<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\Tag;


class TagController extends Controller
{
    public function tagsPostList($tagName)
    {
        $tag = Tag::where('name', $tagName)->firstOrFail();
        $posts = $tag->posts;

        return view('site.posts.index')
            ->with(compact('tag', 'posts'));
    }

    public function tagsPostShow($tagName, $postSlug)
    {
        $tag = Tag::where('name', $tagName)->firstOrFail();
        $post = Post::where('slug', $postSlug)->firstOrFail();
        $backLink = route('tag.post.list', $tag->name);

        return view('site.posts.shows')
            ->with(compact('tag', 'post', 'backLink'));
    }

 

}
