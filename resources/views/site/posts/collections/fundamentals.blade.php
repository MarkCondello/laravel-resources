@extends('site.posts.show')

@php
$icon = '<svg width="30" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false" data-prefix="fas"
                data-icon="link" class="svg-inline--fa fa-link fa-w-16" role="img" viewBox="0 0 512 512">
                <path fill="#a0aec0"
                    d="M326.612 185.391c59.747 59.809 58.927 155.698.36 214.59-.11.12-.24.25-.36.37l-67.2 67.2c-59.27 59.27-155.699 59.262-214.96 0-59.27-59.26-59.27-155.7 0-214.96l37.106-37.106c9.84-9.84 26.786-3.3 27.294 10.606.648 17.722 3.826 35.527 9.69 52.721 1.986 5.822.567 12.262-3.783 16.612l-13.087 13.087c-28.026 28.026-28.905 73.66-1.155 101.96 28.024 28.579 74.086 28.749 102.325.51l67.2-67.19c28.191-28.191 28.073-73.757 0-101.83-3.701-3.694-7.429-6.564-10.341-8.569a16.037 16.037 0 0 1-6.947-12.606c-.396-10.567 3.348-21.456 11.698-29.806l21.054-21.055c5.521-5.521 14.182-6.199 20.584-1.731a152.482 152.482 0 0 1 20.522 17.197zM467.547 44.449c-59.261-59.262-155.69-59.27-214.96 0l-67.2 67.2c-.12.12-.25.25-.36.37-58.566 58.892-59.387 154.781.36 214.59a152.454 152.454 0 0 0 20.521 17.196c6.402 4.468 15.064 3.789 20.584-1.731l21.054-21.055c8.35-8.35 12.094-19.239 11.698-29.806a16.037 16.037 0 0 0-6.947-12.606c-2.912-2.005-6.64-4.875-10.341-8.569-28.073-28.073-28.191-73.639 0-101.83l67.2-67.19c28.239-28.239 74.3-28.069 102.325.51 27.75 28.3 26.872 73.934-1.155 101.96l-13.087 13.087c-4.35 4.35-5.769 10.79-3.783 16.612 5.864 17.194 9.042 34.999 9.69 52.721.509 13.906 17.454 20.446 27.294 10.606l37.106-37.106c59.271-59.259 59.271-155.699.001-214.959z" />
            </svg>';
$title = 'Collection Fundamentaks';

$content = '
<p>Laravel collections are one of the core concepts for using the Laravel framework.</p>
<p>When we query the database with Eloquent or standard Queries, we get a collection which we can do modifications to.</p>
<p>An example of a query instead of a collection method can be seen below. It asks for the relationship of a Post to get its Tags in the collection:</p>
<div>
    <code>$posts = App\Post::with('tags')->get()</code>
</div>
<p>In this code base we have an User entity which is connected to an Affiliation through a FKey <code>affiliation_id</code>.</p>
<p>If we use the <code>$articles</code> collection as our stating point we can modify the result using collection functions.</p>
<code>$posts->pluck('tags')->flatten()->pluck('name')->unique()->map(function($item){ return ucwords($item); })</code>
 <p>The previous is an example of what can be done with colllections. The above does the following:</p>
 <ol>
 <li>Grabs all the tags from the $posts collection,</li>
 <li>Flattend the result into 1 dimensional array,</li>
 <li>Plucks the name from each item in that array,</li>
 <li>Returns only the unique items</li>
 <li>And lastly maps over each item and returns an uppercase word.</li>

 </ol>
 <p>We can also create a collection using the <code>collect(Array)</code> helper function.</p>
 <p>With the array we pass into that, and storing the returned value of the collection into a variable, we can do collection modifications like above.</p>
<p>The more popular collections functions used are:</p>
 <ul>
 <li>map()</li>
 <li>filter()</li>
 <li>flatMap()</li>
 <li>where()</li>
 <li>merge()</li>
 </ul>
<p>We can check all the methods available in the Collection class under the Illuminate\Support namespace. The full list of options can be seen <a href="https://laravel.com/docs/8.x/collections#available-methods" target="_blank">here.</a></p>

';

$links = [
    (object)['name' => 'Laravel Docs', 'url' => "https://laravel.com/docs/8.x/collections#available-methods"],

    (object)['name' => 'Laracasts', 'url' => "https://laracasts.com/series/laravel-6-from-scratch/episodes/36"],
];
<!-- $backLink = route('eloquent.list'); -->
$category = 'Laravel Collections';

@endphp