@extends('layouts.site')

@section('content')
<div class="grid grid-cols-1">
    <div class="p-6">
        <div class="flex items-center">
            @if($tag->image)
            <img src="{{ asset('images/' . $tag->image->first()->original_name) }}" width="30" alt="{{$tag->name}} image."/>
            @endif
           <div class="ml-4 text-lg leading-7 font-semibold">{{$tag->name}}</div>
        </div>
        <ul>
        @foreach($posts as $post)
            <li><a  href="{{ route('tag.post.show', ['tagName' => $tag->name, 'postSlug' => $post->slug ]) }}">
            {{$post->title}}</a></li>  
        @endforeach
        </ul>
    </div>
</div>
@endsection