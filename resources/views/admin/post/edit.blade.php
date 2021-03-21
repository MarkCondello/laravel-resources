@extends('layouts.admin')
@section('content')
<section class="section">
    @php $links = json_encode((object)["links"=>[]]); @endphp
    @if(isset($post))
        @if($post->links)
            @php $links = $post->links; @endphp
        @endif  
    <h1 class="title">Edit {{ $post->title }}</h1>
    <hr>
    <form enctype="multipart/form-data" action="{{ route('admin.post.edit', $post) }}" method="post">
        <input type="hidden" name="id" value="{{$post->id}}"/>
    @else 
    <h1 class="title">Create Post</h1>
    <hr>
    <form enctype="multipart/form-data" action="{{ route('admin.post.save') }}" method="post">
    @endif
        @csrf 
        <div class="field">
            <label class="label">Name</label>
            <div class="control">
                <input class="input" name="title" type="text" value="{{ old('title') ?? $post->title ?? null}}">
            </div>
            @error('title')<p class="help is-danger">{{ $message }}</p>@enderror
        </div>
        <div class="field">
            <label class="label">Slug</label>
            <div class="control">
                <input class="input" name="slug" type="text" placeholder="Text input" value="{{ old('slug') ?? $post->slug ?? null}}">
            </div>
            @error('slug')<p class="help is-danger">{{ $message }}</p>@enderror
        </div>

    <!-- ToDo: Add Author changing options 
        <div class="field">
            <label class="label">Author</label>
            <div class="control has-icons-left has-icons-right">
                <input class="input is-success" type="text" placeholder="Text input" value="bulma">
                <span class="icon is-small is-left">
                    <i class="fas fa-user"></i>
                </span>
                <span class="icon is-small is-right">
                    <i class="fas fa-check"></i>
                </span>
            </div>
            <p class="help is-success">This username is available</p>
        </div> -->
        @if(isset($tags))
        <div class="field">
            <label class="label">Tags</label>
            <div class="control">
                <div class="select">
                <!--ToDo: Make this multiple and a Vue Component -->
                    <select name="tags">
                        <option value="" selected>Select a tag</option>
                        @foreach($tags as $key=>$tag)
                        <option value="{{$key}}" 
                            @if(isset($post))
                                @forelse($post->tags as $postTag)
                                {{ ($postTag->id) === $key ? 'selected' : null }}
                                @empty
                                    null
                                @endforelse
                            @endif
                                >{{$tag}}</option>
                        @endforeach
                    </select>
                </div>
                @error('tags')<p class="help is-danger">{{ $message }}</p>@enderror
            </div>
        </div>
        @endif
        @if(isset($post))
        <!-- ToDo: For the website side, use editor js with no editing options -->
         <div class="field">
            <label class="label">Body</label>
            <textarea style="display: none;" name="body" placeholder="Post Content" id="post-body-text-area">{{ $post->body ?? null }}</textarea>
        <!-- A Post Id is required to store images against. -->
            <div id="editorjs" data-img-save-endpoint="{{ route('admin.post.save.image') }}" data-post-id="{{ $post->id ?? null }}"></div>
            @error('body')<p class="help is-danger">{{ $message }}</p>@enderror
        </div>
        <hr>
        <link-repeater class="mt-6 mb-6" :links="{{ $links }}"></link-repeater>
        @else 
        <hr>
        <p class="mb-6">Save the post to add content to it.</p>
        @endif
        <div class="field is-grouped">
            <div class="control">
                <button type="submit" class="button is-link">Submit</button>
            </div>
            <div class="control">
                <a href="{{ route('admin.post.index') }}" class="button is-link is-light">Cancel</a>
            </div>
        </div>
   
    </form>
</section>
@endsection