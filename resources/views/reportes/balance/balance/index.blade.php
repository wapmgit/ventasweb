@extends ('layouts.master')
<?php $mostrar=0; ?>

@section ('contenido')
<?php $mostrar=1; ?>
<div class="row">
		@include('reportes.balance.balance.search')
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
			@include('reportes.balance.balance.empresa')
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
			   <div class="col-6 table-responsive">
				<table width="100%">
					<thead style="background-color: #E6E6E6">
						<th colspan="5">Ingreso por Ventas</th>							
					</thead>
					<thead style="background-color: #E6E6E6">
						<th>Cliente</th>
						<th>Documento</th>
						<th>Moneda</th>
						<th>Monto</th>								
						<th>Recibido</th>								
					</thead>
						@foreach ($cobranza as $q)
						<?php $countv++; $acummv=$acummv+$q->monto; ?>
				<tr>
				<td><small><small>{{$q->nombre}}</small></small></td>
				<td>{{$q->tipo_comprobante}}-{{$q->num_comprobante}}</td>
				<td>{{$q->idbanco}}</td>
				<td><?php echo number_format( ($q->monto), 2,',','.')." $"; ?></td>
				<td><?php echo number_format( ($q->recibido), 2,',','.'); ?></td>
				</tr>
				@endforeach
							<tr><td>Documentos: </td><td><?php echo "<b>".$countv."</b>"; ?></td>
							<td><strong>Total:</strong></td>
							<td><strong><?php echo number_format( $acummv, 2,',','.')." $"; ?></strong></td>
							</tr>
				</table></br>
				<!-- de las nd -->
				<table width="100%">
				<thead style="background-color: #E6E6E6">
						<th colspan="5">Ingresos por Notas de Debito</th>							
					</thead>
					<thead style="background-color: #E6E6E6">
						<th>Cliente</th>
						<th>Documento</th>
						<th>Moneda</th>
						<th>Monto</th>								
						<th>Recibido</th>								
					</thead>
						@foreach ($nd as $qn)
						<?php $countnd++; $acumnd=$acumnd+$qn->monto; ?>
				<tr>
				<td><small><small>{{$qn->nombre}}</small></small></td>
				<td>{{$qn->idnota}}-{{$qn->referencia}}</td>
				<td>{{$qn->idbanco}}</td>
				<td><?php echo number_format( ($qn->monto), 2,',','.')." $"; ?></td>
				<td><?php echo number_format( ($qn->recibido), 2,',','.'); ?></td>
				</tr>
				@endforeach
							<tr><td>Documentos: </td><td><?php echo "<b>".$countnd."</b>"; ?></td>
							<td><strong>Total:</strong></td>
							<td><strong><?php echo number_format( $acumnd, 2,',','.')." $"; ?></strong></td>
							</tr>
				</table></br>
					<table width="100%">
				<thead style="background-color: #E6E6E6">
						<th colspan="5">Ingresos por Apartados</th>							
					</thead>
					<thead style="background-color: #E6E6E6">
						<th>Cliente</th>
						<th>Documento</th>
						<th>Moneda</th>
						<th>Monto</th>								
						<th>Recibido</th>								
					</thead>
						@foreach ($apartado as $qa)
						<?php $counta++; $acumma=$acumma+$qa->monto; ?>
				<tr>
				<td><small><small>{{$qa->nombre}}</small></small></td>
				<td>{{$qa->tipo_comprobante}}-{{$qa->num_comprobante}}</td>
				<td>{{$qa->idbanco}}</td>
				<td><?php echo number_format( ($qa->monto), 2,',','.')." $"; ?></td>
				<td><?php echo number_format( ($qa->recibido), 2,',','.')." $"; ?></td>
				</tr>
				@endforeach
							<tr><td>Documentos: </td><td><?php echo "<b>".$counta."<b>"; ?></td>
							<td><strong>Total:</strong></td>
							<td><strong><?php echo number_format( $acumma, 2,',','.')." $"; ?></strong></td>
							</tr>
				</table></br>
			</div>
	<div class="col-6 table-responsive">
				<table width="100%">
				<thead style="background-color: #E6E6E6">
						<th colspan="5">Egresos por Compras</th>							
					</thead>
					<thead style="background-color: #E6E6E6">
						<th>Proveedor</th>
						<th>Documento</th>
						<th>Monedas</th>
						<th>Monto</th>								
						<th>Pagado</th>								
					</thead>
					@foreach ($pagos as $pa)
						<?php $countpa++; $acumpa=$acumpa+$pa->monto; ?>
				<tr>
				<td><small>{{$pa->nombre}}</small></td>
				<td>{{$pa->num_comprobante}}</td>
				<td>{{$pa->idbanco}}</td>
				<td><?php echo number_format( ($pa->monto), 2,',','.')." $"; ?></td>
				<td><?php echo number_format( ($pa->recibido), 2,',','.')." $"; ?></td>
				</tr>
				@endforeach
							<tr><td>Documentos: </td><td><?php echo "<b>".$countpa."</b>"; ?></td>
							<td><strong>Total:</strong></td>
							<td><strong><?php echo number_format( $acumpa, 2,',','.')." $"; ?></strong></td>
							</tr>
				</table></br>
				
				<table width="100%">
				<thead style="background-color: #E6E6E6">
						<th colspan="5">Egresos por Gastos</th>							
					</thead>
					<thead style="background-color: #E6E6E6">
						<th>Proveedor</th>
						<th>Documento</th>
						<th>Monedas</th>
						<th>Monto</th>								
						<th>Pagado</th>								
					</thead>
					@foreach ($gastos as $ga)
						<?php $countga++; $acumga=$acumga+$ga->monto; ?>
				<tr>
				<td><small>{{$ga->nombre}}</small></td>
				<td>{{$ga->referencia}}-{{$ga->documento}}</td>
				<td>{{$ga->idbanco}}</td>
				<td><?php echo number_format( ($ga->monto), 2,',','.')." $"; ?></td>
				<td><?php echo number_format( ($ga->recibido), 2,',','.')." $"; ?></td>
				</tr>
				@endforeach
							<tr><td>Documentos: </td><td><?php echo "<b>".$countga."</b>"; ?></td>
							<td><strong>Total:</strong></td>
							<td><strong><?php echo number_format( $acumga, 2,',','.')." $"; ?></strong></td>
							</tr>
				</table></br>
				<table width="100%">
				<thead style="background-color: #E6E6E6">
						<th colspan="5">Egresos por Notas de Debito a Proveedores</th>							
					</thead>
					<thead style="background-color: #E6E6E6">
						<th>Proveedor</th>
						<th>Documento</th>
						<th>Monedas</th>
						<th>Monto</th>								
						<th>Pagado</th>								
					</thead>
					@foreach ($pagond as $ndp)
						<?php $countndp++; $acumndp=$acumndp+$ndp->monto; ?>
				<tr>
				<td><small>{{$ndp->nombre}}</small></td>
				<td>{{$ndp->referencia}}-{{$ndp->documento}}</td>
				<td>{{$ndp->idbanco}}</td>
				<td><?php echo number_format( ($ndp->monto), 2,',','.')." $"; ?></td>
				<td><?php echo number_format( ($ndp->recibido), 2,',','.')." $"; ?></td>
				</tr>
				@endforeach
							<tr><td>Documentos: </td><td><?php echo "<b>".$countndp."</b>"; ?></td>
							<td><strong>Total:</strong></td>
							<td><strong><?php echo number_format( $acumndp, 2,',','.')." $"; ?></strong></td>
							</tr>
				</table></br>
			</div>
			</div>	
  <div class="col-12 table-responsive">
	<table width="100%">
      <thead>
          <tr><td colspan="3" align="center" style="background-color: #E6E6E6"> <strong>Distribucion de Ingresos</strong></td></tr>
		<th>Moneda</th>
		<th>Recibido</th>
		<th>Monto</th> </thead>
         @foreach ($ingresos as $cob) <?php $tcobro=$tcobro+$cob->monto;?>	
        <tr>
          <td><?php  echo$cob->idbanco; ?></td>
          <td><?php echo number_format($cob->recibido, 2,',','.'); ?></td>
          <td><?php  echo number_format($cob->monto, 2,',','.')." $"; ?></td>
        </tr>
        @endforeach
		    <tr><td colspan="2" align="center"><strong>Total Ingresos</strong></td><td><strong><?php echo number_format($tcobro, 2,',','.')." $"; ?></strong></td></tr>
      </table>
  </br>
	  </div>
 <div class="col-12 table-responsive">
	<table width="100%">
      <thead>
          <tr><td colspan="3" align="center" style="background-color: #E6E6E6"> <strong>Distribucion de Egresos</strong></td></tr>
		<th>Moneda</th>
		<th>Pagado</th>
		<th>Monto</th> </thead>
         @foreach ($desglosep as $cob) <?php $tpagos=$tpagos+$cob->monto;?>	
        <tr>
          <td><?php  echo$cob->idbanco; ?></td>
          <td><?php echo number_format($cob->recibido, 2,',','.'); ?></td>
          <td><?php  echo number_format($cob->monto, 2,',','.')." $"; ?></td>
        </tr>
        @endforeach
		    <tr><td colspan="2" align="center"><strong>Total Egresos</strong></td><td><strong><?php echo number_format($tpagos, 2,',','.')." $"; ?></strong></td></tr>
     
      </table>
	  </div>
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
  window.location="{{route('reportecxc')}}";
    });

});

</script>

@endpush
@endsection