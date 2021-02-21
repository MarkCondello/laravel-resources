@extends('posts.show')

@php
$icon = '<svg width="30" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" data-prefix="fas"
                data-icon="link" class="svg-inline--fa fa-link fa-w-16" role="img" viewBox="0 0 512 512">
                <path fill="#a0aec0"
                    d="M326.612 185.391c59.747 59.809 58.927 155.698.36 214.59-.11.12-.24.25-.36.37l-67.2 67.2c-59.27 59.27-155.699 59.262-214.96 0-59.27-59.26-59.27-155.7 0-214.96l37.106-37.106c9.84-9.84 26.786-3.3 27.294 10.606.648 17.722 3.826 35.527 9.69 52.721 1.986 5.822.567 12.262-3.783 16.612l-13.087 13.087c-28.026 28.026-28.905 73.66-1.155 101.96 28.024 28.579 74.086 28.749 102.325.51l67.2-67.19c28.191-28.191 28.073-73.757 0-101.83-3.701-3.694-7.429-6.564-10.341-8.569a16.037 16.037 0 0 1-6.947-12.606c-.396-10.567 3.348-21.456 11.698-29.806l21.054-21.055c5.521-5.521 14.182-6.199 20.584-1.731a152.482 152.482 0 0 1 20.522 17.197zM467.547 44.449c-59.261-59.262-155.69-59.27-214.96 0l-67.2 67.2c-.12.12-.25.25-.36.37-58.566 58.892-59.387 154.781.36 214.59a152.454 152.454 0 0 0 20.521 17.196c6.402 4.468 15.064 3.789 20.584-1.731l21.054-21.055c8.35-8.35 12.094-19.239 11.698-29.806a16.037 16.037 0 0 0-6.947-12.606c-2.912-2.005-6.64-4.875-10.341-8.569-28.073-28.073-28.191-73.639 0-101.83l67.2-67.19c28.239-28.239 74.3-28.069 102.325.51 27.75 28.3 26.872 73.934-1.155 101.96l-13.087 13.087c-4.35 4.35-5.769 10.79-3.783 16.612 5.864 17.194 9.042 34.999 9.69 52.721.509 13.906 17.454 20.446 27.294 10.606l37.106-37.106c59.271-59.259 59.271-155.699.001-214.959z" />
            </svg>';
$title = 'Morph Many to Many';

$content = '
<p>This type of relationship allows a Polymorphic Model to have any other Model we define. The inverse of the MorphTo() relationship.</p>
<p>In this project we have Likables Model which can have Posts, Comments, Affiliations or any Model we want to be Likable.</p>
<p>To set this up we need a likables pivot table which uses the morhps() method to set the keyword, like in the morph-to-morph-to-many example. A user creates a like so that is set as part of the PKey and is set as a column as well.</p>
<div>
<code>
$table->primary([\'user_id\', \'likable_id\', \'likable_type\']);<br>
$table->unsignedInteger(\'user_id\');<br>
$table->morphs(\'likable\');<br>
</code>
</div>

<p>At this point we can connect any model we want to have a Likeable option. Because this code will need to be added to any Model, we should created a trait so it remains DRY.</p>
<div>
<code>
trait Likables { <br>
    //Morph to Many<br>
    public function like($user = null){<br>
        $user = $user ?: auth()->user();<br>
        //this will set the user_id and the Model reference to the likeables table<br>
        return $this->likes()->attach($user);<br>
    }<br><br>

    public function likes(){<br>
        //$this->morphToMany($related, $name, $table, $fkeyPivotKey);<br>
        return $this->morphToMany(User::class, \'likable\')->withTimestamps();<br>
    }<br>
}
</code>
</div>
<p>Then we can include this trait in any model which we want to have a likeable option.</p>
<p>We can test this out with a Comments model in tinker:</p>
<code>App\Models\Comment::find(4)->like(App\Models\User::first());</code>
<p>This will create a new database record in the Likeables table which points to the Comments table. See screenshot below:</p>
<img src="/images/morph_to_many_likables.png" />

<p>We can gather all the liked Comments or any other Model from a User model with a morphedByMany() method like the following:</p>
<code>
    public function likedComments(){<br>
         return $this->morphedByMany(Comment::class, \'likable\');<br>
    }<br>

</code>
</div>
';


$links = [
    (object)['name' => "Laravel Documentation", 'url' => "https://laravel.com/docs/8.x/eloquent-relationships#many-to-many-polymorphic-relations"],

    (object)['name' => 'Laracasts', 'url' => "https://laracasts.com/series/eloquent-relationships/episodes/6"],
];
$backLink = route('eloquent.list');
$category = 'Eloquent relaionships';

@endphp