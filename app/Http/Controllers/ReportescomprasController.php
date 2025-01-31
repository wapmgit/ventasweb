<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use App\Models\Retenciones;
use App\Models\Empresa;
use App\Models\Compras;
use App\Models\Seriales;
use App\Models\Gastos;
use App\Models\Ventas;
use App\Models\Clientes;
use DB;
use Auth;

class ReportescomprasController extends Controller
{
	   public function __construct()
	{
	$this->middleware('auth');
	}
    public function compras(Request $request)
    {
		$rol=DB::table('roles')-> select('rcompras')->where('iduser','=',$request->user()->id)->first();	
		if ($rol->rcompras==1){
		$corteHoy = date("Y-m-d");
        $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
		$tipo=$request->get('tipodoc');
        $query=trim($request->get('searchText'));
        $query2=trim($request->get('searchText2'));
			if (($query)==""){$query=$corteHoy; }
			$query2 = date_create($query2);
            date_add($query2, date_interval_create_from_date_string('1 day'));
            $query2=date_format($query2, 'Y-m-d');
            $datos=DB::table('compras as c')
            ->join ('proveedores as p', 'c.idproveedor','=','p.idproveedor')
			->select ('c.idcompra as idingreso','c.base','c.miva','c.exento','c.num_comprobante','c.condicion as estado','c.total','c.saldo','c.fecha_hora','p.nombre','p.rif','tipo_comprobante')
			->where('tipo_comprobante','=',$tipo)
            ->whereBetween('c.fecha_hora', [$query, $query2])
            ->groupby('c.idcompra')
            ->get();
         // dd($datos);
			$pagos=DB::table('comprobante as re')->join('compras','compras.idcompra','=','re.idcompra')
			-> where('compras.tipo_comprobante','=',$tipo)
			-> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco','re.idpago')
            -> whereBetween('re.fecha_comp', [$query, $query2])
			-> groupby('re.idpago','re.idbanco')
            ->get();
		$query2=date("Y-m-d",strtotime($query2."- 1 days"));
        return view('reportes.compras.compras.index',["datos"=>$datos,"pagos"=>$pagos,"empresa"=>$empresa,"searchText"=>$query,"searchText2"=>$query2]);    
		} else { 
			return view("reportes.mensajes.noautorizado");
			}
	}
	public function gastos(Request $request)
    {	
	$rol=DB::table('roles')-> select('rgastos')->where('iduser','=',$request->user()->id)->first();	
		if ($rol->rgastos==1){
		$corteHoy = date("Y-m-d");
        $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
		$tipo=$request->get('tipodoc');
        $query=trim($request->get('searchText'));
        $query2=trim($request->get('searchText2'));
			if (($query)==""){$query=$corteHoy; }
			$query2 = date_create($query2);
            date_add($query2, date_interval_create_from_date_string('1 day'));
            $query2=date_format($query2, 'Y-m-d');
            $datos=DB::table('gastos as c')
            ->join ('proveedores as p', 'c.idpersona','=','p.idproveedor')
			->select ('c.*','p.nombre','p.rif')
            ->whereBetween('c.fecha', [$query, $query2])
            ->groupby('c.idgasto')
            ->get();
			$pagos=DB::table('comprobante as re')->join('gastos','gastos.idgasto','=','re.idgasto')
			-> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco','re.idpago')
            -> whereBetween('re.fecha_comp', [$query, $query2])
			-> groupby('re.idpago','re.idbanco')
            ->get();
		$query2=date("Y-m-d",strtotime($query2."- 1 days"));
        return view('reportes.compras.gastos.index',["datos"=>$datos,"pagos"=>$pagos,"empresa"=>$empresa,"searchText"=>$query,"searchText2"=>$query2]);    
		} else { 
			return view("reportes.mensajes.noautorizado");
			}  
  }
	public function listaretenciones(Request $request)
	{
	$rol=DB::table('roles')-> select('retenciones','editret','anularret')->where('iduser','=',$request->user()->id)->first();	
		if ($rol->retenciones==1){
		if ($request)
		{			
			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			$query=trim($request->get('searchText'));
			$proveedores=DB::table('retenciones as i')
			->join('retenc','retenc.codigo','=','i.retenc')
			->join('proveedores as p','p.idproveedor','=','i.idproveedor')
			->where('p.nombre','LIKE','%'.$query.'%')
			->paginate(20);
			return view('proveedores.retenciones.index',["rol"=>$rol,"empresa"=>$empresa,"proveedores"=>$proveedores,"searchText"=>$query]);
		}
				} else { 
			return view("reportes.mensajes.noautorizado");
			}  
	}
	public function ajustecorre(Request $request){	
		//dd($request);	
		$idret=explode("_",$request->get('idret'));
		$compra=Retenciones::findOrFail($idret[0]);
		$compra->correlativo=$request->get('ncorre');
		$compra->update(); 		
			if($request->get('ajuste')=="on"){		
			$emp=Empresa::findOrFail(1);
			//dd($request->get('ncorre'));
			if($idret[1]==1){$emp->corre_iva=$request->get('ncorre'); }else{ $emp->corre_islr=$request->get('ncorre'); }
			$emp->update();
			}				
		return Redirect::to('retenciones');
	}
	public function verretencion($id)
	{	
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
		$data=explode("_",$id);
		if($data[1]==0){	
			$retencion=DB::table('retenciones as i')
			->join('retenc as rt','rt.codigo','=','i.retenc')
			->join('proveedores as p','p.idproveedor','=','i.idproveedor')
			->join('compras as in','in.idcompra','=','i.idcompra')
			->where('i.idretencion','=',$data[0])
			->first();}else{
			$retencion=DB::table('retenciones as i')
			->join('retenc as rt','rt.codigo','=','i.retenc')
			->join('proveedores as p','p.idproveedor','=','i.idproveedor')
			->join('gasto as in','in.idgasto','=','i.idgasto')
			->select('i.*','in.fecha as fecha_hora','p.nombre','p.rif','in.documento as num_comprobante','in.control as serie_comprobante','rt.ret','rt.afiva','rt.codtrib','rt.descrip','rt.sustraend')
			->where('i.idretencion','=',$data[0])
			->first();
			}
			return view('proveedores.retenciones.retencion',["empresa"=>$empresa,"retencion"=>$retencion]);		
	}
	public function destroyretencion(Request $request){
		$idret=explode("_",$request->get('idret'));
		$emp=empresa::findOrFail(1);
		if($idret[1]==1){$emp->corre_iva=$emp->corre_iva-1; }else{ $emp->corre_islr=$emp->corre_islr-1; }
		$emp->update();
			$compra=Retenciones::findOrFail($idret[0]);
			$compra->anulada=1;
			$compra->update(); 
			//dd($compra->idingreso."abajo");
		$auxg=$compra->idgasto;
		$auxi=$compra->idingreso;
		if($auxg>0){			
			$venta=Gastos::findOrFail($auxg);
			$venta->saldo=($venta->saldo+$compra->mretd);
			$venta->retenido=($venta->retenido-$compra->mretd);
			$venta->update();
		}
		if($auxi > 0){	
			$venta=Compras::findOrFail($auxi);
			$venta->saldo=($venta->saldo+$compra->mretd);
			$venta->retenido=($venta->retenido-$compra->mretd);
			$venta->update();
		}					
		return Redirect::to('retenciones');
		}
	public function cuentaspagar(Request $request)
	{
		$rol=DB::table('roles')-> select('rcxp')->where('iduser','=',$request->user()->id)->first();	
		if ($rol->rcxp==1){
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();		
			$compras=DB::table('compras as i')
			->join('proveedores as p','p.idproveedor','=','i.idproveedor')
			->select(DB::raw('sum(i.saldo) as acumulado'),'p.nombre','p.rif','p.telefono','p.direccion','p.contacto')
			->groupby('p.idproveedor')
			->where('i.saldo','>',0)
			->where('i.estatus','<>',"Anulada")
			->orderby('p.nombre','ASC')
			->get();
			
			$gastos=DB::table('gastos as g')
			->join('proveedores as p','p.idproveedor','=','g.idpersona')
			->select(DB::raw('sum(g.saldo) as acumulado'),'p.nombre','p.rif','p.telefono','p.direccion','p.contacto')
			->groupby('p.idproveedor')
			->where('g.saldo','>',0)
			->where('g.estatus','=',0)
			->get();
			return view('reportes.compras.pagar.index',["compras"=>$compras,"gastos"=>$gastos,"empresa"=>$empresa]);
			   } else { 
			return view("reportes.mensajes.noautorizado");
			}
	}
	public function pagos(Request $request)
    {   
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
		if ($request)
        {				
			$rol=DB::table('roles')-> select('rdetallec')->where('iduser','=',$request->user()->id)->first();	
			if ($rol->rdetallec==1){
			$corteHoy = date("Y-m-d");
            $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
            $query=trim($request->get('searchText'));
			if (($query)==""){$query=$corteHoy; }
             $query2=trim($request->get('searchText2'));
            $query2 = date_create($query2);  
            date_add($query2, date_interval_create_from_date_string('1 day'));
           $query2=date_format($query2, 'Y-m-d');
			$pagos=DB::table('comprobante as co')
			->join('compras','compras.idcompra','=','co.idcompra' )
			->join('proveedores as p','p.idproveedor','=','compras.idproveedor')
           -> select('p.nombre','co.referencia','compras.num_comprobante','co.idbanco','co.idpago','co.idrecibo','co.monto','co.recibido','co.fecha_comp as fecha','compras.user as vendedor')
			-> where('compras.estatus','=',0)
            -> whereBetween('co.fecha_comp', [$query, $query2])
            ->get();
			//dd($pagos);
			$gastos=DB::table('comprobante as co')
			->join('gastos','gastos.idgasto','=','co.idgasto' )
			->join('proveedores as p','p.idproveedor','=','gastos.idpersona')
           -> select('p.nombre','co.referencia','gastos.documento','co.idbanco','co.idpago','co.idrecibo','co.monto','co.recibido','co.fecha_comp as fecha','gastos.usuario as vendedor')
            -> whereBetween('co.fecha_comp', [$query, $query2])
            ->get();	
			$egresosnd=DB::table('comprobante as re')
			-> join('notasadmp as n','n.idnota','=','re.idnota')
			->join('proveedores  as p','p.idproveedor','=','n.idproveedor')
            -> select('p.nombre','re.referencia','n.idnota as tipo_comprobante','n.idnota as num_comprobante','re.idbanco','re.idrecibo','re.idpago','re.monto','re.recibido','re.fecha_comp as fecha','n.usuario as vendedor')
            -> whereBetween('re.fecha_comp', [$query, $query2])
			-> groupby('re.idrecibo')
            ->get();			
            $desglose=DB::table('comprobante')->select(DB::raw('sum(recibido) as recibido'),DB::raw('sum(monto) as monto'),'idbanco')
            -> whereBetween('fecha_comp', [$query, $query2])
            ->groupby('idpago','idbanco')
            ->get();
			//dd($desglose);
		   $query2=date("Y-m-d",strtotime($query2."- 1 days"));
			return view('reportes.compras.pagos.index',["egresosnd"=>$egresosnd,"comprobante"=>$desglose,"empresa"=>$empresa,"gastos"=>$gastos,"pagos"=>$pagos,"searchText"=>$query,"searchText2"=>$query2]);
			} else { 
	return view("reportes.mensajes.noautorizado");
	}
		}
	}
	public function comprasarticulo(Request $request)
    {
		$rol=DB::table('roles')-> select('rcompraarti')->where('iduser','=',$request->user()->id)->first();	
			if ($rol->rcompraarti==1){
        $corteHoy = date("Y-m-d");
        $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
             $query=trim($request->get('searchText'));
             $query2=trim($request->get('searchText2'));
             if (($query)==""){$query=$corteHoy; }
			$query2 = date_create($query2);
            date_add($query2, date_interval_create_from_date_string('1 day'));
            $query2=date_format($query2, 'Y-m-d');
            $datos=DB::table('detalle_compras as dv')            
             ->join ('articulos as a', 'a.idarticulo','=','dv.idarticulo') 
             ->join ('categoria as ca','ca.idcategoria','=','a.idcategoria')      
            -> select(DB::raw('avg(dv.precio_compra) as vpromedio'),DB::raw('avg(dv.subtotal) as subtotal'),DB::raw('sum(dv.cantidad) as vendido'),'a.nombre','a.idarticulo','ca.nombre as grupo')
            ->whereBetween('dv.fecha', [$query, $query2])
            ->groupby('dv.idarticulo')
			->OrderBy('a.nombre')
            ->get();
			$query2=date("Y-m-d",strtotime($query2."- 1 days"));
			return view('reportes.compras.comprasarticulo.index',["datos"=>$datos,"empresa"=>$empresa,"searchText"=>$query,"searchText2"=>$query2]);           
    } else { 
	return view("reportes.mensajes.noautorizado");
	}
		
	}
	
	public function libroc(Request $request)
    {
				$rol=DB::table('roles')-> select('rlcompras')->where('iduser','=',$request->user()->id)->first();	
			if ($rol->rlcompras==1){
        $corteHoy = date("Y-m-d");
        $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
             $query=trim($request->get('searchText'));
             $query2=trim($request->get('searchText2'));
             if (($query)==""){$query=$corteHoy; }
			$query2 = date_create($query2);
            date_add($query2, date_interval_create_from_date_string('1 day'));
            $query2=date_format($query2, 'Y-m-d');
            $datos=DB::table('compras as c')            
             ->join ('proveedores as p', 'p.idproveedor','=','c.idproveedor')      
            -> select('c.idcompra','c.emision as fecha','c.fecha_hora as recepcion','c.tipo_comprobante as tipo','c.serie_comprobante as factura','p.rif','p.nombre','c.num_comprobante as control','c.total','c.base','c.miva as iva','c.exento','c.tasa')
				->whereBetween('c.fecha_hora', [$query, $query2])
				->where('c.tipo_comprobante','=',"FAC")
				->where('c.estatus','=',"0")
			->OrderBy('c.fecha_hora','asc')
            ->get();
			//dd($datos);
			$retenc=DB::table('retenciones as rt')
			->join('retenc as tret','tret.codigo','=','rt.retenc')
			->select('rt.idcompra','rt.correlativo','rt.fecha','rt.mret','tret.ret','tret.afiva')            
            ->whereBetween('rt.fecha', [$query, $query2])
			->where('anulada','=',0)
			->OrderBy('rt.fecha','asc')
            ->get();
			$query2=date("Y-m-d",strtotime($query2."- 1 days"));
			return view('reportes.compras.libroc.index',["retenc"=>$retenc,"datos"=>$datos,"empresa"=>$empresa,"searchText"=>$query,"searchText2"=>$query2]);
            } else { 
	return view("reportes.mensajes.noautorizado");
	}
    }
	public function seriales(Request $request)
    {
		//dd($request);
		$rol=DB::table('roles')-> select('editserial','printcertificado')->where('iduser','=',$request->user()->id)->first();	
        $corteHoy = date("Y-m-d");
        $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
             $query=trim($request->get('searchText'));
             $query2=trim($request->get('searchText2'));
             if (($query)==""){$query=$corteHoy; }
			$query2 = date_create($query2);
            date_add($query2, date_interval_create_from_date_string('1 day'));
            $query2=date_format($query2, 'Y-m-d');
          
            $datos=DB::table('seriales as se') 
			 ->join ('compras as co', 'co.idcompra','=','se.idcompra')
			 ->join ('detalle_compras as dc', 'dc.idcompra','=','co.idcompra') 
             ->join ('articulos as a', 'a.idarticulo','=','dc.idarticulo')    			
             ->join ('proveedores as p', 'p.idproveedor','=','co.idproveedor')                            
            -> select('a.nombre as articulo','p.nombre as proveedor','co.num_comprobante','co.emision','se.*')
            ->whereBetween('co.emision', [$query, $query2])
			->where('co.estatus','=',0)
			->where('a.serial','=',1)
			->groupby('se.idserial','a.idarticulo')
			->OrderBy('a.nombre')
            ->get();
			$query2=date("Y-m-d",strtotime($query2."- 1 days"));
			return view('reportes.compras.seriales.index',["rol"=>$rol,"datos"=>$datos,"empresa"=>$empresa,"searchText"=>$query,"searchText2"=>$query2]);           
		
	}
	public function editserial(Request $request){	
		$compra=Seriales::findOrFail($request->get('id'));
		$compra->chasis=$request->get('chasis');
		$compra->motor=$request->get('motor');
		$compra->placa=$request->get('placa');
		$compra->color=$request->get('color');
		$compra->año=$request->get('ano');
		$compra->update(); 		
			
		return Redirect::to('repseriales');		
	}
	
	public function certificado($id){	
			 $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			$serial=Seriales::findOrFail($id);
			$venta=Ventas::findOrFail($serial->idventa);	
			$forma=DB::table('formalibre')-> where('idventa','=',$venta->idventa)->first();	
			if($forma != NULL){ $documento= $forma->idforma;
			}else{  $documento= $venta->idventa; }			
			$cliente=Clientes::findOrFail($venta->idcliente);											
		return view('reportes.compras.seriales.certificado',["cliente"=>$cliente,"documento"=>$documento,"venta"=>$venta,"empresa"=>$empresa]);           
	}
}
