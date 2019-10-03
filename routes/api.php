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

Route::post('/user/admin/register', 'Api\Admin\AdminAuthController@register');
Route::post('/user/admin/login', 'Api\Admin\AdminAuthController@login');
Route::get('/user/admin/me', 'Api\Admin\AdminAuthController@mepoint');
Route::post('/user/admin/logout', 'Api\Admin\AdminAuthController@out');

Route::post('/user/seller/register', 'Api\Seller\SellerAuthController@register');
Route::post('/user/seller/login', 'Api\Seller\SellerAuthController@login');
Route::get('/user/seller/me', 'Api\Seller\SellerAuthController@mepoint');
Route::post('/user/seller/logout', 'Api\Seller\SellerAuthController@out');


Route::post('/register', 'Api\AuthController@register');
Route::post('/login', 'Api\AuthController@login');

Route::get('login/{providers}', 'Api\AuthController@redirectToProvider');
Route::get('login/{provider}/callback', 'Api\AuthController@handleProviderCallback');

Route::resource('categories', 'Api\Categories\CategoryController');
Route::resource('products', 'Api\Products\ProductController');