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
  max-width: 300px;
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
			  <?php
$numero = 123;
$longitud = 30; // La longitud deseada, incluyendo los ceros a la izquierda
$relleno = "."; // El carácter con el que se rellenará

//$numero_con_ceros = str_pad($numero, $longitud, $relleno, STR_PAD_LEFT);

//echo $numero_con_ceros; // Salida: 00123
?>
<hr size="2px" color="black" />
              <!-- Table row -->
	<div class="row">
			
	@foreach($datos as $det)
	<?php $cnt=strlen($det->nombre);if($cnt < 25){$ajuste="</br>"; }else{$ajuste="";} ?>
		<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6" >
			<div class="card">
			<img align="center" src="{{ asset('/img/articulos/'.$det->imagen)}}" alt="{{$det->nombre}}" height="250px" width="250px">
			<?php if($cnt < 31 ){?>
			<h4>{{str_pad($det->nombre,$longitud, $relleno, STR_PAD_RIGHT)}}</h4>
			<?php } ?>
			<?php if($cnt > 30 ){?>
			<h6>{{$det->nombre}}</h6>
			<?php } ?>
			<p></p>
			<p>			<div class="card card-dark cabecera"><h3>$ {{$det->precio1}} {{$det->unidad}} </h3></div></p>
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