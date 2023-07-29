<?php

use App\Http\Controllers\Auth\RegisterController;
use Laravel\Sanctum\HasApiTokens;

use App\Models\Subscribe;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Request;
use App\Http\Controllers\HomeController;

use App\Http\Controllers\OfferController;
use App\Http\Controllers\UserOfferController;
use App\Http\Controllers\SubscribeController;
use App\Http\Controllers\OfferSubscribeController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\RedirController;
use App\Http\Controllers\ReportController;


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

Auth::routes([ 'reset' => false,'verify' => false]);

Route::redirect('/home', '/');
Route::get('/', [HomeController::class, 'index'])->name('home');

Route::group(['middleware' => 'auth'], function() {
    Route::resources([
        'offers' => OfferController::class,
        'users.offers' => UserOfferController::class,
        'subscribes' => SubscribeController::class,
        'offers.subscribes' => OfferSubscribeController::class,
        'clients' => ClientController::class,
        'clients.bids' => ClientBidController::class,
        'clients.contracts' => ClientContractController::class,
        'clients.representatives' => ClientRepresentativeController::class,
        'representatives' => RepresentativeController::class,
        'bids' => BidController::class,
        'bids.events' => BidEventController::class,
        'events' => EventController::class,
        'contracts' => ContractController::class,
        'users' => UserController::class
    ]);
});

/* ------------ Link clicks ------------ */
// Офферная страница с рекламной ссылкой
Route::get('/offers/redirs/{id}', [RedirController::class, 'from_offer']
)->middleware('auth');
// Страница, доступная по рекламной ссылке для оформления подписки
Route::get('/subscribes/redirs/{id}', [RedirController::class, 'from_subs']
)->middleware('auth');

Route::get('/test', [SubscribeController::class, 'test']
)->middleware('auth')->name('test');

// Страница оповещения о несанкционированном/недопустимом переходе по рекламной ссылке
Route::get('/redirerr', function () {
    return view('redirerr');
}
)->middleware('auth')->name('redirerr');

// Ручное подтверждение перехода по ссылке
Route::get('/redirs/success/{id}', [RedirController::class, 'success']
)->middleware('auth');

/* ------------- Отчеты --------------- */
// Каталог отчетов
Route::get('/reports', [ReportController::class, 'index']
)->middleware('auth')->name('reports');

// Отчет
Route::match(['get', 'post'], '/reports/show/{id}', [ReportController::class, 'show']
)->middleware('auth')->name('reports.show');

// Запрос информации для создания графиков на странице отчетов
Route::get('/reports/charts/data/{id}', [ReportController::class, 'chart_data']
)->middleware('auth')->name('charts.data');

/* ------------- Сервисные --------------- */
// Получение информации о пользователе
Route::get('getuser', [RedirController::class, 'get_user']);
// Тестирование авторизации с использованием токена
Route::get('token/create', [RedirController::class, 'new_token']);

