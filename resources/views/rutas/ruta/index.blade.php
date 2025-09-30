@extends ('layouts.master')
@section ('contenido')
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h3>Rutas <a href="{{route('newruta')}}"><button class="btn btn-primary btn-sm">Nuevo</button></a></h3>
		@include('rutas.ruta.search')
	</div>
</div>
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-condensed table-hover">
				<thead>
					<th>Id</th>
					<th>Nombre</th>
					<th>Descripción</th>
					<th>Opciones</th>
				</thead>
               @foreach ($rutas as $cat)
				<tr>
					<td>{{ $cat->idruta}}</td>
					<td>{{ $cat->nombre}}</td>
					<td>{{ $cat->descripcion}}</td>
					<td>
						<a href="{{route('editruta',['id'=>$cat->idruta])}}"><button class="btn btn-warning btn-sm">Editar</button></a>
                        <a href="{{route('showruta',['id'=>$cat->idruta])}}"><button class="btn btn-success btn-sm">Ver Clientes</button></a>
					</td>
				</tr>
				
				@endforeach
			</table>
		</div>
	
	</div>
</div>
@endsection