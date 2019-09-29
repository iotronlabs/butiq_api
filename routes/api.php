<?php

use App\Models\Category;
use Illuminate\Http\Request;

 
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


Route::post('/register', 'Api\AuthController@register');
Route::post('/login', 'Api\AuthController@login');

Route::get('login/{providers}', 'Api\AuthController@redirectToProvider');
Route::get('login/{provider}/callback', 'Api\AuthController@handleProviderCallback');

Route::resource('categories', 'Api\Categories\CategoryController');
Route::resource('products', 'Api\Products\ProductController');