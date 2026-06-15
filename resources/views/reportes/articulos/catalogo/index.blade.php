@extends ('layouts.master')
<?php $mostrar=0; ?>
@section ('contenido')
<?php $mostrar=1; ?>
<div class="row" id="search">
		@include('reportes.articulos.catalogo.search')
</div>           
<style> 
  .cabecera { background: linear-gradient(to bottom, #B3E5FC, #FAFAFA); padding: 8px; border-radius: 4px; }
  .pie { background: linear-gradient(to bottom, #FAFAFA, #B3E5FC); padding: 15px; margin-top: 20px; border-radius: 4px; }
  
  .bordeimagen {
    border: 1px solid #0D47A1;
    padding: 5px;
  }

  /* Contenedor de la tarjeta mejorado */
  .card-catalogo {
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.15);
    max-width: 100%; /* Que se adapte a la columna de Bootstrap */
    margin-bottom: 25px;
    text-align: center;
    font-family: arial;
    background-color: #fff;
    border-radius: 6px;
    overflow: hidden;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
   height: 425px; /* Altura fija para que TODAS las tarjetas queden perfectas */
    border: 1px solid #e0e0e0;
  }

  /* Contenedor de la imagen para que no se deforme */
  .card-img-container {
    height: 220px;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 10px;
    background-color: #f9f9f9;
  }

  .card-img-container img {
    max-height: 100%;
    max-width: 100%;
    object-fit: contain; /* Evita que la imagen se estire feo */
  }

  /* Control estricto de los títulos */
  .card-title-container {
    padding: 10px 12px;
  height: 85px; /* Aumentamos de 60px a 85px para dar espacio cómodo a 3 líneas */
  display: flex;
  align-items: center;
  justify-content: center;
  }

  .card-title-container h4 {
   margin: 0;
  font-size: 15px; /* Bajamos 1 punto el tamaño (de 16px a 15px) para que rinda más el espacio */
  font-weight: bold;
  color: #333;
  line-height: 1.3; /* Controla el espacio entre líneas */
  
  /* Ahora el navegador cortará a la tercera línea si es extremadamente largo */
  display: -webkit-box;
  -webkit-line-clamp: 3; /* Cambiado de 2 a 3 */
  -webkit-box-orient: vertical;  
  overflow: hidden;
  }

  /* Contenedor del precio abajo */
  .card-price-container {
    background: linear-gradient(to bottom, #B3E5FC, #FAFAFA);
    padding: 10px;
    border-top: 1px solid #B3E5FC;
  }

  .card-price-container h3 {
    margin: 0;
    font-size: 20px;
    color: #0D47A1;
    font-weight: bold;
  }
  /* Necesitamos que el contenedor de la imagen permita elementos flotantes */
.card-img-container {
  position: relative; /* Clave para el badge */
}

/* El diseño del Badge de Oferta */
.badge-oferta {
  position: absolute;
  top: 10px;
  left: 10px;
  background-color: #d32f2f; /* Rojo llamativo */
  color: white;
  padding: 4px 8px;
  font-size: 12px;
  font-weight: bold;
  text-transform: uppercase;
  border-radius: 4px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.2);
  z-index: 10;
}
</style> 

<div class="invoice p-6 mb-6">
  <div class="cabecera">
    <div class="row items-center">
      <div class="col-12">
        <h4 class="margin: 0;">
          <img src="{{asset('dist/img/iconosistema.png')}}" title="NKS" style="max-height: 30px; vertical-align: middle;"> 
          <span style="vertical-align: middle; font-weight: bold;">SysVent@s</span>
        </h4>
      </div>
    </div>
    <div class="row invoice-info">
      @include('reportes.articulos.catalogo.empresa')
    </div>
  </div>

  <hr size="2px" color="black" style="margin: 20px 0;" />

  <div class="row">
    @foreach($datos as $det)
      <div class="col-lg-3 col-md-4 col-sm-6 col-xs-6">
        <div class="card-catalogo">
          
          <div class="card-img-container">
			@if($det->oferta)
			<span class="badge-oferta">¡Oferta!</span>
			@endif
            <img src="{{ asset('/img/articulos/'.$det->imagen)}}" alt="{{$det->nombre}}">
          </div>
          
          <div class="card-title-container">
            <h4>{{ $det->nombre }}</h4>
          </div>
          
          <div class="card-price-container">
            <h3>${{ number_format($det->precio1, 2) }} <small style="font-size: 14px;">/ {{ $det->unidad }}</small></h3>
          </div>

        </div>
      </div>  
    @endforeach 
    
    <div class="col-12 pie">
      <div class="row align-items-center">
        <div class="col-md-6">
          <label style="margin: 0;"><strong>Usuario:</strong> {{ Auth::user()->name }}</label>  
        </div>
        <div class="col-md-6 text-right">
          <button type="button" id="imprimir" class="btn btn-primary btn-sm">
            <i class="fa fa-print"></i> Imprimir Catálogo
          </button> 
        </div>
      </div>
    </div>
  </div>               
</div>
             

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