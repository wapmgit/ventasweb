@extends ('layouts.master')
<?php $mostrar=0; ?>

@section ('contenido')
<?php $mostrar=1; ?>
<div class="row">
		@include('reportes.pedido.pedidoruta.search')
</div>


<?php $acum=0;$efe=0;$deb=0;$che=0;$tra=0;
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
			@include('reportes.pedido.pedidoruta.empresa')
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
			   <div class="col-12 table-responsive">
				<table width="100%">
					<thead style="background-color: #E6E6E6">
						<th>Fecha</th>
						<th>Cliente</th>
						<th>Cedula</th>
						<th>Direccion</th>
						<th>Monto</th>								
					</thead>
						<?php $total=0; $count=0; $mon=0; $cli=array();?>
							@foreach ($ventas as $cat)
							<?php $mon=$cat->total_venta;?>
							<tr>
								<td><small><?php echo date("d-m-Y",strtotime($cat->fecha_emi)); ?></small></td>
								<td><small>{{ $cat->nombre}}</small></td>
								<td>{{ $cat->cedula}}</td>
								<td>{{ $cat->direccion}}</td>
								<td>
								<?php $count++; $total=$total+$cat->total_venta; echo number_format( $cat->total_venta, 2,',','.')." $"; ?></td>
							</tr>
							@endforeach
							<tr><td colspan="2">Documentos: <?php echo $count; ?></td><td></td>
							<td><strong>Total:</strong></td>
							<td><strong><?php echo number_format( $total, 2,',','.')." $"; ?></strong></td>
							</tr>
				</table>
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
  window.location="{{route('pedidoruta')}}";
    });

});

</script>

@endpush
@endsection