<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Models\Categoria;
use App\Models\Articulos;
use DB;
use Auth;

class CategoriaController extends Controller
{
	  public function __construct()
	{
		$this->middleware('auth');
	}
	public function index(Request $request){	
		if ($request){
            $query=trim($request->get('searchText'));
            $categorias=DB::table('categoria')->where('nombre','LIKE','%'.$query.'%')
            ->where ('condicion','=','1')
            ->orderBy('idcategoria','asc')
            ->paginate(20);
            return view('almacen.categoria.index',["categorias"=>$categorias,"searchText"=>$query]);
		}
		
	}
	public function create(){
		return view('almacen.categoria.create');
	}
    public function store (Request $request)
    {
		     $this->validate($request,[
            'nombre' => 'required'
        ]);
        $categoria=new Categoria;
        $categoria->nombre=$request->get('nombre');
        $categoria->descripcion=$request->get('descripcion');
		if($request->get('licor')=="on"){$categoria->licor=1;}	
        $categoria->condicion='1';
        $categoria->save();
       return Redirect::to('icategoria');

    }
	public function update(Request $request)
    {
		//dd($request);
        $categoria=Categoria::findOrFail($request->id);
        $categoria->nombre=$request->get('nombre');
        $categoria->descripcion=$request->get('descripcion');
		if($request->get('licor')=="on"){$categoria->licor=1;}else{$categoria->licor=0;}	
        $categoria->update();
       return Redirect::to('icategoria');
    }
	    public function show($id)
    { 
        $categoria=Categoria::findOrFail($id);
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
        $articulos=DB::table('articulos as a')
            -> join('categoria as c','a.idcategoria','=','c.idcategoria')
            -> select ('a.idarticulo','a.nombre','a.codigo','a.costo','a.precio1','a.stock','c.nombre as categoria','a.descripcion','a.estado')
            ->where ('c.idcategoria','=',$id)
            ->where ('a.estado','=','Activo')
            ->orderBy('a.nombre','asc')
            ->paginate(50);
    
      return view("almacen.categoria.show",["empresa"=>$empresa,"articulos"=>$articulos,"categoria"=>$categoria]);
    }
    public function edit($id)
    {
		$categoria=Categoria::find($id);
			return view('almacen.categoria.edit')
			->with('categoria',$categoria);

    }
	public function recalcular( Request $request)
    {
		//dd($request);
			$nutil=0;$nprecio=0;$pt=0;
			$modo=$request->get('modo');
			$tasa=$request->get('tasa');
            $categoria=$request->get('categoria');
			if ($modo == 1){
			$articulos=DB::table('articulos as a')
            -> select ('a.idarticulo','a.utilidad','a.util2','iva','a.costo','a.precio1','a.precio2')
            ->where ('a.idcategoria','=',$categoria)
			->get();
			 $cont = 0;
			while($cont < count($articulos)){
                      //actualizo stock   
			$articulo=Articulos::findOrFail($articulos[$cont]->idarticulo); 
		    $nprecio=$articulo->precio1+(($tasa/100)*$articulos[$cont]->precio1);
			$pt=($articulos[$cont]->costo + (($articulos[$cont]->iva/100)*$articulos[$cont]->costo));  
			  $nutil=((($nprecio/$pt)*100)-100);
			  $articulo->precio1=$nprecio;
			  $articulo->utilidad=$nutil;
			  $articulo->precio2=$nprecio;
			 $articulo->util2=$nutil;
			  $articulo->update();
            $cont=$cont+1;
            }     	
			}
			if ($modo == 2){
			$articulos=DB::table('articulos as a')
            -> select ('a.idarticulo','a.utilidad','a.util2','iva','a.costo','a.precio1','a.precio2')
            ->where ('a.idcategoria','=',$categoria)
			->get();
			 $cont = 0;
			while($cont < count($articulos)){
                      //actualizo stock   
         $articulo=Articulos::findOrFail($articulos[$cont]->idarticulo); 
			$articulo->utilidad=$tasa;
			$impuesto=$articulo->iva;
			$costo=$articulo->costo;
			$np=($costo + (($tasa/100)*$costo))+(($costo + (($tasa/100)*$costo))*($impuesto/100));
			  $articulo->precio1=$np;
			  $articulo->utilidad=$tasa;
			  $articulo->precio2=$np;
			 $articulo->util2=$tasa;
			  $articulo->update();
            $cont=$cont+1;
            }     	
			}
     // 	dd($articulo);
       return Redirect::to('icategoria');
    }
}
