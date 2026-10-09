<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Models\Campana;
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
			$mytime=Carbon::now('America/Caracas');
			$data->cierre=$mytime->toDateTimeString();
			$data->estatus=1;
			$data->update();
				//	dd($request);
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
}
