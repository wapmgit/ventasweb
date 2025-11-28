<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use App\Models\Articulo;
use DB;

class SendArticle extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'enviarArticulos';

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
		$article = DB::table('articulos')->join('categoria as cat','cat.idcategoria','=','articulos.idcategoria')
			->select ('articulos.idarticulo','articulos.codigo','articulos.nombre','articulos.costo','articulos.precio1','articulos.precio2','articulos.stock')
			->where('articulos.estado','=',"Activo")
			->get(); 
			$articlejs=json_encode($article);

            $response = Http::post('http://creciven.com/api/recibir-articulos', [
                'empresa' => $empresa->codigo,
                'articulos' => $articlejs,
            ]);
    }
}
