@extends ('layouts.master')
@section ('contenido')
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h3>Campañas <a href="{{route('newcampana')}}"><button class="btn btn-primary btn-sm">Nuevo</button></a></h3>
		@include('pedidoshein.campana.search')
	</div>
</div>
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-condensed table-hover">
				<thead>
					<th>Id</th>
					<th>Codigo</th>
					<th>Proveedor</th>
					<th>Creado</th>
					<th>Cierre</th>
					<th>Costo</th>
					<th>Estatus</th>
					<th>Opciones</th>
				</thead>
               @foreach ($data as $cat)
				<tr>
					<td>{{ $cat->id}}</td>
					<td>{{ $cat->codigo}}</td>
					<td>{{ $cat->nombre}}</td>
					<td>{{ $cat->creado}}</td>
					<td>{{ $cat->cierre}}</td>
					<td>{{ $cat->costo}}</td>
					<td>
					@php if($cat->estatus==0){ echo "Activa"; }
						if($cat->estatus==1){ echo "Cerrada"; }
						if($cat->estatus==2){ echo "Anulada"; } @endphp 
					</td>
					<td>
						<a href="{{route('editcategoria',['id'=>$cat->id])}}"><button class="btn btn-warning btn-sm">Editar</button></a>
                        <a href="{{route('showcampana',['id'=>$cat->id])}}"><button class="btn btn-success btn-sm">Ver articulos</button></a>
					</td>
				</tr>
				
				@endforeach
			</table>
		</div>
		{{$data->render()}}
	</div>
</div>
@endsection