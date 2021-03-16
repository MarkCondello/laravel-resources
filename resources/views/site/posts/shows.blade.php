@extends('layouts.site')

@section('content')
<div class="grid grid-cols-1">

    <div class="p-6">
        <div class="flex items-center">
            @if($tag->image)
                <img src="{{ asset('images/' . $tag->image->first()->original_name) }}" width="30" alt="{{$tag->name}} image."/>
            @endif
            <div class="ml-4 text-lg leading-7 font-semibold">{{ $post->title }}</div>
        </div>
        
        @if(isset($post->body))
          <!-- ToDo: For the website side, use editor js with no editing options -->
          <div class="field">
            <label class="label">Body</label>
            
            <textarea style="display: none;" name="body" placeholder="Post Content" id="post-body-text-area">{{ $post->body }}</textarea>
            <div id="editorjs" data-img-save-endpoint="{{ route('admin.post.save.image') }}" data-post-id="{{ $post->id ?? null }}"></div>

        </div>
        @endif

        @if(isset($post->links) && false)
        <hr>
        <h3>Links:</h3>
        <ul>
            @foreach($links as $link)
            <!-- <li><a href="{{$link->url}}">{{$link->name}}</a></li> -->
            @endforeach
        </ul>
        @endif

        <a href="{{ $backLink }}">Back to {{ $tag->name }}</a>
    </div>
</div>
@endsection