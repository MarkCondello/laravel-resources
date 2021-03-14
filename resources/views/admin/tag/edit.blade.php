@extends('layouts.admin')
@section('content')
<section class="section">
    @if(isset($tag))
    <h1 class="title">Edit {{ $tag->name }}</h1>
    <hr>
    <form action="{{ route('admin.tag.edit', $tag) }}" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="{{$tag->id}}"/>
    @else 
    <h1 class="title">Create Tag</h1>
    <hr>
    <form action="{{ route('admin.tag.save') }}" method="post" enctype="multipart/form-data">
    @endif
        @csrf 
        <div class="field">
            <label class="label">Name</label>
            <div class="control">
                <input class="input" name="name" type="text" value="{{ old('name') ?? $tag->name ?? null }}">
            </div>
            @error('title')<p class="help is-danger">{{ $message }}</p>@enderror
        </div>
        <div class="field">
            <label class="label">Upload Image</label>
            @if($tag)
            <img width="200" src="{{ asset('images/' . $tag->image->first()->original_name) }}" alt="{{ $tag->image->first()->original_name }}"/>
            @endif
            <div class="control">
                <input class="input" name="uploadFile" type="file" value="{{ old('image') ?? null }}">
            </div>
            @error('image')<p class="help is-danger">{{ $message }}</p>@enderror
        </div>

        <div class="field">
            <label class="label">Description</label>
            <div class="control">
                <input class="input" name="description" type="text" value="{{ old('description') ?? $tag->description ?? null }}">
            </div>
            @error('description')<p class="help is-danger">{{ $message }}</p>@enderror
        </div>
        <div class="field is-grouped">
            <div class="control">
                <button type="submit" class="button is-link">Submit</button>
            </div>
            <div class="control">
                <a href="{{ route('admin.tag.index') }}" class="button is-link is-light">Cancel</a>
            </div>
        </div>
    </form>
</section>
@endsection