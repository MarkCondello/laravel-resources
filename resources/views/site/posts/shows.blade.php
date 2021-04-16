@extends('layouts.site')

@section('content')
<div class="grid grid-cols-1">

    <div class="p-6">
        <div class="flex items-center">
            <img src="{{ asset( isset($tag->image) && isset($tag->image->first()->original_name) ? 'images/' . $tag->image->first()->original_name : 'images/logos/laravel.png' )   }}" width="30" alt="{{$tag->name}} image."/>
            <div class="ml-4 text-lg leading-7 font-semibold">{{ $post->title }}</div>
        </div>
        <hr>
        @if(isset($post->body))
        <div class="field">
             @php $blocks = json_decode($post->body)->blocks; @endphp

            @foreach($blocks as $block)
               @switch($block->type)
                    @case('list')
                        @if($block->data->style === "unordered")
                        <ul>
                            @foreach($block->data->items as $item)
                            <li>{{$item}}</li>
                            @endforeach
                        </ul>
                        @elseif($block->data->style === "ordered")
                        <ol>
                            @foreach($block->data->items as $item)
                                <li>{{$item}}</li>
                            @endforeach
                        </ol>
                        @endif
                    @break
                    @case('code')
                    <div>
                        <code>{!! $block->data->code  !!}</code>
                    </div>
                    @break
                    @case('paragraph')
                    <p>{!! htmlspecialchars_decode($block->data->text, ENT_QUOTES) !!}</p>
                    @break
                    @case('image')
                    <div>
                        <img src="{{$block->data->file->url}}" alt="{{$block->data->file->caption ?? null}}" />
                    </div>
                    @break 
                    @case('table')
                         <table>
                            <thead>
                                <tr>
                                    @foreach($block->data->content[0] as $hr)
                                    <th>{{$hr}}</th>
                                    @endforeach
                                </tr>
                            </thead>
                              <tbody>
                                @foreach($block->data->content as $tr)
                                @if (!$loop->first)

                                <tr>
                                    @foreach($tr as $td)
                                    <td>{{$td}}</td>
                                    @endforeach
                                </tr>
                                @endif
                                @endforeach

                            </tbody>  
                        </table>
                    @break 
                    @default 
 
                @endswitch
            @endforeach

          
        </div>
        @endif

        @if(isset($post->links)  )
        <hr>
        <h3>Links:</h3>
        <ul>
            @foreach(json_decode($post->links)->links as $link)
            <li><a href="{{$link->url}}" target="_blank">{{$link->name}}</a></li>
            @endforeach
        </ul>
        @endif

        <a href="{{ $backLink }}">Back to {{ $tag->name }}</a>
    </div>
</div>
@endsection