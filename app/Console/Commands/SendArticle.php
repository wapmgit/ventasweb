<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use App\Models\Articulo;
use Carbon\Carbon;
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
			->select ('cat.idcategoria','articulos.idarticulo','articulos.codigo','articulos.nombre','articulos.costo','articulos.precio1','articulos.precio2','articulos.precio3','articulos.stock','articulos.peso','articulos.imagen','articulos.fraccion','articulos.cntxund','articulos.cntgrupo')
			->where('articulos.estado','=',"Activo")
			->get(); 
			$articlejs=json_encode($article);
			$fechaLimite = Carbon::now()->subWeeks(6)->startOfWeek();
			$datoscli = DB::table('detalle_venta as dv') 
				->join('venta as ve','ve.idventa','=','dv.idventa')    
				->join('clientes as cli','cli.id_cliente','=','ve.idcliente')             
				->join('articulos as a', 'a.idarticulo','=','dv.idarticulo')              
				->select(
					'cli.id_cliente',
					DB::raw('sum(dv.cantidad) as vendido'),
					DB::raw('sum(dv.cantidad*dv.precio_venta) as monto'),
					'dv.idarticulo'
				)
				->where('ve.devolu', '=', 0)
				->where('ve.fecha_emi', '>=', $fechaLimite) // <--- Filtro de las últimas 6 semanas
				->groupBy('cli.id_cliente', 'dv.idarticulo')
				->orderBy('cli.id_cliente')
				->get();
			$datosclijs=json_encode($datoscli);
            $response = Http::post('http://creciven.com/api/recibir-articulos', [
                'empresa' => $empresa->codigo,
                'articulos' => $articlejs,
				'datosventa' => $datosclijs 
            ]);
    }
}
