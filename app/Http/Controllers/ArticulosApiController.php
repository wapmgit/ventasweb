<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Http;
use App\Models\Articulos;
use Exception;
use Illuminate\Support\Facades\Redirect;
use DB;

class ArticulosApiController extends Controller
{
	private $errorServer = ['status' => 500, 'message' => 'Error de comunicación con el servidor de la base de datos.', 'data' => ''];
	private $recordsNotFound = ['status' => 400, 'message' => '0 registros encontrados.', 'data' => ''];

	public function sendData()
    {
   try {	  
		$article = Articulo::selectRaw("
        codweb as barcode,
        SUBSTRING_INDEX(nombre, '*', 1) as name,
        ROUND(stock, 2) as stock,
        iva,
        IF(cntxund > 1, ROUND((precio1 / cntxund), 2), ROUND(precio1, 2)) as price,
        unidad as unit,
        ROUND(cntxund, 0) as cntxund,
        ROUND(cntgrupo, 0) as cntgrupo,
        ROUND(fraccion, 2) as fraccion,
        peso as weight,
        codigo as codesv,
        imagen as img
    ")
    ->where('stock', '>', 0)
    ->whereNotNull('codweb')
    ->orderBy('name', 'asc')
    ->get();
		/*	$article = DB::table('articulos')->join('categoria as cat','cat.idcategoria','=','articulos.idcategoria')
			->select ('cat.idcategoria','articulos.idarticulo','articulos.codigo','articulos.nombre','articulos.costo','articulos.precio1','articulos.precio2','articulos.precio3','articulos.stock','articulos.imagen','articulos.fraccion','articulos.cntxund','articulos.cntgrupo')
			->where('articulos.estado','=',"Activo")
			->OrderBy('articulos.idcategoria','asc')
			->get(); */
			$articlejs=json_encode($article);
		$empresa=DB::table('empresa')->first();

            $response = Http::post('http://creciven.com/api/recibir-articulos', [
                'empresa' => $empresa->codigo,
                'articulos' => $articlejs,
            ]);
			

       } catch (Exception $e) {
		   
             return Redirect::to('sininternet');
        }
		 return Redirect::to('articulos');
    }

}
