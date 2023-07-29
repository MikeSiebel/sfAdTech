<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Http\Library\ApiHelpers;
use App\Models\Redir;
use App\Models\User;
use App\Models\Offer;
use App\Models\Subscribe;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Str;
use GuzzleHttp\Client;
use App\Http\Controllers\UserController;
use App\Http\Controllers\SubscribeController;


class RedirController extends Controller
{
    // Просмотр информации о переходах по подписке
    public function from_subs($id)
    {
        $subscribe = Subscribe::find($id);
        return view('redir-index', ['offer' => false, 'subscribe' => $subscribe,
            'redirs' => Redir::LimitAL()->whereRaw('offer_id in (select s.offer_id from subscribes s where s.id = ?)', [$subscribe->id])->orderByDesc('id')->paginate(10)]);
    }
    // Просмотр информации о переходах по офферу
    public function from_offer($id)
    {
        $offer = Offer::find($id);
        return view('redir-index', ['offer' => $offer, 'subscribe' => false,
            'redirs' => Redir::LimitAL()->where(['offer_id' => $offer->id])->orderByDesc('id')->paginate(10)]);
    }
    // Запрос рекламной ссылки

    public function go(Request $request, $id)
    {

        $subscribe = Subscribe::where(['id' => $id])->first();
        if (!$subscribe){
            return route('redirerr');
        }
        
        $offer_url = $this->create($subscribe);
        return $offer_url;
    }
    // Сохранение информации о запросе рекламной ссылки
    public function create(Subscribe $subscribe)
    {
        $redir = new Redir();
        $redir->offer_id = $subscribe->offer->id;
        $redir->webmaster_id = Auth::user()->id;
        $redir->accept = $redir->webmaster_id == $subscribe->webmaster->id;
        $redir->success = false;
        $redir->save();
        if ($redir->accept) {
            return $subscribe->offer->url.'?rd='.$redir->id;
        } else {
            return route('redirerr');
        }
    }
    // Подтверждение перехода по рекламной ссылке
    public function success(Request $request, $id)
    {
        //$user = $this->get_user($request);
        $redir = Redir::find($id);
        // Проверка наличия оффера у рекламодателя
        if (!$redir){
            return route('redirerr');
        } else {
            $this->update_success($redir);
            return true;
        }
    }
    // Обновление подтверждения о факте перехода по рекламной ссылке
    public function update_success(Redir $redir)
    {
        $redir->success = true;
        $redir->save();
    }
    // Получение нового токена
    public function new_token(Request $request){
        if(Auth::check()){
            Auth::user()->tokens()->delete();
            return auth()
                ->user()
                ->createToken(auth()->user()->name)
                ->plainTextToken;
        } else {
            return 'User not authenticated';
        }
    }

    // Авторизация с использованием токена

    public function get_user(Request $request)
    {
        // Установка параметров запроса
        $url = 'http://localhost/api/user';
        $token = '7|HZYaGY7RaLt0uUF9qtThSmwdWeoP87syQghjaHkh';

        // Создание экземпляра GuzzleHttp\Client с авторизационным заголовком
        $client = new Client([
            'headers' => [
                'Authorization' => 'Bearer ' . $token
            ]
        ]);

        // Отправка GET-запроса с использованием экземпляра GuzzleHttp\Client
        $response = $client->request('GET', $url);

        // Получение ответа в формате JSON
        $user = json_decode($response->getBody(), true);

        // Вывод данных пользователя
        return $user;

    }

}
