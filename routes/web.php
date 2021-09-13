<?php

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


use Illuminate\Support\Facades\Route;



Route::get('/', 'HomeController@index');
Route::get('/post/{slug}', 'HomeController@show')->name('post.show');
Route::get('/tag/{slug}', 'HomeController@tag')->name('tag.show');
Route::get('/category/{slug}', 'HomeController@category')->name('category.show');

Route::get('/search', 'HomeController@search')->name('search');


Route::group([
    'middleware' => 'auth'
], function (){
Route::get('/logout', 'AuthController@logout');
Route::get('/profile', 'ProfileController@index');
Route::get('/profile/show-posts', 'ProfileController@showPosts')->name('profile.showPosts');
Route::get('/profile/show-comments', 'ProfileController@showComments')->name('profile.showComments');
Route::delete('/profile/comments/{id}/destroy', 
'ProfileController@destroyComments')->name('profile.destroyComments');
Route::get('/profile/new-post', 'ProfileController@newPost')->name('profile.newPost');
Route::post('/profile/store-post', 'ProfileController@storePost')->name('profile.storePost');
Route::post('/profile', 'ProfileController@store');

Route::post('/profile', 'ProfileController@store');

Route::post('/comment', 'CommentsController@store');

});

Route::group([
    'middleware' => 'guest'
], function (){
Route::get('/register', 'AuthController@registerForm');
Route::post('/register', 'AuthController@register');
Route::get('/login','AuthController@loginForm');
Route::post('/login', 'AuthController@login')->name('login');
});

Route::group(['prefix' => 'admin', 'namespace' => 'Admin',
'middleware' =>'admin'
], function () {
    Route::get('/', 'DashboardController@index');
    Route::resource('/categories', 'CategoriesController');
    Route::resource('/tags', 'TagsController');
    Route::resource('/users', 'UsersController');
    Route::resource('/posts', 'PostsController');
    Route::get('/posts/toggle/{id}','PostsController@toggle');
    Route::get('/comments','CommentsController@index');
    Route::get('/comments/toggle/{id}','CommentsController@toggle');
    Route::delete('comments/{id}/destroy', 
    'CommentsController@destroy')->name('comments.destroy');
});
