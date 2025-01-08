<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;

use App\Models\DetalleApartado;
use App\Models\Recibos;
use App\Models\Seriales;
use App\Models\Articulos;
use App\Models\Apartado;
use App\Models\Monedas;
use App\Models\MovBancos;
use App\Models\Ventas;
use App\Models\Formalibre;
use App\Models\DetalleVentas;
use App\Models\Kardex;
use Carbon\Carbon;
use DB;
use Auth;


class ApartadoController extends Controller
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
			$rol=DB::table('roles')-> select('newapartado','anularapartado','abonarapartado')->where('iduser','=',$request->user()->id)->first();
			   $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
            $query=trim($request->get('searchText'));
            $ventas=DB::table('apartado as v')
            -> join ('clientes as p','v.idcliente','=','p.id_cliente')
            -> join ('detalle_apartado as dv','v.idventa','=','dv.idventa')
            -> select ('v.impor','v.idventa','v.fecha_hora','p.nombre','v.saldo','v.flibre','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.devolu','v.estado','v.total_venta','v.user')
            -> where ('p.nombre','LIKE','%'.$query.'%')
            -> orwhere ('v.idventa','LIKE','%'.$query.'%')
            -> orderBy('v.idventa','desc')
            -> groupBy('v.idventa','v.fecha_hora','p.nombre','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.estado')
                ->paginate(20);
     
     return view ('apartado.venta.index',["rol"=>$rol,"ventas"=>$ventas,"searchText"=>$query,"empresa"=>$empresa]);
        }
    }
	    public function create(Request $request){
		$rol=DB::table('roles')-> select('newapartado')->where('iduser','=',$request->user()->id)->first();	
		if ($rol->newapartado==1){
		$monedas=DB::table('monedas')->get();
		$vendedor=DB::table('vendedores')->get();
        $empresa=DB::table('empresa')->join('sistema','sistema.idempresa','=','empresa.idempresa')->first();
        $personas=DB::table('clientes')->join('vendedores','vendedores.id_vendedor','=','clientes.vendedor')->select('clientes.id_cliente','clientes.tipo_precio','clientes.tipo_cliente','clientes.nombre','clientes.cedula','vendedores.comision','vendedores.id_vendedor as nombrev')-> where('clientes.status','=','A')->groupby('clientes.id_cliente')->get();
         $contador=DB::table('apartado')->select('idventa')->limit('1')->orderby('idventa','desc')->get();
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
      return view("apartado.venta.create",["seriales"=>$seriales,"rol"=>$rol,"personas"=>$personas,"articulos"=>$articulos,"monedas"=>$monedas,"contador"=>$contador,"empresa"=>$empresa,"vendedores"=>$vendedor]);
    } else { 
	return view("reportes.mensajes.noautorizado");
	}
	}	
	public function store(Request $request){
		//dd($request);
			 $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			$user=Auth::user()->name;
		// try{
		//DB::beginTransaction();
		$contador=DB::table('apartado')->select('idventa')->limit('1')->orderby('idventa','desc')->first();
		if ($contador==NULL){$numero=0;}else{$numero=$contador->idventa;}

		//registra la venta
		$venta=new Apartado;
		$idcliente=explode("_",$request->get('id_cliente'));
		$venta->idcliente=$idcliente[0];
		$venta->tipo_comprobante=$request->get('tipo_comprobante');
		$venta->serie_comprobante=$request->get('serie_comprobante');
		$venta->incremento=$request->get('incremento');
		$venta->dias=$request->get('dias');
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
		$venta->flibre=0;

		if(empty($request->get('tdeuda'))){   $venta->saldo=$request->get('total_venta');}
		else { $venta->saldo=$request->get('tdeuda');}
		if ($venta->saldo > 0){
		$venta->estado='Credito';} else { $venta->estado='Contado';}
		$venta->devolu='0';
		$venta->comision=$request->get('comision');
		$venta->montocomision=($request->get('total_venta')*($request->get('comision')/100));
		$venta->user=$user;
	   $venta-> save();
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
				$recibo->idventa=0;
				if($request->get('tdeuda')>0){
				$recibo->tiporecibo='AP'; }else{$recibo->tiporecibo='P'; }
				$recibo->monto=$request->get('total_venta');
				$pago=explode("_",$idbanco[$contp]);
				$recibo->idpago=$idpago[$contp]; // bbanco
				$recibo->idnota=0;
				$recibo->id_banco=0;
				$recibo->idapartado=$venta->idventa;
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
									$mov->clasificador=12;
									$mov->tipodoc="APA";
									$mov->docrelacion=$venta->idventa;
									$mov->iddocumento=$recibo->idrecibo;
									$mov->tipo_mov="N/C";
									$mov->numero="APA-".$recibo->idventa." Rec-".$recibo->idrecibo;
									$mov->concepto="Apartados";
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
            $detalle=new DetalleApartado();
            $detalle->idventa=$venta->idventa;
            $detalle->idarticulo=$idarticulo[$cont];
            $detalle->costoarticulo=$costoarticulo[$cont];
            $detalle->cantidad=$cantidad[$cont];
            $detalle->descuento=$descuento[$cont];
            $detalle->precio_venta=$precio_venta[$cont];
			 $detalle->fecha_emi=$mytime->toDateTimeString();	
            $detalle->save(); 
			
                      //actualizo stock   
        $articulo=Articulos::findOrFail($idarticulo[$cont]);
        $articulo->stock=$articulo->stock-$cantidad[$cont];
        $articulo->apartado=$articulo->apartado+$cantidad[$cont];
        $articulo->update();
            $cont=$cont+1;
            }
		if( $request -> get('pidserial') > 0){
					$conts=0;
						$serial = $request -> get('pidserial');
						 while($conts < count($serial)){
						$ser=Seriales::findOrFail($serial[$conts]);
						$ser->idapartado=$venta->idventa;
						$ser->iddetalleventa=$detalle->iddetalle_venta;
						$ser->estatus=1;
						$ser->update();
						 $conts=$conts+1;
						}
						}
	/*DB::commit();
}
catch(\Exception $e)
{
    DB::rollback();
} */
			if($request->get('formato')==1){
			  return Redirect::to('reciboapar/'.$venta->idventa);
		}else{		
			  return Redirect::to('tcartaapar/'.$venta->idventa);
		}
	}
	public function recibo($id){
			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			$venta=DB::table('apartado as v')
            -> join ('clientes as p','v.idcliente','=','p.id_cliente')
            -> select ('v.idventa','v.fecha_hora','p.nombre','p.cedula','p.direccion','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.estado','v.total_venta','v.devolu')
            ->where ('v.idventa','=',$id)
            -> first();
            $detalles=DB::table('detalle_apartado as dv')
            -> join('articulos as a','dv.idarticulo','=','a.idarticulo')
            -> select('a.nombre as articulo','a.iva','dv.cantidad','dv.descuento','dv.precio_venta')
            -> where ('dv.idventa','=',$id)
            ->get();
			$recibo=DB::table('recibos as r')-> where ('r.idapartado','=',$id)
            ->get();
			$recibonc=DB::table('mov_notas as mov')-> where ('mov.iddoc','=',$id)-> where ('mov.tipodoc','=',"FAC")
            ->get();

            return view("apartado.venta.recibo",["venta"=>$venta,"recibos"=>$recibo,"recibonc"=>$recibonc,"empresa"=>$empresa,"detalles"=>$detalles]);
}
	public function show(Request $request, $id){
			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			$venta=DB::table('apartado as v')
            -> join ('clientes as p','v.idcliente','=','p.id_cliente')
            -> select ('v.recargo','v.impor','v.base','v.total_iva','v.texe','v.dias','v.incremento','v.idventa','v.tasa','v.fecha_hora','p.nombre','p.cedula','p.telefono','p.direccion','v.control','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.estado','v.total_venta','v.devolu','v.saldo')
            ->where ('v.idventa','=',$id)
            -> first();
            $detalles=DB::table('detalle_apartado as dv')
            -> join('articulos as a','dv.idarticulo','=','a.idarticulo')
            -> select('a.idarticulo','a.codigo','a.nombre as articulo','a.iva','a.unidad','dv.cantidad','dv.descuento','dv.precio_venta','dv.costoarticulo as costo')
            -> where ('dv.idventa','=',$id)
            ->get();
			
			$recibo=DB::table('recibos as r')-> where ('r.idapartado','=',$id)
            ->get();
			$seriales=DB::table('seriales as se')-> where ('se.idventa','=',$id)
            ->get();
			$retencion=DB::table('retencionventas')-> where ('idFactura','=',$id)
            ->first();
			//dd($venta);
			$recibonc=DB::table('mov_notas as mov')-> where ('mov.iddoc','=',$id)-> where ('mov.tipodoc','=',"FAC")
            ->get();

            return view("apartado.venta.show",["retencion"=>$retencion,"seriales"=>$seriales,"venta"=>$venta,"recibos"=>$recibo,"recibonc"=>$recibonc,"empresa"=>$empresa,"detalles"=>$detalles]);
	}
		public function showimportado(Request $request, $id){
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
			
			
			$recibo=DB::table('recibos as r')-> where ('r.idapartado','=',$id)
            ->get();
			$seriales=DB::table('seriales as se')-> where ('se.idventa','=',$id)
            ->get();
			$retencion=DB::table('retencionventas')-> where ('idFactura','=',$id)
            ->first();
			//dd($venta);
			$recibonc=DB::table('mov_notas as mov')-> where ('mov.iddoc','=',$id)-> where ('mov.tipodoc','=',"FAC")
            ->get();

            return view("apartado.venta.showimportado",["retencion"=>$retencion,"seriales"=>$seriales,"venta"=>$venta,"recibos"=>$recibo,"recibonc"=>$recibonc,"empresa"=>$empresa,"detalles"=>$detalles]);
	}
	public function destroy(Request $request){
	
		//dd($request);
		$user=Auth::user()->name;		
		$ser=DB::table('seriales')
					->where('idapartado','=',$request->get('id'))->first();
			
				if($ser!= NULL){	
			$devs=Seriales::where('idapartado','=',$request->get('id'))->get();
			$devs->toQuery()->update(['estatus' => 0]);
				}
			$detalles=DB::table('detalle_apartado as da')
            -> select('da.idarticulo as cod','da.cantidad')
            -> where ('da.idventa','=',$request->get('id'))
            ->get();
					
		$longitud = count($detalles);
		$array = array();
			foreach($detalles as $t){
			$arraycod[] = $t->cod;
			$arraycan[] = $t->cantidad;
			}
		for ($i=0;$i<$longitud;$i++){		
			$articulo=Articulos::findOrFail($arraycod[$i]);
			$articulo->stock=($articulo->stock+$arraycan[$i]);
			$articulo->apartado=($articulo->apartado-$arraycan[$i]);
			$articulo->update();
		}
			$comprobante=DB::table('recibos as cb')
            -> select('cb.idrecibo')
            -> where ('cb.idapartado','=',$request->get('id'))
            ->get();
				$long = count($comprobante);
				$array = array();
			foreach($comprobante as $ct){
			$arrayid[] = $ct->idrecibo;
			}		 
				for ($j=0;$j<$long;$j++){
			$recibo=Recibos::findOrFail($arrayid[$j]);
			$mrecibo=$recibo->monto;	
			 $recibo->referencia='Doc. Anulado ->'.$mrecibo;
			 $recibo->update();
				 	$mbanco=DB::table('mov_ban')
					->where('tipodoc','=',"APA")
					->where('iddocumento','=',$arrayid[$j])->first();
			
				if($mbanco!= NULL){	
				$delmov=MovBancos::findOrFail($mbanco->id_mov);
				$delmov->concepto="Doc. Anul.".$request->get('id')."Rec".$arrayid[$j]."M:".$mrecibo;
				$delmov->update();
				}
				}  
			
			 $ingreso=Apartado::findOrFail($request->get('id'));
			 $ingreso->devolu=1;
			  $ingreso->saldo='0';
			 $ingreso->update();
			 return Redirect::to('apartado');
	}
	public function abonoapartado(Request $request, $id){
			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			$venta=DB::table('apartado as v')
            -> join ('clientes as p','v.idcliente','=','p.id_cliente')
            -> select ('v.dias','v.incremento','v.recargo','v.obs','v.idventa','v.tasa','v.fecha_hora','v.fecha_emi','p.nombre','p.cedula','p.telefono','p.direccion','v.control','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.estado','v.saldo','v.total_venta','v.devolu')
            ->where ('v.idventa','=',$id)
            -> first();
			$recibo=DB::table('recibos as r')-> where ('r.idapartado','=',$id)
            ->get();
			$monedas=DB::table('monedas')->get();

            return view("apartado.venta.abono",["venta"=>$venta,"recibos"=>$recibo,"empresa"=>$empresa,"monedas"=>$monedas]);
	}
	public function recargo(Request $request){
			$mytime=Carbon::now('America/Caracas');
			$mytime->toDateTimeString();	
           $apart=Apartado::findOrFail($request->get('id'));
		   $apart->recargo=$apart->recargo+$request->get('mrecargo');
		   $apart->total_venta=$request->get('mventa');
		   $apart->saldo=$request->get('msaldo');
		   $apart->dias=$apart->dias*2;
 			$apart->update();
			
	 return Redirect::to('abonoapartado/'.$request->get('id'));
	}
	public function saveabono (Request $request)
    {
		//dd($request);
		$user=Auth::user()->name;
			// inserta el recibo
			$cliente=Apartado::findOrFail($request->get('venta'));
          $idpago=$request->get('tidpago');
           $idbanco=$request->get('tidbanco');
		   $denomina=$request->get('denominacion');
           $tmonto=$request->get('tmonto');
           $tref=$request->get('tref');		 
           $contp=0;
             while($contp < count($idpago)){
				$recibo=new Recibos;
				$recibo->idapartado=$request->get('venta');				
				$recibo->tiporecibo='AP'; 
				$recibo->idpago=$idpago[$contp];
				$recibo->id_banco=0;
				$recibo->idventa=0;
				$recibo->idbanco=$idbanco[$contp];
				$recibo->recibido=$denomina[$contp];			
				$recibo->monto=$tmonto[$contp]; 
				$recibo->referencia=$tref[$contp];
				$recibo->tasap=$request->get('peso');
				$recibo->tasab=$request->get('tc');
				$recibo->aux=$request->get('tdeuda');
				$mytime=Carbon::now('America/Caracas');
				$recibo->fecha=$mytime->toDateTimeString();	
				$recibo->usuario=$user;				
				$recibo->save();
						$mon=Monedas::findOrFail($idpago[$contp]);
							if($mon->idbanco>0){
								    $mov=new MovBancos;
									$mov->idbanco=$mon->idbanco;
									$mov->clasificador=12;
									$mov->tipodoc="APA";
									$mov->docrelacion=$request->get('venta');
									$mov->iddocumento=$recibo->idrecibo;
									$mov->tipo_mov="N/C";
									$mov->numero="APA-".$request->get('venta')." Rec-".$recibo->idrecibo;
									$mov->concepto="Cobranza Apartado";
									$mov->idbeneficiario=$cliente->idcliente;	
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
				$ventaup=Apartado::findOrFail($request->get('venta'));
				$ventaup->saldo=($recibo->aux);
				$ventaup->update();
	  return Redirect::to('reciboapartado/'.$recibo->idrecibo);
    }
		function facturar(Request $request){
		//dd($request);
		$user=Auth::user()->name;
		//correlativo de ventas
		  $contador=DB::table('venta')->select('idventa')->limit('1')->orderby('idventa','desc')->first();
		if ($contador==NULL){$numero=0;}else{$numero=$contador->idventa;}
		//busco el pedido
		$dpedido=Apartado::findOrFail($request -> get('idventa'));
		$dpedido->impor=1;
		$dpedido->update();
		//registro la venta
		$venta=new Ventas;
		$venta->idcliente=$dpedido->idcliente;
		$venta->tipo_comprobante="FAC";
		$venta->serie_comprobante=$dpedido->serie_comprobante;
		$venta->control=$request->get('control');
		$venta->num_comprobante=($numero+1);
		$venta->total_venta=$dpedido->total_venta-$dpedido->recargo;
		$venta->tasa=$request->get('tasa');
		$venta->base=$request->get('total_base');
		$venta->total_iva=$request->get('total_iva');
		$venta->texe=$request->get('texe');
		$venta->idvendedor=$dpedido->idvendedor;
		$mytime=Carbon::now('America/Caracas');
		$venta->fecha_hora=$mytime->toDateTimeString();
		$venta->fecha_emi=$request->get('fecha_emi');
		$venta->impuesto='16';
			if(($request->get('convertir')=="on")){
			$venta->flibre=1;
			}
		$venta->saldo=$dpedido->total_venta;
		$venta->estado='Contado';
		$venta->devolu='0';
		$venta->comision=$dpedido->comision;
		$venta->montocomision=$dpedido->montocomision;
		$venta->user=$user;
		$venta-> save();
			if(($request->get('convertir')=="on")){
			$pnro=DB::table('formalibre')
			->select(DB::raw('MAX(idforma) as pnum'))
			->first();				
			$fl=new Formalibre;
			$fl->idventa=$venta->idventa;
			$fl->nrocontrol=($pnro->pnum+1);
			$fl->save();
		}
   //de la venta
   
    $idarticulo = $request -> get('idarticulo');
    $cantidad = $request -> get('cantidad');
    $precio_venta = $request -> get('precio');
    $costoarticulo = $request -> get('costo');
    $descuento = $request -> get('descuento');
	 $fecha_emi = $request->get('fecha_emi');
	 $serie = $request->get('serie_comprobante');
	 
    $mytime=Carbon::now('America/Caracas');
    $cont = 0;
        while($cont < count($idarticulo)){
			if($cantidad[$cont]>0){
        $detalle=new DetalleVentas();
        $detalle->idventa=$venta->idventa;
        $detalle->idarticulo=$idarticulo[$cont];
        $detalle->costoarticulo=$costoarticulo[$cont];
        $detalle->cantidad=$cantidad[$cont];
        $detalle->descuento=$descuento[$cont];
        $detalle->precio_venta=$precio_venta[$cont];
         $detalle->fecha=$mytime->toDateTimeString();	
         $detalle->fecha_emi=$fecha_emi;	
        $detalle->save();
            $kar=new Kardex;
    $kar->fecha=$mytime->toDateTimeString();
    $kar->documento="VENT-".$venta->idventa;
    $kar->idarticulo=$idarticulo[$cont];
    $kar->cantidad=$cantidad[$cont];
    $kar->costo=$costoarticulo[$cont];
    $kar->tipo=2; 
    $kar->user=$user;
     $kar->save();  
                  //actualizo stock   
    $articulo=Articulos::findOrFail($idarticulo[$cont]);
	$articulo->apartado=$articulo->apartado-$cantidad[$cont];
    $articulo->stock=$articulo->stock-$cantidad[$cont];
    $articulo->update();
        $cont=$cont+1;
        }
		}
		if($request->get('convertir')=="on"){
	  return Redirect::to('fbs/'.$venta->idventa);
	}else{
        return Redirect::to('tcartaimpor/'.$venta->idventa);
	}
	}
		public function reciboapartado($id){
			
			$recibo=Recibos::findOrFail($id);
			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			$venta=DB::table('apartado as v')
            -> join ('clientes as p','v.idcliente','=','p.id_cliente')
            -> select ('v.dias','v.incremento','v.idventa','v.tasa','v.fecha_hora','v.fecha_emi','p.nombre','p.cedula','p.telefono','p.direccion','v.control','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.estado','v.saldo','v.total_venta','v.devolu')
            ->where ('v.idventa','=',$recibo->idapartado)
            -> first();
            return view("apartado.venta.reciboabono",["venta"=>$venta,"recibos"=>$recibo,"empresa"=>$empresa]);
	}
		public function reporteapartados(Request $request){
		if ($request->get('idvendedor'))
        {		
		$query=trim($request->get('idvendedor'));
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
		$vendedor=DB::table('vendedores')->get();
		$detalles=DB::table('detalle_apartado as dv')
		->join('apartado as ve','ve.idventa','=','dv.idventa')
		-> join('articulos as a','dv.idarticulo','=','a.idarticulo')
		-> select(DB::raw('sum(dv.cantidad) as cantidad'),'ve.idvendedor as vendedor','a.nombre as articulo','a.stock','a.idarticulo')
		->where('ve.idvendedor','=',$query)
		->where('ve.devolu','=',0)
		->where('ve.impor','=',0)
		->groupby('dv.idarticulo','ve.idvendedor')
		->get();
		$ven=DB::table('vendedores')-> where('id_vendedor','=',$query)->first();
		$query=$ven->nombre;
		$valida=1;
		}else{
		$query=trim($request->get('idvendedor'));
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
		$vendedor=DB::table('vendedores')->get();
		$detalles=DB::table('detalle_apartado as dv')
		->join('apartado as ve','ve.idventa','=','dv.idventa')
		-> join('articulos as a','dv.idarticulo','=','a.idarticulo')
		-> select(DB::raw('sum(dv.cantidad) as cantidad'),'a.nombre as articulo','a.stock','a.idarticulo')
		->where('ve.devolu','=',0)
		->where('ve.impor','=',0)
		->groupby('dv.idarticulo')
		->get();		
		$query="Todos Vendedores";
		$valida=0;
			}
		return view("reportes.apartado.articulos.index",["valida"=>$valida,"vendedor"=>$vendedor,"ventas"=>$detalles,"searchText"=>$query,"empresa"=>$empresa]);
	}
			public function apartadosresumen(Request $request){
			
      if ($request)
        {
			$vendedores=DB::table('vendedores')->get();    
			$corteHoy = date("Y-m-d");
            $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
            $query=trim($request->get('searchText'));
			if (($query)==""){$query=$corteHoy; }
             $query2=trim($request->get('searchText2'));
            $query2 = date_create($query2);  
	
            date_add($query2, date_interval_create_from_date_string('1 day'));
            $query2=date_format($query2, 'Y-m-d');
         //datos venta
	
         if($request->get('vendedor')==0){
            $datos=DB::table('apartado as v')
			-> join('clientes as c','v.idcliente','=','c.id_cliente')
			-> join ('vendedores as ven','ven.id_vendedor','=','c.vendedor')
			->select('v.idventa','c.nombre','v.tipo_comprobante','v.num_comprobante','v.impor','v.estado','v.total_venta','v.fecha_hora','v.fecha_emi','v.saldo','v.devolu','ven.nombre as vendedor','v.user')
			-> whereBetween('v.fecha_hora', [$query, $query2])
			-> groupby('v.idventa')
            ->get();
				
			// pagos
			$pagos=DB::table('recibos as re')
			->join('apartado as v','v.idventa','=','re.idapartado')
			->join('monedas as mo','mo.idmoneda','=','re.idpago')
			-> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco','re.idpago')
			->where('re.monto','>',0)
			->where('v.devolu','=',0)
            -> whereBetween('re.fecha', [$query, $query2])
			-> groupby('re.idpago','re.idbanco')
            ->get();
			//datos devolucion     
             $devolucion=DB::table('apartado as d')
            -> select(DB::raw('sum(d.total_venta) as totaldev'))
			->where('d.devolu','=',1)
            ->whereBetween('d.fecha_hora', [$query, $query2])
            ->get();
		 //dd($devolucion);   
		 $detalles=DB::table('detalle_apartado as dv')
		->join('apartado as ve','ve.idventa','=','dv.idventa')
		-> join('articulos as a','dv.idarticulo','=','a.idarticulo')
		-> select(DB::raw('sum(dv.cantidad) as cantidad'),'a.nombre as articulo','a.stock','a.idarticulo')
		->where('ve.devolu','=',0)
		-> whereBetween('dv.fecha_emi', [$query, $query2])
		->groupby('dv.idarticulo')
		->get();
		 }else{
			$datos=DB::table('apartado as v')
			-> join('clientes as c','v.idcliente','=','c.id_cliente')
			-> join ('vendedores as ven','ven.id_vendedor','=','c.vendedor')
			->select('v.idventa','c.nombre','v.tipo_comprobante','v.num_comprobante','v.impor','v.estado','v.total_venta','v.fecha_hora','v.fecha_emi','v.saldo','v.devolu','ven.nombre as vendedor','v.user')
			-> where('ven.id_vendedor','=',$request->get('vendedor'))
			-> whereBetween('v.fecha_hora', [$query, $query2])
			-> groupby('v.idventa')
            ->get(); 
		
			$pagos=DB::table('recibos as re')
			->join('apartado as v','v.idventa','=','re.idapartado')
			->join('clientes as cli','cli.id_cliente','=','v.idcliente')
			->join('vendedores as ve','ve.id_vendedor','=','cli.vendedor')
			-> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco','re.idpago')
			-> where('ve.id_vendedor','=',$request->get('vendedor'))
			->where('re.monto','>',0)
			->where('v.devolu','=',0)
            -> whereBetween('re.fecha', [$query, $query2])
			-> groupby('re.idpago','re.idbanco')
            ->get(); 		
		//dd($pagos);	
			$devolucion=DB::table('apartado as d')
			->join('vendedores as ve','ve.id_vendedor','=','d.idvendedor')
            -> select(DB::raw('sum(d.total_venta) as totaldev'))
			->where('d.devolu','=',1)
			-> where('d.idvendedor','=',$request->get('vendedor'))
            ->whereBetween('d.fecha_hora', [$query, $query2])
            ->get();
		$detalles=DB::table('detalle_apartado as dv')
		->join('apartado as ve','ve.idventa','=','dv.idventa')
		-> join('articulos as a','dv.idarticulo','=','a.idarticulo')
		-> select(DB::raw('sum(dv.cantidad) as cantidad'),'a.nombre as articulo','a.stock','a.idarticulo')
		-> where('ve.idvendedor','=',$request->get('vendedor'))
		->where('ve.devolu','=',0)
		-> whereBetween('dv.fecha_emi', [$query, $query2])
		->groupby('dv.idarticulo')
		->get();
		 }
			$query2=date("Y-m-d",strtotime($query2."- 1 days"));
			return view('reportes.apartado.ventas.index',["datos"=>$datos,"detalles"=>$detalles,"devolucion"=>$devolucion,"empresa"=>$empresa,"pagos"=>$pagos,"vendedores"=>$vendedores,"searchText"=>$query,"searchText2"=>$query2]);
       
		} 
	}
}
