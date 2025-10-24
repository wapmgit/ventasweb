@extends ('layouts.master')
<?php $mostrar=0; $tasasref=0; $acumtasa=0; $acumtref=0; $acumbsbcv=0; $acumpreal=$acumpdesc=0;?>

@section ('contenido')
<?php $mostrar=1; ?>
<div class="row">
		@include('reportes.ventas.resumendiario.search')
</div>

<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {

   text-align: center;
}
@media print{@page {size: landscape}}
</style>
<?php $countv=0; $acummv=0; $counta=0; $acumma=0; $acumd=0; $countnd=0;
$acumpa=0; $countpa=0; $acumga=0; $countga=0; $tcobro=0; $tpagos=0; $countndp=0; $acumndp=0;
?>
 <!-- Main content -->
		<div class="invoice p-3 mb-3">
              <!-- title row -->
              <div class="row">
                <div class="col-12">
                  <h4>
                    <img src="{{asset('dist/img/iconosistema.png')}}" title="NKS"> SysVent@s
                    <small class="float-right"></small>
                  </h4>
                </div>
                <!-- /.col -->
              </div>
              <!-- info row -->
              <div class="row invoice-info">
			@include('reportes.ventas.resumendiario.empresa')
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
			   <div class="col-12">
			  
				<table width="100%">
					<thead >
						<th colspan="4" style="background-color: #E6E6E6">Ventas</th>	
						<th colspan="<?php echo count($monedas);?>" style="background-color: #E6E6E6">Medios de Cobro</th>
						
					</thead>
					<thead >
						<th>Fecha</th>
						<th>Facturado</th>
						<th>Cobrado</th>
						<th>Pendiente</th>
						@foreach ($monedas as $m)
						<th><small>{{$m->nombre}}</small></th>
						@endforeach															
					</thead> <?php if(count($datos)>0){ ?>
						@foreach ($datos as $q)
						<?php $countv++; 
						$acummv=$acummv+$q->monto; 
						$acumd=$acumd+$q->deuda; 
						$acumpa=$acumpa+(($q->monto-$q->deuda));
						?>
				<tr>
				<td><?php echo date("d-m-Y",strtotime($q->fecha)); ?></td>
				<td><?php echo number_format( ($q->monto), 2,',','.')." $"; ?></td>
				<td><?php echo number_format( ($q->monto-$q->deuda), 2,',','.')." $"; ?></td>
				<td><?php echo number_format( ($q->deuda), 2,',','.')." $"; ?></td>
						@foreach ($monedas as $m)<td>
							@foreach ($pagos as $p)
								<?php if(($q->fecha==$p->fecha_emi)and($p->idpago==$m->idmoneda)){ ?>
								<?php echo number_format( ($p->recibido), 2,',','.'); ?>
								<?php } ?>
							@endforeach
						@endforeach	</td>
				</tr>
				@endforeach
				<tr>
				<td ><strong>Total:</strong></td>
				<td><strong><?php echo number_format($acummv, 2,',','.')." $"; ?></strong></td>
				<td><strong><?php echo number_format( $acumd, 2,',','.')." $"; ?></strong></td>
				<td><strong><?php echo number_format( $acumpa, 2,',','.')." $"; ?></strong></td>
					@foreach ($monedas as $m) <?php $tcobro=0; ?><td>
							@foreach ($pagos as $p)							
								<?php if($p->idpago==$m->idmoneda){
									$tcobro=$tcobro+$p->recibido;  } ?>
							@endforeach
							<?php echo number_format( $tcobro, 2,',','.')." ".$m->simbolo; ?></strong>
						@endforeach
					
						</td>
					</tr> <?php } ?>
				</table></br>
				<!-- de las nd -->
				
					
			</div>
			</div>	
			<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
				<label>Usuario: </label>  {{ Auth::user()->name }}  
				<div class="form-group" align="center">
				<button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button> 
				</div>
			</div>
                   
		</div><!-- /.box-body -->
	
            	
@push ('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
  //  alert ('si');
  document.getElementById('imprimir').style.display="none";
  window.print(); 
  window.location="{{route('resumendiario')}}";
    });

});

</script>

@endpush
@endsection