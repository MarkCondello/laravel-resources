@extends('layouts.admin')
@section('content')
    <section class="section">
        <h1 class="title">{{ __('Tags') }}</h1>
        <a class="button" href="{{ route('admin.tag.create')}}">Add Tag</a>
        <!-- Include SS table here -->
        <search-sort-table url="{{route('admin.api.tag.list')}}" :columns="{{ json_encode($columns) }}"></search-sort-table>
    </section>
@endsection