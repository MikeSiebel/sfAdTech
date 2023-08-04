@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <!--<div class="card-header">{{ __('Dashboard') }}</div>-->
                <div class="card-header">Трекер трафика взаимодействия рекламодателей и владельцев сайтов</div>
                <div class="card-body">
                        <div class="jumbotron">
                          <h1 class="display-4">Размещение рекламы в интернете</h1>
                          <p class="lead">Онлайн реклама в одном месте. Мы предоставляем услуги размещения интернет-рекламы на различных платформах для рекламодателей.</p>
                          <p class="lead">Возможности заработка для веб-мастеров. Мы предлагаем веб-мастерам возможность получать дополнительный доход за размещение интернет-рекламы на их рекурсосах.</p>
                          <hr class="my-4">
                          <p class="lead">Гарантированное качество и результат. Мы обеспечиваем высокое качество услуги по рекламе и гарантируем эффективность вашей рекламной кампании.</p>
                          <p class="text-center">
                          <a class="btn btn-outline-secondary btn-lg" href="https://github.com/MikeSiebel/sfadtech/blob/main/description.md" target="_blank" role="button">Получить дополнительную информацию</a>
                          </p>
                        </div>
                    <hr>
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    <p class="text-center">
                    {{ __('You are logged in!') }}
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
