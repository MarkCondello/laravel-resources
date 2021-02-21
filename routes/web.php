<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\WelcomeController;
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

 Route::get('/', [WelcomeController::class, 'home'])->name('home');

//ToDo: Replace all this with a dynamically created links from post categories and their posts instead
Route::group([
    'prefix' => 'eloquent',
    'as' => 'eloquent.',

], function(){
    Route::get('/', function(){
        return view('posts.list');
    })->name('list');


    Route::get('/one-to-one', function(){
        return view('posts.eloquent.one-to-one');
    })->name('one-to-one');

    Route::get('/one-to-many', function(){
        return view('posts.eloquent.one-to-many');
    })->name('one-to-many');

    Route::get('/many-to-many', function(){
        return view('posts.eloquent.many-to-many');
    })->name('many-to-many');

    Route::get('/has-many-through', function(){
        return view('posts.eloquent.has-many-through');
    })->name('has-many-through');

    Route::get('/morph-to-morph-many', function(){
        return view('posts.eloquent.morph-to-morph-many');
    })->name('morph-to-morph-many');

    Route::get('/morph-many-to-many', function(){
        return view('posts.eloquent.morph-many-to-many');
    })->name('morph-many-to-many');
}, 
  
);
//  Route::get('/eloquent', function(){
//     return view('posts.list');
//  })->name('eloquent');
