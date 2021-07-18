@extends('layouts.site')

@section('content')
<div class="grid grid-cols-1">
    <div class="p-6">
        <div class="flex items-center">
       <img src="{{ asset( isset($tag->image) && isset($tag->image->first()->original_name) ? 'images/' . $tag->image->first()->original_name : 'images/logos/laravel.png' )   }}" width="30" alt="{{$tag->name}} image."/>
           <div class="ml-4 text-lg leading-7 font-semibold">{{$tag->name}}</div>
        </div>
        <ul>
        @foreach($posts as $post)
            <li><a href="{{ route('tag.post.show', ['tagName' => $tag->name, 'postSlug' => $post->slug ]) }}">
            {{$post->title}}</a></li>  
        @endforeach
        </ul>
    </div>
</div>
@endsection