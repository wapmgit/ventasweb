@extends ('layouts.master')
<?php $mostrar=0; ?>
@section ('contenido')
<?php $mostrar=1; ?>
<div class="row" >
		@include('pedidoshein.cobranza.search')
</div>

<?php $acum=0;$tcobranza=0;$deb=0;$che=0;$tra=$tventas=$tingnd=0;$acumnc=0;$tapart=0;
$cefe=0;?>
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
			@include('pedidoshein.cobranza.empresa')
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
			   <div class="col-12 table-responsive">
				<table width="100%">
					<thead style="background-color: #E6E6E6" >
						<th id="campo">Recibo</th>
						<th>Cliente</th>
						<th>Pedido</th>
						<th>Moneda</th>
						<th>Recibido</th>
						<th>Monto</th>
						<th>Referencia</th>
						<th>Fecha</th>
						<th>Fecha Recibo.</th>
					</thead>
					@foreach ($cobranza as $cob)
					<?php  $tcobranza=$tcobranza+$cob->monto;?> 		 
					<tr>
						<td><?php if ($cob->monto>0){?>
							<a href="" data-target="#modal-delete-{{$cob->idrecibo}}" data-toggle="modal" ><button class="btn btn-danger btn-xs" >X</button></a>	
							<?php } ?>
						{{$cob->idrecibo}}</td>
						<td><small>{{$cob->nombre}}</small></td>
						<td>{{$cob->tipo_comprobante}}-{{$cob->num_comprobante}}</td>
						<td><small><?php  echo $cob->idbanco; ?></small></td>
						<td><?php echo number_format($cob->recibido, 2,',','.'); if(date("d-m-Y",strtotime($cob->fecharecibo)) != date("d-m-Y",strtotime($cob->fecha))){ echo "*"; } ?></td>
						<td><?php  echo number_format($cob->monto, 2,',','.')." $"; ?></td>
						<td><small>{{$cob->referencia}}</small></td>
						<td><small><?php echo date("d-m-Y h:i:s a",strtotime($cob->fecha)); ?></small></td>
						<td><?php echo date("d-m-Y",strtotime($cob->fecharecibo)); ?></td>
					</tr>
					@include('reportes.ventas.cobranza.modal')
					<tr> 
					@endforeach
					<tr>    
						<td colspan="5"><strong>Total Ingresos Cobranza</strong></td><td colspan="3"><strong><?php  echo number_format($tcobranza, 2,',','.'); ?> $</strong></td></tr>
				</table><br>
		    
			</div>
		<div class="col-lg-8 col-md-8 col-sm-6 col-xs-12"><h5 align="center">Desglose de Ingresos</h5>
	    <table width="100%">
			<thead style="background-color: #E6E6E6" >
				<th>Moneda</th>
				<th>Recibido</th>
				<th>Monto</th>
			</thead>
				@foreach ($comprobante as $co)
			<?php  $tventas=$tventas+$co->mmonto;?> 	
				<tr>
				<td>{{$co->idbanco}}</td>
				<td><?php echo number_format($co->mrecibido, 2,',','.'); ?></td>
				<td><?php  echo number_format($co->mmonto, 2,',','.')." $"; ?></td>
				</tr>
				@endforeach	  
					<tr>    
						<td colspan="2"><strong>Total</strong></td><td><strong><?php  echo number_format($tventas, 2,',','.'); ?> $</strong></td></tr>		  		
		</table> 
	  </div>

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 		       
		<label>Usuario: </label>  {{ Auth::user()->name }}  
				<div class="form-group" align="center">
				<button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button> 
				</div>

		</div><!-- /.box-body -->
</div><!-- /.box -->
    </div>        
@push ('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
  //  alert ('si');
  document.getElementById('imprimir').style.display="none";
  window.print(); 
  window.location="{{route('detalleingresoshein')}}";
    });
});

</script>
@endpush
@endsection