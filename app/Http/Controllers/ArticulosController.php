<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Input;
use App\Models\Articulos;
use App\Models\Categoria;
use Carbon\Carbon;
use DB;
use Auth;
use Dompdf\Dompdf;


class ArticulosController extends Controller
{
	  public function __construct()
	{
		$this->middleware('auth');
	}

    public function index(Request $request)
    {
   if ($request)
        {
			$rol=DB::table('roles')-> select('newarticulo','editarticulo','web')->where('iduser','=',$request->user()->id)->first();
            $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
            $query=trim($request->get('searchText'));
            $articulos=DB::table('articulos as a')
			-> join('categoria as c','a.idcategoria','=','c.idcategoria')
			-> select ('a.idarticulo','a.nombre','a.precio1','a.codigo','a.stock','c.nombre as categoria','a.descripcion','a.imagen','a.estado')
            ->where('a.nombre','LIKE','%'.$query.'%')
            ->orwhere('a.codigo','LIKE','%'.$query.'%')
            ->where('a.estado','=','Activo')
            ->orderBy('a.idarticulo','desc')
            ->paginate(25);
			//dd($articulos);
            return view('almacen.articulo.index',["rol"=>$rol,"articulos"=>$articulos,"empresa"=>$empresa,"searchText"=>$query]);
        } 
    }
	public function create(Request $request)
    {
		$rol=DB::table('roles')-> select('newarticulo')->where('iduser','=',$request->user()->id)->first();	
		if ($rol->newarticulo==1){
			$contador=DB::table('articulos')->select('idarticulo')->limit('1')->orderby('idarticulo','desc')->first();		
			$categorias=DB::table('categoria')->where('condicion','=','1')->get();
			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
//dd($contador);
			return view("almacen.articulo.create",["categorias"=>$categorias,"cnt"=>$contador,"empresa"=>$empresa]);
		} else { 
		return view("reportes.mensajes.noautorizado");
		}
    }
	public function store (Request $request)
    {
		//dd($request);
		$this->validate($request,[
            'nombre' => 'required',
            'codigo' => 'required',
            'utilidad' => 'required',
            'costo' => 'required',
            'impuesto' => 'required|numeric',
            'precio1' => 'required|numeric'
        ]);
			$cat=explode("_",$request->get('idcategoria'));
		$articulo=new Articulos;
        $articulo->idcategoria=$cat[0];
        $articulo->codigo=$request->get('codigo');
        $articulo->codweb=$request->get('codweb');
        $articulo->nombre=$request->get('nombre');
        $articulo->stock=0;
        $articulo->descripcion=$request->get('descripcion');
        $articulo->estado='Activo';
        $articulo->unidad=$request->get('unidad');
        $articulo->cntxund=$request->get('cntxund');
        $articulo->cntgrupo=$request->get('cntgrupo');
        $articulo->fraccion=$request->get('fraccion');
        $articulo->volumen=$request->get('volumen');
        $articulo->peso=$request->get('peso');
		$articulo->minimo=$request->get('min');
      if($request->get('showlista')=="on"){$articulo->showlista=1;}else{$articulo->showlista=0;}
        $articulo->grados=$request->get('grados');
        $articulo->utilidad=$request->get('utilidad');
        $articulo->precio1=$request->get('precio1');
			if($request->get('precio2')==NULL){
			$articulo->precio2=$request->get('precio1');}else{
			$articulo->precio2=$request->get('precio2');}
			if($request->get('util2')==NULL){
			$articulo->util2=$request->get('utilidad');}else{
			$articulo->util2=$request->get('util2');}
			if($request->get('precio3')==NULL){
			$articulo->precio3=$request->get('precio1');}else{
			$articulo->precio3=$request->get('precio3');}
			if($request->get('util2')==NULL){
			$articulo->util3=$request->get('utilidad');}else{
			$articulo->util3=$request->get('util3');}
        $articulo->costo=$request->get('costo');
        //validar iva vacio
        $articulo->iva=$request->get('impuesto');
		if($request->get('serial')=="on"){$articulo->serial=1;}		
			if(!empty($request->file('imagen'))){
			$file = $request->file('imagen');
			$img = $file->getClientOriginalName();		
        	\Storage::disk('local')->put($img, \File::get($file));
			$articulo->imagen=$img;
			}
		$mytime=Carbon::now('America/Caracas');
			$articulo->created_at=$mytime->toDateTimeString();
        $articulo->save();
       return Redirect::to('articulos');

    }
	public function edit($id)
    {
		$articulos=Articulos::find($id);
		$categorias=DB::table('categoria')->where('condicion','=','1')->get();
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			return view('almacen.articulo.edit')
			->with(["articulo"=>$articulos,"categorias"=>$categorias,"empresa"=>$empresa]);

    }
	public function update(Request $request)
    {
		//dd($request);
		$this->validate($request,[
            'nombre' => 'required',
            'codigo' => 'required',
            'utilidad' => 'required',
            'costo' => 'required',
            'impuesto' => 'required|numeric',
            'precio1' => 'required'
        ]);
		$cat=explode("_",$request->get('idcategoria'));
        $articulo=Articulos::findOrFail($request->get('id'));
        $articulo->idcategoria=$cat[0];
        $articulo->codigo=$request->get('codigo');
		$articulo->codweb=$request->get('codweb');
        $articulo->nombre=$request->get('nombre');
        $articulo->stock=$request->get('stock');
        $articulo->descripcion=$request->get('descripcion');
        $articulo->estado='Activo';
		$articulo->unidad=$request->get('unidad');
		$articulo->cntxund=$request->get('cntxund');
		$articulo->cntgrupo=$request->get('cntgrupo');
		$articulo->fraccion=$request->get('fraccion');
        $articulo->volumen=$request->get('volumen');
		$articulo->peso=$request->get('peso');
		$articulo->minimo=$request->get('min');
        $articulo->grados=$request->get('grados');
        $articulo->utilidad=$request->get('utilidad');

        $articulo->precio1=$request->get('precio1');
			if($request->get('precio2')==NULL){
			$articulo->precio2=$request->get('precio1');}else{
			$articulo->precio2=$request->get('precio2');}
			if($request->get('util2')==NULL){
			$articulo->util2=$request->get('utilidad');}else{
			$articulo->util2=$request->get('util2');}
			if($request->get('util3')==NULL){
			$articulo->util3=$request->get('utilidad');}else{
			$articulo->util3=$request->get('util3');}
			if($request->get('precio3')==NULL){
			$articulo->precio3=$request->get('precio1');}else{
			$articulo->precio3=$request->get('precio3');}
        $articulo->costo=$request->get('costo');
        $articulo->iva=$request->get('impuesto');
		if($request->get('serial')=="on"){$articulo->serial=1;}	
		if(!$request->get('showlista')){$articulo->showlista=0;}else{$articulo->showlista=1;}
		if(!empty($request->file('imagen'))){
			$file = $request->file('imagen');
			$img = $file->getClientOriginalName();		
        	\Storage::disk('local')->put($img, \File::get($file));
			$articulo->imagen=$img;
			}
			$mytime=Carbon::now('America/Caracas');
			$articulo->updated_at=$mytime->toDateTimeString();
        $articulo->update();

       return Redirect::to('articulos');
    }
	public function destroy(Request $request)
    {
        $articulo=Articulos::findOrFail($request->get('id'));
        $articulo->estado='Inactivo';
        $articulo->update();
     return Redirect::to('articulos');
    }
	public function kardex($id)
   {	
		//	dd($id);	
	 	 $articulo=Articulos::findOrFail($id);		 
		$datos=DB::table('kardex as k')
		->where('k.idarticulo','=',$id)
		->get();
	       return view("almacen.articulo.kardex",["datos"=>$datos,"articulo"=>$articulo]);
    }
	    public function show($id)
    {
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
		//compra
		$ultcompra=DB::table('detalle_compras as di')
		->join('compras as in','in.idcompra','=','di.idcompra')
		->join('proveedores as p','p.idproveedor','=','in.idproveedor')
		->select('p.nombre','in.num_comprobante','in.fecha_hora','di.cantidad','di.precio_compra')->where('di.idarticulo','=',$id)
		->orderby('di.iddetalle_compra','desc')->first();
		//venta
		$ultventa=DB::table('detalle_venta as dv')
		->join('venta as v','v.idventa','=','dv.idventa')
		->join('clientes as c','c.id_cliente','=','v.idcliente')
		->select('c.nombre','v.tipo_comprobante','v.num_comprobante','v.fecha_emi','dv.cantidad','dv.precio_venta')->where('dv.idarticulo','=',$id)
		->orderby('dv.iddetalle_venta','desc')->first();
		//dd($ultventa);
		//ajustes
		$ajustes=DB::table('detalle_ajustes')->select(DB::raw('sum(cantidad) as cantidad'),'tipo_ajuste')
		->where('idarticulo','=',$id)
		->groupBy('tipo_ajuste')->get();
			$hoy = date("Y-m-d");  
		  $analisis=date("Y-m-d",strtotime($hoy."- 30 days"));
		  $analisisventa=DB::table('detalle_venta')->select(DB::raw('sum(cantidad) as cantidad'))
		  ->whereBetween('fecha_emi', [$analisis, $hoy])
		  ->where('idarticulo','=',$id)
			->first();
		   $analisiscompra=DB::table('detalle_compras')->join('compras','compras.idcompra','=','detalle_compras.idcompra')->select(DB::raw('sum(detalle_compras.cantidad) as cantidad'))
		  ->whereBetween('compras.fecha_hora', [$analisis, $hoy])
		  ->where('detalle_compras.idarticulo','=',$id)
			->first();
			$compras=DB::table('detalle_compras')->select(DB::raw('sum(cantidad) as cantidad'),DB::raw('sum(precio_compra) as precio'),DB::raw('count(idcompra) as compra'))->where('idarticulo','=',$id)->first();
			$ventas=DB::table('detalle_venta')->select(DB::raw('sum(cantidad) as cantidad'),DB::raw('sum(precio_venta) as precio'),DB::raw('count(idventa) as venta'))->where('idarticulo','=',$id)->first();
			$devcompras=DB::table('detalle_devolucioncompras')->select(DB::raw('sum(cantidad) as devocompras'))->where('codarticulo','=',$id)->first();
			$deventas=DB::table('detalle_devolucion')->select(DB::raw('sum(cantidad) as devoventas'))->where('idarticulo','=',$id)->first();
			$util=DB::table('detalle_venta')->select(DB::raw('sum(costoarticulo*cantidad) as costo'),DB::raw('sum(precio_venta*cantidad) as precio'))->where('idarticulo','=',$id)->first();
		  return view("almacen.articulo.show",["articulo"=>Articulos::findOrFail($id),"ultcompra"=>$ultcompra,"ultventa"=>$ultventa,"ajustes"=>$ajustes,"analisisventa"=>$analisisventa,"analisiscompra"=>$analisiscompra,"compras"=>$compras,"ventas"=>$ventas,"devcompras"=>$devcompras,"deventas"=>$deventas,"util"=>$util,"empresa"=>$empresa]);

    }
	    public function validar (Request $request){
            if($request->ajax()){
        $result=DB::table('articulos')->where('codigo','=',$request->get('codigo'))->get();
         return response()->json($result);
     }
		}
	public function detalleventa (Request $request,$id){
		  $data=explode("_",$id);
    $id=$data[0];
    $art=$data[1];
	$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			$venta=DB::table('venta as v')
            -> join ('clientes as p','v.idcliente','=','p.id_cliente')
            -> select ('v.idventa','v.tasa','v.fecha_hora','p.nombre','p.cedula','p.telefono','p.direccion','v.control','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.estado','v.total_venta','v.devolu')
            ->where ('v.idventa','=',$id)
            -> first();
            $detalles=DB::table('detalle_venta as dv')
            -> join('articulos as a','dv.idarticulo','=','a.idarticulo')
            -> select('a.idarticulo','a.nombre as articulo','a.iva','a.unidad','dv.cantidad','dv.descuento','dv.precio_venta')
            -> where ('dv.idventa','=',$venta->idventa)
            ->get();
			
			$recibo=DB::table('recibos as r')-> where ('r.idventa','=',$id)
            ->get();
			$seriales=DB::table('seriales as se')-> where ('se.idventa','=',$id)
            ->get();
			$retencion=DB::table('retencionventas')-> where ('idFactura','=',$id)
            ->first();
			//dd($retencion);
			$recibonc=DB::table('mov_notas as mov')-> where ('mov.iddoc','=',$id)-> where ('mov.tipodoc','=',"FAC")
            ->get();
      return view("almacen.articulo.detalleventa",["articulo"=>$art,"retencion"=>$retencion,"seriales"=>$seriales,"venta"=>$venta,"recibos"=>$recibo,"recibonc"=>$recibonc,"empresa"=>$empresa,"detalles"=>$detalles]);  
	  }
	  	public function detalleajuste(Request $request,$id){
			 $data=explode("_",$id);
			$id=$data[0];
			$art=$data[1];
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
		$ajuste=DB::table('ajustes as a')
            -> join ('detalle_ajustes as da','a.idajuste','=','da.idajuste')
            -> select ('a.idajuste','a.fecha_hora','a.concepto','a.responsable','a.monto')
            ->where ('a.idajuste','=',$id)
            -> first();

            $detalles=DB::table('detalle_ajustes as da')
            -> join('articulos as a','da.idarticulo','=','a.idarticulo')
            -> select('a.idarticulo','a.nombre as articulo','da.cantidad','da.tipo_ajuste','da.costo')
            -> where ('da.idajuste','=',$id)
            ->get();

		return view("almacen.articulo.detalleajuste",["articulo"=>$art,"ajuste"=>$ajuste,"detalles"=>$detalles,"empresa"=>$empresa]);
	}
		public function detallecompra(Request $request,$id){
			//dd($id);
		$data=explode("_",$id);
		$id=$data[0];
		$art=$data[1];
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
	
		$ingreso=DB::table('compras as i')
			-> join ('proveedores as p','i.idproveedor','=','p.idproveedor')
			-> select ('i.idcompra as idingreso','i.fecha_hora','i.total','p.nombre','p.telefono','rif','direccion','i.tipo_comprobante','i.serie_comprobante','i.num_comprobante','i.impuesto','i.condicion as estado','i.base','i.miva','i.exento','i.estatus','i.idproveedor')
			->where ('i.idcompra','=',$id)
			-> first();
	$pago=DB::table('comprobante')
			-> where('idcompra','=',$ingreso->idingreso)->get();

		$detalles=DB::table('detalle_compras as d')
			-> join('articulos as a','d.idarticulo','=','a.idarticulo')
			-> select('a.idarticulo','a.nombre as articulo','d.cantidad','d.precio_compra','d.precio_venta','d.subtotal')
			-> where ('d.idcompra','=',$ingreso->idingreso)
			->get();
			
		$ser=DB::table('seriales')-> where('idcompra','=',$ingreso->idingreso)->get();
		$ret=DB::table('retenciones')-> where('idcompra','=',$ingreso->idingreso)->get();
		return view("almacen.articulo.detallecompra",["articulo"=>$art,"ret"=>$ret,"ser"=>$ser,"ingreso"=>$ingreso,"empresa"=>$empresa,"detalles"=>$detalles,"pago"=>$pago]);
	}
	public function reporteetiquetas(Request $request)
	{	 
		$categorias=DB::table('categoria')->where('condicion','=','1')->get();
		if ($request->get('grupo') != "")
        {
		$datos=DB::table('articulos as art')
		->where('art.idcategoria','=',$request->get('grupo'))
		->where('art.stock','>',0)
		->where('art.estado','=',"Activo")
		->get();	
		}else{				 
		$datos=DB::table('articulos as art')
		->where('art.stock','>',0)
		->where('art.estado','=',"Activo")
		->get();	
		}
	 
	       return view("reportes.articulos.etiquetas.index",["datos"=>$datos,"categorias"=>$categorias]);
    }
}
