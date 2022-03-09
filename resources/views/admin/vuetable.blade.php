@extends('layouts.admin')
<!-- Generated by Laravel with the UI package -->
@php($thrs = (new App\Models\Post)->table_ths())
@section('content')
  <section class="section">
      <h1 class="title">{{ __('Vue Table') }}</h1>
      <vue-table 
        :table_ths="{{ json_encode($thrs) }}"
        data-url="{{ route('admin.api.post.table-list') }}"
        search-by="title"
      ></vue-table>
  </section>
@endsection