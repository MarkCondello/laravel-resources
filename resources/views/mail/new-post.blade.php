@component('mail::message')
# Introduction

A new {{ $post->tags()->first()->name }} post was created entitled: {{ $post->title }} 

Thanks,<br>
{{ config('app.name') }}
@endcomponent
