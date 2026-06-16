@extends ('layouts.master')
@section ('contenido')
<?php $cntvend=count($vendedores); ?>
<?php $cntrut=count($rutas); ?>
	<div class="row">
		<h3>Nuevo Cliente</h3> <?php if($cntvend==0){ echo "<P class='text-danger'><span class='text-danger'>Debe Registrar Vendedor¡¡</span></p>";} ?>
		 <?php if($cntrut==0){ echo "<P class='text-danger'><span class='text-danger'>Debe Registrar Ruta¡¡</span></p>";} ?>
		<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">			
			<form action="{{route('guardarcliente')}}" id="formulario" method="POST" enctype="multipart/form-data" >         
			{{csrf_field()}}
            <div class="form-group">
            	<label for="nombre">Nombre</label>
            	<input type="text" name="nombre" class="form-control" value="{{old('nombre')}}" onchange="conMayusculas(this)" placeholder="Nombre...">
				@if($errors->first('nombre'))<P class='text-danger'>{{$errors->first('nombre')}}</p>@endif
            </div>
		</div>
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">			
            <div class="form-group">
            	<label for="descripcion">Cedula</label>
            	<input type="text" name="cedula" id="vidcedula" onchange="conMayusculas(this)"  value="{{old('cedula')}}" class="form-control" maxlength="10" placeholder="V000000">
					@if($errors->first('cedula'))<P class='text-danger'>{{$errors->first('cedula')}}</p>@endif
            </div>
		</div>	
		<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">					
            <div class="form-group">
            	<label for="rif" id="prif" title="Pasar Cedula">Rif</label>
            	<input type="text" name="rif" id="rif" value="{{old('rif')}}" onchange="conMayusculas(this)"  class="form-control" maxlength="12" placeholder="V000000-0">
					@if($errors->first('rif'))<P class='text-danger'>{{$errors->first('rif')}}</p>@endif
            </div>
		</div>	
				<div class="col-lg-1 col-md- col-sm-6 col-xs-6">		
           <div class="form-group">
		     <label for="tipo_cliente" >Codigo Pais</label>
				<input type="text" name="codpais" class="form-control" value="{{old('codpais')}}" placeholder="+58">
		   @if($errors->first('codpais'))<P class='text-danger'>{{$errors->first('codpais')}}</p>@endif
		   </div>
		</div>
			<div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">				
            <div class="form-group"> 
			<label for="tipo_cliente" >Telefono</label>
      <div class="input-group">
	  
                    <div class="input-group-prepend">
                      <span class="input-group-text"><i class="fas fa-phone"></i></span>
                    </div>
                    <input type="text" name="telefono" value="{{old('telefono')}}" class="form-control" data-inputmask='"mask": "(999) 999-9999"' data-mask>
                  @if($errors->first('telefono'))<P class='text-danger'>{{$errors->first('telefono')}}</p>@endif
				  </div>
            </div>
		</div>
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
           <div class="form-group">
             <label for="categoria">Categoria Comercial</label>
				<select name="categoria" class="form-control">
            				@foreach ($categoria as $cat)
            				<option value="{{$cat->idcategoria}}">{{$cat->nombrecategoria}}</option>
            				@endforeach
            			</select>
           </div>
		   </div>

		<div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">			
             <div class="form-group">
             <label for="direccion">Direccion <a href="" data-target="#modaldireccion" data-toggle="modal"><button class="btn btn-primary btn-xs">+</button></a></label>
            <input type="text" name="direccion" class="form-control" value="{{old('direccion')}}" placeholder="Direccion...">
            @if($errors->first('direccion'))<P class='text-danger'>{{$errors->first('direccion')}}</p>@endif
		   </div>
		</div>
		      <div class="col-lg-2 col-sm-2 col-md-2 col-xs-12">
            	 <div class="form-group"> <label for="tipo_cliente" >Imagen</label>
            			  <div class="custom-file">
                      <input type="file" name="imagen" class="custom-file-input" id="customFile">
                      <label class="custom-file-label" for="customFile">Cargar</label>
                    </div>
            		</div>
            </div>
		 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">	
           <div class="form-group">
             <label for="tipo_cliente" >Tipo cliente</label>
			<select name="tipo_cliente" id="tipo_cliente" class="form-control">
                           <option value="1" selected>Contado</option>
                           <option value="0">Credito</option>                         
            </select>
           </div>
		</div>
			 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">	
           <div class="form-group">
				<label for="tipo_precio">Dias Credito </label><br>
				  <input type="number" name="diascre"  id="diascre"  value="0" class="form-control">

           </div>
		</div>
			 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
           <div class="form-group">
				<label for="tipo_precio">Limite Credito </label><br>
				  <input type="number" name="limitcre"  id="limitcre"  value="0" class="form-control">

           </div>
		</div>
		 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">		
           <div class="form-group">
				<label for="tipo_precio">Tipo de Precio </label><br>
				<label for="precio1"> P 1 </label> <input name="precio" type="radio" value="1" checked="checked">
				<label for="precio2"> P 2 </label> <input name="precio" type="radio" value="2">
				<label for="precio2"> P 3 </label> <input name="precio" type="radio" value="3">
           </div>
		</div>

		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">	
		   	   <div class="form-group">
            			<label for="tipo_precio">Vendedor </label><br>
            			<select name="idvendedor" class="form-control">
            				@foreach ($vendedores as $cat)
            				<option value="{{$cat->id_vendedor}}">{{$cat->nombre}}</option>
            				@endforeach
            			</select>           			
            		</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">			
		   <div class="form-group">
            			<label >Ruta</label>
            			<select name="idruta" class="form-control">
            				@foreach ($rutas as $dat)
            				<option  value="{{$dat->idruta}}">{{$dat->nombre}}</option>
            				@endforeach
            			</select>
            			
            		</div>
	</div>
		<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
           <div class="form-group">
             <label for="tipo_precio">Agente Retencion</label><br>
			<label for="precio1"> Si </label> <input name="agente" id="arsi" type="radio" value="1">
		    <label for="precio1"> No </label> <input name="agente" checked="checked" id="arno"  type="radio" value="0" >
           </div>
		   </div>
	<div class="col-lg-1 col-md-1 col-sm-1 col-xs-12">
           <div class="form-group">
             <label for="tipo_precio">% Ret.</label><br>
      <input type="number"  step="1" class="form-control" disabled id="retencion" name="retencion" >
           </div>
		   </div>
		   		<div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">		
           <div class="form-group">
		     <label for="tipo_cliente" >Licencia</label>
				<input type="text" name="licencia" class="form-control" value="{{old('licencia')}}" placeholder="Licencia...">
           </div>
		</div>
	<div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">		
           <div class="form-group">
		     <label for="tipo_cliente" >Contacto</label>
				<input type="text" name="contacto" class="form-control" value="{{old('contacto')}}" placeholder="Persona...">
           </div>
		</div>
			<div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">		
           <div class="form-group">
		     <label for="tipo_cliente" >Tel. Contacto</label>
				<input type="text" name="telcontacto" class="form-control" value="{{old('telcontacto')}}" placeholder="Telefono...">
           </div>
		</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center" id="divmapa">
		<link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
		<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

			<div class="card">
			<div class="card-header d-flex justify-content-between align-items-center">
					<h5 class="mb-0">Ubicación para el despacho</h5>
					<button type="button" id="btn-toggle-mapa" class="btn btn-sm btn-outline-secondary">
						Ocultar Mapa
					</button> <button type="button" id="btn-toggle-mapaon" class="btn btn-sm btn-outline-secondary">
						Ver Mapa
					</button>
				</div>
				<div class="card-body">
				<div id="contenedor-mapa">
				<p class="text-muted small mt-1">Puedes arrastrar el marcador azul hasta tu dirección exacta.</p>
					<div id="map" style="height: 350px; width: 100%; border-radius: 8px;"></div>
						<input type="text" name="latitud" class="form-control" readonly  id="latitud">
						<input type="text" name="longitud" class="form-control" readonly   id="longitud">
				</div>
				</div>
			</div>
</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">	
            <div class="form-group">
				<button class="btn btn-danger btn-sm" type="reset" id="btncancelar">Cancelar</button>
            	<button class="btn btn-primary btn-sm" <?php if($cntvend==0){ echo "style='display: none'"; }?> type="button" id="btnguardar">Guardar</button>
			    <div style="display: none" id="loading">  <img src="{{asset('img/sistema/loading30.gif')}}"></div>
            </div>	
</div>		
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">		
@include('clientes.cliente.modaldireccion')
</div>	
		</form>       
	</div>
@endsection
@push('scripts')
	<script>
		let defaultLat = 8.5980; 
		let defaultLng = -71.1442;

    // Inicializar el mapa de Leaflet apuntando al mapa libre de OpenStreetMap
    const map = L.map('map').setView([defaultLat, defaultLng], 14);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© OpenStreetMap contributors'
    }).addTo(map);

    // Crear un marcador arrastrable
    let marker = L.marker([defaultLat, defaultLng], { draggable: true }).addTo(map);

    // Función para actualizar los inputs ocultos del formulario
    function actualizarInputs(lat, lng) {
        document.getElementById('latitud').value = lat;
        document.getElementById('longitud').value = lng;
    }

    // Intentar obtener la ubicación real del cliente mediante el navegador
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            let userLat = position.coords.latitude;
            let userLng = position.coords.longitude;

            map.setView([userLat, userLng], 16);
            marker.setLatLng([userLat, userLng]);
            actualizarInputs(userLat, userLng);
        }, function(error) {
            // Si el usuario niega el permiso, se queda con la ubicación por defecto
            actualizarInputs(defaultLat, defaultLng);
        });
    } else {
        actualizarInputs(defaultLat, defaultLng);
    }

    // Evento por si el cliente arrastra el marcador manualmente para ser más preciso
    marker.on('dragend', function (e) {
        let coords = e.target.getLatLng();
        actualizarInputs(coords.lat, coords.lng);
    });
	
	    $('[data-mask]').inputmask()
	$(document).ready(function(){
		document.getElementById('btn-toggle-mapa').style.display="none"; 
		document.getElementById('contenedor-mapa').style.display="none"; 
			$("#diascre").attr("readonly",true); 
			$("#limitcre").attr("readonly",true); 
		$("#vidcedula").on("change",function(){
         var form2= $('#formulario');
        var url2 = '{{route("validarcliente")}}';
        var data2 = form2.serialize();
			$.post(url2,data2,function(result2){  
		var resultado2=result2;
         console.log(resultado2); 
         rows=resultado2.length; 
			if (rows > 0){
            var nombre=resultado2[0].nombre;
			var cedula=resultado2[0].cedula; 
			var rif=resultado2[0].telefono;  
			alert ('Numero de identificacion ya existe, Nombre: '+nombre+' Cedula: '+cedula+' telefono: '+rif);   
           $("#vidcedula").val("");
           $("#vidcedula").focus();
			}    
          });
     });
	 		$("#tipo_cliente").on("change",function(){			
			  var valor= $("#tipo_cliente").val();
			  if(valor==0){ $("#diascre").attr("readonly",false); 
			  $("#limitcre").attr("readonly",false); 
			  $("#diascre").val(5); }
			  else { $("#diascre").attr("readonly",true);
			    $("#limitcre").attr("readonly",true); 
				$("#diascre").val(0);
				$("#limitcre").val(0);
			  }
				 });
	  $('#btnguardar').click(function(){   
		document.getElementById('loading').style.display=""; 
		document.getElementById('btnguardar').style.display="none"; 
		document.getElementById('btncancelar').style.display="none"; 
		document.getElementById('formulario').submit(); 
    })
		$("#arsi").on("click",function(){	
		$("#retencion").val("75");
		$("#retencion").attr("disabled",false); 
	});
	$("#arno").on("click",function(){	
		$("#retencion").val(""); 
		$("#retencion").attr("disabled",true); 
	});

		  $('#prif').click(function(){ 
		  $("#rif").val($("#vidcedula").val());
		});		
$("#btn-toggle-mapa").click(function(){ 
document.getElementById('contenedor-mapa').style.display="none"; 
document.getElementById('btn-toggle-mapa').style.display="none"; 
document.getElementById('btn-toggle-mapaon').style.display=""; 
	 })
	 $("#btn-toggle-mapaon").click(function(){ 
document.getElementById('contenedor-mapa').style.display=""; 
document.getElementById('btn-toggle-mapa').style.display=""; 
document.getElementById('btn-toggle-mapaon').style.display="none"; 
	 })		
	
			 });
			 function conMayusculas(field) {
            field.value = field.value.toUpperCase()
}
				</script>
			@endpush