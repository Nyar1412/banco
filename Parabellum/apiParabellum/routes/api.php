<?php

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

Route::post('register', 'AuthController@register')->middleware('cors');
Route::post('login', 'AuthController@login')->middleware('cors');

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::get('Usuario/{id}', 'UsuarioController@show');
Route::get('Usuario', 'UsuarioController@index');

Route::put('Usuario', 'UsuarioController@update');
Route::delete('Usuario', 'UsuarioController@destroy');

