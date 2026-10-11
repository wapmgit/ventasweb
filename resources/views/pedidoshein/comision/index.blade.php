@extends ('layouts.master')
@section ('contenido')
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h3>Pago Comisiones</h3>
		@include('pedidoshein.comision.search')
	</div>
</div>
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-condensed table-hover">
				<thead>
					<th>Id</th>
					<th>Vendedor</th>
					<th>Campaña</th>
					<th>Fecha</th>
					<th>Monto</th>
					<th>Saldo</th>
					<th>Opciones</th>
				</thead>
               @foreach ($data as $cat)
				<tr>
					<td>{{ $cat->idcomision}}</td>
					<td>{{ $cat->nombre}}</td>
					<td>{{ $cat->codigo}}</td>
					<td>{{ $cat->fecha}}</td>
					<td>{{ $cat->montocomision}}</td>
					<td>{{ $cat->pendiente}}</td>
					<td>
                        <a href="{{route('showcomishein',['id'=>$cat->idcomision])}}">
						<button class="btn btn-<?php  if($cat->pendiente==0){ echo 'success';}else{ echo 'info'; } ?> btn-sm">@php if($cat->pendiente==0) { echo "Detalle";}else{ echo "Abono"; }  @endphp</button></a>						
					</td>
				</tr>
				
				@endforeach
			</table>
		</div>
		{{$data->render()}}
	</div>
</div>
@endsection