<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent;
use Illuminate\Support\Facades\Redirect;
use App\Models\Compras;
use App\Models\Gastos;
use App\Models\Detallecompras;
use App\Models\DevolucionCompras;
use App\Models\DetalledevolucionCompras;
use App\Models\Comprobantes;
use App\Models\MovBancos;
use App\Models\Proveedores;
use App\Models\Notasadmp;
use App\Models\Movnotasp;
use App\Models\Monedas;
use App\Models\Articulos;
use App\Models\Seriales;
use App\clase\Errores;
use App\Models\Kardex;
use DB;
use Auth;
use Carbon\Carbon;

class ComprasController extends Controller
{
   	   public function __construct()
	{
	$this->middleware('auth');
	}
    public function index(Request $request)
    {
		
     if ($request)
        {$rol=DB::table('roles')-> select('crearcompra','anularcompra','importarne')->where('iduser','=',$request->user()->id)->first();
			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			$query=trim($request->get('searchText'));
            $ingresos=DB::table('compras as i')
            -> join ('proveedores as p','i.idproveedor','=','p.idproveedor')
            -> join ('detalle_compras as di','i.idcompra','=','di.idcompra')
            -> select ('i.idcompra as idingreso','i.fecha_hora','i.emision','p.nombre','i.tipo_comprobante','i.serie_comprobante','i.num_comprobante','i.impuesto','i.condicion as estado','i.estatus',DB::raw('sum(di.subtotal)as total'))
            -> where ('p.nombre','LIKE','%'.$query.'%')
            -> orwhere('i.num_comprobante','LIKE','%'.$query.'%')
           -> orderBy('i.idcompra','desc')
            -> groupBy('i.idcompra','i.fecha_hora','p.nombre','i.tipo_comprobante','i.serie_comprobante','i.num_comprobante','i.impuesto','i.condicion')
			->paginate(50);
     return view ('compras.ingreso.index',["empresa"=>$empresa,"rol"=>$rol,"ingresos"=>$ingresos,"searchText"=>$query]);
        }
	}
    public function create(Request $request){ 
		$rol=DB::table('roles')-> select('crearcompra')->where('iduser','=',$request->user()->id)->first();	
	if ($rol->crearcompra==1){
		$monedas=DB::table('monedas')->get();
		$contador=DB::table('articulos')->select('idarticulo')->limit('1')->orderby('idarticulo','desc')->first();		
        $empresa=DB::table('empresa')->join('sistema','sistema.idempresa','=','empresa.idempresa')->first();
		$categorias=DB::table('categoria')->where('condicion','=','1')->get();
        $personas=DB::table('proveedores')
        -> where('estatus','=','A')->get();
        $articulos =DB::table('articulos as art')
        -> select(DB::raw('CONCAT(art.'.$empresa->codart.',"-",art.nombre," - ",stock," - ",costo,"-",iva) as articulo'),'art.idarticulo','art.costo','art.serial','art.iva')
        -> where('art.estado','=','Activo')
        -> get();
        return view("compras.ingreso.create",["cnt"=>$contador,"monedas"=>$monedas,"personas"=>$personas,"articulos"=>$articulos,"categorias"=>$categorias,"empresa"=>$empresa]);
	} else { 
	return view("reportes.mensajes.noautorizado");
	}   
   }
    public function store(Request $request){
	//dd($request);
	$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
	$user=Auth::user()->name; 

	DB::beginTransaction();
	try{
 
    $ingreso=new Compras;
    $ingreso->idproveedor=$request->get('idproveedor');
    $ingreso->tipo_comprobante=$request->get('tipo_comprobante');
    $ingreso->serie_comprobante=$request->get('serie_comprobante');
    $ingreso->num_comprobante=$request->get('num_comprobante');
    $mytime=Carbon::now('America/Caracas');
    $ingreso->fecha_hora=$mytime->toDateTimeString();
    $ingreso->impuesto='16';
    $ingreso->emision=$request->get('emision');
    $ingreso->total=$request->get('total_venta');
    $ingreso->totalbs=$request->get('total_bs');
    $ingreso->base=$request->get('base');
    $ingreso->basebs=$request->get('base_bs');
    $ingreso->miva=$request->get('iva');
    $ingreso->ivabs=$request->get('iva_bs');
    $ingreso->exento=$request->get('exento');
    $ingreso->exentobs=$request->get('exe_bs');
	if(empty($request->get('tdeuda'))){   $ingreso->saldo=$request->get('total_venta');}
	else { $ingreso->saldo=$request->get('tdeuda');}
    if ($ingreso->saldo > 0){
    $ingreso->condicion='Credito';} else { $ingreso->condicion='Contado';}
    $ingreso->nota=$request->get('nota');
    $ingreso->diascre=$request->get('diascre');
    $ingreso->tasa=$request->get('tasacompra');
    $ingreso->user=$user;
    $ingreso-> save();	
	$datpro=Proveedores::findOrFail($request->get('idproveedor'));
	if($request->get('totala')>0){
  // inserta el recibo
          $idpago=$request->get('tidpago');
           $idbanco=$request->get('tidbanco');
		   $denomina=$request->get('denominacion');
           $tmonto=$request->get('tmonto');
           $tref=$request->get('tref');		 
           $contp=0;
              while($contp < count($idpago)){
				$recibo=new Comprobantes;
				$recibo->idcompra= $ingreso->idcompra;
				$recibo->monto=$request->get('total_venta');
				$recibo->idpago=$idpago[$contp];
				$recibo->idbanco=$idbanco[$contp];
				$recibo->recibido=$denomina[$contp];			
				$recibo->monto=$tmonto[$contp]; 
				$recibo->referencia=$tref[$contp];
				$recibo->tasap=$request->get('peso');
				$recibo->tasab=$request->get('tasacompra');
				$recibo->aux=$request->get('tdeuda');
				$mytime=Carbon::now('America/Caracas');
				$recibo->fecha_comp=$mytime->toDateTimeString();						
				$recibo->save();	
					$mon=Monedas::findOrFail($idpago[$contp]);
							if($mon->idbanco>0){
								    $mov=new MovBancos;
									$mov->idbanco=$mon->idbanco;
									$mov->clasificador=3;
									$mov->tipodoc="COMP";
									$mov->docrelacion=$ingreso->idcompra;
									$mov->iddocumento=$recibo->idrecibo;
									$mov->tipo_mov="N/D";
									$mov->numero="COMP-".$recibo->idcompra." Rec-".$recibo->idrecibo;
									$mov->concepto="Compras";
									$mov->idbeneficiario= $ingreso->idproveedor;	
									$mov->identificacion=$datpro->nombre;
									$mov->ced=$datpro->rif;
									$mov->tipo_per="P";
									$mov->monto=$denomina[$contp];
									$mov->tasadolar=$request->get('tasacompra');
									$mytime=Carbon::now('America/Caracas');
									$mov->fecha_mov=$mytime->toDateTimeString();	
									$mov->user=Auth::user()->name;
									$mov->save();
							}
				$contp=$contp+1;
			  } 
	}
	
// carga detalles de compra
        $idarticulo = $request -> get('idarticulo');
        $cantidad = $request -> get('cantidad');
        $precio_compra = $request -> get('precio_compra');
        $precio = $request -> get('precio');
        $precio_cambio = $request -> get('ptasa');
        $descuento = $request -> get('descuento');
        $neto = $request -> get('neto');
        $subtotal = $request -> get('stotal');
		
        
        $impuesto=0; $utilidad=0; $costo=0; $util2=0;
        $cont = 0; $cont2 = 0;
            while($cont < count($idarticulo)){
            $detalle=new DetalleCompras();
            $detalle->idcompra=$ingreso->idcompra;
            $detalle->idarticulo=$idarticulo[$cont];
            $detalle->cantidad=$cantidad[$cont];
            $detalle->precio_compra=$precio_compra[$cont];
            $detalle->precio_tasa=$precio_cambio[$cont];
            $detalle->precio=$precio[$cont];
            $detalle->descuento=$descuento[$cont];
            $detalle->neto=$neto[$cont];
            $detalle->subtotal=$subtotal[$cont];
			$mytime=Carbon::now('America/Caracas');
			$detalle->fecha=$mytime->toDateTimeString();
            $detalle->save();
			        //si posee serial
		$kar=new Kardex;
		$kar->fecha=$mytime->toDateTimeString();
		$kar->documento="COMP-".$ingreso->idcompra."-".$request->get('num_comprobante');
		$kar->idarticulo=$idarticulo[$cont];
		$kar->cantidad=$cantidad[$cont];
		$kar->costo=$precio_compra[$cont];
		$kar->tipo=1; 
		$kar->user=$user;
		 $kar->save();
		 
        //actualizo costo   
        $articulo=Articulos::findOrFail($idarticulo[$cont]);
        $costo= $precio_compra[$cont];
        $costot= $precio_cambio[$cont];
        $articulo->stock=$articulo->stock+$cantidad[$cont];
        $impuesto= $articulo->iva;
        $utilidad= $articulo->utilidad;
        $util2= $articulo->util2;
        $util3= $articulo->util3;
		if($request->get('recalcular')){
			$articulo->costo=$precio_compra[$cont];
			$articulo->costo_t=$precio_cambio[$cont];
			if($empresa->calc_util==1){
				$pt=($costo + (($utilidad/100)*$costo))+($costo + (($utilidad/100)*$costo))*($impuesto/100);
				$pt2=($costo + (($util2/100)*$costo))+($costo + (($util2/100)*$costo))*($impuesto/100);
				$pt3=($costo + (($util3/100)*$costo))+($costo + (($util3/100)*$costo))*($impuesto/100);
				$articulo->precio1=$pt;
				$articulo->precio2=$pt2;
				$articulo->precio3=$pt3;
				$articulo->precio_t=($costot + (($utilidad/100)*$costot))+($costot + (($utilidad/100)*$costot))*($impuesto/100);
			}else{
				$pt=($costo*(($impuesto/100)+1))/((100-$utilidad)/100);
				$pt2=($costo*(($impuesto/100)+1))/((100-$util2)/100);
				$pt3=($costo*(($impuesto/100)+1))/((100-$util3)/100);
				$articulo->precio1=$pt;
				$articulo->precio2=$pt2;
				$articulo->precio3=$pt3;
				$articulo->precio_t=($costot*(($impuesto/100)+1))/((100-$util2)/100);
			}
		}
		$articulo->update();
		$cont=$cont+1;
	}
			if(!empty($request->get('chasis'))){
			$art = $request -> get('artserial');		
			$cha = $request -> get('chasis');		
			$mot = $request -> get('motor');		
			$pla = $request -> get('placa');		
			$col = $request -> get('color');		
			$ano = $request -> get('ano');	
			$conts=0;			
		   while($conts < count($cha)){ 
				$ser=new Seriales;
				$ser->idcompra=$ingreso->idcompra;
				$ser->idarticulo=$art[$conts];
				$ser->chasis=$cha[$conts];
				$ser->motor=$mot[$conts];
				$ser->placa=$pla[$conts];
				$ser->color=$col[$conts];
				$ser->año=$ano[$conts];
				$ser->save();
			   $conts++;
		   }
					}
                     
            DB::commit();
			   }
catch(\Exception $e)
{  
	$logsc=new Errores();
	$mensaje=$logsc->logs($e->getMessage(),$user);
    DB::rollback();
	return view("reportes.mensajes.msgerror",["mensaje"=>$mensaje]);
}

return Redirect::to('showcompra/'.$ingreso->idcompra."-1");
}
	public function show(Request $request, $id){
		$data=explode("-",$id);
		$id=$data[0];
		$ruta=$data[1];
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
		$rol=DB::table('roles')-> select('editcompra')->where('iduser','=',$request->user()->id)->first();		
		$pago=DB::table('comprobante')
			-> where('idcompra','=',$id)->get();
		$ingreso=DB::table('compras as i')
			-> join ('proveedores as p','i.idproveedor','=','p.idproveedor')
			-> select ('i.tasa','i.idcompra as idingreso','i.fecha_hora','i.condicion','i.total','p.nombre','p.telefono','rif','direccion','i.tipo_comprobante','i.serie_comprobante','i.num_comprobante','i.impuesto','i.condicion as estado','i.base','i.miva','i.exento','i.estatus','i.idproveedor','i.saldo','i.nota')
			->where ('i.idcompra','=',$id)
			-> first();


		$detalles=DB::table('detalle_compras as d')
			-> join('articulos as a','d.idarticulo','=','a.idarticulo')
			-> select('d.iddetalle_compra','a.idarticulo','a.nombre as articulo','d.cantidad','d.precio_compra','d.neto','d.precio_venta','d.subtotal','d.descuento','d.precio')
			-> where ('d.idcompra','=',$id)
			->get();
			
		$ser=DB::table('seriales')-> where('idcompra','=',$id)->get();
		$ret=DB::table('retenciones')-> where('idcompra','=',$id)->get();
		$recibonc=DB::table('mov_notasp as mov')-> where ('mov.iddoc','=',$id)
		-> where ('mov.tipodoc','=', $ingreso->tipo_comprobante)
            ->get();
		return view("compras.ingreso.show",["recibonc"=>$recibonc,"rol"=>$rol,"ret"=>$ret,"ruta"=>$ruta,"ser"=>$ser,"ingreso"=>$ingreso,"empresa"=>$empresa,"detalles"=>$detalles,"pago"=>$pago]);
	}  
	public function etiquetas($id){
    $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
            $detalles=DB::table('detalle_compras as d')
            -> join('articulos as a','d.idarticulo','=','a.idarticulo')
            -> select('a.nombre as articulo','a.precio1','a.codigo','a.precio2','a.precio3')
            -> where ('d.idcompra','=',$id)
            ->get();
			
            return view("compras.ingreso.".$empresa->formatoeti,["empresa"=>$empresa,"detalles"=>$detalles]);
	}
	public function actuartic(Request $request)
    {
		if($request->ajax()){
        $articulos =DB::table('articulos as art') 
		-> select(DB::raw('CONCAT(art.codigo,"-",art.nombre," - ",stock," - ",costo,"-",iva) as articulo'),'art.idarticulo','art.costo','art.serial','art.iva')		
        -> where('art.estado','=','Activo')
        ->groupby('art.idarticulo')
        -> get();
	
          return response()->json($articulos);
	}
    }
	public function destroy(Request $request){
	
		//dd($request);
	$user=Auth::user()->name;
    $ingreso=new DevolucionCompras;
    $ingreso->idcompra=$request->get('id');
    $mytime=Carbon::now('America/Caracas');
    $ingreso->fecha_hora=$mytime->toDateTimeString();
	$ingreso->usuario=$user;
    $ingreso-> save();
	
	$ser=DB::table('seriales')
					->where('idcompra','=',$request->get('id'))->first();
			
				if($ser!= NULL){	
			$devs=Seriales::where('idcompra','=',$request->get('id'))->get();
			$devs->toQuery()->update(['estatus' => 1]);
				}
			$detalles=DB::table('detalle_compras as da')
            -> select('da.idarticulo as cod','da.cantidad')
            -> where ('da.idcompra','=',$request->get('id'))
            ->get();
					
		$longitud = count($detalles);
		$array = array();
			foreach($detalles as $t){
			$arraycod[] = $t->cod;
			$arraycan[] = $t->cantidad;
			}
		for ($i=0;$i<$longitud;$i++){
			$ingresod=new DetalledevolucionCompras;
			$ingresod->iddevolucion=$ingreso->iddevolucion;
			$ingresod->codarticulo=$arraycod[$i];
			$ingresod->cantidad=$arraycan[$i];
			$ingresod->fecha=$mytime->toDateTimeString();
			$ingresod-> save();
		
			$articulo=Articulos::findOrFail($arraycod[$i]);
			$articulo->stock=($articulo->stock-$arraycan[$i]);
			$articulo->update();
			
			$kar=new Kardex;			
			$kar->fecha=$mytime->toDateTimeString();
			$kar->documento="DEV:C-".$request->get('id');
			$kar->idarticulo=$arraycod[$i];
			$kar->cantidad=$arraycan[$i];
			$kar->costo=0;
			$kar->tipo=2; 
			$kar->user=$user;
			 $kar->save();
		}
			$comprobante=DB::table('comprobante as cb')
            -> select('cb.idrecibo')
            -> where ('cb.idcompra','=',$request->get('id'))
            ->get();
				$long = count($comprobante);
				$array = array();
			foreach($comprobante as $ct){
			$arrayid[] = $ct->idrecibo;
			}		 
				for ($j=0;$j<$long;$j++){
			$recibo=Comprobantes::findOrFail($arrayid[$j]);
			$mrecibo=$recibo->monto;	
			 $recibo->referencia='Anulado ->'.$mrecibo;
			 $recibo->monto='0';
			 $recibo->recibido='0';
			 $recibo->update();
				 	$mbanco=DB::table('mov_ban')
					->where('tipodoc','=',"COMP")
					->where('iddocumento','=',$arrayid[$j])->first();
			
				if($mbanco!= NULL){	
				$delmov=MovBancos::findOrFail($mbanco->id_mov);
				$delmov->monto=0;
				$delmov->concepto="Anul.".$request->get('id')."Rec".$arrayid[$j]."M:".$mrecibo;
				$delmov->estatus=1;
				$delmov->update();
				}
				}  
			
			 $ingreso=Compras::findOrFail($request->get('id'));
			 $ingreso->estatus='Anulada';
			  $ingreso->saldo='0';
			 $ingreso->update();
			 return Redirect::to('compras');
}
	public function almacena(Request $request)
    {	
		if($request->ajax()){	
		$paciente=new Proveedores;
        $paciente->nombre=$request->get('cnombre');
        $paciente->rif=$request->get('rif');
        $paciente->telefono=$request->get('ctelefono');
        $paciente->estatus='A';
        $paciente->tpersona=$request->get('tpersona');
        $paciente->direccion=$request->get('cdireccion');
        $paciente->contacto=$request->get('contacto');
        $paciente->save();
	
		$personas=DB::table('proveedores')-> where('rif','=',$request->get('rif'))->get();
           return response()->json($personas);
		}
    }
	public function validar (Request $request){
		if($request->ajax()){
        $result=DB::table('proveedores')->where('rif','=',$request->get('rif'))->get();
         return response()->json($result);
		}		
    }
	public function validarcod (Request $request){
            if($request->ajax()){
        $result=DB::table('articulos')->where('codigo','=',$request->get('codigo'))->get();
         return response()->json($result);
		}     
	}
	public function almacenaart(Request $request)
    {
     if($request->ajax()){
		 $cat=explode("_",$request->get('idcategoria'));
		 $articulo=new Articulos;
		$articulo->idcategoria=$cat[0];
        $articulo->codigo=$request->get('codigo');
        $articulo->nombre=$request->get('nombre');
        $articulo->stock="0";
        $articulo->descripcion=$request->get('nombre');
        $articulo->estado='Activo';
		$articulo->unidad=$request->get('unidad');
        $articulo->volumen=$request->get('volumen');
        $articulo->fraccion=$request->get('fraccion');
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
			if($request->get('util3')==NULL){
			$articulo->util3=$request->get('utilidad');}else{
			$articulo->util3=$request->get('util3');}
        $articulo->costo=$request->get('costo');
        $articulo->iva=$request->get('impuesto');
		if($request->get('serial')=="on"){$articulo->serial=1;}	
		$mytime=Carbon::now('America/Caracas');
		$articulo->created_at=$mytime->toDateTimeString();
		$articulo->save();

		$articulos =DB::table('articulos as art')
        -> select(DB::raw('CONCAT(art.codigo,"-",art.nombre," - ",stock," - ",costo,"-",iva) as articulo'),'art.idarticulo','art.costo','art.serial','art.fraccion','art.iva')
        -> where('art.codigo','=',$request->get('codigo'))
        -> get();
           return response()->json($articulos);
		}
    }
	public function facturar($idproveedor){
		$categorias=DB::table('categoria')->where('condicion','=','1')->get();
		$contador=DB::table('articulos')->select('idarticulo')->limit('1')->orderby('idarticulo','desc')->first();		
		$empresa=DB::table('empresa')->join('sistema','sistema.idempresa','=','empresa.idempresa')->first();
		$monedas=DB::table('monedas')->get();
        $personas=DB::table('proveedores')
        -> where ('idproveedor','=',$idproveedor)
        -> where('estatus','=','A')->get();
        $articulos =DB::table('articulos as art')
        -> select(DB::raw('CONCAT(art.'.$empresa->codart.',"-",art.nombre," - ",stock," - ",costo,"-",iva) as articulo'),'art.idarticulo','art.costo','art.serial','art.iva')
        -> where('art.estado','=','Activo')
        -> get();
        return view("compras.ingreso.create",["cnt"=>$contador,"monedas"=>$monedas,"personas"=>$personas,"articulos"=>$articulos,"categorias"=>$categorias,"empresa"=>$empresa]);
    }
	public function anular(Request $request){
		
		$recibo=Comprobantes::findOrFail($request->get('id'));
	
		if($request->get('tiporecibo')==0){
			$compra=$recibo->idcompra;
			//
				$mbanco=DB::table('mov_ban')->where('tipodoc','=',"COMP")->where('iddocumento','=',$request->get('id'))->first();
				if($mbanco!= NULL){	
					$delmov=MovBancos::findOrFail($mbanco->id_mov);
					$montobanco=$delmov->monto;
					$idbanco=$delmov->idbanco;
					$delmov->monto=0;
					$delmov->concepto="Anul.".$delmov->docrelacion."Rec".$delmov->iddocumento."M:".$montobanco;
					$delmov->estatus=1;
					$delmov->update();	
				}
				 $monton=$recibo->monto;
				 $recibo->referencia='Anulado '.$monton.'$';
				 $recibo->monto=0;
				 $recibo->recibido=0;
				 $recibo->update();
		}	if($request->get('tiporecibo')==1){
			$compra=$recibo->idgasto;	
				$mbanco=DB::table('mov_ban')->where('tipodoc','=',"GAST")->where('iddocumento','=',$request->get('id'))->first();
				if($mbanco!= NULL){	
					$delmov=MovBancos::findOrFail($mbanco->id_mov);
					$montobanco=$delmov->monto;
					$idbanco=$delmov->idbanco;
					$delmov->monto=0;
					$delmov->concepto="Anul.".$delmov->docrelacion."Rec".$delmov->iddocumento."M:".$montobanco;
					$delmov->estatus=1;
					$delmov->update();	
				}
				 $monton=$recibo->monto;
				 $recibo->referencia='Anulado '.$monton.'$';
				 $recibo->monto=0;
				 $recibo->recibido=0;
				 $recibo->update();
		}
		if($request->get('tiporecibo')==2){
			$compra=$recibo->idnota;	
				$mbanco=DB::table('mov_ban')->where('tipodoc','=',"N/DP")->where('iddocumento','=',$request->get('id'))->first();
				if($mbanco!= NULL){	
					$delmov=MovBancos::findOrFail($mbanco->id_mov);
					$montobanco=$delmov->monto;
					$idbanco=$delmov->idbanco;
					$delmov->monto=0;
					$delmov->concepto="Anul.".$delmov->docrelacion."Rec".$delmov->iddocumento."M:".$montobanco;
					$delmov->estatus=1;
					$delmov->update();	
				}
				 $monton=$recibo->monto;
				 $recibo->referencia='Anulado '.$monton.'$';
				 $recibo->monto=0;
				 $recibo->recibido=0;
				 $recibo->update();
		}
				
					 if($request->get('tiporecibo')==0){
							 $ingreso=Compras::findOrFail($compra);
							  $ingreso->saldo=($ingreso->saldo+$monton);
							 $ingreso->update();
					 }if($request->get('tiporecibo')==1){
							 $ingreso=Gastos::findOrFail($compra);
							  $ingreso->saldo=($ingreso->saldo+$monton);
							 $ingreso->update(); 
					 }
					 if($request->get('tiporecibo')==2){
							 $ingreso=Notasadmp::findOrFail($compra);
							  $ingreso->pendiente=($ingreso->pendiente+$monton);
							 $ingreso->update(); 
					 }
		if($request->get('tiporecibo')==3){		
		$nota=Movnotasp::findOrFail($request->get('id'));
				$nc=DB::table('relacionncp')-> where('idmov','=',$request->get('id'))->first();
		$doc=$nota->tipodoc;
		
			if($doc=="N/D"){
				$mov=Notasadmp::findOrFail($nota->iddoc); 	
				$mov->pendiente=$mov->pendiente+$nota->monto;
				$mov->update();
			}if($doc=="FAC"){
				$mov=Compras::findOrFail($nota->iddoc); 	
				$mov->saldo=$mov->saldo+$nota->monto;
				$mov->update();
			}if($doc=="GTO"){
				$mov=Gastos::findOrFail($nota->iddoc); 	
				$mov->saldo=$mov->saldo+$nota->monto;
				$mov->update();
			}
				$movnc=Notasadmp::findOrFail($nc->idnota); 	
				$movnc->pendiente=$movnc->pendiente+$nota->monto;
				$movnc->update();
		$nota->monto=0;
		$nota->referencia="Anulado";
		$nota->update();		
	}
return Redirect::to('detallegresos');
		
}
public function importarne($id){
    $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
    $pago=DB::table('comprobante')
        -> where('idcompra','=',$id)->get();
   $ingreso=DB::table('compras as i')
            -> join ('proveedores as p','i.idproveedor','=','p.idproveedor')
            -> select ('i.idcompra','i.emision','i.fecha_hora','i.total','p.nombre','p.telefono','rif','direccion','i.tipo_comprobante','i.serie_comprobante','i.num_comprobante','i.impuesto','i.estatus as estado','i.base','i.miva','i.exento','i.estatus')
            ->where ('i.idcompra','=',$id)
            -> first();

            $detalles=DB::table('detalle_compras as d')
            -> join('articulos as a','d.idarticulo','=','a.idarticulo')
            -> select('a.nombre as articulo','d.cantidad','d.precio_compra','d.iddetalle_compra as iddetalle','a.iva','d.precio_venta','d.subtotal')
            -> where ('d.idcompra','=',$id)
            ->get();
            return view("compras.ingreso.notas",["ingreso"=>$ingreso,"empresa"=>$empresa,"detalles"=>$detalles,"pago"=>$pago]);
}
	    public function almacenanota(Request $request){
//	dd($request);
	$user=Auth::user()->name;
	//try{
  // DB::beginTransaction(); 		
      $ingreso=Compras::findOrFail($request->get('id'));
    $ingreso->tipo_comprobante="FAC";
    $ingreso->serie_comprobante=$request->get('serie_comprobante');
    $ingreso->num_comprobante=$request->get('num_comprobante');
    $ingreso->emision=$request->get('emision');
    $ingreso->total=$request->get('tcompra');
    $ingreso->saldo=$request->get('tcompra');
    $ingreso->base=$request->get('tbase');
    $ingreso->miva=$request->get('tiva');
    $ingreso->exento=$request->get('texe');
    $ingreso-> update();

// carga detalles de compra
        $detalle = $request -> get('detalle');
        $precio_compra = $request -> get('precio');
        $sub = $request -> get('subt');
        
        $impuesto=0; $utilidad=0; $costo=0; $util2=0;
        $cont = 0; $cont2 = 0;
            while($cont < count($detalle)){
			$det=DetalleCompras::findOrFail($detalle[$cont]);
            $det->precio_compra=$precio_compra[$cont];
            $det->precio_tasa= $ingreso->tasa*$precio_compra[$cont];
            $det->subtotal=$sub[$cont];
            $det->update();			       
			$cont=$cont+1;
                    }
                            
        /*       DB::commit();
}
catch(\Exception $e)
{
    DB::rollback();
} */
return Redirect::to('compras');
}
public function ajustec(Request $request)
{
    $request->validate([
        'iddetalle' => ['required', 'integer'],
        'idcompra'  => ['required', 'integer'],
        'cantidad'  => ['required', 'numeric', 'min:0.0001'],
        'precio'    => ['required', 'numeric', 'min:0'],
        'descuento' => ['nullable', 'numeric', 'min:0', 'max:100'],
        'tasa'      => ['nullable', 'numeric', 'min:0'],
    ]);

    DB::beginTransaction();

    try {
        $vdolar = floatval($request->get('tasa', 1));
        if ($vdolar <= 0) {
            $vdolar = 1;
        }

        $detalle = DetalleCompras::findOrFail($request->get('iddetalle'));
        $compra  = Compras::findOrFail($request->get('idcompra'));

        $art = DB::table('articulos')
            ->select('iva')
            ->where('idarticulo', '=', $detalle->idarticulo)
            ->first();

        $tasaIva = $art ? floatval($art->iva) : 0;

        $cantidad     = floatval($request->get('cantidad'));
        $precioCompra = floatval($request->get('precio'));
        $descuento    = floatval($request->get('descuento', 0));

        // Precio unitario con descuento si aplica
        $precioUnit = $descuento > 0
            ? $precioCompra * ((100 - $descuento) / 100)
            : $precioCompra;

        // Valores anteriores de esta línea (subtotal ya incluye IVA; neto está sin IVA)
        $subAnt  = round(floatval($detalle->subtotal), 2);
        $netoAnt = round(floatval($detalle->neto), 2);

        if ($tasaIva > 0) {
            $baseAnt = $netoAnt > 0 ? $netoAnt : round($subAnt / (1 + ($tasaIva / 100)), 2);
            $ivaAnt  = round(max(0, $subAnt - $baseAnt), 2);
            $exeAnt  = 0;
        } else {
            $baseAnt = 0;
            $ivaAnt  = 0;
            $exeAnt  = $netoAnt > 0 ? $netoAnt : $subAnt;
        }

        // Nuevos valores de esta línea
        $montoBruto = $cantidad * $precioUnit;

        if ($tasaIva > 0) {
            // Subtotal con IVA incluido; neto sin IVA (base imponible)
            $subNuevo  = round($montoBruto, 2);
            $netoNuevo = round($subNuevo / (1 + ($tasaIva / 100)), 2);
            $ivaNuevo  = round($subNuevo - $netoNuevo, 2);

            $baseNueva = $netoNuevo;
            $exeNueva  = 0;
        } else {
            // Exento: neto y subtotal coinciden, sin IVA
            $subNuevo  = round($montoBruto, 2);
            $netoNuevo = $subNuevo;
            $ivaNuevo  = 0;

            $baseNueva = 0;
            $exeNueva  = $subNuevo;
        }

        // Actualizar cabecera de compra restando lo anterior y sumando lo nuevo
        $nuevoTotal = max(0, round((floatval($compra->total) - $subAnt) + $subNuevo, 2));
        $nuevaBase  = max(0, round((floatval($compra->base) - $baseAnt) + $baseNueva, 2));
        $nuevoIva   = max(0, round((floatval($compra->miva) - $ivaAnt) + $ivaNuevo, 2));
        $nuevoExe   = max(0, round((floatval($compra->exento) - $exeAnt) + $exeNueva, 2));

        $compra->total    = $nuevoTotal;
        $compra->totalbs  = round($nuevoTotal * $vdolar, 2);
        $compra->saldo    = $nuevoTotal; // Sin abonos, el saldo acompaña al nuevo total
        $compra->base     = $nuevaBase;
        $compra->basebs   = round($nuevaBase * $vdolar, 2);
        $compra->miva     = $nuevoIva;
        $compra->ivabs    = round($nuevoIva * $vdolar, 2);
        $compra->exento   = $nuevoExe;
        $compra->exentobs = round($nuevoExe * $vdolar, 2);
        $compra->update();

        // Actualizar la línea del detalle
        $detalle->cantidad      = $cantidad;
        $detalle->precio_compra = $precioCompra;
        $detalle->descuento     = $descuento;
        $detalle->precio        = $precioUnit;
        $detalle->neto          = $netoNuevo;
        $detalle->subtotal      = $subNuevo;
        $detalle->update();

        DB::commit();

        return Redirect::to('showcompra/' . $compra->idcompra . '-1');
    } catch (\Exception $e) {
        DB::rollBack();
        return back()->withErrors([
            'error' => 'No se pudo ajustar la línea de compra: ' . $e->getMessage()
        ]);
    }
}
	public function actpreciocompra(Request $request){
	//dd($request);
	DB::beginTransaction();
	try{
			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			$idarticulo = $request -> get('idarticulo');
		      
        $impuesto=0; $utilidad=0; $costo=0; $util2=0;
        $cont = 0; 
		$pact=($request -> get('tasac')/$request -> get('tasap'));
            while($cont < count($idarticulo)){
        //actualizo costo   
        $articulo=Articulos::findOrFail($idarticulo[$cont]);
        $costo= $articulo->costo*$pact;
        $impuesto= $articulo->iva;
        $utilidad= $articulo->utilidad;
        $util2= $articulo->util2;
        $util3= $articulo->util3;

			if($empresa->calc_util==1){
				$pt=($costo + (($utilidad/100)*$costo))+($costo + (($utilidad/100)*$costo))*($impuesto/100);
				$pt2=($costo + (($util2/100)*$costo))+($costo + (($util2/100)*$costo))*($impuesto/100);
				$pt3=($costo + (($util3/100)*$costo))+($costo + (($util3/100)*$costo))*($impuesto/100);
				$articulo->precio1=$pt;
				$articulo->precio2=$pt2;
				$articulo->precio3=$pt3;
				
			}else{
				$pt=($costo*(($impuesto/100)+1))/((100-$utilidad)/100);
				$pt2=($costo*(($impuesto/100)+1))/((100-$util2)/100);
				$pt3=($costo*(($impuesto/100)+1))/((100-$util3)/100);
				$articulo->precio1=$pt;
				$articulo->precio2=$pt2;
				$articulo->precio3=$pt3;
				
			}
		$articulo->costo=$costo;
		$articulo->update();
		$cont=$cont+1;
	}

	 DB::commit();
	}
	catch(\Exception $e)
	{
		DB::rollback();
	}
	return Redirect::to('showcompra/'.$request -> get('id').'-1');
	}
}
