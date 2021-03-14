@extends('layouts.admin')
@section('content')
    <section class="section">
        <h1 class="title">{{ __('Posts') }}</h1>
        <a class="button" href="{{ route('admin.post.create')}}">Add Post</a>
    
        <!-- Include SS table here -->
        <!-- <example-component></example-component> -->
        <search-sort-table url="{{route('admin.api.post.list')}}" :columns="{{json_encode($columns)}}"></search-sort-table>
    </section>
@endsection