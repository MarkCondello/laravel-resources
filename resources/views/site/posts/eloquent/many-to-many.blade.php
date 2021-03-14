@extends('site.posts.show')

@php
$icon = '<svg width="30" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" data-prefix="fas"
                data-icon="link" class="svg-inline--fa fa-link fa-w-16" role="img" viewBox="0 0 512 512">
                <path fill="#a0aec0"
                    d="M326.612 185.391c59.747 59.809 58.927 155.698.36 214.59-.11.12-.24.25-.36.37l-67.2 67.2c-59.27 59.27-155.699 59.262-214.96 0-59.27-59.26-59.27-155.7 0-214.96l37.106-37.106c9.84-9.84 26.786-3.3 27.294 10.606.648 17.722 3.826 35.527 9.69 52.721 1.986 5.822.567 12.262-3.783 16.612l-13.087 13.087c-28.026 28.026-28.905 73.66-1.155 101.96 28.024 28.579 74.086 28.749 102.325.51l67.2-67.19c28.191-28.191 28.073-73.757 0-101.83-3.701-3.694-7.429-6.564-10.341-8.569a16.037 16.037 0 0 1-6.947-12.606c-.396-10.567 3.348-21.456 11.698-29.806l21.054-21.055c5.521-5.521 14.182-6.199 20.584-1.731a152.482 152.482 0 0 1 20.522 17.197zM467.547 44.449c-59.261-59.262-155.69-59.27-214.96 0l-67.2 67.2c-.12.12-.25.25-.36.37-58.566 58.892-59.387 154.781.36 214.59a152.454 152.454 0 0 0 20.521 17.196c6.402 4.468 15.064 3.789 20.584-1.731l21.054-21.055c8.35-8.35 12.094-19.239 11.698-29.806a16.037 16.037 0 0 0-6.947-12.606c-2.912-2.005-6.64-4.875-10.341-8.569-28.073-28.073-28.191-73.639 0-101.83l67.2-67.19c28.239-28.239 74.3-28.069 102.325.51 27.75 28.3 26.872 73.934-1.155 101.96l-13.087 13.087c-4.35 4.35-5.769 10.79-3.783 16.612 5.864 17.194 9.042 34.999 9.69 52.721.509 13.906 17.454 20.446 27.294 10.606l37.106-37.106c59.271-59.259 59.271-155.699.001-214.959z" />
            </svg>';
$title = 'Many To Many';

$content = '
<p>In this code base we have Post which can have many Tags and we have Tags which can have many Posts. Neither of these tables relates to the other through a FKey.</p>
<p>For this relationship to work, a pivot table is required. In this case we have made a posts_tags table which follows the naming convention for weak entities. Usually this table includes a composite primary key of the entities it relates to. This is so there are no duplicate combinations for Posts/Tags. It also includes FKeys\'s for each table respectively. See the migration for the posts_tags table below:</p>
<code>
$table->primary([\'post_id\', \'tag_id\']);<br>
$table->foreignId(\'post_id\')->constrained()->onDelete(\'cascade\');<br>
$table->foreignId(\'tag_id\')->constrained()->onDelete(\'cascade\');<br><br>
</code>
<p>The Post and Tag models each have a belongsTo() relationship which connects it to the other Model.</p>
<div>
    <code>//Post model<br>
    public function tags(){<br>
        return $this->belongsToMany(Tag::class)->withTimestamps();<br>
        }</code><br><br>
</div>
<div>
    <code>//Tag model<br>
    public function posts(){<br>
        return $this->belongsToMany(Post::class)->withTimestamps();<br>
        }</code><br> 
</div>
<p>Note: withTimestamps() will save timestamp details to the pivot table.</p>

<p>We can test this connection be attaching the oposite model using tinker. The following will find a post with an id of 12 and add tags with an id of 1, 2 and 3. This will be saving in the posts_tags table:
</p>
<code> App\Models\Post::find(12)->tags()->attach([1, 2, 3]);
</code>
<p>Note: The inverse is also an option where we can detatch and thereby remove items from the posts_tags table.</p>
';

$links = [
    (object)['name' => "Laravel Documentation", 'url' => "https://laravel.com/docs/8.x/eloquent-relationships#many-to-many"],

    (object)['name' => 'Laracasts', 'url' => "https://laracasts.com/series/eloquent-relationships/episodes/3"],
];
$backLink = route('eloquent.list');
$category = 'Eloquent relaionships';

@endphp