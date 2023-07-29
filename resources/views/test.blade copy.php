@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Тестирование рекламных ссылок для {{ Auth::user()->name }}</div>

                   <!-- ....-->
                        <a href="javascript:go(1)">Ссылка на оффер без подписки</a>
                    </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        
        // переход по ссылке на рекламу
        function go(id) {
            let url = "{{route('go',0)}}".slice(0, -1) + id;
            let token = getToken(go, id);
            if (!token) {
                return;
            }

            axios.defaults.withCredentials = true;
            const instance = axios.create({
                baseURL: url,
                headers: {
                    'Authorization': `Bearer ${token}`,
                    'Content-Type': 'application/json'
                }
            });
            instance.get('/')
                .then(response => {
                    console.log(response.data);
                    var href = response.data;
                    window.open(href, '_blank').focus();
                })
                .catch(error => {
                    //console.error(error);
                    alert(error);
                });
        }
        // функция генерации токена
        function createToken() {
            const url = '/token/create';
            const instance = axios.create({
                baseURL: url
            });
            instance.get('/')
                .then(response => {
                    var token = response.data; //$(this).attr('href');
                    let elem = document.querySelector('#token');
                    elem.value = token;
                })
                .catch(error => {
                    console.error(error);
                    var token = error;
                });
        }
        // функция возвращает токен пользователя из поля "Токен". Если его нет - генерирует новый и повторно вызывает функцию перехода по ссылке
        function getToken(func, id) {
            let elem = document.querySelector('#token');
            let token = elem.value;
            if (!token){
                console.log('Токен не указан. Пробую получить');
                createToken();
                setTimeout(func /* go */, 1000, id)
                return;
            } else {
                return token;
            }
        }
        // копирование токена в буфер обмена
        function tokenToClipboard() {
            let text = document.querySelector('#token');
            text.select();
            document.execCommand("copy");
        }

    </script>
@endsection
