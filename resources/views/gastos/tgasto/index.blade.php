@extends ('layouts.master')
@section ('contenido')
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h3>Tipo de Gastos <a href="{{route('newtgasto')}}"><button class="btn btn-primary btn-sm">Nuevo</button></a></h3>
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

					<th>Opciones</th>
				</thead>
               @foreach ($data as $cat)
				<tr>
					<td>{{ $cat->idgasto}}</td>
					<td>{{ $cat->nombregasto}}</td>

					<td>
						<a href="{{route('edittgasto',['id'=>$cat->idgasto])}}"><button class="btn btn-warning btn-sm">Editar</button></a>
                        
					</td>
				</tr>
				
				@endforeach
			</table>
		</div>
	
	</div>
</div>
@endsection