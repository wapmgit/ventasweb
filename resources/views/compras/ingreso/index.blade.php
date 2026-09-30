@extends ('layouts.master')
@section ('contenido')
@include('almacen.articulo.empresa')
	<div class="row">
		<h3>Compras 
		@if($rol->crearcompra==1)<a href="{{route('newcompra')}}"><button class="btn btn-primary btn-sm">Nuevo</button></a>@endif</h3>
		@include('compras.ingreso.search')
</div>
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="table-responsive">
			<table  id="comprastable" class="table table-bordered table-striped">
				<thead>	<tr>		
					<th>Emision</th>
					<th>Recepcion</th>
					<th>Proveedor</th>
					<th>Documento</th>
					<th>Monto</th>
					<th>Estado</th>
					<th>Opciones</th></tr>
				</thead>
				<tbody>
               @foreach ($ingresos as $ing)
				<?php $status=$ing->estatus;				
					$newdate=date("d-m-Y",strtotime($ing->fecha_hora));
					$emi=date("d-m-Y",strtotime($ing->emision));
				 ?>
				<tr>
					<td><small><?php echo $emi; ?></small></td>
					<td><small><?php echo $newdate; ?></small></td>
					<td><small>{{ $ing->nombre}}</small></td>
					<td> <?php if(($ing->tipo_comprobante=="N/E")and ($status=="0")){?>
					@if($rol->importarne==1)<a  href="{{route('importarne',['id'=>$ing->idingreso])}}"><b> {{ $ing->tipo_comprobante}}</b></a>@else  {{ $ing->tipo_comprobante}} @endif
					:{{$ing->serie_comprobante}}-{{$ing->num_comprobante}}<?php }else{ ?>
					{{ $ing->tipo_comprobante.':'.$ing->serie_comprobante.'-'.$ing->num_comprobante}}<?php } ?></td>
					<td><?php echo number_format( $ing->total, 2,',','.'); ?></td>
					<td><small>{{ $ing->estado}}</small></td>			
				<td class="text-center align-middle">
					@php $direccion = $ing->idingreso . "-1"; @endphp

					<div class="dropdown">
						<button class="btn btn-sm btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
							Acciones
						</button>
						<div class="dropdown-menu dropdown-menu-right">
							<a class="dropdown-item text-info" href="{{ route('showcompra', ['id' => $direccion]) }}">
								<i class="fa fa-eye mr-2"></i> Ver Detalles
							</a>
							<a class="dropdown-item text-secondary" href="{{ route('etiquetascompra', ['id' => $ing->idingreso]) }}">
								<i class="fa fa-tag mr-2"></i> Etiquetas
							</a>
							<div class="dropdown-divider"></div>
							@if($status == "0")
								@if($rol->anularcompra == 1)
									<a class="dropdown-item text-danger" href="" data-target="#modal-delete-{{ $ing->idingreso }}" data-toggle="modal">
										<i class="fa fa-ban mr-2"></i> Anular Compra
									</a>
								@endif
							@else
								<span class="dropdown-item text-muted disabled">
									<i class="fa fa-exclamation-circle mr-2"></i> Compra Anulada
								</span>
							@endif
						</div>
					</div>
				</td>
				</tr>		
				@include('compras.ingreso.modal')
				@endforeach
				</tbody>		
				<tfoot>	<tr>		
					<th>Emision</th>
					<th>Recepcion</th>
					<th>Proveedor</th>
					<th>Documento</th>
					<th>Monto</th>
					<th>Condicion</th>
					<th>Opciones</th></tr>
				</tfoot>
			</table>
		</div>
		{!!$ingresos->links() !!}
	</div>
</div>
@push ('scripts')
<script>
$(document).ready(function(){
	$(function () {
    $("#comprastable").DataTable({
		"bSort" : false,
		"order":[0,'desc'],
		"searching": true,
		"bPaginate": false,
		"bInfo":false,
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#comprastable_wrapper .col-md-6:eq(0)');

  });
   $('#btn-anul').click(function(){
		document.getElementById('btn-anul').style.display="none"; 
			});
});
</script>
@endpush
@endsection
