@extends ('layouts.master')
@section ('contenido')
<div class="row">
@include('almacen.articulo.empresa')
</div>
<div class="row" id="principal">
	<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
		<h3> Articulos 
		@if($rol->newarticulo==1)<a href="{{route('newarticulo')}}"><button class="btn btn-primary btn-sm">Nuevo</button></a>@endif</h3>
		@include('almacen.articulo.search')
	</div>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4" align="right">
 @if($rol->web==1)<a href="{{route('send-articles')}}" title="Sincronizar Articulos"><button class="btn btn-info btn-sm" id="btn"><i class="fa fa-fw fa-cloud-upload"></i></button></a>@endif
	</div>
</div>
<div class="row"  id="imgcarga"  style="display:none">
<div  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">  
<img src="{{asset('dist/img/loading.gif')}}"  width="120"></div>
</div>
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="table-responsive">
			<table id="articulostable" class="table table-striped table-bordered table-condensed table-hover">
				<thead>			
					<th>Codigo</th>
					<th>Nombre</th>					
					<th>Grupo</th>
					<th>stock</th>
					<th>Imagen</th>
					<th>$</th>
					<th>BS.</th>
					<th>Opciones</th>
				</thead>
               @foreach ($articulos as $cat)
				<tr>
					
					<td><small><small>{{ $cat->codigo}}</small></small></td>
					<td><a href="{{route('showarticulo',['id'=>$cat->idarticulo])}}"><i class="fa fa-fw fa-line-chart"></i> 
					</a><small><?php //echo substr( $cat->nombre, 0, 40 ); ?>{{$cat->nombre}}</small></td>					
					<td><small><small>{{ $cat->categoria}}</small></small></td>
					<td><small>{{ $cat->stock}}</small></td>
						<td  > <?php if ($cat->imagen==""){?> <img src="{{ asset('/img/articulos/ninguna.jpg')}}" alt="{{$cat->nombre}}" height="20px" width="20px" class="img-thumbnail"><?php }else{ ?><img src="{{ asset('/img/articulos/'.$cat->imagen)}}" alt="{{$cat->nombre}}" height="15px" width="30px" class="img-thumbnail"><?php } ?> </td>
					<td><small><?php echo number_format($cat->precio1, 2,',','.'); ?></small></td>
					<td><small><?php echo number_format(($cat->precio1*$empresa->tc), 2,',','.'); ?></small></td>
					<td>
						

						
						                                         
				<div class="btn-group">
                    <button type="button" class="btn btn-primary btn-xs">Opc.</button>
                    <button type="button" class="btn btn-primary dropdown-toggle btn-xs" data-toggle="dropdown">
                      <span class="sr-only"></span>
                    </button>
                    <div class="dropdown-menu" role="menu">
					
				<div class="color-palette-set">			
                 @if($rol->editarticulo==1) <div class="bg-warning color-palette" align="center"><a  href="{{route('editarticulo',['id'=>$cat->idarticulo])}}">Editar</a></div>	@endif
                  <div class="bg-danger color-palette" align="center">	<a  href=""  data-target="#modal-delete-{{$cat->idarticulo}}" data-toggle="modal">Alta</a></div>
                  <div class="bg-success color-palette" align="center"><a  href="{{route('kardexarticulo',['id'=>$cat->idarticulo])}}"> kardex</a> </div>
                </div> 						
				
				
					
			                  
				   </div>
                  </div>
				</td>
				</tr>
				@include('almacen.articulo.modal')
				@endforeach
			</table>
		</div>
				{!!$articulos->links() !!}
	</div>
</div>
@push ('scripts')
<script>
$(document).ready(function(){
	const cuerpoDelDocumento = document.body;
	cuerpoDelDocumento.onload = miFuncion;
	function miFuncion() {
		// alert('La página terminó de cargar');
  	document.getElementById('imgcarga').style.display="none"; 
	document.getElementById('principal').style.display=""; 
	} 

	$("#btn").click(function(){
		document.getElementById('imgcarga').style.display=""; 
		document.getElementById('principal').style.display="none"; 
	})
	
	$(function () {
    $("#articulostable").DataTable({
		"searching": false,
		"bPaginate": false,
		"bInfo":false,
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
    }).buttons().container().appendTo('#articulostable_wrapper .col-md-6:eq(0)');

  });
});


</script>
@endpush
@endsection