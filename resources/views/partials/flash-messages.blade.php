 
@php 
$messageData = (object)[
        'text' => '',
        'heading' => '',
        'class' => '',
    ];

if( request()->session()->has('FlashMessage') ):
    $messageData->text = request()->session()->get('FlashMessage');
    $messageData->heading = 'Success!';
    $messageData->class = 'is-success';
endif;

if( request()->session()->has('FlashNotice') ):
    $messageData->text = request()->session()->get('FlashNotice');
    $messageData->heading = 'Info';
    $messageData->class = 'is-info';
endif;

if( request()->session()->has('FlashWarning') ):
    $messageData->text = request()->session()->get('FlashWarning');
    $messageData->heading = 'Warning!';
    $messageData->class = 'is-warning';
endif;

if( request()->session()->has('FlashError') ):
    $messageData->text = request()->session()->get('FlashError');
    $messageData->heading = 'Error!';
    $messageData->class = 'is-danger';
endif;

@endphp

@if(!empty($messageData->text))
<article  class="flash-message message {{ $messageData->class }}">
    <div class="message-header">
        <p>{{ $messageData->heading }}</p>
        <button class="delete" aria-label="delete" type="button"></button>
    </div>
    <div class="message-body">
        {{ $messageData->text }}
    </div>
</article>
@endif

