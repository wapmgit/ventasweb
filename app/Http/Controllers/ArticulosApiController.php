<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Http;
use App\Models\Articulos;
use Exception;
use Illuminate\Support\Facades\Redirect;
use DB;
use Carbon\Carbon;

class ArticulosApiController extends Controller
{
	private $errorServer = ['status' => 500, 'message' => 'Error de comunicación con el servidor de la base de datos.', 'data' => ''];
	private $recordsNotFound = ['status' => 400, 'message' => '0 registros encontrados.', 'data' => ''];

	public function sendData()
    {
   try {	  
			$article = DB::table('articulos')->join('categoria as cat','cat.idcategoria','=','articulos.idcategoria')
			->select ('cat.idcategoria','articulos.idarticulo','articulos.codigo','articulos.nombre','articulos.costo','articulos.precio1','articulos.precio2','articulos.precio3','articulos.pvip','articulos.stock','articulos.peso','articulos.imagen','articulos.fraccion','articulos.cntxund','articulos.cntgrupo')
			->where('articulos.estado','=',"Activo")
			->OrderBy('articulos.idcategoria','asc')
			->get(); 
			
		$empresa=DB::table('empresa')->first();
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
			$articlejs=json_encode($article);
			
            $response = Http::post('http://creciven.com/api/recibir-articulos', [
                'empresa' => $empresa->codigo,
                'articulos' => $articlejs,
				'datosventa' => $datosclijs 
            ]);
			

       } catch (Exception $e) {
		   
             return Redirect::to('sininternet');
        }
		 return Redirect::to('articulos');
    }

}
