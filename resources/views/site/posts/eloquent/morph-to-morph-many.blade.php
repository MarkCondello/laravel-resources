@extends('site.posts.show')

@php
$icon = '<svg width="30" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" data-prefix="fas"
                data-icon="link" class="svg-inline--fa fa-link fa-w-16" role="img" viewBox="0 0 512 512">
                <path fill="#a0aec0"
                    d="M326.612 185.391c59.747 59.809 58.927 155.698.36 214.59-.11.12-.24.25-.36.37l-67.2 67.2c-59.27 59.27-155.699 59.262-214.96 0-59.27-59.26-59.27-155.7 0-214.96l37.106-37.106c9.84-9.84 26.786-3.3 27.294 10.606.648 17.722 3.826 35.527 9.69 52.721 1.986 5.822.567 12.262-3.783 16.612l-13.087 13.087c-28.026 28.026-28.905 73.66-1.155 101.96 28.024 28.579 74.086 28.749 102.325.51l67.2-67.19c28.191-28.191 28.073-73.757 0-101.83-3.701-3.694-7.429-6.564-10.341-8.569a16.037 16.037 0 0 1-6.947-12.606c-.396-10.567 3.348-21.456 11.698-29.806l21.054-21.055c5.521-5.521 14.182-6.199 20.584-1.731a152.482 152.482 0 0 1 20.522 17.197zM467.547 44.449c-59.261-59.262-155.69-59.27-214.96 0l-67.2 67.2c-.12.12-.25.25-.36.37-58.566 58.892-59.387 154.781.36 214.59a152.454 152.454 0 0 0 20.521 17.196c6.402 4.468 15.064 3.789 20.584-1.731l21.054-21.055c8.35-8.35 12.094-19.239 11.698-29.806a16.037 16.037 0 0 0-6.947-12.606c-2.912-2.005-6.64-4.875-10.341-8.569-28.073-28.073-28.191-73.639 0-101.83l67.2-67.19c28.239-28.239 74.3-28.069 102.325.51 27.75 28.3 26.872 73.934-1.155 101.96l-13.087 13.087c-4.35 4.35-5.769 10.79-3.783 16.612 5.864 17.194 9.042 34.999 9.69 52.721.509 13.906 17.454 20.446 27.294 10.606l37.106-37.106c59.271-59.259 59.271-155.699.001-214.959z" />
            </svg>';
$title = 'Morph To Morph Many';

$content = '
<p>This type of Polymorphic relation allows a model to have a relationship with many models.</p>
<p>In this project we have Videos which morphs to either a Series or a Collection model or any other Model we choose.</p>
<p>In order to set Videos to a morphMany() relationship we need to add <code>morphs(keyword)</code> to the Video migration.</p>
<div>
<code>
$table->morphs(\'watchable\');  <br>
$table->string(\'title\');<br>
...;</code></div>
<p>Note: the morphs() method creates 2 columns using the string passed in as a prefix. In this case watchable_type (which will be a reference to the model which it morphs to eg App\Models\Post) and watchable_id (which is the id of the Post Model we want to relate a Video to). See screenshot of the videos table below:</p>
 <img src="/images/videos_morphto_table.png" />
<p>In the Video model, we need to tell Laravel that it is a morphTo() relationship type. <b>Note:</b> The method name needs to be the same as the keyword stored in the database for the morphs columns eg (wathchable).
</p>
<div>
    <code>
    public function watchable(){<br>
        return $this->morphTo();<br>
    }<br>
    </code>
</div>
<p><b>Note:</b> We can use a different method name but the <code>morphs(keyword)</code> name needs to be included in the morphTo() method.</p>
<div>
    <code>public function views(){<br>
        return $this->morphTo(\'watchable\');<br>
    }</code>
</div>
<p>Then on any Model we want to have the polymorphic relation with Videos, we add the morphMany() method.<b>Note:</b> Rembember to add the name for the <code>morphs(keyword)</code>.</p>
<div>
    <code>
        public function videos(){<br>
            return $this->morphMany(Video::class, \'watchable\');<br>
        }<br>
    </code>
</div>
<p>In summary this type of polymorphic relationship allows a Model of any type to have a Video using the morph() keyword "watchable". See an example of how a Post entity can be attached to and creates a Video model below in tinker:</p>
<code>
$p3 = App\Models\Post::find(3);<br>
$p3->videos()->create([ \'title\' => \'Test title\', \'description\' => \'Test desc\', \'url\' => \'test.com\']);<br>
</code>
<!-- <p>This type of relationship is the inverse of morphedByMany() or Many to Many Polymorphic relationships. The Many To Many would allow a Video to have any Model we define instead.</p> -->
<!-- <p>There are limitations with this morphTo() relation on the Video model as if we want to add the same video to different Posts or Collections, we would have to copy the same content and only change the watchable_type and watchable_id. <u>I assume this is where morphToMany() polymorphic relations is useful.<u/></p> -->
';


$links = [
    (object)['name' => "Laravel Documentation", 'url' => "https://laravel.com/docs/8.x/eloquent-relationships#one-to-many-polymorphic-relations"],

    (object)['name' => 'Laracasts', 'url' => "https://laracasts.com/series/eloquent-relationships/episodes/5"],
];
$backLink = route('eloquent.list');
$category = 'Eloquent relaionships';

@endphp