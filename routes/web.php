<?php

use Illuminate\Support\Facades\Route;
// ToDo: Add the COntrollers paths here
use App\Http\Controllers\Site\HomeController;
use App\Http\Controllers\Site\TagController;
use App\Http\Controllers\PayOrderController;

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

// Should have a site group
Route::get('/', [HomeController::class, 'home'])->name('home');

Route::get('tag/{tagName}', [TagController::class, 'tagsPostList'])->name('tag.post.list');
Route::get('tag/{tagName}/{postSlug}', [TagController::class, 'tagsPostShow'])->name('tag.post.show');
 
Auth::routes();

Route::get('pay', [PayOrderController::class, 'store']);

Route::get('/lightbox', function(){
    return view('site.lightbox');
});

// Service Container example
Route::get('/container', function(){
    $container = new \App\Container();
    $container->bind('example', function(){
        return new \App\Example();
    });
    $example = $container->resolve('example');
    ddd($example->go());
});

// app()->bind('example', function(){
//     $foo = config('services.foo.key');
//     return new \App\Example($foo);
// });

Route::get('/laravels-container', function(){
//Route::get('/laravels-container', function(App\Example $example){

    //$example = app()->make(App\Example::class);
    //$example = resolve(App\Example::class);
    $example = resolve('App\Example');
    // ddd($example->collaborator->FunctionName());
    ddd($example->foo, $example->foo); // the same singleton object

});

Route::group([
        'prefix' => 'admin',
        'as' => 'admin.',
        'middleware' => ['can:access_admin', 'auth'],
        //'middleware' => 'can:access_admin',
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
