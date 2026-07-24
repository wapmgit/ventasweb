@extends ('layouts.master')
<?php $mostrar=0; ?>
@section ('contenido')
<?php $mostrar=1; ?>
         
<div class="row" id="search">
		@include('reportes.articulos.catalogo.search')
</div>           
  <style>  
   .cabecera { background: linear-gradient(to bottom, #B3E5FC, #FAFAFA); padding: 2px;}
   .pie { background: linear-gradient(to bottom,  #FAFAFA, #B3E5FC); padding: 2px;}
.bordeimagen{
border:1px solid #0D47A1;
padding:5px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 310px;
  margin: auto;
  text-align: center;
  font-family: arial;
  container-type: inline-size;
}
.cardp {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 310px;
  margin: auto;
  text-align: center;
  font-family: arial;
}
.price {
  color: grey;
  font-size: 22px;
}

.card button {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;
}

.card button:hover {
  opacity: 0.7;
}
.titulo-producto {
  /* clamp(tamaño_mínimo, tamaño_fluido, tamaño_máximo) */
  font-size: clamp(0.75rem, 4cqw, 1.1rem);
  line-height: 1.2;
  font-weight: bold;
  
  /* Límite de 2 líneas con puntos suspensivos */
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
  min-height: 2.4em; /* Asegura espacio uniforme para 2 líneas */
}
  </style> 
 <!-- Main content -->
            <div class="invoice p-6 mb-6">
              <!-- title row -->
			  <div class="cabecera">
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
              <div class="row invoice-info" >
			@include('reportes.articulos.catalogo.empresa')
              </div>
			  </div>
              <!-- /.row -->

<hr size="2px" color="black" />
              <!-- Table row -->
	<div class="row">
			
	@foreach($datos as $det)
		<!-- Agregamos mb-4 aquí para dar espacio vertical entre filas de tarjetas -->
		<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6 mb-4">
			<div class="card p-2 h-100 d-flex flex-column justify-content-between">
				
				<!-- Imagen adaptativa para que no rompa el diseño -->
				<div style="height: 190px; display: flex; align-items: center; justify-content: center; overflow: hidden;">
					<img src="{{ asset('/img/articulos/'.$det->imagen)}}" alt="{{$det->nombre}}" class="img-fluid" style="max-height: 100%; object-fit: contain;">
				</div>

				<!-- Título unificado con control de líneas -->
				<div class="px-2 my-2">
					<h6 class="titulo-producto m-0" title="{{$det->nombre}}">{{$det->nombre}}</h6>
				</div>

				<!-- Precio -->
				<div class="cardp card-dark cabecera p-2 mt-auto">
					<h3 class="m-0 font-weight-bold" style="font-size: 1.2rem;">$ {{$det->precio1}} <small>{{$det->unidad}}</small></h3>
				</div>

			</div>
		</div>  
	@endforeach	
	
        
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 pie">
	<hr size="2px" color="black" />
		<label>Usuario: </label>  {{ Auth::user()->name }}  
			<div class="form-group" align="center">
				<button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button> 
			</div>
	</div>
    </div>                
<!-- /.box-body -->

</div><!-- /.box -->
             
@push ('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
  document.getElementById('imprimir').style.display="none";
  window.print(); 
  window.location="{{route('catalogo')}}";
    });
    $('#remove').click(function(){
  document.getElementById('search').style.display="none";
    });
});
</script>
@endpush
@endsection