@extends('layouts.admin')
@section('content')
<section class="section">
    @if(isset($tag))
    <h1 class="title">Edit {{ $tag->name }}</h1>
    <hr>
    <form action="{{ route('admin.tag.edit', $tag) }}" method="post">
    <input type="hidden" name="id" value="{{$tag->id}}"/>
    @else 
    <h1 class="title">Create Tag</h1>
    <hr>
    <form action="{{ route('admin.tag.save') }}" method="post">
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