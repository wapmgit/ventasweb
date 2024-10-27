@extends ('layouts.master')
@section ('contenido')
<?php 
$ceros=5; 
function add_ceros($numero,$ceros) {
  $numero=$numero;
	$digitos=strlen($numero);
  $recibo=" ";
  for ($i=0;$i<8-$digitos;$i++){
    $recibo=$recibo."0";
  }
return $insertar_ceros = $recibo.$numero;
};
?>
<style type="text/css">
#capa{
	height: 500px;
	width: 100%;
	border: 1px solid #ddd;
	background: #f1f1f1;
	overflow-y: scroll;
}
</style>
  	<div class="invoice p-3 mb-3">
              <!-- title row -->
              <div class="row">
                <div class="col-12">
                  <h4>
                  <img src="{{asset('dist/img/iconosistema.png')}}" title="NKS">SysVent@s
                    <small class="float-right"></small>
                  </h4>
                </div>
                <!-- /.col -->
              </div>
              <!-- info row -->
              <div class="row invoice-info">
			<div class="col-sm-6 invoice-col">
			{{$empresa->nombre}}
			<address>
			<strong>{{$empresa->rif}}</strong><br>
					{{$empresa->direccion}}<br>
					Tel: {{$empresa->telefono}}<br>
			</address>
	</div>
				 	<div class="col-sm-3 invoice-col">
		<h3 align="center"><u>  Estado de Cuenta </u></h3>		
	</div>	
	<div class="col-sm-3 invoice-col" align="center">
<img src="{{asset('dist/img/logoempresa.png')}}" width="50%" height="80%" title="NKS">
	</div>
              </div>
<div class="row"><?php $acummonto=0; ?>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<table width="100%"><tr><td width="30%"><strong>Rif -> Proveedor</strong></td><td width="20%"><strong>Telefono</strong></td><td width="30%"><strong>Direccion</strong></td><td width="20%"><strong>Vendedor</strong></td>
			</tr>
			<tr><td>{{$cliente->cedula}} -> {{$cliente->nombre}}</td><td>{{$cliente->telefono}}</td><td>{{$cliente->direccion}}</td><td>{{$cliente->vendedor}} </td>
			</tr>
			</table></br>
		</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="divbotones" align="right">
                 <div class="form-group">
				<a href="" data-target="#modaldebito-{{$cliente->id_cliente}}" data-toggle="modal"><button class="btn btn-warning btn-xs">N. Debito</button></a>		
					<a href="" data-target="#modalcredito-{{$cliente->id_cliente}}" data-toggle="modal"><button class="btn btn-primary btn-xs">N. Credito</button></a>
					@if($rol->abonarcxc==1)<a href="{{route('showcxc',['id'=>$cliente->id_cliente])}}"><button class="btn btn-info btn-xs">Abono</button></a>@endif
                    <a href="" data-target="#modalrecibos-{{$cliente->id_cliente}}" data-toggle="modal"><button class="btn btn-success btn-xs">Recibos</button></a>
					</div>
			</div>

@include('clientes.cliente.modalcredito')
@include('clientes.cliente.modaldebito')
@include('clientes.cliente.modalrecibos')
</div>
@include('clientes.cliente.modaldetalle')
@include('clientes.cliente.modaldetallenc')

		<div class="row">	
	<div id="capac">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<table width="100%">
				<thead>
				<th class="filap1"></th>
					<th>Documento</th>
					<th>Ref.</th>
					<th>Desc.</th>
					<th>Fecha</th>
					<th>Condicion</th>
					<th>Monto Doc.</th>
					<th>Des. %</th>
					<th>Monto Des.</th>
					<th>Saldo</th>						
				</thead>
				<?php $vendido=0; $acum=0; $link=2; $saldo=$saldond=$saldonc=0; $cont=$contnd=$contnc=0; ?>
               @foreach ($ventas as $cat) 
			   <?php if($cat->devolu==0){ $vendido=$vendido+$cat->total_venta;  $saldo=$saldo+$cat->saldo; }
			   $cont++; 
			   ?>
				<tr>
				<td class="filap1"> <a  href="{{route('tcarta',['id'=>$cat->idventa.'-'.$link])}}"><i class="fa fa-fw fa-eye" title="Ver Documento"></i></a></td>
					<td> <?php if($cat->devolu==1){echo "*DEV";}?>             
					{{ $cat->tipo_comprobante}}-{{ $cat->serie_comprobante}} {{$cat->num_comprobante}}
					</td>
					<td></td><td></td>
					<td><small><?php echo date("d-m-Y h:i:s a",strtotime($cat->fecha_hora)); ?></small></td>
					<td>{{ $cat->estado}}</td>
					<td>{{ $cat->total_venta}}</td>
					<td>{{ $cat->descuento}}</td>
					<td>{{ $cat->total_pagar}}</td>
					<td> {{ $cat->saldo}}</td>				
				</tr>
				
					@foreach($pagos as $p)
					<?php if($cat->idventa==$p->idventa){ ?>
					<tr style="line-height:80%"><td></td><td colspan="4"><small>------------> Recibo-{{$p->idrecibo}} <?php echo date("d-m-Y",strtotime($p->fecha)); ?></small></td><td colspan="4"><small>{{$p->idbanco}}->{{$p->recibido}}->{{$p->monto}}$</small></td><td></td><td></td></tr>
					<?php } ?>
					@endforeach
				@endforeach
				@foreach ($notas as $not)
				<?php if ($not->tipo==1){ $link=1;}else{$link=2;}?>
				<tr>
				<td class="filap1"> <a href="{{route('shownd',['id'=>$not->idnota.'_'.$link])}}" title="Ver Documento"><i class="fa fa-fw fa-eye" title="Ver Documento"></i></a></td>
					<td> <?php if ($not->tipo==1){?>
					N/D - <?php $idv=$not->ndocumento; echo add_ceros($idv,$ceros); ?>
					 <?php
									}else{?>
					N/C -  <?php $idv=$not->ndocumento; echo add_ceros($idv,$ceros); ?><?php } ?> </td>
					<td>{{ $not->referencia}}</td><td>{{ $not->descripcion}}</td>
					<td><?php echo date("d-m-Y",strtotime($not->fecha)); ?></td>
					<td></td>
					<td>{{ $not->monto}}</td>
					<td></td>
					<td></td>
					<td>
					<?php if ($not->tipo==1){?>
				{{ $not->pendiente}}<?php
						 $saldond=$saldond+$not->pendiente; $contnd++;  }else{?>{{ $not->pendiente}}<?php			 
						  $saldonc=$saldonc+$not->pendiente;  $contnc++; }?></td>				
				</tr>
				@endforeach
				@foreach ($retencion as $ret)
				<?php $link=1; ?>
				<tr><td class="filap1"> <a href="{{route('showret',['id'=>$ret->idret.'_'.$link])}}" title="Ver Documento"><i class="fa fa-fw fa-eye" title="Ver Documento"></i></a></td>
					<td> RET-<?php $idv=$ret->idret; echo add_ceros($idv,$ceros); ?></td>
					<td>Doc:{{ $ret->comprobante}}</td>
					<td>Fac:{{ $ret->idfactura}}</td>
					<td><?php echo date("d-m-Y",strtotime($ret->fecha)); ?></td>
					<td></td>
					<td>{{ $ret->mretd}}</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>				
				</tr>
				@endforeach
				<tr><td class="filap1"></td><td colspan="5"><strong>Facturas: <?php echo $cont. " -> N/D: ".$contnd." -> N/C: ".$contnc; ?></strong></td><td><strong>Facturado: <?php echo$vendido; ?> $.</strong></td><td colspan="2"></td><td><strong><?php echo (($saldo+$saldond)-$saldonc); ?> $.</strong></td></tr>
			</table>
			
		</div>

	</div>
	     <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12"></br>
                    <div class="form-group" align="center">
					<button type="button" id="regresar" class="btn btn-danger btn-sm" data-dismiss="modal">Regresar</button>
                     <button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button>

                    </div>
                </div>  

			<form action="{{route('clientes')}}" method="POST" id="formulariodetalle" enctype="multipart/form-data" >  
			 {{csrf_field()}}
    <input type="hidden" name="comprobante" id="pidcomprobante" value="0">
	 <input type="hidden" name="tipo" id="pidtipo" value="0">
	 </form>
     
</div>
	<div id="capaprint" style="display:none">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<table width="100%">
				<thead>
					<th>Documento</th>
					<th>Ref.</th>
					<th>Desc.</th>
					<th>Fecha</th>
					<th>Condicion</th>
					<th>Monto Doc.</th>
					<th>Des. %</th>
					<th>Monto Des.</th>
					<th>Saldo</th>						
				</thead>
				<?php $vendido=0; $acum=0; $saldo=$saldond=$saldonc=0; $cont=$contnd=$contnc=0; ?>
               @foreach ($ventas as $cat) 
			   <?php if($cat->devolu==0){ $vendido=$vendido+$cat->total_venta;  $saldo=$saldo+$cat->saldo; }
			   $cont++; 
			   ?>
				<tr>
					<td> <?php if($cat->devolu==1){echo "*DEV";}?>{{ $cat->tipo_comprobante}}-{{ $cat->serie_comprobante}} {{$cat->num_comprobante}}	
					</td>
					<td></td><td></td>
					<td><small><?php echo date("d-m-Y h:i:s a",strtotime($cat->fecha_hora)); ?></small></td>
					<td>{{ $cat->estado}}</td>
					<td>{{ $cat->total_venta}}</td>
					<td>{{ $cat->descuento}}</td>
					<td>{{ $cat->total_pagar}}</td>
					<td>{{ $cat->saldo}}</td>				
				</tr>
				@endforeach
				@foreach ($notas as $not)
				<tr>
					<td> <?php if ($not->tipo==1){?>
						N/D - {{$not->idnota}}<?php
									}else{?>
					N/C - {{$not->idnota}}<?php } ?> </td>
					<td>{{ $not->referencia}}</td><td>{{ $not->descripcion}}</td>
					<td><?php echo date("d-m-Y",strtotime($not->fecha)); ?></td>
					<td></td>
					<td>{{ $not->monto}}</td>
					<td></td>
					<td></td>
					<td>
					<?php if ($not->tipo==1){?>{{ $not->pendiente}}<?php
						 $saldond=$saldond+$not->pendiente; $contnd++;  }else{?>
				{{ $not->pendiente}}
			<?php $saldonc=$saldonc+$not->pendiente;  $contnc++; }?></td>				
				</tr>
				@endforeach
					@foreach ($retencion as $ret)			
				<tr>
					<td> RET-<?php $idv=$ret->idret; echo add_ceros($idv,$ceros); ?></td>
					<td>Doc:{{ $ret->comprobante}}</td>
					<td>Fac:{{ $ret->idfactura}}</td>
					<td><?php echo date("d-m-Y",strtotime($ret->fecha)); ?></td>
					<td></td>
					<td>{{ $ret->mretd}}</td>
					<td>0</td>
					<td>0</td>
					<td>0</td>				
				</tr>
				@endforeach
				<tr><td colspan="5"><strong>Facturas: <?php echo $cont. " -> N/D: ".$contnd." -> N/C: ".$contnc; ?></strong></td><td><strong>Facturado: <?php echo$vendido; ?> $.</strong></td><td colspan="2"></td><td><strong><?php echo (($saldo+$saldond)-$saldonc); ?> $.</strong></td></tr>
			</table>
			
		</div>

	</div>
</div>
@push ('scripts')
<script>
$(document).ready(function(){

    $('#ing').DataTable();	

    $('#imprimir').click(function(){
		$(".filap1").remove();
  //  alert ('si');
  document.getElementById('divbotones').style.display="none";
  document.getElementById('capac').style.display="none";
  document.getElementById('capaprint').style.display="";
  document.getElementById('imprimir').style.display="none";
  document.getElementById('regresar').style.display="none";
  window.print(); 
  window.location.href="/edocuenta/{{$cliente->id_cliente}}";
    });
$('#regresar').on("click",function(){
  window.location="{{route('clientes')}}";
  
});
$('#btndedito').on("click",function(){
  document.getElementById('btndedito').style.display="none"; 
});
$('#btncredito').on("click",function(){
  document.getElementById('btncredito').style.display="none"; 
});
$('#btn-cerrar').on("click",function(){
$(".otrafila").remove();
});
$('#btn-cerrarnc').on("click",function(){
$(".filadelete").remove();
});
$('#btn-close').on("click",function(){
$(".otrafila").remove();
});


});
</script>
@endpush
@endsection