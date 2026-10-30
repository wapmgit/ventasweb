<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\View;
use App\Models\Empresa;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //
		Paginator::useBootstrap();
		//de la empresa
		View::composer('*', function ($view) {
            // Aquí buscas tu empresa (puedes ajustar el query según cómo guardes los datos)
            $empresa = Empresa::first(); 
            
            // Compartimos la variable $empresa con todas las vistas
            $view->with('NombreEmpresa', $empresa->nombre);
        });
    }
}
