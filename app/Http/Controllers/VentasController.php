<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Models\Ventas;
use App\Models\Movnotas;
use App\Models\Monedas;
use App\Models\Notasadm;
use App\Models\Recibos;
use App\Models\MovBancos;
use App\Models\DetalleVentas;
use App\Models\Kardex;
use App\Models\Articulos;
use App\Models\Seriales;
use App\Models\Devolucion;
use App\Models\Detalledevolucion;
use App\Models\Formalibre;
use App\Models\Clientes;
use Carbon\Carbon;
use DB;
use Auth;

class VentasController extends Controller
{
   public function __construct()
	{
		$this->middleware('auth');
	function truncar($numero, $digitos)
	{
    $truncar = 10**$digitos;
    return intval($numero * $truncar) / $truncar;
	}
	}
	 public function index(Request $request)
    {
        if ($request)
        {
			$rol=DB::table('roles')-> select('crearventa','anularventa')->where('iduser','=',$request->user()->id)->first();
			   $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
            $query=trim($request->get('searchText'));
            $ventas=DB::table('venta as v')
            -> join ('clientes as p','v.idcliente','=','p.id_cliente')
            -> join ('detalle_venta as dv','v.idventa','=','dv.idventa')
            -> select ('v.idventa','v.fecha_hora','p.nombre','v.flibre','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.devolu','v.estado','v.total_venta','v.user')
            -> where ('p.nombre','LIKE','%'.$query.'%')
            -> orwhere ('v.idventa','LIKE','%'.$query.'%')
            -> orderBy('v.idventa','desc')
            -> groupBy('v.idventa','v.fecha_hora','p.nombre','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.estado')
                ->paginate(20);
     
     return view ('ventas.venta.index',["rol"=>$rol,"ventas"=>$ventas,"searchText"=>$query,"empresa"=>$empresa]);
        }
    }
    public function create(Request $request){
		$rol=DB::table('roles')-> select('crearventa')->where('iduser','=',$request->user()->id)->first();	
		if ($rol->crearventa==1){
		$monedas=DB::table('monedas')->get();
		$vendedor=DB::table('vendedores')->get();
        $empresa=DB::table('empresa')->join('sistema','sistema.idempresa','=','empresa.idempresa')->first();
        $personas=DB::table('clientes')->join('vendedores','vendedores.id_vendedor','=','clientes.vendedor')->select('clientes.id_cliente','clientes.tipo_precio','clientes.tipo_cliente','clientes.nombre','clientes.cedula','vendedores.comision','vendedores.id_vendedor as nombrev')-> where('clientes.status','=','A')->groupby('clientes.id_cliente')->get();
         $contador=DB::table('venta')->select('idventa')->limit('1')->orderby('idventa','desc')->get();
      //dd($contador);
        $articulos =DB::table('articulos as art')
        -> select(DB::raw('CONCAT(art.codigo," ",art.nombre) as articulo'),'art.idarticulo','art.stock','art.costo','art.precio1 as precio_promedio','art.precio2 as precio2','art.iva','art.serial')
        -> where('art.estado','=','Activo')
        -> where ('art.stock','>','0')
        ->groupby('articulo','art.idarticulo')
        -> get();
		//dd($articulos);
		   $seriales =DB::table('seriales')->where('estatus','=',0)->get();
     if ($contador==""){$contador=0;}
      return view("ventas.venta.create",["seriales"=>$seriales,"rol"=>$rol,"personas"=>$personas,"articulos"=>$articulos,"monedas"=>$monedas,"contador"=>$contador,"empresa"=>$empresa,"vendedores"=>$vendedor]);
    } else { 
	return view("reportes.mensajes.noautorizado");
	}
	}	
    public function store(Request $request){
		//dd($request);
		 $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
		$user=Auth::user()->name;
   try{
   DB::beginTransaction();
   $contador=DB::table('venta')->select('idventa')->limit('1')->orderby('idventa','desc')->first();
   if ($contador==NULL){$numero=0;}else{$numero=$contador->idventa;}

//registra la venta
    $venta=new Ventas;
	$idcliente=explode("_",$request->get('id_cliente'));
    $venta->idcliente=$idcliente[0];
    $venta->tipo_comprobante=$request->get('tipo_comprobante');
    $venta->serie_comprobante=$request->get('serie_comprobante');
    $venta->idvendedor=$request->get('nvendedor');
    $venta->num_comprobante=($numero+1);
    $venta->control=$request->get('control');
    $venta->tasa=$request->get('tc');
    $venta->total_venta=$request->get('total_venta');
    $venta->base=$request->get('totalbase');
    $venta->total_iva=$request->get('total_iva');
    $venta->texe=$request->get('totalexe');
    $mytime=Carbon::now('America/Caracas');
    $venta->fecha_hora=$mytime->toDateTimeString();
	$venta->fecha_emi=$request->get('fecha_emi');
    $venta->impuesto='16';
		if(($request->get('tdeuda')==0)and($request->get('convertir')=="on")){
			$venta->flibre=1;
			}
	if(empty($request->get('tdeuda'))){   $venta->saldo=$request->get('total_venta');}
	else { $venta->saldo=$request->get('tdeuda');}
    if ($venta->saldo > 0){
    $venta->estado='Credito';} else { $venta->estado='Contado';}
    $venta->devolu='0';
    $venta->comision=$request->get('comision');
	$venta->montocomision=($request->get('total_venta')*($request->get('comision')/100));
	$venta->user=$user;
   $venta-> save();
		if(($request->get('tdeuda')==0)and($request->get('convertir')=="on")){
			$pnro=DB::table('formalibre')
			->select(DB::raw('MAX(idforma) as pnum'))
			->first();				
			$fl=new Formalibre;
			$fl->idventa=$venta->idventa;
			$fl->nrocontrol=($pnro->pnum+1);
			$fl->save();
		}
    // inserta el recibo
          $idpago=$request->get('tidpago');
           $idbanco=$request->get('tidbanco');
		   $denomina=$request->get('denominacion');
           $tmonto=$request->get('tmonto');
           $tref=$request->get('tref');		 
           $contp=0;
		   if($request->get('totala')>0){
              while($contp < count($idpago)){
				$recibo=new Recibos;
				$recibo->idventa=$venta->idventa;
				if($request->get('tdeuda')>0){
				$recibo->tiporecibo='A'; }else{$recibo->tiporecibo='P'; }
				$recibo->monto=$request->get('total_venta');
				$pago=explode("_",$idbanco[$contp]);
				$recibo->idpago=$idpago[$contp]; // bbanco
				$recibo->idnota=0;
				$recibo->id_banco=0;
				$recibo->idbanco=$idbanco[$contp]; 
				$recibo->recibido=$denomina[$contp];			
				$recibo->monto=$tmonto[$contp]; 
				$recibo->referencia=$tref[$contp];
				$recibo->tasap=$request->get('peso');
				$recibo->tasab=$request->get('tc');
				$recibo->aux=$request->get('tdeuda');
				$recibo->fecha=$mytime->toDateTimeString();		
				$recibo->usuario=$user;					
				$recibo->save();
						$mon=Monedas::findOrFail($idpago[$contp]);
							if($mon->idbanco>0){
								    $mov=new MovBancos;
									$mov->idbanco=$mon->idbanco;
									$mov->clasificador=1;
									$mov->tipodoc="FAC";
									$mov->docrelacion=$venta->idventa;
									$mov->iddocumento=$recibo->idrecibo;
									$mov->tipo_mov="N/C";
									$mov->numero="FAC-".$recibo->idventa." Rec-".$recibo->idrecibo;
									$mov->concepto="Ventas";
									$mov->idbeneficiario=$idcliente[0];	
									$mov->identificacion="";
									$mov->ced="";
									$mov->tipo_per="C";
									$mov->monto=$denomina[$contp];
									$mov->tasadolar=$request->get('tc');
									$mytime=Carbon::now('America/Caracas');
									$mov->fecha_mov=$mytime->toDateTimeString();	
									$mov->user=Auth::user()->name;
									$mov->save();
							}			
				 $contp=$contp+1;
			  }  
		   }
		    
        $idarticulo = $request -> get('idarticulo');
        $cantidad = $request -> get('cantidad');
        $descuento = $request -> get('descuento');
        $precio_venta = $request -> get('precio_venta');
        $costoarticulo = $request -> get('costoarticulo');

        $cont = 0;
            while($cont < count($idarticulo)){
            $detalle=new DetalleVentas();
            $detalle->idventa=$venta->idventa;
            $detalle->idarticulo=$idarticulo[$cont];
            $detalle->costoarticulo=$costoarticulo[$cont];
            $detalle->cantidad=$cantidad[$cont];
            $detalle->descuento=$descuento[$cont];
            $detalle->precio_venta=$precio_venta[$cont];
			 $detalle->fecha_emi=$mytime->toDateTimeString();	
            $detalle->save();

				$kar=new Kardex;
		$kar->fecha=$mytime->toDateTimeString();
		$kar->documento="VENT-".($numero+1);
		$kar->idarticulo=$idarticulo[$cont];
		$kar->cantidad=$cantidad[$cont];
		$kar->costo=$costoarticulo[$cont];
		$kar->tipo=2; 
		$kar->user=$user;
		 $kar->save();  
                      //actualizo stock   
        $articulo=Articulos::findOrFail($idarticulo[$cont]);
        $articulo->stock=$articulo->stock-$cantidad[$cont];
        $articulo->update();
            $cont=$cont+1;
            }
		if( $request -> get('pidserial') > 0){
					$conts=0;
						$serial = $request -> get('pidserial');
						 while($conts < count($serial)){
						$ser=Seriales::findOrFail($serial[$conts]);
						$ser->idventa=$venta->idventa;
						$ser->iddetalleventa=$detalle->iddetalle_venta;
						$ser->estatus=1;
						$ser->update();
						 $conts=$conts+1;
						}
						}
		$cli=Clientes::findOrFail($idcliente[0]);
        $cli->lastfact=$mytime->toDateTimeString();
        $cli->update();
	DB::commit();
}
catch(\Exception $e)
{
    DB::rollback();
}
	if($request->get('convertir')=="on"){
	  return Redirect::to('fbs/'.$venta->idventa);
	}
	if($empresa->tikect==1){
		  return Redirect::to('recibo/'.$venta->idventa);
	}else{
	return Redirect::to($request->get('formato').'/'.$venta->idventa);
	}
	}
 public function showdevolucion($id)
    {   
	     $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
		$venta=DB::table('venta as v')
            -> join ('clientes as p','v.idcliente','=','p.id_cliente')
            -> select ('v.tasa','v.idventa','v.fecha_hora','v.devolu','p.cedula','p.nombre','p.telefono','p.direccion','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.estado','v.total_venta')
            ->where ('v.idventa','=',$id)
            -> first();

            $detalles=DB::table('detalle_venta as dv')
            -> join('articulos as a','dv.idarticulo','=','a.idarticulo')
            -> select('a.nombre as articulo','dv.iddetalle_venta','dv.idarticulo','dv.cantidad','dv.descuento','dv.precio_venta')
            -> where ('dv.idventa','=',$id)
            ->get();
			$recibo=DB::table('recibos as r')-> where ('r.idventa','=',$id)
            ->get();
		
            return view("ventas.venta.devolucion",["venta"=>$venta,"detalles"=>$detalles,"recibo"=>$recibo,"empresa"=>$empresa]);
      
    }
public function devolucion(Request $request){


//registra la devolucion
	$user=Auth::user()->name;
    $devolucion=new Devolucion;
    $devolucion->idventa=$request->get('idventa');
    $devolucion->comprobante=$request->get('comprobante');
    $mytime=Carbon::now('America/Lima');
    $devolucion->fecha_hora=$mytime->toDateTimeString();
    $devolucion->user=$user;
	$devolucion-> save();

    $venta=Ventas::findOrFail( $devolucion->idventa);
	$cliente=$venta->idcliente;
    $venta->devolu='1';
	$venta->saldo='0';
    $venta->update();
	$ser=DB::table('seriales')-> where('idventa','=',$devolucion->idventa)->first();
	if($ser<>NULL){
	$devs=Seriales::findOrFail( $ser->idserial);
    $devs->estatus=0;
    $devs->idventa=0;
    $devs->iddetalleventa=0;
    $devs->update();
	}
	$anularecibo=0;
	if($request -> get('nc')=="on"){
		$anularecibo=1;
	}
	$forma=DB::table('formalibre')-> where ('idventa','=',$request->get('idventa'))
            ->first();
	if($forma != NULL){
	$ventaf=Formalibre::findOrFail($forma->idforma);
    $ventaf->anulado=1;
    $ventaf->update();
	}
//registra el detalle de la devolucion
        $idarticulo = $request -> get('idarticulo');
        $cantidad = $request -> get('cantidad');
        $descuento = $request -> get('descuento');
        $precio_venta = $request -> get('precio_venta');
        $recibos = $request -> get('idrecibo');
        $cont = 0;
        $contr = 0;

            while($cont < count($idarticulo)){
            $detalle=new Detalledevolucion();
            $detalle->iddevolucion=$devolucion->iddevolucion;
            $detalle->idarticulo=$idarticulo[$cont];
            $detalle->cantidad=$cantidad[$cont];
            $detalle->descuento=$descuento[$cont];
            $detalle->precio_venta=$precio_venta[$cont];
            $detalle->save();
            $articulo=Articulos::findOrFail($idarticulo[$cont]);
            $articulo->stock=($articulo->stock+$cantidad[$cont]);
            $articulo->update();
		$kar=new Kardex;
		$kar->fecha=$mytime->toDateTimeString();
		$kar->documento="DEV:V-".$request->get('comprobante');
		$kar->idarticulo=$idarticulo[$cont];
		$kar->cantidad=$cantidad[$cont];
		$kar->costo=$precio_venta[$cont];
		$kar->tipo=1; 
		$kar->user=$user;
		 $kar->save(); 
            $cont=$cont+1;
            }
		
				if($request -> get('idrecibo')){
			 while($contr < count($recibos)){
			$recibo=Recibos::findOrFail($recibos[$contr]);
			$mrecibo=$recibo->monto;	
			 $recibo->referencia='Anulado ->'.$mrecibo;
			 $recibo->monto='0';
			 $recibo->recibido='0';
			 $recibo->update();
				 	$mbanco=DB::table('mov_ban')
					->where('tipodoc','=',"FAC")
					->where('iddocumento','=',$recibos[$contr])->first();
	
				if(($mbanco!= NULL) and ($anularecibo==0)){					
				$delmov=MovBancos::findOrFail($mbanco->id_mov);
				$delmov->monto=0;
				$delmov->concepto="Anul.".$request->get('idventa')."Rec".$recibos[$contr]."M:".$mrecibo;
				$delmov->estatus=1;
				$delmov->update();
				}	
				$contr=$contr+1;
				}  			
			 }
		
			if($request -> get('nc')=="on"){
	$contador=DB::table('notasadm')->select(DB::raw('count(ndocumento) as doc'))->where('tipo','=',2)->first();

   if ($contador==NULL){$numero=0;}else{$numero=$contador->doc;}
		$paciente=new Notasadm;
        $paciente->tipo=2;
        $paciente->ndocumento=$numero+1;
        $paciente->idcliente= $venta->idcliente;
        $paciente->descripcion="N/C por Devolucion";
        $paciente->referencia=$venta->tipo_comprobante." ".$venta->serie_comprobante." ".$venta->num_comprobante;
        $paciente->monto=$request->get('montonc');
		$mytime=Carbon::now('America/Caracas');
		$paciente->fecha=$mytime->toDateTimeString();
        $paciente->pendiente=$request->get('montonc');
        $paciente->pordevolucion=1;
		$paciente->usuario=Auth::user()->name;
        $paciente->save();
			}      
	if(Auth::user()->nivel=="A"){
		return Redirect::to('ventas');}else{
		return Redirect::to('ventacaja');
	}
}
	public function devoluparcial(Request $request){
	//dd($request);
	//    try{
	//DB::beginTransaction();
	$user=Auth::user()->name;
	$vdolar=$request -> get('tasa');
    $detalleventa=DetalleVentas::findOrFail($request->iddetalle);
	$idar=$detalleventa->idarticulo;
	$aux= $detalleventa->cantidad*$detalleventa->precio_venta;
	$nc=($detalleventa->cantidad-$request -> get('cantidad'));
	$aux2=$request -> get('cantidad')*$request -> get('precio');	
	$costo=$detalleventa->costoarticulo;

			$artcomi=Articulos::findOrFail($idar);
				if($artcomi->iva>0){ 
				$baseant=truncar((($detalleventa->precio_venta)/(($artcomi->iva/100)+1)), 2);
				$auxb=truncar(($baseant*$vdolar),2);
				$baseant=truncar(($detalleventa->cantidad*$auxb),2);	
				$subivant=truncar(($baseant*($artcomi->iva/100)), 2);	
				$subivant=truncar($subivant,2);
		
				$basenew=truncar((($request -> get('precio'))/(($artcomi->iva/100)+1)), 2);
				$auxbnew=truncar(($basenew*$vdolar),2);
				$basenew=truncar(($request -> get('cantidad')*$auxbnew),2);	
				$subivanew=truncar(($basenew*($artcomi->iva/100)), 2);	
				$subivanew=truncar($subivanew,2);

					$subexeant=0;
					$subexenew=0;
			}else{
					$subivant=$subivanew=$basenew=$baseant=0;
					$subexeant=truncar($detalleventa->cantidad*(($detalleventa->precio_venta*$vdolar)),2);
					$subexenew=truncar($request -> get('cantidad')*(($request -> get('precio')*$vdolar)),2);

			}				
					$aventa=Ventas::findOrFail($request -> get('idventa'));
					$abono=$aventa->total_venta-$aventa->saldo;
					$aventa->base=(($aventa->base-$baseant)+$basenew);
					$aventa->total_iva=(($aventa->total_iva-$subivant)+$subivanew);
					$aventa->texe=(($aventa->texe-$subexeant)+$subexenew);
					$descuento=$aventa->descuento;
					$aventa->total_venta=(($aventa->total_venta-($aux+$descuento))+$aux2);
					$aventa->total_pagar=0;	 
					$aventa->saldo=($aventa->total_venta-$abono);
					$aventa->montocomision=($aventa->total_venta*($aventa->comision/100));						
					$aventa->update();	
		
		$detalleventa->cantidad=$request -> get('cantidad');
		$detalleventa->precio_venta=$request -> get('precio');
		$detalleventa->update();
		
				
		$kar=new Kardex;
		$mytime=Carbon::now('America/Caracas');
		$kar->fecha=$mytime->toDateTimeString();
		$kar->documento="DEVP-".$request -> get('idventa');
		$kar->idarticulo=$idar;
		$kar->cantidad=$nc;
		$kar->costo=$costo;
		$kar->tipo=1; 
		$kar->user=$user;	
		 $kar->save();	
/* DB::commit();
}
catch(\Exception $e)
{
    DB::rollback();
} */

  return Redirect::to('tcarta/'.$request -> get('idventa'));
}
public function recibo($id){
			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			$venta=DB::table('venta as v')
            -> join ('clientes as p','v.idcliente','=','p.id_cliente')
            -> select ('v.idventa','v.fecha_hora','p.nombre','p.cedula','p.direccion','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.estado','v.total_venta','v.devolu')
            ->where ('v.idventa','=',$id)
            -> first();
            $detalles=DB::table('detalle_venta as dv')
            -> join('articulos as a','dv.idarticulo','=','a.idarticulo')
            -> select('a.nombre as articulo','a.iva','dv.cantidad','dv.descuento','dv.precio_venta')
            -> where ('dv.idventa','=',$id)
            ->get();
			$recibo=DB::table('recibos as r')-> where ('r.idventa','=',$id)
            ->get();
			$recibonc=DB::table('mov_notas as mov')-> where ('mov.iddoc','=',$id)-> where ('mov.tipodoc','=',"FAC")
            ->get();

            return view("ventas.venta.recibo",["venta"=>$venta,"recibos"=>$recibo,"recibonc"=>$recibonc,"empresa"=>$empresa,"detalles"=>$detalles]);
}
public function show(Request $request, $id){

			$ruta=$_SERVER["HTTP_REFERER"];
			//$c1= substr($ruta,34);		//modelo juancho
			$c1= substr($ruta,24); //base sistema		

			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			$venta=DB::table('venta as v')
            -> join ('clientes as p','v.idcliente','=','p.id_cliente')
            -> select ('v.idventa','v.tasa','v.fecha_hora','p.nombre','p.cedula','p.telefono','p.direccion','v.control','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.estado','v.total_venta','v.devolu')
            ->where ('v.idventa','=',$id)
            -> first();
            $detalles=DB::table('detalle_venta as dv')
            -> join('articulos as a','dv.idarticulo','=','a.idarticulo')
            -> select('a.idarticulo','a.nombre as articulo','a.iva','a.unidad','dv.cantidad','dv.descuento','dv.precio_venta')
            -> where ('dv.idventa','=',$id)
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

            return view("ventas.venta.show",["retencion"=>$retencion,"ruta"=>$c1,"seriales"=>$seriales,"venta"=>$venta,"recibos"=>$recibo,"recibonc"=>$recibonc,"empresa"=>$empresa,"detalles"=>$detalles]);
}
public function fbs($id){
	//dd($id);
			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			$venta=DB::table('venta as v')
			->join('formalibre as fl','fl.idventa','v.idventa')
            -> join ('clientes as p','v.idcliente','=','p.id_cliente')
            -> select ('v.idventa','fl.idforma','v.fecha_hora','v.fecha_emi','v.tasa','v.tasa','v.texe','v.base','v.total_iva','p.nombre','p.cedula','p.telefono','p.direccion','v.control','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.estado','v.total_venta','v.devolu')
            ->where ('v.idventa','=',$id)
            -> first();
			//dd($venta);
            $detalles=DB::table('detalle_venta as dv')
            -> join('articulos as a','dv.idarticulo','=','a.idarticulo')
            -> select('a.idarticulo','dv.idarticulo','a.nombre as articulo','a.unidad','a.codigo','a.iva','dv.cantidad','dv.descuento','dv.precio_venta')
            -> where ('dv.idventa','=',$id)
            ->get();
			
			$recibo=DB::table('recibos as r')-> where ('r.idventa','=',$id)
            ->get();
			$seriales=DB::table('seriales as se')-> where ('se.idventa','=',$id)
            ->get();
			//dd($seriales);
			$recibonc=DB::table('mov_notas as mov')-> where ('mov.iddoc','=',$id)-> where ('mov.tipodoc','=',"FAC")
            ->get();

            return view("ventas.venta.formatobs",["seriales"=>$seriales,"venta"=>$venta,"recibos"=>$recibo,"recibonc"=>$recibonc,"empresa"=>$empresa,"detalles"=>$detalles]);
}
public function notabs($id){

			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			$venta=DB::table('venta as v')
            -> join ('clientes as p','v.idcliente','=','p.id_cliente')
            -> select ('v.idventa','v.fecha_hora','v.fecha_emi','v.tasa','v.tasa','v.texe','v.base','v.total_iva','p.nombre','p.cedula','p.telefono','p.direccion','v.control','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.estado','v.total_venta','v.devolu')
            ->where ('v.idventa','=',$id)
            -> first();
			//dd($venta);
            $detalles=DB::table('detalle_venta as dv')
            -> join('articulos as a','dv.idarticulo','=','a.idarticulo')
            -> select('a.idarticulo','dv.idarticulo','a.nombre as articulo','a.unidad','a.codigo','a.iva','dv.cantidad','dv.descuento','dv.precio_venta')
            -> where ('dv.idventa','=',$id)
            ->get();
			
			$recibo=DB::table('recibos as r')-> where ('r.idventa','=',$id)
            ->get();
			$seriales=DB::table('seriales as se')-> where ('se.idventa','=',$id)
            ->get();
			//dd($seriales);
			$recibonc=DB::table('mov_notas as mov')-> where ('mov.iddoc','=',$id)-> where ('mov.tipodoc','=',"FAC")
            ->get();

            return view("ventas.venta.notabs",["seriales"=>$seriales,"venta"=>$venta,"recibos"=>$recibo,"recibonc"=>$recibonc,"empresa"=>$empresa,"detalles"=>$detalles]);
}
 public function almacena(Request $request)
    {	
	//dd($request);
     if($request->ajax()){
		 $paciente=new Clientes;
        $paciente->nombre=$request->get('cnombre');
        $paciente->cedula=$request->get('ccedula');
        $paciente->rif=$request->get('rif');
        $paciente->telefono=$request->get('ctelefono');
        $paciente->status='A';
        $paciente->direccion=$request->get('cdireccion');
        $paciente->tipo_cliente=$request->get('ctipo_cliente');
        $paciente->tipo_precio=$request->get('cprecio');
		 $paciente->vendedor=$request->get('idvendedor');
		  $mytime=Carbon::now('America/Caracas');
		$paciente->creado=$mytime->toDateTimeString();
        $paciente->save();
	// dd($paciente);
	$personas=DB::table('clientes')->join('vendedores','vendedores.id_vendedor','=','clientes.vendedor')->select('clientes.id_cliente','clientes.tipo_precio','clientes.nombre','clientes.cedula','clientes.tipo_cliente','vendedores.comision','vendedores.id_vendedor as nombrev')-> where('clientes.cedula','=',$request->get('ccedula'))->get();
           return response()->json($personas);
	}
    }
	public function validar (Request $request){
        if($request->ajax()){
			$pacientes=DB::table('clientes')->where('cedula','=',$request->get('ccedula'))->get();
         return response()->json($pacientes);
		}
      
     }
	 public function refrescar(Request $request)
    {
		if($request->ajax()){
        $articulos =DB::table('articulos as art')
        -> select(DB::raw('CONCAT(art.codigo," ",art.nombre) as articulo'),'art.idarticulo','art.stock','art.costo','art.precio1 as precio_promedio','art.precio2 as precio2')
        -> where('art.estado','=','Activo')
        -> where ('art.stock','>','0')
        ->groupby('articulo','art.idarticulo')
        -> get();
           return response()->json($articulos);
		}
    }
	public function facturar(Request $request, $idcliente){
		//dd($request);
				$rol=DB::table('roles')-> select('crearventa')->where('iduser','=',$request->user()->id)->first();	
		if ($rol->crearventa==1){
	     $monedas=DB::table('monedas')->get();
	     $vendedor=DB::table('vendedores')->get();
		 $empresa=DB::table('empresa')->join('sistema','sistema.idempresa','=','empresa.idempresa')->first();
         $personas=DB::table('clientes')->join('vendedores','vendedores.id_vendedor','=','clientes.vendedor')->select('clientes.id_cliente','clientes.tipo_precio','clientes.nombre','clientes.cedula','clientes.tipo_cliente','vendedores.comision','vendedores.id_vendedor as nombrev')
         -> where('status','=','A')
		 ->groupby('clientes.id_cliente')
         -> where ('id_cliente','=',$idcliente)
         ->get();
         $contador=DB::table('venta')->select('idventa')->limit('1')->orderby('idventa','desc')->get();
      //dd($contador);
        $articulos =DB::table('articulos as art')
         -> select(DB::raw('CONCAT(art.codigo," ",art.nombre) as articulo'),'art.idarticulo','art.stock','art.costo','art.precio1 as precio_promedio','art.precio2 as precio2','art.iva','art.serial')
         -> where('art.estado','=','Activo')
         -> where ('art.stock','>','0')
         ->groupby('articulo','art.idarticulo','art.stock')
         -> get();
		    $seriales =DB::table('seriales')->where('estatus','=',0)->get();
     return view("ventas.venta.create",["seriales"=>$seriales,"rol"=>$rol,"personas"=>$personas,"monedas"=>$monedas,"articulos"=>$articulos,"contador"=>$contador,"empresa"=>$empresa,"vendedores"=>$vendedor]);
	    } else { 
	return view("reportes.mensajes.noautorizado");
	}
	}
	public function anular(Request $request){
			//dd($request);
    $id=$request->get('id');
    $tipo=$request->get('tipo');
	if($tipo==1){
		$user=Auth::user()->name;
			 $recibo=Recibos::findOrFail($id);
			 $venta=$recibo->idventa;
			 $monton=$recibo->monto;
			 $nota=$recibo->idnota;
			 $recibo->referencia='Anulado ->'.$monton;
			 $recibo->monto='0';
			 $recibo->recibido='0';
			 $recibo->update();
				$mbanco=DB::table('mov_ban')
				->where('tipodoc','=',$request->get('doc'))
				->where('iddocumento','=',$request->get('id'))->first();
			
				if($mbanco!= NULL){	
				$delmov=MovBancos::findOrFail($mbanco->id_mov);
				$delmov->monto=0;
				$delmov->concepto="Anul.".$request->get('doc')."Rec".$request->get('id')."M:".$monton;
				$delmov->estatus=1;
				$delmov->update();
				}
				
		if($request->get('doc')=="FAC"){
			$ingreso=Ventas::findOrFail($venta);
			$ingreso->saldo=($ingreso->saldo+$monton);
			$ingreso->update(); }else{
			$nd=Notasadm::findOrFail($nota);
			$nd->pendiente=($nd->pendiente+$monton);
			$nd->update();
		}
	}else{
		$nota=Movnotas::findOrFail($id);
				$nc=DB::table('relacionnc')-> where('idmov','=',$id)->first();
		$doc=$nota->tipodoc;
		
			if($doc=="N/D"){
				$mov=Notasadm::findOrFail($nota->iddoc); 	
				$mov->pendiente=$mov->pendiente+$nota->monto;
				$mov->update();
			}else{
				$mov=Ventas::findOrFail($nota->iddoc); 	
				$mov->saldo=$mov->saldo+$nota->monto;
				$mov->update();
			}
				$movnc=Notasadm::findOrFail($nc->idnota); 	
				$movnc->pendiente=$movnc->pendiente+$nota->monto;
				$movnc->update();
		$nota->monto=0;
		$nota->referencia="Anulado";
		$nota->update();		
	}	
				 return Redirect::to('detalleingresos');
	}
	public function vcxc(Request $request)
    {   
     if($request->ajax()){
		 	$idcliente=explode("_",$request->get('id_cliente'));
         $datov=DB::table('venta as v')
        ->select(DB::raw('SUM(v.saldo) as monto' ),'v.idcliente')
        ->where('v.idcliente','=',$idcliente[0])
         ->groupby('v.idcliente')
        -> get();
          return response()->json($datov);
 }
    }
	public function anulforma(Request $request){

    $ventaf=Formalibre::findOrFail($request->id);
    $ventaf->anulado=1;
    $ventaf->update();
    return Redirect::to('correlativof');
}

}
