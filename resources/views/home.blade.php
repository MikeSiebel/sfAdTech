@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Dashboard') }}</div>

                <div class="card-body">
                        <div class="jumbotron">
                          <h1 class="display-4">Публикация онлайн-рекламы</h1>
                          <p class="lead">Мы предлагаем рекламодателям услуги по размещению интернет-рекламы на разнообразных платформах.</p>
                          <p class="lead">Мы предоставляем web-мастерам возможность заработать дополнительные средства, размещая интернет-рекламу на своих ресурсах</p>
                          <hr class="my-4">
                          <p class="lead">Мы гарантируем высокое качество рекламных услуг и эффективность вашей рекламной кампании.</p>
                          <p class="text-center">
                          <a class="btn btn-outline-secondary btn-lg" href="https://github.com/MikeSiebel/sfadtech/blob/main/description.md" target="_blank" role="button">Узнать больше</a>
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
