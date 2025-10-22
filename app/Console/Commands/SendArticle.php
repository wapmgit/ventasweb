<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Articulo;

class SendArticle extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command:name';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
		$empresa=DB::table('empresa')->first();
      $article = DB::table('articulo')->join('categoria as cat','cat.idcategoria','=','articulo.idcategoria')
			->select ('articulo.idarticulo','articulo.codigo','articulo.nombre','articulo.costo','articulo.precio1','articulo.precio2','articulo.stock')
			->where('cat.servicio','=',0)
			->where('articulo.estado','=',"Activo")
			->get(); 

		$articlejs=json_encode($article);
		  $response = Http::post('http://creciven.com/api/recibir-articulos',[
			'form_params' => [
				'empresa' =>$empresa->codigo,
				'articulos' => $articlejs 
				]
			]);
    }
}
