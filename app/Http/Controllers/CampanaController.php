<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Models\Campana;
use App\Models\Comisionshein;
use App\Models\PedidoShein;
use App\Models\MovBancos;
use App\Models\Reciboscomision;
use App\Models\Notasadmp;
use Carbon\Carbon;
use DB;
use Auth;

class CampanaController extends Controller
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
            $data=DB::table('campana as v')
           ->join('proveedores','proveedores.idproveedor','v.idproveedor')
		   ->select('v.*','proveedores.nombre')
			-> where ('v.codigo','LIKE','%'.$query.'%')
            -> orderBy('v.id','desc')
            ->paginate(50);
     
	return view ('pedidoshein.campana.index',["data"=>$data,"searchText"=>$query,"empresa"=>$empresa]);
        }
    }
		public function create(){
	
			$proveedores=DB::table('proveedores')->get();
			return view('pedidoshein.campana.create')
			->with('proveedores',$proveedores);
	}
	public function store (Request $request)
    {
		$user=Auth::user()->name;

        $data=new Campana;
        $data->codigo=$request->get('codigo');
        $data->idproveedor=$request->get('idproveedor');
          $mytime=Carbon::now('America/Caracas');
		$data->creado=$mytime->toDateTimeString();
		$data->usuario=$user;
        $data->save();
       return Redirect::to('campana');

    }
	public function show($id)
    {   //  dd($id);
        $campana=Campana::findOrFail($id);
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
        $articulos=DB::table('campana as ca')
            -> join('pedidoshein as ps','ps.codlote','=','ca.id')
            -> join('detalle_pedidoshein as dp','dp.idpedido','=','ps.idpedido')
            -> select ('dp.*','ca.estatus')
            ->where ('ps.codlote','=',$id)
            ->where ('ps.anulado','=',0)
            ->orderBy('dp.descripcion','asc')
            ->get();

      return view("pedidoshein.campana.show",["empresa"=>$empresa,"articulos"=>$articulos,"campana"=>$campana]);
    }
	  public function cerrarcampana(Request $request)
    {    
			$data=campana::findOrFail($request->campana);
			$data->costo=$request->costo;
			$data->utilidad=$request->utilidad;
			$data->pagado=$request->pagopedido;
			$data->gastos=$request->gastopedido;
			$data->utilneta=$request->utilneta;
			$mytime=Carbon::now('America/Caracas');
			$data->cierre=$mytime->toDateTimeString();
			$data->estatus=1;
			$data->update();
				//	
	$contador=DB::table('notasadmp')->select(DB::raw('count(idnota) as doc'))->where('tipo','=',1)->first();
	//dd($contador);
   if ($contador==NULL){$numero=0;}else{$numero=$contador->doc;}
        $paciente=new Notasadmp;
        $paciente->tipo=1;
        $paciente->ndocumento=$numero+1;
        $paciente->idproveedor=$data->idproveedor;
        $paciente->descripcion="Campaña Shein #".$data->codigo;
        $paciente->referencia="Shein-".$data->codigo;
        $paciente->monto=$request->costo;
		$mytime=Carbon::now('America/Caracas');
		$paciente->fecha=$mytime->toDateTimeString();
        $paciente->pendiente=$request->costo;
		$paciente->usuario=Auth::user()->name;
        $paciente->save();
       return Redirect::to('campana');

    }
	public function comicampana($id)
    {   
        $campana=Campana::findOrFail($id);
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
        $pedidos=DB::table('campana as ca')
            -> join('pedidoshein as ps','ps.codlote','=','ca.id')
            -> join('clientes as cli','cli.id_cliente','=','ps.idcliente')
            -> select ('ps.*','cli.nombre','cli.telefono')
            ->where ('ps.codlote','=',$id)
            ->where ('ps.anulado','=',0)
            ->where ('ps.idcomision','=',0)
            ->orderBy('ps.idpedido','asc')
            ->get(); // dd($pedidos);
		$vendedores=DB::table('campana as ca')
            -> join('pedidoshein as ps','ps.codlote','=','ca.id')
            -> join('vendedores as vend','vend.id_vendedor','=','ps.idvendedor')
            -> select ('vend.id_vendedor','vend.nombre')
            ->where ('ps.codlote','=',$id)
            ->where ('ps.anulado','=',0)
            ->where ('ps.idcomision','=',0)
            ->groupby('ps.idvendedor')
            ->get(); 
      return view("pedidoshein.campana.comicampana",["vendedores"=>$vendedores,"empresa"=>$empresa,"pedidos"=>$pedidos,"campana"=>$campana]);
    }
	
		public function generarcomisionshein (Request $request)
    {
	
		$user=Auth::user()->name;

        $data=new Comisionshein;
        $data->idvendedor=$request->get('id_vendedor');
        $data->codlote=$request->get('id_campana');
        $data->montoventas=$request->get('monto_base_ventas');
        $data->porcentaje=$request->get('porcentaje');
        $data->montocomision=$request->get('monto_comision');
        $data->pendiente=$request->get('monto_comision');
        $mytime=Carbon::now('America/Caracas');
		$data->fecha=$mytime->toDateTimeString();
		$data->usuario=$user;
        $data->save();
		     $idventa=$request->get('pedidos_ids');         
			$contp=0;
				  while($contp < count($idventa)){
					$datap=PedidoShein::findOrFail($idventa[$contp]);
					$datap->idcomision=$data->idcomision;
					$datap->update();
					 $contp=$contp+1;
				  } 
	return back()->with('success', 'Comisión generada exitosamente por un monto de ' . number_format($data->montocomision, 2, ',', '.') . ' $');

    }
	// de la comision
	public function comisionvendedorshein(Request $request)
    {
        if ($request)
        {			
			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
            $query=trim($request->get('searchText'));
            $data=DB::table('comisioneshein as comi')
           ->join('campana as cam','cam.id','comi.codlote')
           ->join('vendedores as vend','vend.id_vendedor','comi.idvendedor')
		   ->select('comi.*','vend.nombre','cam.codigo')
			-> where ('vend.nombre','LIKE','%'.$query.'%')
            -> orderBy('comi.idcomision','desc')
            ->paginate(50);
     
	return view ('pedidoshein.comision.index',["data"=>$data,"searchText"=>$query,"empresa"=>$empresa]);
        }
    }
	public function showcomishein($id)
    {  
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
       		
       $data=DB::table('comisioneshein as comi')
           ->join('campana as cam','cam.id','comi.codlote')
           ->join('vendedores as vend','vend.id_vendedor','comi.idvendedor')
		   ->select('comi.*','vend.nombre','vend.cedula','vend.telefono','cam.codigo')
			-> where ('comi.idcomision',$id)
            ->first();
	$monedas=DB::table('monedas')->get();
		$recibos=DB::table('mov_ban as mv')
           	 -> where ('mv.tipodoc','=',"COMS")
           	 -> where ('mv.docrelacion','=',$id)
            ->get();
			//dd($recibos);
      return view("pedidoshein.comision.show",["data"=>$data,"recibos"=>$recibos,"empresa"=>$empresa,"monedas"=>$monedas]);
    }
			public function saveabonocomishein (Request $request)
    {
		//dd($request);
		
		$idpago=explode("_",$request->get('pidpago'));
		$tipo=$idpago[1];
		if($tipo==0){$pagado=$request->get('pagado');}
		if($tipo==1){$pagado=($request->get('pagado')/$idpago[2]);}
		if($tipo==2){$pagado=($request->get('pagado')*$idpago[2]);}
		$mone=DB::table('monedas')-> where('idmoneda','=',$idpago[0])->first();
		$user=Auth::user()->name;      
		$pago=new Reciboscomision;
		$pago->id_comision=0;
		$pago->idcomishein=$request->get('comision');
		$pago->monto=$pagado;
		$pago->observacion=$request->get('observacion')." pagado: ".$request->get('pagado').$mone->simbolo;
		$mytime=Carbon::now('America/Caracas');
		$pago->fecha=$mytime->toDateTimeString();
		$pago->user=$user;
		$pago-> save();
		
		$venta=Comisionshein::findOrFail($request->get('comision'));
		$venta->pendiente=($venta->pendiente-$pagado);
		$venta->update();
		
			$vendedor=DB::table('comisioneshein')-> join('vendedores','vendedores.id_vendedor','=','comisioneshein.idvendedor')->where('idcomision','=',$request->get('comision'))->first();
			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			
			$mbanco=DB::table('monedas')
					->where('idmoneda','=',$idpago[0])->first();
			//dd($mbanco);
				if($mbanco->idbanco>0){	
         $mov=new MovBancos;
        $mov->idbanco=$mbanco->idbanco;
        $mov->clasificador=8;
        $mov->tipo_mov="N/D";
        $mov->tipodoc="COMS";
        $mov->docrelacion=$request->get('comision');
        $mov->iddocumento=$pago->id_recibo;
        $mov->numero="COMI-".$request->get('comision');
        $mov->moneda=$mone->nombre;
        $mov->concepto="Abono/Pago Comision";
        $mov->idbeneficiario=$vendedor->id_vendedor;	
		$mov->identificacion=$vendedor->nombre;
		$mov->ced=$vendedor->cedula;
		$mov->tipo_per="V";
        $mov->monto=$request->get('pagado');
		$mov->tasadolar=$empresa->tasa_banco;
        $mytime=Carbon::now('America/Caracas');
        $mov->fecha_mov=$mytime->toDateTimeString();
        $mov->user=$user;
        $mov->save();
		}
	   return Redirect::to('comisionvendedorshein');
    }
}
