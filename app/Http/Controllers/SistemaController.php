<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Models\Empresa;
use App\Models\Monedas;
use App\Models\Articulos;
use App\Models\Roles;
use App\Models\User;

use DB;
use Carbon\Carbon;
use Auth;

class SistemaController extends Controller
{
	public function __construct()
	{
	$this->middleware('auth');
	}
	public function acttasas(Request $request)
	{
			$rol=DB::table('roles')-> select('acttasa')->where('iduser','=',$request->user()->id)->first();	
			$empresa=DB::table('empresa')
			->first();
			$monedas=DB::table('monedas')
			->get();
			return view('sistema.tasa.index',["rol"=>$rol,"monedas"=>$monedas,"empresa"=>$empresa]);
		
	}
	 public function update(Request $request)
    {
	         $idm=$request->get('idmoneda');
			$valor=$request->get('valor');	 
			$contp=0;
              while($contp < count($idm)){
				  $actm=Monedas::findOrFail($idm[$contp]);
					$actm->valor=$valor[$contp];				
				$actm->update();
				if($idm[$contp]==4){
					$empresa=Empresa::findOrFail('1');
					$empresa->tc=$valor[$contp];
					$empresa->update();
				}
				if($idm[$contp]==3){
					$empresa=Empresa::findOrFail('1');
					$empresa->peso=$valor[$contp];
					$empresa->update();
				}
				 $contp=$contp+1;
			  }  
		   
         return Redirect::to('tasas');
	}
	public function usuarios(Request $request)
	{
		$rol=DB::table('roles')-> select('actroles','updatepass')->where('iduser','=',$request->user()->id)->first();	
	//	dd($rol);
			if ($rol->actroles==1){			
			$user=DB::table('users')->join('roles','users.id','=','roles.iduser')
			->get();
			return view('sistema.roles.usuarios',["empresa"=>$user,"updatepass"=>$rol->updatepass]);							  
			} else { 
		return view("reportes.mensajes.noautorizado");
	}
		
	}
	
	 public function updtuser(Request $request)
    {
		//dd($request);
		$data=Roles::findOrFail($request->get('rol'));
		$usuario=$data->iduser;
		if ($request->get('op1')){ $data->newcliente=1; }else{ $data->newcliente=0; }
		if ($request->get('op2')){ $data->editcliente=1; }else{ $data->editcliente=0; }
		if ($request->get('op3')){ $data->newproveedor=1; }else{ $data->newproveedor=0; }
		if ($request->get('op4')){ $data->editproveedor=1; }else{ $data->editproveedor=0; }
		if ($request->get('op5')){ $data->newvendedor=1; }else{ $data->newvendedor=0; }
		if ($request->get('op6')){ $data->editvendedor=1; }else{ $data->editvendedor=0; }
		if ($request->get('op7')){ $data->newarticulo=1; }else{ $data->newarticulo=0; }
		if ($request->get('op8')){ $data->editarticulo=1; }else{ $data->editarticulo=0; }
		if ($request->get('op9')){ $data->crearcompra=1; }else{ $data->crearcompra=0; }
		if ($request->get('op10')){ $data->anularcompra=1; }else{ $data->anularcompra=0; }
		if ($request->get('op11')){ $data->crearventa=1; }else{ $data->crearventa=0; }
		if ($request->get('op12')){ $data->anularventa=1; }else{ $data->anularventa=0; }
		if ($request->get('op20')){ $data->crearpedido=1; }else{ $data->crearpedido=0; }
		if ($request->get('op13')){ $data->creargasto=1; }else{ $data->creargasto=0; }
		if ($request->get('op14')){ $data->anulargasto=1; }else{ $data->anulargasto=0; }
		if ($request->get('op15')){ $data->abonarcxp=1; }else{ $data->abonarcxp=0; }
		if ($request->get('op16')){ $data->abonarcxc=1; }else{ $data->abonarcxc=0; }
		if ($request->get('op21')){ $data->abonargasto=1; }else{ $data->abonargasto=0; }
		if ($request->get('op17')){ $data->crearajuste=1; }else{ $data->crearajuste=0; }
		if ($request->get('op18')){ $data->comisiones=1; }else{ $data->comisiones=0; }
		if ($request->get('op19')){ $data->acttasa=1; }else{ $data->acttasa=0; }
		if ($request->get('op22')){ $data->actroles=1; }else{ $data->actroles=0; }
		if ($request->get('op23')){ $data->rventas=1; }else{ $data->rventas=0; }
		if ($request->get('op24')){ $data->rdetallei=1; }else{ $data->rdetallei=0; }
		if ($request->get('op25')){ $data->rcxc=1; }else{ $data->rcxc=0; }
		if ($request->get('op26')){ $data->rcompras=1; }else{ $data->rcompras=0; }
		if ($request->get('op27')){ $data->rdetallec=1; }else{ $data->rdetallec=0; }
		if ($request->get('op28')){ $data->rcxp=1; }else{ $data->rcxp=0; }
		if ($request->get('op29')){ $data->anularpedido=1; }else{ $data->anularpedido=0; }
		if ($request->get('op30')){ $data->importarpedido=1; }else{ $data->importarpedido=0; }
		if ($request->get('op31')){ $data->editpedido=1; }else{ $data->editpedido=0; }
		if ($request->get('op32')){ $data->ccaja=1; }else{ $data->ccaja=0; }
		if ($request->get('op33')){ $data->updatepass=1; }else{ $data->updatepass=0; }
		if ($request->get('op34')){ $data->newbanco=1; }else{ $data->newbanco=0; }
		if ($request->get('op35')){ $data->accesobanco=1; }else{ $data->accesobanco=0; }
		if ($request->get('op36')){ $data->rarti=1; }else{ $data->rarti=0; }
		if ($request->get('op37')){ $data->rlistap=1; }else{ $data->rlistap=0; }
		if ($request->get('op38')){ $data->rgerencial=1; }else{ $data->rgerencial=0; }
		if ($request->get('op39')){ $data->ranalisisc=1; }else{ $data->ranalisisc=0; }
		if ($request->get('op40')){ $data->newmoneda=1; }else{ $data->newmoneda=0; }
		if ($request->get('op41')){ $data->editmoneda=1; }else{ $data->editmoneda=0; }
		if ($request->get('op42')){ $data->rutilventa=1; }else{ $data->rutilventa=0; }
		if ($request->get('op43')){ $data->rventasarti=1; }else{ $data->rventasarti=0; }
		if ($request->get('op44')){ $data->rgastos=1; }else{ $data->rgastos=0; }
		if ($request->get('op45')){ $data->retenciones=1; }else{ $data->retenciones=0; }
		if ($request->get('op46')){ $data->rcompraarti=1; }else{ $data->rcompraarti=0; }
		if ($request->get('op47')){ $data->anularret=1; }else{ $data->anularret=0; }
		if ($request->get('op48')){ $data->editret=1; }else{ $data->editret=0; }
		if ($request->get('op49')){ $data->resumenbanco=1; }else{ $data->resumenbanco=0; }
		if ($request->get('op50')){ $data->editbanco=1; }else{ $data->editbanco=0; }
		if ($request->get('op51')){ $data->newndbanco=1; }else{ $data->newndbanco=0; }
		if ($request->get('op52')){ $data->newncbanco=1; }else{ $data->newncbanco=0; }
		if ($request->get('op53')){ $data->transferenciabanco=1; }else{ $data->transferenciabanco=0; }
		if ($request->get('op54')){ $data->anularopbanco=1; }else{ $data->anularopbanco=0; }
		if ($request->get('op55')){ $data->rlcompras=1; }else{ $data->rlcompras=0; }
		if ($request->get('op56')){ $data->rlventas=1; }else{ $data->rlventas=0; }
		if ($request->get('op57')){ $data->rlvalorizado=1; }else{ $data->rlvalorizado=0; }
		if ($request->get('op58')){ $data->rcorrelativo=1; }else{ $data->rcorrelativo=0; }
		if ($request->get('op59')){ $data->edoctacliente=1; }else{ $data->edoctacliente=0; }
		if ($request->get('op60')){ $data->edoctaproveedor=1; }else{ $data->edoctaproveedor=0; }
		if ($request->get('op61')){ $data->newapartado=1; }else{ $data->newapartado=0; }
		if ($request->get('op62')){ $data->anularapartado=1; }else{ $data->anularapartado=0; }
		if ($request->get('op63')){ $data->abonarapartado=1; }else{ $data->abonarapartado=0; }
		if ($request->get('op64')){ $data->editserial=1; }else{ $data->editserial=0; }
		if ($request->get('op65')){ $data->printcertificado=1; }else{ $data->printcertificado=0; }
		if ($request->get('op66')){ $data->importarne=1; }else{ $data->importarne=0; }
		if ($request->get('op67')){ $data->rvdivisas=1; }else{ $data->rvdivisas=0; }
		if ($request->get('op68')){ $data->cambiarprecioventa=1; }else{ $data->cambiarprecioventa=0; }
		if ($request->get('op69')){ $data->editfecha=1; }else{ $data->editfecha=0; }
		$data ->update();
			
		$user=DB::table('users')->join('roles','users.id','=','roles.iduser')
			->get();
		   
         return Redirect::to('showusuarios');
	}
	public function ayuda()
	{		
		return view('sistema.ayuda.index');	
	}
		public function logs()
	{		$empresa=DB::table('empresa')->join('sistema','sistema.idempresa','=','empresa.idempresa')->first();
		return view('sistema.logs',["empresa"=>$empresa]);	
	}
	function calculador(Request $request){
			$ruta=$_SERVER["HTTP_REFERER"];
			$c1= substr($ruta,29);
		
		echo exec('start sistema\calculadora.bat');
		    return Redirect::to($c1);
	}
	function blocn(Request $request){
			$ruta=$_SERVER["HTTP_REFERER"];
			$c1= substr($ruta,29);		
		echo exec('start sistema\bloc.bat');
		    return Redirect::to($c1);
	}
	public function info()
    {
		$empresa=DB::table('empresa')->join('sistema','sistema.idempresa','=','empresa.idempresa')->first();
        return view('sistema.info',["empresa"=>$empresa]);
    }
		public function empresa(Request $request)
    {
		$rol=DB::table('roles')-> select('idrol')->where('iduser','=',$request->user()->id)->first();	
		$empresa=DB::table('empresa')->join('sistema','sistema.idempresa','=','empresa.idempresa')->first();
        return view('sistema.empresa.edit',["empresa"=>$empresa,"rol"=>$rol]);
    }
		public function updatempresa(Request $request)
    {
		//dd($request);
        $emp=Empresa::findOrFail('1');
		$tasa=$emp->tasaespecial;
        $emp->nombre=$request->get('nombre');
        $emp->rif=$request->get('rif');
        $emp->direccion=$request->get('direccion');
        $emp->telefono=$request->get('telefono');
        $emp->tasaespecial=$request->get('tasaajuste');
        $emp->tasadif=$request->get('tasadif');
        $emp->formatofac=$request->get('formato');
        $emp->formatolp=$request->get('formatolp');
        $emp->calc_util=$request->get('calc_util');
        $emp->nlineas=$request->get('nlineas');
		if($request->get('usaserie')){
        $emp->serie=$request->get('usaserie');}else{
			$emp->serie="A";
		}
        $emp->codigo=$request->get('codigo');
				if(!empty($request->file('imagen'))){
			$file = $request->file('imagen');
			$img = $file->getClientOriginalName();		
        	\Storage::disk('diskimg')->put($img, \File::get($file));
			$emp->logo=$img;
			}
		if($request->get('tikect')=="on"){$emp->tikect=1;}else{$emp->tikect=0;}
		if($request->get('web')=="on"){$emp->web=1;}else{$emp->web=0;}
		if($request->get('tasaes')=="on"){$emp->tespecial=1;}else{$emp->tespecial=0;}
		if($request->get('tdif')=="on"){$emp->tdif=1;}else{$emp->tdif=0;}
		if($request->get('formal')=="on"){$emp->fl=1;}else{$emp->fl=0;}
		if($request->get('actcosto')=="on"){$emp->actcosto=1;}else{$emp->actcosto=0;}
		if($request->get('serie')=="on"){$emp->usaserie=1;}else{$emp->usaserie=0;}
		if($request->get('facfiscalcre')=="on"){$emp->facfiscalcredito=1;}else{$emp->facfiscalcredito=0;}
		if($request->get('relapedido')=="on"){$emp->relapedido=1;}else{$emp->relapedido=0;}
		if($request->get('bordefac')=="on"){$emp->bordefac=1;}else{$emp->bordefac=0;}
        $emp->update();

		 if ($tasa>0){
		$lista=DB::table('articulos')
            -> select('idarticulo','costo','precio1','utilidad','precio2','util2')
            -> where ('costo','>',0)
            ->get();
			
		$longitud = count($lista);
		$array = array();
			foreach($lista as $t){
			$arraycod[] = $t->idarticulo;
			}
		for ($i=0;$i<$longitud;$i++){		
			$articulo=Articulos::findOrFail($arraycod[$i]);
			$articulo->costo=(($articulo->costo*$tasa)/$request->get('tasaajuste'));
			$articulo->precio1=(($articulo->utilidad/100)*$articulo->costo)+$articulo->costo;
			$articulo->precio2=(($articulo->util2/100)*$articulo->costo)+$articulo->costo;
			$articulo->precio3=(($articulo->util3/100)*$articulo->costo)+$articulo->costo;
			$articulo->update();
		}
		 }
	   return Redirect::to('/home');
    }
		public function sininternet(Request $request)
	{
		//dd($request);
			$ruta=$_SERVER["HTTP_REFERER"];
			$c1= substr($ruta,29);

			return view ('reportes.mensajes.sinconexion',["link"=>$c1]);
		      
		
	}
	public function updatepass(Request $request)
	{
		//dd($request);
    $user = Auth::user();
	$user = User::find($request->id);
    $user->password = Hash::make($request->pass);
    $user->save();

    return redirect()->back()->with('success', '¡Contraseña actualizada correctamente!');
	}
	public function balance(Request $request)
	{
		//
			$corteHoy = date("Y-m-d");
            $query=trim($request->get('searchText'));
			if (($query)==""){$query=$corteHoy; }
             $query2=trim($request->get('searchText2'));
           $query2 = date_create($query2);  
	
            date_add($query2, date_interval_create_from_date_string('1 day'));
           $query2=date_format($query2, 'Y-m-d');
		$rol=DB::table('roles')-> select('idrol')->where('iduser','=',$request->user()->id)->first();	
		$empresa=DB::table('empresa')->join('sistema','sistema.idempresa','=','empresa.idempresa')->first();
		$cobranza=DB::table('recibos as re')
			->join('venta','venta.idventa','=','re.idventa' )
			->join('clientes','clientes.id_cliente','=','venta.idcliente')
			-> select('clientes.nombre','re.referencia','re.tiporecibo','venta.tipo_comprobante','venta.num_comprobante','re.idbanco','re.idpago','re.idrecibo','re.monto','re.recibido','re.fecha')    
			-> where('venta.devolu','=',0)
            -> whereBetween('re.fecha', [$query, $query2])
			-> groupby('re.idrecibo','re.idbanco')
            ->get();
			//dd($cobranza);
			$nd=DB::table('recibos as re')
			->join('notasadm','notasadm.idnota','=','re.idnota' )
			->join('clientes','clientes.id_cliente','=','notasadm.idcliente')
			-> select('clientes.nombre','re.referencia','re.tiporecibo','notasadm.referencia','notasadm.idnota','re.idbanco','re.idpago','re.idrecibo','re.monto','re.recibido','re.fecha')    
            -> whereBetween('re.fecha', [$query, $query2])
			-> groupby('re.idrecibo','re.idbanco')
            ->get();
			//notas
			$apartado=DB::table('recibos as re')
			->join('apartado','apartado.idventa','=','re.idapartado' )
			->join('clientes','clientes.id_cliente','=','apartado.idcliente')
			-> select('clientes.nombre','re.referencia','re.tiporecibo','apartado.tipo_comprobante','apartado.num_comprobante','re.idbanco','re.idpago','re.idrecibo','re.monto','re.recibido','re.fecha')    
			-> where('apartado.devolu','=',0)
            -> whereBetween('re.fecha', [$query, $query2])
			-> groupby('re.idrecibo','re.idbanco')
            ->get();
			 $ingresos=DB::table('recibos as re')			
            -> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco','re.idpago')
            -> whereBetween('re.fecha', [$query, $query2])
			-> groupby('re.idpago','re.idbanco')
            ->get();

			//de los egresos
			$pagos=DB::table('comprobante as co')
			->join('compras','compras.idcompra','=','co.idcompra' )
			->join('proveedores as p','p.idproveedor','=','compras.idproveedor')
           -> select('p.nombre','co.referencia','compras.num_comprobante','co.idbanco','co.idpago','co.idrecibo','co.monto','co.recibido','co.fecha_comp as fecha')
			-> where('compras.estatus','=',0)
            -> whereBetween('co.fecha_comp', [$query, $query2])
            ->get();
			//dd($pagos);
			$gastos=DB::table('comprobante as co')
			->join('gastos','gastos.idgasto','=','co.idgasto' )
			->join('proveedores as p','p.idproveedor','=','gastos.idpersona')
           -> select('p.nombre','co.referencia','gastos.documento','co.idbanco','co.idpago','co.idrecibo','co.monto','co.recibido','co.fecha_comp as fecha')
            -> whereBetween('co.fecha_comp', [$query, $query2])
            ->get();
			$pagond=DB::table('comprobante as co')
			->join('notasadmp as not','not.idnota','=','co.idnota' )
			->join('proveedores as p','p.idproveedor','=','not.idproveedor')
           -> select('p.nombre','not.referencia','not.ndocumento as documento','co.idbanco','co.idpago','co.idrecibo','co.monto','co.recibido','co.fecha_comp as fecha')
            -> whereBetween('co.fecha_comp', [$query, $query2])
            ->get();
			 $desglosep=DB::table('comprobante')->select(DB::raw('sum(recibido) as recibido'),DB::raw('sum(monto) as monto'),'idbanco')
            -> whereBetween('fecha_comp', [$query, $query2])
            ->groupby('idpago','idbanco')
            ->get();
        return view('reportes.balance.balance.index',["pagond"=>$pagond,"ingresos"=>$ingresos,"desglosep"=>$desglosep,"pagos"=>$pagos,"gastos"=>$gastos,"nd"=>$nd,"cobranza"=>$cobranza,"apartado"=>$apartado,"empresa"=>$empresa,"rol"=>$rol,"searchText"=>$query,"searchText2"=>$query2]);
	}

}
