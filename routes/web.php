<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\WorkController;

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

Route::get('/', function () {
    return view('welcome');
});

Route::get('/works', [WorkController::class, 'index']);
Route::prefix('/work')->group( function () {
    Route::post('/store', [WorkController::class, 'store']);
    Route::put('/{id}/start', [WorkController::class, 'startWork']);
    Route::put('/{id}/stop', [WorkController::class, 'stopWork']);
    Route::delete('/{id}', [WorkController::class, 'destroy']);
    Route::get('/search/{date}', [WorkController::class, 'searchData']);
    Route::get('/search/{date_from}/{date_to}', [WorkController::class, 'searchDataRange']);
    }
);