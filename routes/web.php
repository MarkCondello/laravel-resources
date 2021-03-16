<?php

use Illuminate\Support\Facades\Route;
// ToDo: Add the COntrollers paths here
use App\Http\Controllers\Site\HomeController;
use App\Http\Controllers\Site\TagController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// SHould have a site group
Route::get('/', [HomeController::class, 'home'])->name('home');

Route::get('tag/{tagName}', [TagController::class, 'tagsPostList'])->name('tag.post.list');
Route::get('tag/{tagName}/{postSlug}', [TagController::class, 'tagsPostShow'])->name('tag.post.show');



//ToDo: Replace all this with a dynamically created links from post categories and their posts instead
Route::group([
    'prefix' => 'eloquent',
    'as' => 'eloquent.',

], function(){
    Route::get('/', function(){
        return view('site.posts.list');
    })->name('list');

    Route::get('/one-to-one', function(){
        return view('site.posts.eloquent.one-to-one');
    })->name('one-to-one');

    Route::get('/one-to-many', function(){
        return view('site.posts.eloquent.one-to-many');
    })->name('one-to-many');

    Route::get('/many-to-many', function(){
        return view('site.posts.eloquent.many-to-many');
    })->name('many-to-many');

    Route::get('/has-many-through', function(){
        return view('site.posts.eloquent.has-many-through');
    })->name('has-many-through');

    Route::get('/morph-to-morph-many', function(){
        return view('site.posts.eloquent.morph-to-morph-many');
    })->name('morph-to-morph-many');

    Route::get('/morph-many-to-many', function(){
        return view('site.posts.eloquent.morph-many-to-many');
    })->name('morph-many-to-many');
});
 
Auth::routes();

Route::group([
    'prefix' => 'admin',
    'as' => 'admin.',
    'middleware' => 'auth',
    ], 
    function(){
        Route::get('/dash', [App\Http\Controllers\Admin\DashController::class, 'index'])->name('dash');

        Route::group([
            'prefix' => '/post',
            'as' => 'post.',
        ], function(){
            Route::get('/list', [App\Http\Controllers\Admin\PostController::class, 'index'])->name('index');
            Route::post('/save', [App\Http\Controllers\Admin\PostController::class, 'store'])->name('save');
            Route::get('/add', [App\Http\Controllers\Admin\PostController::class, 'create'])->name('create');
            Route::post('/save-image', [App\Http\Controllers\Admin\PostController::class, 'saveBlockImg'])->name('save.image');

            Route::post('/{post}/edit', [App\Http\Controllers\Admin\PostController::class, 'edit'])->name('edit');
            Route::get('/{post}/update', [App\Http\Controllers\Admin\PostController::class, 'update'])->name('update');
            Route::delete('/{post}/delete', [App\Http\Controllers\Admin\PostController::class, 'destroy'])->name('destroy');
        });

        Route::group([
            'prefix' => '/tag',
            'as' => 'tag.',
        ], function(){
    
            Route::get('/list', [App\Http\Controllers\Admin\TagController::class, 'index'])->name('index');
            Route::get('/add', [App\Http\Controllers\Admin\TagController::class, 'create'])->name('create');
            Route::post('/save', [App\Http\Controllers\Admin\TagController::class, 'store'])->name('save');
           
            Route::get('/{tag}/update', [App\Http\Controllers\Admin\TagController::class, 'update'])->name('update');
            Route::post('/{tag}/edit', [App\Http\Controllers\Admin\TagController::class, 'edit'])->name('edit');
            Route::delete('/{tag}/delete', [App\Http\Controllers\Admin\TagController::class, 'destroy'])->name('destroy');
        });

        Route::group([
            'prefix' => '/images',
            'as' => 'images.',
        ], function(){
            Route::get('/', [App\Http\Controllers\Admin\ImageController::class, 'create'])->name('create');
            Route::post('/',  [App\Http\Controllers\Admin\ImageController::class, 'store'])->name('save');
            Route::get('/{image}',  [App\Http\Controllers\Admin\ImageController::class, 'show'])->name('show');
        });

        // Admin API routes
        Route::group([
            'prefix' => 'api',
            'as' => 'api.',
        ], function(){

            Route::group([
                'prefix' => '/post',
                'as' => 'post.',
            ], function(){
                Route::get('/list', [App\Http\Controllers\Admin\Api\PostController::class, 'list'])->name('list');
            });

            Route::group([
                'prefix' => '/tag',
                'as' => 'tag.',
            ], function(){
                Route::get('/list', [App\Http\Controllers\Admin\Api\TagController::class, 'list'])->name('list');
            });

        });
    }
);
