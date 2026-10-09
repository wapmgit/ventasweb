<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Models\PedidoShein;
use App\Models\Recibos;
use App\Models\Monedas;
use App\Models\MovBancos;
use App\Models\Detalle_PedidoShein;
use Carbon\Carbon;
use DB;
use Auth;

class PedidoSheinController extends Controller
{
     public function __construct()
	{
		$this->middleware('auth');
	}
	public function index(Request $request)
    {
		//dd($request);
        if ($request)
        {
			
			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
            $query=trim($request->get('searchText'));
            $ventas=DB::table('pedidoshein as v')
			  -> join ('campana as ca','ca.id','=','v.codlote')
            -> join ('clientes as p','v.idcliente','=','p.id_cliente')
			->join('vendedores as ve','ve.id_vendedor','=','v.idvendedor')
            -> select ('ca.codigo','v.tipo_comprobante','num_comprobante','v.idpedido','v.fechapedido','p.nombre','v.anulado','v.estatus','v.monto','v.saldo','ve.nombre as user')
			-> where ('p.nombre','LIKE','%'.$query.'%')
            -> orderBy('v.idpedido','desc')
            -> groupBy('v.idpedido')
            ->paginate(20);
     
     return view ('pedidoshein.pedido.index',["ventas"=>$ventas,"searchText"=>$query,"empresa"=>$empresa]);
        }
    }
	public function create(Request $request){

		$monedas=DB::table('monedas')->get();
		$vendedor=DB::table('vendedores')->get();
		$categoria=DB::table('categoriaclientes')->get();	
		$campana=DB::table('campana')->where('estatus','0')->get();	
		$rutas=DB::table('rutas')->get();
		$empresa=DB::table('empresa')->join('sistema','sistema.idempresa','=','empresa.idempresa')->first();
        $personas=DB::table('clientes')->join('vendedores','vendedores.id_vendedor','=','clientes.vendedor')->select('clientes.id_cliente','clientes.tipo_precio','clientes.tipo_cliente','clientes.nombre','clientes.cedula','vendedores.comision','vendedores.id_vendedor as nombrev')-> where('clientes.status','=','A')->groupby('clientes.id_cliente')->get();
         $contador=DB::table('pedidoshein')->select('idpedido')->limit('1')->orderby('idpedido','desc')->get();

		 
     if ($contador==""){$contador=0;}
      return view("pedidoshein.pedido.create",["campana"=>$campana,"categoria"=>$categoria,"rutas"=>$rutas,"personas"=>$personas,"monedas"=>$monedas,"contador"=>$contador,"empresa"=>$empresa,"vendedores"=>$vendedor]);

	}
		public function store(Request $request){
	
	//dd($request);
		$user=Auth::user()->name;
 //try{
  //DB::beginTransaction(); 
   $contador=DB::table('pedidoshein')->select('idpedido')->limit('1')->orderby('idpedido','desc')->first();
   if ($contador==NULL){$numero=0;}else{$numero=$contador->idpedido;}

//registra la venta
    $venta=new PedidoShein;
	$idcliente=explode("_",$request->get('id_cliente'));
    $venta->idcliente=$idcliente[0];
    $venta->tipo_comprobante=$request->get('tipo_comprobante');
    $venta->idvendedor=$request->get('nvendedor');
    $venta->codlote=$request->get('lote');
    $venta->num_comprobante=($numero+1);
    $venta->monto=$request->get('total_venta');
    $mytime=Carbon::now('America/Caracas');
    $venta->fechapedido=$mytime->toDateTimeString();
	$venta->saldo=$request->get('tdeuda');
    $venta->anulado='0';
	$venta->user=$user;
	$venta-> save();

        $idarticulo = $request -> get('idarticulo');
        $cantidad = $request -> get('cantidad');
        $descri = $request -> get('descri');
        $precio_venta = $request -> get('precio_venta');
        $envio = $request -> get('envio');


        $cont = 0;
            while($cont < count($idarticulo)){
            $detalle=new Detalle_PedidoShein();
            $detalle->idpedido=$venta->idpedido;
            $detalle->codigo=$idarticulo[$cont];
            $detalle->cantidad=$cantidad[$cont];
            $detalle->descripcion=$descri[$cont];
            $detalle->costo=$precio_venta[$cont];
            $detalle->envio=$envio[$cont];
            $detalle->subtotal=($cantidad[$cont]*$precio_venta[$cont])+($cantidad[$cont]*$envio[$cont]);
			 $detalle->fecha=$mytime->toDateTimeString();	
            $detalle->save();
            $cont=$cont+1;
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
				$recibo->idpedidoshein=$venta->idpedido;
				if($request->get('tdeuda')>0){
				$recibo->tiporecibo='A'; }else{$recibo->tiporecibo='P'; }
				$pago=explode("_",$idbanco[$contp]);
				$recibo->idpago=$idpago[$contp]; // bbanco
				$recibo->idnota=0;
				$recibo->idapartado=0;
				$recibo->idventa=0;
				$recibo->id_banco=0;
				$recibo->idbanco=$idbanco[$contp]; 
				$recibo->recibido=$denomina[$contp];			
				$recibo->monto=$tmonto[$contp]; 
				$recibo->referencia=$tref[$contp];
				$recibo->tasap=$request->get('peso');
				$recibo->tasab=$request->get('tc');
				$recibo->aux=$request->get('tdeuda');
				$recibo->fecha=$mytime->toDateTimeString();		
				$recibo->fecharecibo=$mytime->toDateTimeString();		
				$recibo->usuario=$user;					
				$recibo->save();
						$mon=Monedas::findOrFail($idpago[$contp]);
							if($mon->idbanco>0){
								    $mov=new MovBancos;
									$mov->idbanco=$mon->idbanco;
									$mov->clasificador=11;
									$mov->tipodoc="PED";
									$mov->docrelacion=$venta->idpedido;
									$mov->iddocumento=$recibo->idrecibo;
									$mov->tipo_mov="N/C";
									$mov->numero="PED-".$recibo->idpedidoshein." Rec-".$recibo->idrecibo;
									$mov->concepto="Pedido";
									$mov->moneda=$idbanco[$contp];
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
/*	DB::commit();
}
catch(\Exception $e)
{
    DB::rollback();
}*/
  return Redirect::to('pedidoshein');
}
public function show(Request $request,$id){
	//dd($request);
    $user=Auth::user()->name;
    $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();

    $venta=DB::table('pedidoshein as pe')
     -> join ('campana as ca','ca.id','=','pe.codlote')
    -> join ('clientes as p','pe.idcliente','=','p.id_cliente')
	->join('vendedores as v','v.id_vendedor','=','pe.idvendedor')
    -> select ('ca.codigo','v.nombre as nombrev','pe.idcliente','pe.idpedido','pe.fechapedido','p.nombre',DB::raw('CONCAT(p.codpais,p.telefono) as telefono'),'p.cedula','p.direccion','pe.tipo_comprobante','pe.num_comprobante','pe.estatus','pe.monto','pe.anulado')
    ->where ('pe.idpedido','=',$id)
    -> first();
    $detalles=DB::table('detalle_pedidoshein as dv')
    -> where ('dv.idpedido','=',$id)
    ->get();			
	$monedas=DB::table('monedas')->get();

    return view("pedidoshein.pedido.show",["monedas"=>$monedas,"venta"=>$venta,"empresa"=>$empresa,"detalles"=>$detalles]);
}
	public function addart(Request $request){
			$mytime=Carbon::now('America/Caracas');
			$detalle=new Detalle_PedidoShein();
            $detalle->idpedido=$request->idpedido;
            $detalle->codigo=$request->pcodigo;
            $detalle->descripcion=$request->pdescri;
            $detalle->cantidad=$request->pcantidad;
            $detalle->costo=$request->pprecio_venta;
            $detalle->envio=$request->envio;
			$detalle->subtotal=($request->pcantidad*$request->pprecio_venta)+($request->pcantidad*$request->envio);
			 $detalle->fecha=$mytime->toDateTimeString();	
            $detalle->save();
		$venta=PedidoShein::findOrFail($request->idpedido);
		$venta->monto=($venta->monto+$detalle->subtotal);
		$venta->saldo=($venta->saldo+$detalle->subtotal);
		$venta->update();
		return Redirect::to('showpedidoshein/'.$request->idpedido);
	}
	public function ajuste(Request $request){	

	try{
	DB::beginTransaction();
	$user=Auth::user()->name;
    $detalleventa=Detalle_PedidoShein::findOrFail($request->iddetalle);
	$aux= $detalleventa->subtotal;
	$aux2=($request -> get('cantidad')*$request -> get('precio'))+($request -> get('cantidad')*$request -> get('envio'));	
	
	$detalleventa->cantidad=$request -> get('cantidad');
	$detalleventa->descripcion=$request -> get('descri');
	$detalleventa->costo=$request -> get('precio');
	$detalleventa->envio=$request -> get('envio');
	$detalleventa->subtotal=$aux2;
	$detalleventa->update();
	$venta=PedidoShein::findOrFail($request -> get('idventa'));
	$abono=$venta->monto-$venta->saldo;
	$venta->monto=(($venta->monto-$aux)+$aux2);
	$venta->saldo=($venta->monto-$abono);
	$venta->update();
	 DB::commit();
	}
	catch(\Exception $e)
	{
		DB::rollback();
	}
	return Redirect::to('showpedidoshein/'.$request -> get('idventa'));
	}
	public function abonopedido(Request $request, $id){

	$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
	$venta=DB::table('pedidoshein as pe')
    -> join ('clientes as p','pe.idcliente','=','p.id_cliente')
	->join('vendedores as v','v.id_vendedor','=','pe.idvendedor')
    -> select ('v.nombre as nombrev','pe.nota','pe.idcliente','pe.idpedido','pe.fechapedido','p.nombre',DB::raw('CONCAT(p.codpais,p.telefono) as telefono'),'p.cedula','p.direccion','pe.tipo_comprobante','pe.num_comprobante','pe.estatus','pe.monto','pe.saldo','pe.anulado')
    ->where ('pe.idpedido','=',$id)
    -> first();
    $detalles=DB::table('detalle_pedidoshein as dv')
    -> where ('dv.idpedido','=',$id)
    ->get();			
	$monedas=DB::table('monedas')->get();
			$recibo=DB::table('recibos as r')-> where ('r.idpedidoshein','=',$id)
            ->get();
			
            return view("pedidoshein.pedido.abono",["venta"=>$venta,"recibos"=>$recibo,"empresa"=>$empresa,"monedas"=>$monedas]);
	}
		public function saveabono (Request $request)
    {
		//dd($request);
		$user=Auth::user()->name;
			// inserta el recibo
			$cliente=PedidoShein::findOrFail($request->get('venta'));
          $idpago=$request->get('tidpago');
           $idbanco=$request->get('tidbanco');
		   $denomina=$request->get('denominacion');
           $tmonto=$request->get('tmonto');
           $tref=$request->get('tref');		 
           $contp=0;
             while($contp < count($idpago)){
				$recibo=new Recibos;
				$recibo->idpedidoshein=$request->get('venta');				
				$recibo->tiporecibo='A'; 
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
				$recibo->fecharecibo=$mytime->toDateTimeString();	
				$recibo->usuario=$user;				
				$recibo->save();
						$mon=Monedas::findOrFail($idpago[$contp]);
							if($mon->idbanco>0){
								    $mov=new MovBancos;
									$mov->idbanco=$mon->idbanco;
									$mov->clasificador=11;
									$mov->tipodoc="PED";
									$mov->docrelacion=$request->get('venta');
									$mov->iddocumento=$recibo->idrecibo;
									$mov->tipo_mov="N/C";
									$mov->numero="PED-".$request->get('venta')." Rec-".$recibo->idrecibo;
									$mov->concepto="Cobranza Pedido Shein";
									$mov->moneda=$idbanco[$contp];
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
				$ventaup=PedidoShein::findOrFail($request->get('venta'));
				$ventaup->saldo=$request->get('tdeuda');
				$ventaup->update();
	  return Redirect::to('abonopedidoshein/'.$request->get('venta'));
    }
	public function destroy(Request $request){
		
			$user=Auth::user()->name;
			 $venta=PedidoShein::findOrFail($request->get('id'));
			 $venta->anulado=1;
             $venta->update();
			 return Redirect::to('pedidoshein');
	}
	public function recibopedido($id){

		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
		$venta=DB::table('pedidoshein as pe')
		-> join ('clientes as p','pe.idcliente','=','p.id_cliente')
		->join('vendedores as v','v.id_vendedor','=','pe.idvendedor')
		-> select ('v.nombre as nombrev','pe.nota','pe.idcliente','pe.idpedido','pe.fechapedido','p.nombre',DB::raw('CONCAT(p.codpais,p.telefono) as telefono'),'p.cedula','p.direccion','pe.tipo_comprobante','pe.num_comprobante','pe.estatus','pe.monto','pe.saldo','pe.anulado')
		->where ('pe.idpedido','=',$id)
		-> first();
		$detalles=DB::table('detalle_pedidoshein as dv')
		-> where ('dv.idpedido','=',$id)
		->get();			
		$recibo=DB::table('recibos as r')-> where ('r.idpedidoshein','=',$id)
		->get();

            return view("pedidoshein.pedido.recibopedido",["venta"=>$venta,"recibos"=>$recibo,"empresa"=>$empresa,"detalles"=>$detalles]);
}
	public function cobrarshein(Request $request)
	{
		if ($request)
		{		
			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			 $lista=DB::table('pedidoshein as v')
			  -> join ('campana as ca','ca.id','=','v.codlote')
            -> join ('clientes as p','v.idcliente','=','p.id_cliente')
            -> select (DB::raw('sum(v.saldo) as acumulado'),DB::raw('sum(v.monto) as monto'),'p.id_cliente','p.cedula','p.telefono','p.nombre')           
			-> where('ca.estatus','=',1)
			-> where('v.saldo','>',0)
            -> where('v.anulado','=',0)
			->groupby('v.idcliente','p.cedula','p.telefono','p.nombre')
            -> orderBy('p.nombre','asc')
            ->get();	
			return view('pedidoshein.cobrar.index',["empresa"=>$empresa,"pacientes"=>$lista]);
		}
	}
	  	public function cobranza(Request $request)
    {   
      if ($request)
        {			
			$corteHoy = date("Y-m-d");
            $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
            $query=trim($request->get('searchText'));
			if (($query)==""){$query=$corteHoy; }
             $query2=trim($request->get('searchText2'));
           $query2 = date_create($query2);  
	
            date_add($query2, date_interval_create_from_date_string('1 day'));
           $query2=date_format($query2, 'Y-m-d');
        
			$cobranza=DB::table('recibos as re')
			->join('pedidoshein','pedidoshein.idpedido','=','re.idpedidoshein' )
			->join('clientes','clientes.id_cliente','=','pedidoshein.idcliente')
			->join('vendedores as vende','vende.id_vendedor','=','clientes.vendedor')
			-> select('clientes.nombre','idmovban','re.referencia','re.tiporecibo','pedidoshein.tipo_comprobante','pedidoshein.num_comprobante','re.idbanco','re.idpago','re.idrecibo','re.monto','re.recibido','re.fecha','re.fecharecibo','vende.nombre as vendedor')    
			-> where('pedidoshein.anulado','=',0)
            -> whereBetween('re.fecha', [$query, $query2])
			-> groupby('re.idrecibo','re.idbanco')
			->get();
            	
				$comprobante=DB::table('recibos as re')
				->join('pedidoshein','pedidoshein.idpedido','=','re.idpedidoshein' )
				->join('clientes','clientes.id_cliente','=','pedidoshein.idcliente')
				-> select(DB::raw('sum(recibido) as mrecibido'),DB::raw('sum(re.monto) as mmonto'),'idbanco','tiporecibo')  
					-> where('pedidoshein.anulado','=',0)			
				-> whereBetween('re.fecha', [$query, $query2])
				->groupby('re.idpago','idbanco','tiporecibo')
				->get();
		   $query2=date("Y-m-d",strtotime($query2."- 1 days"));
			return view('pedidoshein.cobranza.index',["empresa"=>$empresa,"cobranza"=>$cobranza,"comprobante"=>$comprobante,"searchText"=>$query,"searchText2"=>$query2]);			
		}			
	}
}
