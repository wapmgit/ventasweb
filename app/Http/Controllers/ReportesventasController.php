<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use DB;
use Auth;

class ReportesventasController extends Controller
{
  public function __construct()
	{
		$this->middleware('auth');
	}
    public function ventas(Request $request)
    {
		$rol=DB::table('roles')-> select('rventas')->where('iduser','=',$request->user()->id)->first();	
		if ($rol->rventas==1){
        if ($request)
        {
			$vendedores=DB::table('vendedores')->get();    
			$rutas=DB::table('rutas')->get();    
			$corteHoy = date("Y-m-d");
            $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
            $query=trim($request->get('searchText'));
            $vende=trim($request->get('vendedor'));
            $ruta=trim($request->get('ruta'));
	
			if (($query)==""){$query=$corteHoy; }
             $query2=trim($request->get('searchText2'));
            $query2 = date_create($query2);  
	
            date_add($query2, date_interval_create_from_date_string('1 day'));
            $query2=date_format($query2, 'Y-m-d');
         //datos venta
		if(($vende=="")or($vende==0))	{$c=">";$v=0;	$filtro="Todos los Vendedores"; 
						}else{ $c="=";$v=$request->get('vendedor'); $busca=DB::table('vendedores')->select('nombre')-> where('id_vendedor','=',$request->get('vendedor'))->first(); $filtro="Vendedor: ".$busca->nombre;}
		if(($ruta=="")or($ruta==0))	{$cr=">";$r=0;	$filtro=$filtro.", Todas las Rutas";
						}else{ $cr="=";$r=$request->get('ruta');  $busca=DB::table('rutas')->select('nombre')-> where('idruta','=',$request->get('ruta'))->first(); $filtro=$filtro.", ".$busca->nombre;}
         if($request->get('vendedor')==0){
            $datos=DB::table('venta as v')
			-> join('clientes as c','v.idcliente','=','c.id_cliente')
			-> join ('vendedores as ven','ven.id_vendedor','=','v.idvendedor')
			->select('v.idventa','c.nombre','v.tipo_comprobante','v.num_comprobante','v.estado','v.total_venta','v.fecha_hora','v.fecha_emi','v.saldo','v.devolu','ven.nombre as vendedor','v.user')
			-> where ('v.idvendedor',$c,$v)
			-> where ('c.ruta',$cr,$r)
			-> whereBetween('v.fecha_hora', [$query, $query2])
			-> groupby('v.idventa')
            ->get();
			//dd($datos);	
			// pagos
			$pagos=DB::table('recibos as re')
			->join('venta as v','v.idventa','=','re.idventa')
			->join('clientes as cli','cli.id_cliente','=','v.idcliente')
			->join('monedas as mo','mo.idmoneda','=','re.idpago')
			-> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco','re.idpago')
			->where('re.monto','>',0)
			->where('v.devolu','=',0)
			-> where ('v.idvendedor',$c,$v)
			-> where ('cli.ruta',$cr,$r)
            -> whereBetween('re.fecha', [$query, $query2])
			-> groupby('re.idpago','re.idbanco')
            ->get();
			//datos devolucion     
             $devolucion=DB::table('venta as d')
			 ->join('vendedores as ve','ve.id_vendedor','=','d.idvendedor')
			->join('clientes as cli','cli.id_cliente','=','d.idcliente')
            -> select(DB::raw('sum(d.total_venta) as totaldev'))
			->where('d.devolu','=',1)
			-> where ('d.idvendedor',$c,$v)
			-> where ('cli.ruta',$cr,$r)
            ->whereBetween('d.fecha_hora', [$query, $query2])
            ->get();
		// dd($devolucion);   
		//de los recibos
			$recibos=DB::table('recibos as re')
			->join('venta as v','v.idventa','=','re.idventa')
			->join('monedas as mo','mo.idmoneda','=','re.idpago')
			-> select('re.monto','re.recibido','re.idbanco','re.idpago','re.idventa')
			->where('re.monto','>',0)
			->where('v.devolu','=',0)
			-> where ('v.idvendedor',$c,$v)
            -> whereBetween('re.fecha', [$query, $query2])
            ->get();
			//dd($recibos);
		 }else{
			 
			$datos=DB::table('venta as v')
			-> join('clientes as c','v.idcliente','=','c.id_cliente')
			-> join ('vendedores as ven','ven.id_vendedor','=','c.vendedor')
			->select('v.idventa','c.nombre','v.tipo_comprobante','v.num_comprobante','v.estado','v.total_venta','v.fecha_hora','v.fecha_emi','v.saldo','v.devolu','ven.nombre as vendedor','v.user')
			-> where ('v.idvendedor',$c,$v)
			-> where ('c.ruta',$cr,$r)
			-> whereBetween('v.fecha_hora', [$query, $query2])
			-> groupby('v.idventa')
            ->get(); 
		
			$pagos=DB::table('recibos as re')
			->join('venta as v','v.idventa','=','re.idventa')
			->join('clientes as cli','cli.id_cliente','=','v.idcliente')
			->join('vendedores as ve','ve.id_vendedor','=','cli.vendedor')
			-> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco','re.idpago')
			-> where ('v.idvendedor',$c,$v)
			-> where ('cli.ruta',$cr,$r)
			->where('re.monto','>',0)
			->where('v.devolu','=',0)
            -> whereBetween('re.fecha', [$query, $query2])
			-> groupby('re.idpago','re.idbanco')
            ->get(); 	
			$recibos=DB::table('recibos as re')
			->join('venta as v','v.idventa','=','re.idventa')
			->join('monedas as mo','mo.idmoneda','=','re.idpago')
			-> select('re.monto','re.recibido','re.idbanco','re.idpago','re.idventa')
			->where('re.monto','>',0)
			->where('v.devolu','=',0)
			-> where ('v.idvendedor',$c,$v)
            -> whereBetween('re.fecha', [$query, $query2])
            ->get();			
		//dd($pagos);	
			$devolucion=DB::table('venta as d')
			->join('vendedores as ve','ve.id_vendedor','=','d.idvendedor')
			->join('clientes as cli','cli.id_cliente','=','d.idcliente')
            -> select(DB::raw('sum(d.total_venta) as totaldev'))
			->where('d.devolu','=',1)
			-> where ('d.idvendedor',$c,$v)
			-> where ('cli.ruta',$cr,$r)
            ->whereBetween('d.fecha_hora', [$query, $query2])
            ->get();
		 }
			$query2=date("Y-m-d",strtotime($query2."- 1 days"));
			return view('reportes.ventas.ventas.index',["recibos"=>$recibos,"filtro"=>$filtro,"rutas"=>$rutas,"datos"=>$datos,"devolucion"=>$devolucion,"empresa"=>$empresa,"pagos"=>$pagos,"vendedores"=>$vendedores,"searchText"=>$query,"searchText2"=>$query2]);
       
		} 
		}
		else { 
	return view("reportes.mensajes.noautorizado");
	}
		
	}
	public function corte(Request $request)
    {   
	//dd($request);
	$rol=DB::table('roles')-> select('ccaja')->where('iduser','=',$request->user()->id)->first();	
		if ($rol->ccaja==1){
        $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
		$usuario=DB::table('users')->get();
		//dd($request->get('usuario'));
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
		  $user=$request->get('usuario');
		 // dd($user);
		 //datos v
		    if($request->get('usuario') == NULL){
			$filtro="Todas las Cajas";
            $datos=DB::table('venta as v')										
			-> whereBetween('v.fecha_hora', [$query, $query2])
			-> groupby('v.idventa')
            ->get();
				//dd($corteHoy);     
				//ventas impuestos
			$impuestos=DB::table('detalle_venta as dv')
			-> join('venta as ve','ve.idventa','=','dv.idventa')
			-> join('articulos as art','art.idarticulo','=','dv.idarticulo')
			-> select(DB::raw(('sum(((dv.precio_venta*dv.cantidad)/((art.iva/100)+1))) as gravado')),'art.iva',DB::raw('sum(dv.precio_venta*dv.cantidad) as montoventa'))
			-> whereBetween('dv.fecha', [$query, $query2])
			->where('ve.devolu','=',0)
			-> groupby('art.iva')
			->get();
		//dd($impuestos);
        //datos devolucion     
             $devolucion=DB::table('notasadm as d')
            -> select(DB::raw('sum(monto) as totaldev'))
			->where('pordevolucion','=',1)
            ->whereBetween('fecha', [$query, $query2])
            ->get();
			//dd($devolucion);
			//cobros directos
			$pagos=DB::table('recibos as re')
			-> join('venta as v','v.idventa','=','re.idventa')
			-> select('re.idpago','re.idbanco',DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'))
            -> whereBetween('re.fecha', [$query, $query2])
			-> where ('re.tiporecibo','=',"P")
			->where('v.devolu','=',0)
			-> groupby('re.idpago','idbanco')
            ->get();
			//  
			$cobranza=DB::table('recibos as re')
			-> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco')
            -> whereBetween('re.fecha', [$query, $query2])
			-> where ('re.tiporecibo','=',"A")
			-> groupby('re.idpago','re.idbanco')
            ->get();
			$cobranzant=DB::table('recibos as re')
			-> select('re.recibido','re.monto',DB::raw('DATEDIFF(re.fecha,re.fecharecibo) as dif'))
            -> whereBetween('re.fecha', [$query, $query2])
			-> where ('re.tiporecibo','=',"A")
            ->get();
			//dd($cobranzant);
			$papartado=DB::table('recibos as re')
			-> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco')
            -> whereBetween('re.fecha', [$query, $query2])
			-> where ('re.tiporecibo','=',"AP")
			-> groupby('re.idpago','re.idbanco')
            ->get();
			$ingresos=DB::table('recibos as re')
			 -> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco')
            -> whereBetween('re.fecha', [$query, $query2])
			-> groupby('re.idpago','re.idbanco')
            ->get();	
			//	dd($cobranza); 
			$comisiones=DB::table('reciboscomision as re')
			-> select(DB::raw('sum(re.monto) as monto'))
            -> whereBetween('re.fecha', [$query, $query2])
            ->first();
			//dd($comisiones);
			
			$ingresosnd=DB::table('mov_notas as n')
			->join('venta','venta.idventa','=','n.iddoc')
            -> select(DB::raw('sum(n.monto) as recibido'))
            -> whereBetween('n.fecha', [$query, $query2])
			-> groupby('n.tipodoc')
            ->first();
			//$query2=date("Y-m-d",strtotime($query2."- 1 days"));
				  } else {
			$filtro=$request->get('usuario');
		    $datos=DB::table('venta as v')
			-> whereBetween('v.fecha_hora', [$query, $query2])
			-> where ('user','=',$user)
			-> groupby('v.idventa')
            ->get();
			//dd($datos);
			//ventas impuestos
			$impuestos=DB::table('detalle_venta as dv')
			-> join('articulos as art','dv.idarticulo','=','art.idarticulo')
			-> join('venta as v','dv.idventa','=','v.idventa')
			-> select(DB::raw(('sum(((dv.precio_venta*dv.cantidad)/((art.iva/100)+1))) as gravado')),'art.iva',DB::raw('sum(dv.precio_venta*dv.cantidad) as montoventa'))
			-> where ('v.user','=',$user)
			->where('v.devolu','=',0)
			-> whereBetween('dv.fecha', [$query, $query2])
			-> groupby('art.iva')
			->get();
			//
			//datos devolucion     
			$devolucion=DB::table('notasadm as d')
            -> select(DB::raw('sum(monto) as totaldev'))
			->where('pordevolucion','=',1)
		    -> where ('usuario','=',$user)
            ->whereBetween('d.fecha', [$query, $query2])
            ->get();
			//dd($devolucion);
			//cobros directos
			$pagos=DB::table('recibos as re')
			-> join('venta as v','v.idventa','=','re.idventa')
            -> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco','re.idpago')
			-> where ('v.user','=',$user)
            -> whereBetween('re.fecha', [$query, $query2])
			-> where ('re.tiporecibo','=',"P")
			-> groupby('re.idpago','re.idbanco')
            ->get();
			//apartados
			
      // dd($query);   
			$cobranza=DB::table('recibos as re')
            -> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco','re.idpago')
			-> where ('re.usuario','=',$user)
            -> whereBetween('re.fecha', [$query, $query2])
			-> where ('re.tiporecibo','=',"A")
			-> groupby('re.idpago','re.idbanco')
            ->get();
			$cobranzant=DB::table('recibos as re')
			-> select('re.recibido','re.monto',DB::raw('DATEDIFF(re.fecha,re.fecharecibo) as dif'))
            -> where ('re.usuario','=',$user)
			-> whereBetween('re.fecha', [$query, $query2])
			-> where ('re.tiporecibo','=',"A")
            ->get();
			$papartado=DB::table('recibos as re')
            -> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco','re.idpago')
			-> where ('re.usuario','=',$user)
            -> whereBetween('re.fecha', [$query, $query2])
			-> where ('re.tiporecibo','=',"AP")
			-> groupby('re.idpago','re.idbanco')
            ->get();
		    $ingresos=DB::table('recibos as re')			
            -> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco','re.idpago')
			-> where ('re.usuario','=',$user)
            -> whereBetween('re.fecha', [$query, $query2])
			-> groupby('re.idpago','re.idbanco')
            ->get();

			$comisiones=DB::table('reciboscomision as re')
			-> select(DB::raw('sum(re.monto) as monto'))
			-> where ('re.user','=',$user)
            -> whereBetween('re.fecha', [$query, $query2])
            ->first();
			$ingresosnd=DB::table('mov_notas as n')
            -> select(DB::raw('sum(n.monto) as recibido'))
			->where('n.tipodoc','=',"FAC")
			-> where ('n.user','=',$user)
            -> whereBetween('n.fecha', [$query, $query2])
			-> groupby('n.tipodoc')
            ->first();
			//dd($ingresosnd);	  
				  }
	  if($request->get('usuario') == "0"){
			$filtro="Todas las Cajas";
            $datos=DB::table('venta as v')										
			-> whereBetween('v.fecha_hora', [$query, $query2])
			-> groupby('v.idventa')
            ->get();
			//	dd($datos);     
				//ventas impuestos
			$impuestos=DB::table('detalle_venta as dv')
			-> join('venta as ve','ve.idventa','=','dv.idventa')
			-> join('articulos as art','art.idarticulo','=','dv.idarticulo')
			-> select(DB::raw(('sum(((dv.precio_venta*dv.cantidad)/((art.iva/100)+1))) as gravado')),'art.iva',DB::raw('sum(dv.precio_venta*dv.cantidad) as montoventa'))
			-> whereBetween('dv.fecha', [$query, $query2])
			->where('ve.devolu','=',0)
			-> groupby('art.iva')
			->get();
		//dd($impuestos);
        //datos devolucion     
             $devolucion=DB::table('notasadm as d')
            -> select(DB::raw('sum(monto) as totaldev'))
			->where('pordevolucion','=',1)
            ->whereBetween('fecha', [$query, $query2])
            ->get();
			//dd($devolucion);
			//cobros directos
			$pagos=DB::table('recibos as re')
			-> join('venta as v','v.idventa','=','re.idventa')
			-> select('re.idpago','re.idbanco',DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'))
            -> whereBetween('re.fecha', [$query, $query2])
			-> where ('re.tiporecibo','=',"P")
			->where('v.devolu','=',0)
			-> groupby('re.idpago','idbanco')
            ->get();
			//  
			$cobranza=DB::table('recibos as re')
			-> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco')
            -> whereBetween('re.fecha', [$query, $query2])
			-> where ('re.tiporecibo','=',"A")
			-> groupby('re.idpago','re.idbanco')
            ->get();
			$cobranzant=DB::table('recibos as re')
			-> select('re.recibido','re.monto',DB::raw('DATEDIFF(re.fecha,re.fecharecibo) as dif'))
			-> whereBetween('re.fecha', [$query, $query2])
			-> where ('re.tiporecibo','=',"A")
            ->get();
			$papartado=DB::table('recibos as re')
			-> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco')
            -> whereBetween('re.fecha', [$query, $query2])
			-> where ('re.tiporecibo','=',"AP")
			-> groupby('re.idpago','re.idbanco')
            ->get();
			$ingresos=DB::table('recibos as re')
			 -> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco')
            -> whereBetween('re.fecha', [$query, $query2])
			-> groupby('re.idpago','re.idbanco')
            ->get();	
				//dd($cobranza); 
			$comisiones=DB::table('reciboscomision as re')
			-> select(DB::raw('sum(re.monto) as monto'))
            -> whereBetween('re.fecha', [$query, $query2])
            ->first();
			//dd($comisiones);
			
			$ingresosnd=DB::table('mov_notas as n')
			->join('venta','venta.idventa','=','n.iddoc')
            -> select(DB::raw('sum(n.monto) as recibido'))
            -> whereBetween('n.fecha', [$query, $query2])
			-> groupby('n.tipodoc')
            ->first();
			
				  }		
				  $query2=date("Y-m-d",strtotime($query2."- 1 days"));	  
		} }else { 
	return view("reportes.mensajes.noautorizado");
	}

        return view('reportes.ventas.corte.index',["cobranzant"=>$cobranzant,"papartado"=>$papartado,"filtro"=>$filtro,"datos"=>$datos,"devolucion"=>$devolucion,"impuestos"=>$impuestos,"comision"=>$comisiones,"empresa"=>$empresa,"ingresos"=>$ingresos,"cobranza"=>$cobranza,"pagos"=>$pagos,"searchText"=>$query,"searchText2"=>$query2,"usuario"=>$usuario,"ingresosnd"=>$ingresosnd]);    
  }
  	public function cobranza(Request $request)
    {   

        $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
      if ($request)
        {	
		$rol=DB::table('roles')-> select('rdetallei','anularrv')->where('iduser','=',$request->user()->id)->first();	
		if ($rol->rdetallei==1){
			$corteHoy = date("Y-m-d");
            $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
            $query=trim($request->get('searchText'));
			if (($query)==""){$query=$corteHoy; }
             $query2=trim($request->get('searchText2'));
           $query2 = date_create($query2);  
	
            date_add($query2, date_interval_create_from_date_string('1 day'));
           $query2=date_format($query2, 'Y-m-d');
		   $vendedores=DB::table('vendedores')->get();         
		   if($request->get('vendedor')==0){
			$cobranza=DB::table('recibos as re')
			->join('venta','venta.idventa','=','re.idventa' )
			->join('clientes','clientes.id_cliente','=','venta.idcliente')
			->join('vendedores as vende','vende.id_vendedor','=','clientes.vendedor')
			-> select('clientes.nombre','re.referencia','re.tiporecibo','venta.tipo_comprobante','venta.num_comprobante','re.idbanco','re.idpago','re.idrecibo','re.monto','re.recibido','re.fecha','re.fecharecibo','vende.nombre as vendedor')    
			-> where('venta.devolu','=',0)
            -> whereBetween('re.fecha', [$query, $query2])
			-> groupby('re.idrecibo','re.idbanco')
            ->get();
		//	dd($cobranza);
            $comprobante=DB::table('recibos')
			->join('venta','venta.idventa','=','recibos.idventa' )
            -> select(DB::raw('sum(recibido) as mrecibido'),DB::raw('sum(monto) as mmonto'),'idbanco','tiporecibo')        
            -> where('venta.devolu','=',0)
			-> whereBetween('fecha', [$query, $query2])
            ->groupby('idpago','idbanco','tiporecibo')
            ->get();
		   	//
			$ingresosnd=DB::table('recibos as re')
			-> join('notasadm as n','n.idnota','=','re.idnota')
			->join('clientes','clientes.id_cliente','=','n.idcliente')
            -> select('clientes.nombre','re.referencia','re.tiporecibo','n.idnota as tipo_comprobante','n.idnota as num_comprobante','re.idbanco','re.idrecibo','re.idpago','re.monto','re.recibido','re.fecha','re.fecharecibo','n.usuario as vendedor')
            -> whereBetween('re.fecha', [$query, $query2])
			-> groupby('re.idrecibo')
            ->get();
			$recibonc=DB::table('mov_notas as mov')-> whereBetween('mov.fecha', [$query, $query2])
            ->get();
			$apartado=DB::table('recibos as re')
			->join('apartado','apartado.idventa','=','re.idapartado' )
			->join('clientes','clientes.id_cliente','=','apartado.idcliente')
			->join('vendedores as vende','vende.id_vendedor','=','clientes.vendedor')
			-> select('clientes.nombre','re.referencia','re.tiporecibo','apartado.tipo_comprobante','apartado.num_comprobante','re.idbanco','re.idpago','re.idrecibo','re.monto','re.recibido','re.fecha','re.fecharecibo','vende.nombre as vendedor')    
			-> where('apartado.devolu','=',0)
            -> whereBetween('re.fecha', [$query, $query2])
			-> groupby('re.idrecibo','re.idbanco')
            ->get();
			   }else{
				   $cobranza=DB::table('recibos as re')
				->join('venta','venta.idventa','=','re.idventa' )
				->join('clientes','clientes.id_cliente','=','venta.idcliente')
				->join('vendedores as vende','vende.id_vendedor','=','clientes.vendedor')
			 -> select('clientes.nombre','re.referencia','re.tiporecibo','venta.tipo_comprobante','venta.num_comprobante','re.idbanco','re.idrecibo','re.idpago','re.monto','re.recibido','re.fecha','re.fecharecibo','vende.nombre as vendedor')
				->where('clientes.vendedor','=',$request->get('vendedor'))  
				-> where('venta.devolu','=',0)
				-> whereBetween('re.fecha', [$query, $query2])
				-> groupby('re.idrecibo')
				->get();
				$comprobante=DB::table('recibos as re')
				->join('venta','venta.idventa','=','re.idventa' )
				->join('clientes','clientes.id_cliente','=','venta.idcliente')
				->join('vendedores as vende','vende.id_vendedor','=','clientes.vendedor')
				-> select(DB::raw('sum(recibido) as mrecibido'),DB::raw('sum(monto) as mmonto'),'idbanco','tiporecibo')
				->where('clientes.vendedor','=',$request->get('vendedor'))    
				-> where('venta.devolu','=',0)				
				-> whereBetween('re.fecha', [$query, $query2])
				->groupby('re.idpago','idbanco','tiporecibo')
				->get();
				$ingresosnd=DB::table('recibos as re')
				-> join('notasadm as n','n.idnota','=','re.idnota')
				->join('clientes','clientes.id_cliente','=','n.idcliente')
				-> select('clientes.nombre','re.referencia','re.tiporecibo','n.idnota as tipo_comprobante','n.idnota as num_comprobante','re.idbanco','re.idrecibo','re.idpago','re.monto','re.recibido','re.fecha','re.fecharecibo','n.usuario as vendedor')
				-> whereBetween('re.fecha', [$query, $query2])
				-> groupby('re.idrecibo')
				->get();
				$recibonc=DB::table('mov_notas as mov')-> whereBetween('mov.fecha', [$query, $query2])
				->get();
				 $apartado=DB::table('recibos as re')
				->join('apartado','apartado.idventa','=','re.idapartado' )
				->join('clientes','clientes.id_cliente','=','apartado.idcliente')
				->join('vendedores as vende','vende.id_vendedor','=','clientes.vendedor')
			 -> select('clientes.nombre','re.referencia','re.tiporecibo','apartado.tipo_comprobante','apartado.num_comprobante','re.idbanco','re.idrecibo','re.idpago','re.monto','re.recibido','re.fecha','re.fecharecibo','vende.nombre as vendedor')
				->where('clientes.vendedor','=',$request->get('vendedor'))  
				-> where('apartado.devolu','=',0)
				-> whereBetween('re.fecha', [$query, $query2])
				-> groupby('re.idrecibo')
				->get();
			   }
		   $query2=date("Y-m-d",strtotime($query2."- 1 days"));
			return view('reportes.ventas.cobranza.index',["rol"=>$rol,"apartado"=>$apartado,"comprobante"=>$comprobante,"vendedores"=>$vendedores,"empresa"=>$empresa,"cobranza"=>$cobranza,"searchText"=>$query,"searchText2"=>$query2,"ingresosnd"=>$ingresosnd,"recibonc"=>$recibonc]);
			   } else { 
			return view("reportes.mensajes.noautorizado");
			}
		}
			
	}
	public function cuentascobrar(Request $request)	
	{
			$rol=DB::table('roles')-> select('rcxc')->where('iduser','=',$request->user()->id)->first();	
		if ($rol->rcxc==1){
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();		
		$vendedores=DB::table('vendedores')->get();  
		$rutas=DB::table('rutas')->get();  
			if($request->get('vendedor')==NULL){
			$clientes=DB::table('venta as v')
			->join('clientes as c','c.id_cliente','=','v.idcliente')
			->join('vendedores as ve','ve.id_vendedor','=','v.idvendedor')
			->select(DB::raw('sum(v.saldo) as acumulado'),'c.nombre','c.cedula','c.telefono','c.id_cliente')
			->where('v.saldo','>',0)
			->where('v.devolu','=',0)
			->groupby('c.id_cliente')
			->orderby('c.nombre','ASC')
			->get(); 
	
			$q2=DB::table('notasadm as n')
			->join('clientes as c','c.id_cliente','=','n.idcliente')
			->select(DB::raw('sum(n.pendiente) as acumulado'),'c.nombre','c.cedula','c.telefono','c.id_cliente')
			->where('n.tipo','=',1)->where('n.pendiente','>',0)
			->groupby('n.idcliente')
			->get(); 
			$filtro="Todos los vendedores, Todas las rutas.";
			$vendedor="";
			}else{
				if($request->get('ruta')==0){
				$vendedor=DB::table('vendedores')->where('id_vendedor','=',$request->get('vendedor'))->select('nombre')->first();
				$filtro=$vendedor->nombre." Todas las Rutas";
				$c=">";$v=0;
				}else{ 
				$vendedor=DB::table('vendedores')->where('id_vendedor','=',$request->get('vendedor'))->select('nombre')->first();
				$ruta=DB::table('rutas')->where('idruta','=',$request->get('ruta'))->select('nombre')->first();
				$filtro=$vendedor->nombre." Ruta ".$ruta->nombre;
				$c="=";$v=$request->get('ruta');}	
			$clientes=DB::table('venta as v')
			->join('clientes as c','c.id_cliente','=','v.idcliente')
			->join('vendedores as ve','ve.id_vendedor','=','v.idvendedor')
			->select(DB::raw('sum(v.saldo) as acumulado'),'c.nombre','c.cedula','c.telefono','c.id_cliente')
			->where('v.idvendedor','=',$request->get('vendedor'))
			-> where ('c.ruta',$c,$v)
			->where('v.saldo','>',0)
			->where('v.devolu','=',0)
			->groupby('c.id_cliente')
			->orderby('c.nombre','ASC')	
			->get();
					
		$q2=DB::table('notasadm as n')
			->join('clientes as c','c.id_cliente','=','n.idcliente')
			->select(DB::raw('sum(n.pendiente) as acumulado'),'c.nombre','c.cedula','c.telefono','c.id_cliente')
			->where('c.vendedor','=',$request->get('vendedor'))
			-> where ('c.ruta',$c,$v)
			->where('n.tipo','=',1)->where('n.pendiente','>',0)
			->groupby('n.idcliente')
			->get(); 
			//dd($clientes);
			
			}
			
			return view('reportes.ventas.cobrar.index',["filtro"=>$filtro,"rutas"=>$rutas,"vendedor"=>$vendedor,"notas"=>$q2,"pacientes"=>$clientes,"vendedores"=>$vendedores,"empresa"=>$empresa]);
			   } else { 
			return view("reportes.mensajes.noautorizado");
			}
	}
	
		public function cuentascobrarv()
		{
			$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			$ventas=DB::table('venta as v')
			->join('vendedores as ve','ve.id_vendedor','=','v.idvendedor')
			->select(DB::raw('SUM(v.saldo) as acumulado'),'v.idvendedor','ve.nombre','ve.cedula','ve.telefono')
			->groupby('v.idvendedor','ve.nombre','ve.cedula','ve.telefono')
			->where('v.saldo','>',0)
			->where('v.devolu','=',0)
			->paginate(10);
			$notasnd=DB::table('notasadm as not')
			->join('clientes as c','c.id_cliente','=','not.idcliente')
			->select(DB::raw('SUM(not.pendiente) as tnotas'),'not.tipo','c.vendedor')
			->where('not.tipo','=',1)
			->where('not.pendiente','>',0)		
			->groupby('c.vendedor','not.tipo')
			->get();
			//dd($ventas);
			return view('vendedor.cobrar.index',["notasnd"=>$notasnd,"ventas"=>$ventas,"empresa"=>$empresa]);	
		}
	public function utilidad(Request $request)
    {   
		$rol=DB::table('roles')-> select('rutilventa')->where('iduser','=',$request->user()->id)->first();	
		if ($rol->rutilventa==1){
        $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
			if ($request)
			{
			$corteHoy = date("Y-m-d");
            $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
            $query=trim($request->get('searchText'));
             $query2=trim($request->get('searchText2'));
            $query2 = date_create($query2);
			if (($query)==""){$query=$corteHoy; }
            date_add($query2, date_interval_create_from_date_string('1 day'));
            $query2=date_format($query2, 'Y-m-d');
			//datos venta
		    $resumen=($request->get('check'));    
				if ($resumen=="on"){    
				$datos=DB::table('venta as v')
				-> join('detalle_venta as dv','v.idventa','=','dv.idventa')
				-> select('v.tipo_comprobante','v.serie_comprobante','v.num_comprobante',DB::raw('avg(dv.costoarticulo) as costo'),DB::raw('avg(dv.precio) as precio'),DB::raw('avg(dv.precio_venta) as precio_venta'),DB::raw('sum(dv.cantidad) as cantidad'),DB::raw('sum(dv.cantidad*dv.costoarticulo) as costoneto'),DB::raw('sum(dv.cantidad*dv.precio_venta)as ventaneta'),DB::raw('sum(dv.cantidad*dv.precio) as ventad'))
				->where('v.devolu','=',0)
				-> whereBetween('dv.fecha_emi', [$query, $query2])
				-> Groupby('dv.idventa')      
				->get();
				//dd($datos);
				}else{
				$datos=DB::table('venta as v')
				-> join('detalle_venta as dv','v.idventa','=','dv.idventa')
				-> join('articulos as a','dv.idarticulo','=','a.idarticulo')
				-> select('v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.total_venta','v.fecha_hora','a.idarticulo','dv.cantidad as cantidad','a.costo','a.iva','dv.precio','dv.precio_venta',DB::raw('(dv.cantidad * dv.costoarticulo) as costoneto'),DB::raw('(dv.cantidad*dv.precio_venta)as ventaneta'),DB::raw('(dv.cantidad*dv.precio)as ventad'))  
				->where('v.devolu','=',0)
				-> whereBetween('v.fecha_hora', [$query, $query2])
				->get();
				}
             $devolucion=DB::table('devolucion as d')
            -> join('recibos as r','r.idventa','=','d.idventa')
            -> select(DB::raw('sum(r.aux) as totaldev'))
            ->whereBetween('d.fecha_hora', [$query, $query2])
            ->get();
			//dd($devolucion);   
			$query2=date("Y-m-d",strtotime($query2."- 1 days"));
			return view('reportes.ventas.utilidad.index',["datos"=>$datos,"devolucion"=>$devolucion,"empresa"=>$empresa,"searchText"=>$query,"searchText2"=>$query2]);  
		}   
		}
		else { 
	return view("reportes.mensajes.noautorizado");
	}		
    }
	public function ventasarticulo(Request $request)
    {
		$rol=DB::table('roles')-> select('rventasarti')->where('iduser','=',$request->user()->id)->first();	
		if ($rol->rventasarti==1){
		$vendedores=DB::table('vendedores')->get();  
		$clientes=DB::table('clientes')->get();  
		$rutas=DB::table('rutas')->get();  
        $corteHoy = date("Y-m-d");
        $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
             $query=trim($request->get('searchText'));
             $query2=trim($request->get('searchText2'));
             if (($query)==""){$query=$corteHoy; }
			$query2 = date_create($query2);
            date_add($query2, date_interval_create_from_date_string('1 day'));
            $query2=date_format($query2, 'Y-m-d');
            $datos=DB::table('detalle_venta as dv') 
			->join ('venta as ve', 've.idventa','=','dv.idventa') 			
             ->join ('articulos as a', 'a.idarticulo','=','dv.idarticulo') 
             ->join ('categoria as ca','ca.idcategoria','=','a.idcategoria')      
            -> select(DB::raw('avg(dv.precio_venta) as vpromedio'),DB::raw('sum(dv.cantidad) as vendido'),'a.nombre','a.precio1 as pventa','a.idarticulo','ca.nombre as grupo')
            ->whereBetween('dv.fecha', [$query, $query2])
            ->where('ve.devolu','=',0)
			->groupby('dv.idarticulo','a.nombre')
			->OrderBy('a.nombre')
            ->get();
		
			$nvendedor="";
		if($request->get('opcion')>0){	
			if($request->get('opcion')==1){		
			$vende=DB::table('vendedores')->where('id_vendedor','=',$request->get('vendedor'))->first();  
			$nvendedor=$vende->nombre;
			$datos=DB::table('detalle_venta as dv')            
             ->join ('venta as ve', 've.idventa','=','dv.idventa') 
             ->join ('articulos as a', 'a.idarticulo','=','dv.idarticulo') 
             ->join ('categoria as ca','ca.idcategoria','=','a.idcategoria')      
            -> select(DB::raw('avg(dv.precio_venta) as vpromedio'),DB::raw('sum(dv.cantidad) as vendido'),'a.nombre','a.precio1 as pventa','a.idarticulo','ca.nombre as grupo')
			->where('ve.idvendedor','=',$request->get('vendedor'))
			->where('ve.devolu','=',0)
            ->whereBetween('dv.fecha', [$query, $query2])
            ->groupby('dv.idarticulo','a.nombre')
			->OrderBy('a.nombre')
            ->get();	
			}
		if($request->get('opcion')==2){
				$cli=DB::table('clientes')->where('id_cliente','=',$request->get('cliente'))->first();
				$nvendedor=$cli->nombre;
			$datos=DB::table('detalle_venta as dv')            
             ->join ('venta as ve', 've.idventa','=','dv.idventa') 
             ->join ('articulos as a', 'a.idarticulo','=','dv.idarticulo') 
             ->join ('categoria as ca','ca.idcategoria','=','a.idcategoria')      
            -> select(DB::raw('avg(dv.precio_venta) as vpromedio'),DB::raw('sum(dv.cantidad) as vendido'),'a.nombre','a.precio1 as pventa','a.idarticulo','ca.nombre as grupo')
			->where('ve.idcliente','=',$request->get('cliente'))
			->where('ve.devolu','=',0)
            ->whereBetween('dv.fecha', [$query, $query2])
            ->groupby('dv.idarticulo','a.nombre')
			->OrderBy('a.nombre')
            ->get();	
			}
			if($request->get('opcion')==3){
				$vende=DB::table('vendedores')->where('id_vendedor','=',$request->get('vendedorr'))->first();  
				$ru=DB::table('rutas')->where('idruta','=',$request->get('ruta'))->first();
				$nvendedor=$vende->nombre. " ".$ru->nombre;
			$datos=DB::table('detalle_venta as dv')            
             ->join ('venta as ve', 've.idventa','=','dv.idventa') 
			->join ('clientes as cli', 'cli.id_cliente','=','ve.idcliente') 
             ->join ('articulos as a', 'a.idarticulo','=','dv.idarticulo') 
             ->join ('categoria as ca','ca.idcategoria','=','a.idcategoria')      
            -> select(DB::raw('avg(dv.precio_venta) as vpromedio'),DB::raw('sum(dv.cantidad) as vendido'),'a.nombre','a.precio1 as pventa','a.idarticulo','ca.nombre as grupo')
			->where('ve.idvendedor','=',$request->get('vendedorr'))
			->where('cli.ruta','=',$request->get('ruta'))
			->where('ve.devolu','=',0)
            ->whereBetween('dv.fecha', [$query, $query2])
            ->groupby('dv.idarticulo','a.nombre')
			->OrderBy('a.nombre')
            ->get();	
			
			   }
			   }
			
			$query2=date("Y-m-d",strtotime($query2."- 1 days"));
			return view('reportes.ventas.ventasarticulo.index',["rutas"=>$rutas,"clientes"=>$clientes,"persona"=>$nvendedor,"vendedores"=>$vendedores,"datos"=>$datos,"empresa"=>$empresa,"searchText"=>$query,"searchText2"=>$query2,"opc"=>$request->get('opcion')]);
       	}
		else { 
	return view("reportes.mensajes.noautorizado");
	}     
    }
	public function cajaventas(Request $request)
	{
		//dd($request);
		$user=Auth::user()->name;
		$rol=DB::table('roles')-> select('ccaja')->where('iduser','=',$request->user()->id)->first();
        if ($rol->ccaja==1){
		$empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
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
         //datos venta
            $datos=DB::table('venta as v')
			->where('v.user','=',$user)
			-> whereBetween('v.fecha_hora', [$query, $query2])
			-> groupby('v.idventa')
            ->get();
			//dd($datos);
			//ventas impuestos
			$impuestos=DB::table('detalle_venta as dv')
			-> join('articulos as art','dv.idarticulo','=','art.idarticulo')
			-> join('venta as v','dv.idventa','=','v.idventa')
			-> select(DB::raw(('sum(((dv.precio_venta*dv.cantidad)/((art.iva/100)+1))) as gravado')),DB::raw('sum(dv.precio_venta*dv.cantidad) as montoventa'),'art.iva')
			->where('v.user','=',$user)
			-> whereBetween('v.fecha_hora', [$query, $query2])
			-> groupby('art.iva')
			->get();
		//
        //datos devolucion     
             $devolucion=DB::table('devolucion as d')
            -> join('recibos as r','r.idventa','=','d.idventa')
            -> select(DB::raw('sum(r.monto) as totaldev'))
			->where('d.user','=',$user)
            ->whereBetween('d.fecha_hora', [$query, $query2])
            ->get();
			//dd($devolucion);
			//cobros directos
			$pagos=DB::table('recibos as re')
			->join('venta','venta.idventa','=','re.idventa')
			-> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco','re.idpago')	 
		 	->where('venta.user','=',$user)
			->where('venta.devolu','=',0)
            -> whereBetween('re.fecha', [$query, $query2])
			-> where ('re.tiporecibo','=',"P")
			-> groupby('re.idpago','re.idbanco')
            ->get();
      // dd($query);   
			$cobranza=DB::table('recibos as re')
			->join('venta','venta.idventa','=','re.idventa')
			-> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco','re.idpago')
		 	->where('venta.user','=',$user)
            -> whereBetween('re.fecha', [$query, $query2])
			-> where ('re.tiporecibo','=',"A")
			-> groupby('re.idpago','re.idbanco')
            ->get();
		$ingresos=DB::table('recibos as re')
			->join('venta','venta.idventa','=','re.idventa')
         -> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco','re.idpago')
		 	->where('venta.user','=',$user)
			->where('venta.devolu','=',0)
            -> whereBetween('re.fecha', [$query, $query2])
			-> groupby('re.idpago','re.idbanco')
            ->get();
			$comisiones=DB::table('reciboscomision as re')
			-> select(DB::raw('sum(re.monto) as monto'))
            -> whereBetween('re.fecha', [$query, $query2])
            ->first();
			//dd($comisiones);
			$query2=date("Y-m-d",strtotime($query2."- 1 days"));
        return view('reportes.ventas.corte.cortecaja',["datos"=>$datos,"devolucion"=>$devolucion,"impuestos"=>$impuestos,"empresa"=>$empresa,"ingresos"=>$ingresos,"cobranza"=>$cobranza,"pagos"=>$pagos,"searchText"=>$query,"searchText2"=>$query2]);
       
		} }else { 
	return view("reportes.mensajes.noautorizado");
	}

            
    }
	public function ventacaja(Request $request)
    {
        if ($request)
        {
			$rol=DB::table('roles')-> select('crearventa','anularventa')->where('iduser','=',$request->user()->id)->first();
			$corteHoy = date("Y-m-d");
			$user=Auth::user()->name;
			   $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
            $query=trim($request->get('searchText'));
            $ventas=DB::table('venta as v')
            -> join ('clientes as p','v.idcliente','=','p.id_cliente')
            -> join ('detalle_venta as dv','v.idventa','=','dv.idventa')
            -> select ('v.idventa','v.fecha_hora','p.nombre','v.tipo_comprobante','v.serie_comprobante','v.num_comprobante','v.impuesto','v.devolu','v.estado','v.total_venta')		
			->where('v.user','=',$user)
			 ->where('v.fecha_emi','like',$corteHoy)
            -> where ('p.nombre','LIKE','%'.$query.'%')
            -> orderBy('v.idventa','desc')
            -> groupBy('v.idventa')
                ->paginate(50);
     return view ('ventas.venta.ventacaja',["rol"=>$rol,"ventas"=>$ventas,"searchText"=>$query,"empresa"=>$empresa]);
        }
    } 
		public function librov(Request $request)
    {
			$rol=DB::table('roles')-> select('rlventas')->where('iduser','=',$request->user()->id)->first();	
			if ($rol->rlventas==1){
        $corteHoy = date("Y-m-d");
        $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
             $query=trim($request->get('searchText'));
             $query2=trim($request->get('searchText2'));
             if (($query)==""){$query=$corteHoy; }
			$query2 = date_create($query2);
            date_add($query2, date_interval_create_from_date_string('1 day'));
            $query2=date_format($query2, 'Y-m-d');
            $datos=DB::table('venta as v')  
			->join('formalibre as fl','fl.idventa','=','v.idventa')			
             ->join ('clientes as cl', 'cl.id_cliente','=','v.idcliente')      
            -> select('fl.anulado','v.devolu','v.fecha_emi as fecha','v.tasa','v.texe','v.base','fl.idforma','fl.nrocontrol','v.tipo_comprobante as tipo','cl.rif','cl.nombre','v.serie_comprobante as serie','v.num_comprobante as factura','v.control','v.total_venta','v.total_iva')
            ->whereBetween('v.fecha_emi', [$query, $query2])
			->OrderBy('v.idventa','asc')
            ->get();
			$retenc=DB::table('retencionventas as rt')
			->join('clientes as cli','rt.idcliente','=','cli.id_cliente')			
            ->whereBetween('rt.fecha', [$query, $query2])
			->OrderBy('rt.fecha','asc')
			->groupBy('rt.idret')
            ->get();
			//dd($retenc);
			$query2=date("Y-m-d",strtotime($query2."- 1 days"));
			return view('reportes.ventas.librov.index',["retenc"=>$retenc,"datos"=>$datos,"empresa"=>$empresa,"searchText"=>$query,"searchText2"=>$query2]);
                  } else { 
	return view("reportes.mensajes.noautorizado");
	}
    }
	public function correlativo(Request $request)
    {
        if ($request)
        {
			$rol=DB::table('roles')-> select('rcorrelativo')->where('iduser','=',$request->user()->id)->first();	
			if ($rol->rcorrelativo==1){
			//dd($request);
			$corteHoy = date("Y-m-d");
            $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
            $query=trim($request->get('searchText'));
			if (($query)==""){$query=$corteHoy; }
             $query2=trim($request->get('searchText2'));
            $query2 = date_create($query2);  
	
            date_add($query2, date_interval_create_from_date_string('1 day'));
            $query2=date_format($query2, 'Y-m-d');
         //datos venta	

            $datos=DB::table('venta as v')
			->join('formalibre as fl','fl.idventa','=','v.idventa')
			-> join('clientes as c','v.idcliente','=','c.id_cliente')
			-> join ('vendedores as ven','ven.id_vendedor','=','c.vendedor')
			->select('v.idventa','c.direccion','c.telefono','c.nombre','v.tipo_comprobante','v.num_comprobante','v.estado','v.total_venta','v.tasa','v.fecha_emi as fecha_hora','v.fecha_emi','v.saldo','v.devolu','v.user','fl.nrocontrol','fl.anulado','fl.idForma','v.base','v.texe','v.total_iva')
			-> whereBetween('v.fecha_emi', [$query, $query2])
			//-> groupby('fl.nrocontrol')
            ->get(); 
	  $query2=date("Y-m-d",strtotime($query2."- 1 days"));
        return view('reportes..ventas.ventasf.index',["datos"=>$datos,"empresa"=>$empresa,"searchText"=>$query,"searchText2"=>$query2]);
		} else { 
			return view("reportes.mensajes.noautorizado");
		}
		}
	}
		public function ventasdivisas(Request $request)
	{
			$corteHoy = date("Y-m-d");
            $query=trim($request->get('searchText'));
			if (($query)==""){$query=$corteHoy; }
             $query2=trim($request->get('searchText2'));
           $query2 = date_create($query2);  
	
            date_add($query2, date_interval_create_from_date_string('1 day'));
           $query2=date_format($query2, 'Y-m-d');
		$rol=DB::table('roles')-> select('idrol','rvdivisas')->where('iduser','=',$request->user()->id)->first();	
		$empresa=DB::table('empresa')->join('sistema','sistema.idempresa','=','empresa.idempresa')->first();
		if ($rol->rvdivisas==1){
		$divisa=DB::table('detalle_venta as dv')
			->join('venta','venta.idventa','=','dv.idventa' )
			->join('clientes','clientes.id_cliente','=','venta.idcliente')
			-> select('clientes.nombre','venta.tipo_comprobante','venta.num_comprobante','venta.tasa','venta.num_comprobante','dv.*')    
			-> where('venta.devolu','=',0)
			-> where('dv.descuento','>',0)
            -> whereBetween('venta.fecha_emi', [$query, $query2])
			-> groupby('dv.iddetalle_venta')
            ->get();
			//dd($divisa);

        return view('reportes.ventas.relaciondivisas.index',["divisa"=>$divisa,"empresa"=>$empresa,"rol"=>$rol,"searchText"=>$query,"searchText2"=>$query2]);
	} else { 
			return view("reportes.mensajes.noautorizado");
		}
	}
	public function reportecxcvencida(Request $request)
 {
		$rol=DB::table('roles')-> select('rventasarti')->where('iduser','=',$request->user()->id)->first();	
		if ($rol->rventasarti==1){
		$vendedores=DB::table('vendedores')->get();  
		$clientes=DB::table('clientes')->get();  
		$rutas=DB::table('rutas')->get();  
        $corteHoy = date("Y-m-d");
        $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
		
			$datos=DB::table('venta as v')
			->join('clientes as c','c.id_cliente','=','v.idcliente')
			-> join ('vendedores as ve','ve.id_vendedor','=','v.idvendedor')
			->select('v.saldo as acumulado','v.idventa as tipo_comprobante','serie_comprobante','num_comprobante','v.fecha_emi as fecha_hora','v.user','c.nombre','c.diascredito as diascre','ve.nombre as vendedor','c.cedula','c.telefono','c.id_cliente')
			->where('v.saldo','>',0)
			->where('v.tipo_comprobante','=','FAC')
			->where('v.devolu','=',0)
			->orderby('c.nombre','ASC')
			->get();
			$notasnd=DB::table('notasadm as not')
			->join('clientes as c','c.id_cliente','=','not.idcliente')
			->select('not.pendiente as tnotas','c.id_cliente','c.nombre','not.idnota','c.cedula','not.fecha')
			->where('not.tipo','=',1)
			->where('not.pendiente','>',0)			
			->get();
			$nc=DB::table('notasadm as not')
			->join('clientes as c','c.id_cliente','=','not.idcliente')
			->select(DB::raw('SUM(not.pendiente) as tnc'),'c.id_cliente')
			->where('not.tipo','=',2)
			->where('not.pendiente','>',0)					
			->groupby('c.id_cliente')
			->get();
			$nvendedor="";
			
		if($request->get('opcion')>0){	
			if($request->get('opcion')==1){		
			$vende=DB::table('vendedores')->where('id_vendedor','=',$request->get('vendedor'))->first();  
			$nvendedor=$vende->nombre;
			$datos=DB::table('venta as v')
			->join('clientes as c','c.id_cliente','=','v.idcliente')
			-> join ('vendedores as ve','ve.id_vendedor','=','v.idvendedor')
			->select('v.saldo as acumulado','v.idventa as tipo_comprobante','serie_comprobante','num_comprobante','v.fecha_emi as fecha_hora','v.user','c.nombre','c.diascredito as diascre','ve.nombre as vendedor','c.cedula','c.telefono','c.id_cliente')
			->where('v.idvendedor','=',$request->get('vendedor'))
			->where('v.saldo','>',0)
			->where('v.tipo_comprobante','=','FAC')
			->where('v.devolu','=',0)
			->orderby('c.nombre','ASC')
			->get();
			$notasnd=DB::table('notasadm as not')
			->join('clientes as c','c.id_cliente','=','not.idcliente')
			->select('not.pendiente as tnotas','c.id_cliente','c.nombre','not.idnota','c.cedula','not.fecha')
			->where('c.vendedor','=',$request->get('vendedor'))
			->where('not.tipo','=',1)
			->where('not.pendiente','>',0)			
			->get();	
			$nc=DB::table('notasadm as not')
			->join('clientes as c','c.id_cliente','=','not.idcliente')
			->select(DB::raw('SUM(not.pendiente) as tnc'),'c.id_cliente')
			->where('c.vendedor','=',$request->get('vendedor'))
			->where('not.tipo','=',2)
			->where('not.pendiente','>',0)					
			->groupby('c.id_cliente')
			->get();			
			}
		if($request->get('opcion')==2){ 
				$cli=DB::table('clientes')->where('id_cliente','=',$request->get('cliente'))->first();
				$nvendedor=$cli->nombre;
			$datos=DB::table('venta as v')
			->join('clientes as c','c.id_cliente','=','v.idcliente')
			-> join ('vendedores as ve','ve.id_vendedor','=','v.idvendedor')
			->select('v.saldo as acumulado','v.idventa as tipo_comprobante','serie_comprobante','num_comprobante','v.fecha_emi as fecha_hora','v.user','c.nombre','c.diascredito as diascre','ve.nombre as vendedor','c.cedula','c.telefono','c.id_cliente')
			->where('v.idcliente','=',$request->get('cliente'))
			->where('v.saldo','>',0)
			->where('v.tipo_comprobante','=','FAC')
			->where('v.devolu','=',0)
			->orderby('c.nombre','ASC')
			->get();	
			$notasnd=DB::table('notasadm as not')
			->join('clientes as c','c.id_cliente','=','not.idcliente')
			->select('not.pendiente as tnotas','c.id_cliente','c.nombre','not.idnota','c.cedula','not.fecha')
			->where('not.idcliente','=',$request->get('cliente'))
			->where('not.tipo','=',1)
			->where('not.pendiente','>',0)			
			->get();	
			$nc=DB::table('notasadm as not')
			->join('clientes as c','c.id_cliente','=','not.idcliente')
			->select(DB::raw('SUM(not.pendiente) as tnc'),'c.id_cliente')
			->where('not.idcliente','=',$request->get('cliente'))
			->where('not.tipo','=',2)
			->where('not.pendiente','>',0)					
			->groupby('c.id_cliente')
			->get();
			}
			if($request->get('opcion')==3){
				
				$vende=DB::table('vendedores')->where('id_vendedor','=',$request->get('vendedorr'))->first();  
				$ru=DB::table('rutas')->where('idruta','=',$request->get('ruta'))->first();
				$nvendedor=$vende->nombre. " Ruta: ".$ru->nombre;
			$datos=DB::table('venta as v')
			->join('clientes as c','c.id_cliente','=','v.idcliente')
			-> join ('vendedores as ve','ve.id_vendedor','=','v.idvendedor')
			->select('v.saldo as acumulado','v.idventa as tipo_comprobante','serie_comprobante','num_comprobante','v.fecha_emi as fecha_hora','v.user','c.nombre','c.diascredito as diascre','ve.nombre as vendedor','c.cedula','c.telefono','c.id_cliente')
			->where('v.idvendedor','=',$request->get('vendedorr'))
			->where('c.ruta','=',$request->get('ruta'))
			->where('v.saldo','>',0)
			->where('v.tipo_comprobante','=','FAC')
			->where('v.devolu','=',0)
			->orderby('c.nombre','ASC')
			->get();
			$notasnd=DB::table('notasadm as not')
			->join('clientes as c','c.id_cliente','=','not.idcliente')
			->select('not.pendiente as tnotas','c.id_cliente','c.nombre','not.idnota','c.cedula','not.fecha')
			->where('c.vendedor','=',$request->get('vendedorr'))
			->where('c.ruta','=',$request->get('ruta'))
			->where('not.tipo','=',1)
			->where('not.pendiente','>',0)			
			->get();	
			$nc=DB::table('notasadm as not')
			->join('clientes as c','c.id_cliente','=','not.idcliente')
			->select(DB::raw('SUM(not.pendiente) as tnc'),'c.id_cliente')
			->where('c.vendedor','=',$request->get('vendedorr'))
			->where('c.ruta','=',$request->get('ruta'))
			->where('not.tipo','=',2)
			->where('not.pendiente','>',0)					
			->groupby('c.id_cliente')
			->get();
			   }
			   }

			return view('reportes.ventas.venci_cobro.index',["rutas"=>$rutas,"clientes"=>$clientes,"persona"=>$nvendedor,"vendedores"=>$vendedores,"datos"=>$datos,"notasnd"=>$notasnd,"nc"=>$nc,"empresa"=>$empresa,"opc"=>$request->get('opcion')]);
       	}
		else { 
	return view("reportes.mensajes.noautorizado");
	}     
    }
	public function resumendiario(Request $request)
	{
		//dd($request);
			$corteHoy = date("Y-m-d");
            $query=trim($request->get('searchText'));
			if (($query)==""){$query=$corteHoy; }
             $query2=trim($request->get('searchText2'));
           $query2 = date_create($query2);  
	
            date_add($query2, date_interval_create_from_date_string('1 day'));
           $query2=date_format($query2, 'Y-m-d');
		$rol=DB::table('roles')-> select('idrol','rventas')->where('iduser','=',$request->user()->id)->first();	
		$empresa=DB::table('empresa')->join('sistema','sistema.idempresa','=','empresa.idempresa')->first();
		if ($rol->rventas==1){
			$datos=DB::table('venta as v')
			->select('fecha_emi as fecha',DB::raw('sum(v.total_venta) as monto'),DB::raw('sum(v.saldo) as deuda'))
			->where('v.devolu','=',0)
			-> whereBetween('v.fecha_emi', [$query, $query2])
			-> groupby('v.fecha_emi')
            ->get();
			// pagos
			//dd($datos);
			$pagos=DB::table('recibos as re')
			->join('venta as v','v.idventa','=','re.idventa')
			->join('monedas as mo','mo.idmoneda','=','re.idpago')
			-> select(DB::raw('sum(re.monto) as monto'),DB::raw('sum(re.recibido) as recibido'),'re.idbanco','re.idpago','v.fecha_emi')
			->where('re.monto','>',0)
			->where('v.devolu','=',0)
            -> whereBetween('v.fecha_emi', [$query, $query2])
			-> groupby('v.fecha_emi','re.idpago','re.idbanco')
            ->get();	
			
			$monedas=DB::table('monedas')->get();//	dd($monedas);	;	
        return view('reportes.ventas.resumendiario.index',["datos"=>$datos,"pagos"=>$pagos,"monedas"=>$monedas,"empresa"=>$empresa,"rol"=>$rol,"searchText"=>$query,"searchText2"=>$query2]);
	} else { 
			return view("reportes.mensajes.noautorizado");
		}
	}
		public function ventasproveedor(Request $request)
    {
		$rol=DB::table('roles')-> select('rventasarti')->where('iduser','=',$request->user()->id)->first();	
		if ($rol->rventasarti==1){
		$proveedores=DB::table('proveedores')->get();  

        $corteHoy = date("Y-m-d");
        $empresa=DB::table('empresa')-> where('idempresa','=','1')->first();
             $query=trim($request->get('searchText'));
             $query2=trim($request->get('searchText2'));
             if (($query)==""){$query=$corteHoy; }
			$query2 = date_create($query2);
            date_add($query2, date_interval_create_from_date_string('1 day'));
            $query2=date_format($query2, 'Y-m-d');
		$datos = DB::table('compras as co')
		  ->join('detalle_compras as dc','dc.idcompra','=','co.idcompra')	
		  ->join('articulos as art','art.idarticulo','=','dc.idarticulo')	
		// ->select(DB::raw('(space(12)*0) as cxc'),'cli.id_cliente','cli.nombre','cli.cedula','cli.cedula as rif','cli.direccion','cli.telefono','cli.diascredito as dias_credito','cli.vendedor','vend.comision')
		-> select(DB::raw('sum(dc.cantidad) as comprado'),'art.nombre','art.idarticulo')
		->where('co.estatus','0')
		->whereBetween('co.fecha_hora', [$query, $query2])	 
		->groupby('art.idarticulo')
		  ->get(); 
 
			$nvendedor="";
		 $ventas = DB::table('venta as co')
		  ->join('detalle_venta as dc','dc.idventa','=','co.idventa')	
		  ->join('articulos as art','art.idarticulo','=','dc.idarticulo')	
		// ->select(DB::raw('(space(12)*0) as cxc'),'cli.id_cliente','cli.nombre','cli.cedula','cli.cedula as rif','cli.direccion','cli.telefono','cli.diascredito as dias_credito','cli.vendedor','vend.comision')
			-> select(DB::raw('sum(dc.cantidad) as vendido'),'art.idarticulo')
		 ->where('co.devolu','0')
		 ->whereBetween('co.fecha_emi', [$query, $query2])	 
		  ->groupby('art.idarticulo')
		  ->get();
	if($request->get('proveedor')){		
	
		 $datos = DB::table('compras as co')
		  ->join('detalle_compras as dc','dc.idcompra','=','co.idcompra')	
		  ->join('articulos as art','art.idarticulo','=','dc.idarticulo')	
		// ->select(DB::raw('(space(12)*0) as cxc'),'cli.id_cliente','cli.nombre','cli.cedula','cli.cedula as rif','cli.direccion','cli.telefono','cli.diascredito as dias_credito','cli.vendedor','vend.comision')
		    -> select(DB::raw('sum(dc.cantidad) as comprado'),'art.nombre','art.idarticulo')
		->where('co.idproveedor','=',$request->get('proveedor'))
			->where('co.estatus','0')		
		->whereBetween('co.fecha_hora', [$query, $query2])	 
		  ->groupby('art.idarticulo')
		  ->get(); 

		$vende=DB::table('proveedores')->where('idproveedor','=',$request->get('proveedor'))->first();  
			$nvendedor=$vende->nombre;
		 $ventas = DB::table('venta as co')
		  ->join('detalle_venta as dc','dc.idventa','=','co.idventa')	
		  ->join('articulos as art','art.idarticulo','=','dc.idarticulo')	
		// ->select(DB::raw('(space(12)*0) as cxc'),'cli.id_cliente','cli.nombre','cli.cedula','cli.cedula as rif','cli.direccion','cli.telefono','cli.diascredito as dias_credito','cli.vendedor','vend.comision')
			-> select(DB::raw('sum(dc.cantidad) as vendido'),'art.idarticulo')
		 ->where('co.devolu','0')
		 ->whereBetween('co.fecha_emi', [$query, $query2])	 
		  ->groupby('art.idarticulo')
		  ->get(); 
	}
			$query2=date("Y-m-d",strtotime($query2."- 1 days"));
			return view('reportes.ventas.ventasproveedor.index',["ventas"=>$ventas,"proveedores"=>$proveedores,"persona"=>$nvendedor,"datos"=>$datos,"empresa"=>$empresa,"searchText"=>$query,"searchText2"=>$query2]);
       	}
		else { 
	return view("reportes.mensajes.noautorizado");
	}     
    }
}
