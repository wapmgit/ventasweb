<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Rutas;
use App\Models\Subrutas;
use Illuminate\Support\Facades\Redirect;
use DB;
use Auth;

class RutasController extends Controller
{
public function __construct()
	{
	$this->middleware('auth');
	}
	public function index(Request $request)
    {
		$query=trim($request->get('searchText'));
		$rutas=DB::table('rutas')->where('nombre','LIKE','%'.$query.'%')
        -> get();
            return view('rutas.ruta.index',["rutas"=>$rutas,"searchText"=>$query]);
		
    }
	public function create()
    {
        return view("rutas.ruta.create");
    }
	public function store (Request $request)
    {
        $ruta=new Rutas;
        $ruta->nombre=$request->get('nombre');
        $ruta->descripcion=$request->get('descripcion');
        $ruta->save();
           return Redirect::to('iruta');

    }
	public function edit($id)
    {
		$ruta=Rutas::find($id);
		$subrutas=Subrutas::where('idruta',$id)->get();
			return view('rutas.ruta.edit')
			->with('ruta',$ruta)
			->with('subrutas',$subrutas);

    }
	public function update(Request $request)
    {
		//dd($request);
		$id=$request->id;
        $actruta=Rutas::findOrFail($request->id);
        $actruta->nombre=$request->get('nombre');
        $actruta->descripcion=$request->get('descripcion');
        $actruta->update();
   
	      // 2. Procesar Premios Principales
        $idsEnviados = array_filter($request->input('idsruta', []));

        // Eliminar de la BD los premios de esta rifa que el usuario quitó en la vista
        Subrutas::where('idruta', $id)
            ->whereNotIn('idsubruta', $idsEnviados)
            ->delete();

   if ($request->has('nombresruta')) {
        $nombres = $request->input('nombresruta', []);
        $descripciones = $request->input('descripcionr', []);
        $idsSubruta = $request->input('idsruta', []);

        foreach ($nombres as $key => $nombre) {
            $idSubruta = $idsSubruta[$key] ?? null;

            Subrutas::updateOrCreate(
                [
                    'idsubruta' => $idSubruta // Condición para buscar si existe
                ],
                [
                    'idruta'      => $id, // Relación con la ruta principal
                    'nombre'      => $nombre,
                    'descripcion' => $descripciones[$key] ?? ''
                ]
            );
        }
    }  
		return Redirect::to('iruta');
    }
	public function show($id)   
    { 
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
        $ruta=Rutas::findOrFail($id);
        $clientes=DB::table('clientes as a')
            -> join('rutas as c','c.idruta','=','a.ruta') 
			->select('a.*')			
            ->where ('c.idruta','=',$id)
            ->where ('a.status','=','A')
            ->orderBy('a.nombre','asc')
            ->get();
    
      return view("rutas.ruta.show",["empresa"=>$empresa,"clientes"=>$clientes,"ruta"=>$ruta]);
    }
}
