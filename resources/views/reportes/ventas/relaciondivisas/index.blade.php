@extends ('layouts.master')
<?php $mostrar=0; $tasasref=0; $acumtasa=0; $acumtref=0; $acumbsbcv=0; $acumpreal=$acumpdesc=0;?>

@section ('contenido')
<?php $mostrar=1; ?>
<div class="row">
		@include('reportes.ventas.relaciondivisas.search')
</div>


<?php $countv=0; $acummv=0; $counta=0; $acumma=0; $acumnd=0; $countnd=0;
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
			@include('reportes.ventas.relaciondivisas.empresa')
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
			   <div class="col-12 table-responsive">
			  
				<table width="100%">
					<thead style="background-color: #E6E6E6">
						<th colspan="8">Ingreso Divisas por Ventas</th>							
					</thead>
					<thead style="background-color: #E6E6E6">
						<th>Cliente</th>
						<th>Documento</th>
						<th>Tasa BCV</th>
						<th>Monto $->Bcv</th>
						<th>Monto Bs->Bcv</th>
						<th>Descuento</th>
						<th>Monto $</th>								
						<th>Tasa Referencial</th>															
					</thead> <?php if(count($divisa)>0){ ?>
						@foreach ($divisa as $q)
						<?php $countv++; 
						$acumtasa=$acumtasa+$q->tasa;
						$acumpreal=$acumpreal+($q->precio*$q->cantidad);
						$acumpdesc=$acumpdesc+($q->precio_venta*$q->cantidad);
						$tasasref=((($q->precio*$q->cantidad)*$q->tasa)/($q->precio_venta*$q->cantidad));
						$acummv=$acummv+$q->precio; 
						$acumbsbcv=$acumbsbcv+(($q->precio*$q->cantidad)*$q->tasa);
						?>
				<tr>
				<td><small>{{$q->nombre}}</small></td>
				<td>{{$q->tipo_comprobante}}-{{$q->num_comprobante}}</td>
				<td><?php echo number_format( ($q->tasa), 2,',','.')." $"; ?></td>
				<td><?php echo number_format( ($q->precio*$q->cantidad), 2,',','.')." $"; ?></td>
				<td><?php echo number_format( ((($q->precio*$q->cantidad)*$q->tasa)), 2,',','.')." Bs"; ?></td>
				<td><?php echo number_format( ($q->descuento), 2,',','.')." %"; ?></td>
				<td><?php echo number_format( ($q->precio_venta*$q->cantidad), 2,',','.'); ?></td>
				<td><?php $acumtref=$acumtref+$tasasref; echo number_format( ($tasasref), 2,',','.')." Bs"; ?></td>
				
				</tr>
				@endforeach
				<tr>
				<td colspan="2"><strong>Total:</strong></td>
				<td><strong><?php echo number_format( ($acumtasa/$countv), 2,',','.')." $"; ?></strong></td>
				<td><strong><?php echo number_format( $acumpreal, 2,',','.')." $"; ?></strong></td>
				<td><strong><?php echo number_format( $acumbsbcv, 2,',','.')." Bs"; ?></strong></td>
				<td></td>
				<td><strong><?php echo number_format( $acumpdesc, 2,',','.')." $"; ?></strong></td>
				<td><strong><?php echo number_format(( $acumtref/$countv), 2,',','.')." Bs"; ?></strong></td>
					</tr> <?php } ?>
				</table></br>
				<!-- de las nd -->
				
					
			</div>
			</div>	
<!--
<div class="col-12 table-responsive">
	<table width="100%">
      <thead>
          <tr><td colspan="3" align="center" style="background-color: #E6E6E6"> 
		  <strong>Resumen: </strong></td></tr>
<tr><td align="center" style="background-color: #E6E6E6"> 
		  <strong>Ingresos: <?php  echo number_format($tcobro, 2,',','.')." $"; ?></strong></td>
		  <td align="center" style="background-color: #E6E6E6"> 
		  <strong>Egresos: <?php  echo number_format($tpagos, 2,',','.')." $"; ?></strong></td>
		  <td align="center" style="background-color: #E6E6E6"> 
		  <strong>Saldo: <?php  echo number_format(($tcobro-$tpagos), 2,',','.')." $"; ?></strong></td></tr> 		
		  </thead>
      </table>
	  </div>	  -->
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
  window.location="{{route('reportecxc')}}";
    });

});

</script>

@endpush
@endsection