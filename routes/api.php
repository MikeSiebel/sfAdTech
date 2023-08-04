<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RedirController;
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

// ad link request for $id subscription 
// запрос рекламной ссылки для $id подписки
Route::middleware('auth:sanctum')->get('/go/{id}',  [RedirController::class, 'go'])->name('go');

// confirmation of clicking on an advertising link for $id subscription
Route::middleware('auth:sanctum')->get('/success/{id}',  [RedirController::class, 'success'])->name('success');

 Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    $request->user();
});

