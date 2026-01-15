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
$saldond=$saldonc=0; $contnd=0; $contnc=0;
?>
<style type="text/css">
#capae{
	height: 700px;
	width: 100%;
	border: 1px solid #ddd;
	background: #f1f1f1;
	overflow-y: scroll;
}
</style>
<?php $acummonto=0;?>
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
			@include('proveedores.proveedor.empresa')
				<div class="col-sm-3 invoice-col">
				<h3 align="center"> <u>Estado de Cuenta</u> </h3>
				<h5 align="center"> Proveedor </h>
				</div>		
				<div class="col-sm-3 invoice-col">
				<div align="center">  
			<img src="{{ asset('dist/img/'.$empresa->logo)}}" width="50%" height="80%" title="NKS">
			</div>
	    </div>
			</div>	
<div class="row">

	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<table width="100%" border="1"><tr><td width="30%"><strong>Rif -> Proveedor</strong></td><td width="20%"><strong>Telefono</strong></td><td width="30%"><strong>Direccion</strong></td><td width="20%"><strong>Contacto</strong></td>
			</tr>
			<tr><td>{{$datos->rif}}->  {{$datos->nombre}}   </td><td>{{$datos->telefono}}</td><td><small>{{$datos->direccion}}</small></td><td>{{$datos->contacto}} </td>
			</tr>
			</table></br>
		</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="divbotones" align="right">
                 <div class="form-group">
				 <a href="" data-target="#modaldebito-{{$datos->idproveedor}}" data-toggle="modal"><button class="btn btn-warning btn-xs">N. Debito</button></a>
				 <a href="" data-target="#modalcredito-{{$datos->idproveedor}}" data-toggle="modal"><button class="btn btn-primary btn-xs">N. Credito</button></a>
					  <a href="{{route('showcxp',['id'=>$datos->idproveedor])}}"><button class="btn btn-info btn-xs">Abono</button></a>
					                      <a href="" data-target="#modalrecibos-{{$datos->idproveedor}}" data-toggle="modal"><button class="btn btn-success btn-xs">Recibos</button></a>
					</div>
			</div>
@include('proveedores.proveedor.modalcredito')
@include('proveedores.proveedor.modalrecibos')
@include('proveedores.proveedor.modaldebito')
</div>
<div class="row">
		<div id="capa">
		       <div class="col-12 table-responsive">
					<table width="100%">
				<thead style="background-color: #D4E6F1" >
				<th class="filap1"></th>
					<th>Documento</th>
					<th>Fecha</th>
					<th>Monto Doc.</th>
					<th>Base Imponible</th>
					<th>IVA</th>
					<th>Exento</th>
					<th>Por Pagar</th>

							
				</thead>
				<?php $comprado=0; $acum=0; $base=$exento=$iva=$pagar=0; $saldo=0; $cont=0;?>
               @foreach ($compras as $cat)
			   <?php $comprado=$comprado+$cat->total;  
			   $saldo=$saldo+$cat->saldo; 
			   $base=$base+$cat->base;
			   $exento=$exento+$cat->exento; 
			   $iva=$iva+$cat->miva;
			   $cont++; 
			   ?>
				<tr>
					<td class="filap1"> <a  href="{{route('showcompra',['id'=>$cat->idcompra.'-'.$link])}}"><i class="fa fa-fw fa-eye" title="Ver Documento"></i></a></td>
					<td>{{ $cat->tipo_comprobante}}-{{ $cat->serie_comprobante}} {{ $cat->num_comprobante}}</td>
					<td>{{ $cat->fecha_hora}}</td>
					<td>{{ $cat->total}}</td>
					<td>{{ $cat->base}}</td>
					<td>{{ $cat->miva}}</td>
					<td>{{ $cat->exento}}</td>
					<td>{{ $cat->saldo}}</td>				
				</tr>	
				@foreach($rcompras as $p)
					<?php if($cat->idcompra==$p->idcompra){ ?>
					<tr style="line-height:80%"><td></td><td colspan="3"><small>------------> Recibo-{{$p->idrecibo}} <?php echo date("d-m-Y",strtotime($p->fecha_comp)); ?></small></td><td colspan="3"><small>{{$p->idbanco}}->{{$p->recibido}}->{{$p->monto}}$</small></td><td></td></tr>
					<?php } ?>
					@endforeach
				<tr>
				@endforeach
				
				@foreach ($gastos as $go)
			   <?php 
			   $comprado=$comprado+$go->monto; 
			   $saldo=$saldo+$go->saldo; 
			    $base=$base+$go->base;
			   $cont++; 
			   ?>
				<tr>
					<td class="filap1"> <a  href="{{route('showgasto',['id'=>$go->idgasto.'-'.$link])}}"><i class="fa fa-fw fa-eye" title="Ver Documento"></i></a></td>
					<td>GTO-{{$go->documento}}</td>
					<td>{{ $go->fecha}}</td>
					<td>{{ $go->monto}}</td>
					<td>{{ $go->monto}}</td>
					<td></td>
					<td></td>
					<td>{{ $go->saldo}}</td>				
				</tr>
					@foreach($rgastos as $p)
					<?php if($go->idgasto==$p->idgasto){ ?>
					<tr style="line-height:80%"><td></td><td colspan="3"><small>------------> Recibo-{{$p->idrecibo}} <?php echo date("d-m-Y",strtotime($p->fecha_comp)); ?></small></td><td colspan="3"><small>{{$p->idbanco}}->{{$p->recibido}}->{{$p->monto}}$</small></td><td></td></tr>
					<?php } ?>
					@endforeach
				@endforeach
					@foreach ($notas as $not)
					<?php  $comprado=$comprado+$not->monto; 
							
							if ($not->tipo==1){$saldo=$saldo+$not->pendiente; $p=1; }else{$p=2; $saldo=$saldo-$not->pendiente;}
					?>
				<tr>
				<td class="filap1"> <a href="{{route('shownota',['id'=>$not->idnota.'_'.$link.'_'.$p])}}" title="Ver Documento"><i class="fa fa-fw fa-eye" title="Ver Documento"></i></a></td>
					<td> <?php if ($not->tipo==1){?>
					N/D - <?php $idv=$not->ndocumento; echo add_ceros($idv,$ceros); ?>
					 <?php
									}else{?>
					N/C -  <?php $idv=$not->ndocumento; echo add_ceros($idv,$ceros); ?><?php } ?> </td>
						<td><?php echo date("d-m-Y",strtotime($not->fecha)); ?></td>
						<td>{{ $not->monto}}</td>
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
				<tr>
				<td class="filap1"></td>
				<td><strong>Facturas: <?php echo $cont; ?></strong></td><td></td>
				<td><strong><?php echo $comprado; ?> $.</strong></td>
				<td><strong><?php echo $base; ?> $.</strong></td>
				<td><strong><?php echo $iva; ?> $.</strong></td>
				<td><strong><?php echo $exento; ?> $.</strong>
				</td><td><strong><?php echo ($saldo); ?> $.</strong></td></tr>
			</table>
			</div>
		</div>

	</div>
	     <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center"></br>
					<button type="button" id="regresar" class="btn btn-danger btn-sm" data-dismiss="modal">Regresar</button>                    
					<button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button>				
                    </div>
                </div>  
</div>
</div>
@push ('scripts')
<script>
$(document).ready(function(){
	    $('#ing').DataTable();	
    $('#imprimir').click(function(){
			$(".filap1").remove();
		document.getElementById('divbotones').style.display="none";	
		document.getElementById('imprimir').style.display="none";
		document.getElementById('regresar').style.display="none";
		window.print(); 
		window.location="{{route('proveedores')}}";
    });
	
$('#regresar').on("click",function(){
  window.location="{{route('proveedores')}}";
  
});
});
</script>
@endpush
@endsection