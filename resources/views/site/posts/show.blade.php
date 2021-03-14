@extends('layouts.site')

@section('content')
<div class="grid grid-cols-1">

    <div class="p-6">
        <div class="flex items-center">
            {!! $icon ?? "" !!}
             <div class="ml-4 text-lg leading-7 font-semibold">{{ $title }}</div>
        </div>
        <div>
            {!! $content ?? "" !!}
        </div>
        <hr>

        @if(isset($links))
        <h3>Links:</h3>
        <ul>
            @foreach($links as $link)
            <li><a href="{{$link->url}}">{{$link->name}}</a></li>
            @endforeach
        </ul>
        @endif
        <a href="{{ $backLink }}">Back to {{ $category }}</a>
    </div>
</div>
@endsection