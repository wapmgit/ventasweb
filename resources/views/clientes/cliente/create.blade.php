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
            	<input type="text" name="nombre" id="nombre" class="form-control" value="{{old('nombre')}}" onchange="conMayusculas(this)" placeholder="Nombre...">
				@if($errors->first('nombre'))<P class='text-danger'>{{$errors->first('nombre')}}</p>@endif
            </div>
		</div>
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">			
            <div class="form-group">
            	<label for="descripcion">Cedula  <span class="input-group-btn">
    <button
        type="button"
        class="btn btn-default btn-sm seniat-btn-compact"
        title="Validar en SENIAT"
        onclick="abrirModalSeniat('#vidcedula', '#nombre');">
        <i class="fa fa-check-circle text-info"></i>
        <span style="font-size: 11px; font-weight: 600; margin-left: 3px;">SENIAT</span>
    </button>
</span></label>
            	<input type="text" name="cedula" id="vidcedula" onchange="conMayusculas(this)"  value="{{old('cedula')}}" class="form-control" maxlength="10" placeholder="000000">
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
			<div class="col-lg-1 col-md-1 col-sm-1 col-xs-6">
           <div class="form-group">
				<label for="tipo_precio">Limite Cre.</label><br>
				  <input type="number" name="limitcre"  id="limitcre"  value="0" class="form-control">

           </div>
		</div>
		<div class="col-lg-1 col-md-1 col-sm-1 col-xs-6">
           <div class="form-group">
             <label for="tipo_precio">Recargo</label><br>
     			<label for="recargo"> Si </label> <input name="recargo"  type="radio" value="1">
		    <label for="recargo"> No </label> <input name="recargo" type="radio" value="0" >
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

		<div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">		
		   	   <div class="form-group">
            			<label for="tipo_precio">Vendedor </label><br>
            			<select name="idvendedor" class="form-control">
            				@foreach ($vendedores as $cat)
            				<option value="{{$cat->id_vendedor}}">{{$cat->nombre}}</option>
            				@endforeach
            			</select>           			
            		</div>
		</div>
		   	<div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
           <div class="form-group">
		     <label for="tipo_cliente" >Licencia</label>
<input type="text" name="licencia" class="form-control" value="" placeholder="Licencia...">
           </div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">			
		   <div class="form-group">
            			<label >Ruta</label>
            			<select name="idruta" id="idruta" class="form-control">
            				@foreach ($rutas as $dat)
            				<option  value="{{$dat->idruta}}">{{$dat->nombre}}</option>
            				@endforeach
            			</select>
            			
            		</div>
	</div>
	<div class="col-lg-´2 col-md-2 col-sm-2 col-xs-12">            
    <div class="form-group">
        <label>Sub Ruta</label>
        <select name="idsubruta" id="idsubruta" class="form-control">
            <option value="">-- Seleccione Subruta --</option>
            @foreach ($subrutas as $dat)
                <option value="{{ $dat->idsubruta }}" data-ruta="{{ $dat->idruta }}">
                    {{ $dat->nombre }}
                </option>
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
				<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">	
				   <label for="tipo_cliente" >	LATITUD</label></div>
				<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">	 
					<input type="text" name="latitud" class="form-control"  value="" id="latitud">	   
				</div>	<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">	
					 <label for="tipo_cliente" >lONGITUD</label></div>
		 <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">	 <input type="text" name="longitud" class="form-control"  value=""  id="longitud">
		</div>
    
	
    </div>
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
		<div class="modal fade" id="modalSeniat" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-md" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title"><i class="fa fa-id-card-o"></i> Validación Fiscal SENIAT</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="seniat_dato_actual">Cédula / RIF ingresado:</label>
                    <div class="input-group">
                        <input type="text" id="seniat_dato_actual" class="form-control" readonly>
                        <span class="input-group-btn">
                            <button type="button" class="btn btn-default" onclick="copiarDatoSeniat();" title="Copiar dato">
                                <i class="fa fa-copy"></i> Copiar
                            </button>
                        </span>
                    </div>
                </div>

                <p class="text-muted" style="font-size: 13px; margin-bottom: 10px;">
                    1. Abre el portal del SENIAT y completa la verificación.<br>
                    2. Copia el rif y nombre o razón social resultante(Una sola seleccion).<br>
                    3. Pégalo abajo para pasar el dato a tu formulario.
                </p>

                <button type="button" class="btn btn-outline-primary btn-block" onclick="abrirPortalSeniat();">
                    <i class="fa fa-external-link"></i> Abrir BuscaRif SENIAT
                </button>

                <hr>

                <div class="form-group" style="margin-bottom: 0;">
				<label for="texto_pegar_seniat">
					<strong>Pegado rápido (pega aquí y se pasa solo):</strong>
				</label>
				<input
					type="text"
					id="texto_pegar_seniat"
					class="form-control"
					placeholder="Pega aquí con Ctrl + V..."
					autocomplete="off"
				>
				<small class="text-muted">Al pegar, se limpia el texto, se llena el campo y se cierra la ventana.</br>
				Completara los campo Nombre y Rif en el formulario de Registro.
				</small>
			</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
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
	
	// Captura el pegado directo en el input del modal
$(document).on('paste', '#texto_pegar_seniat', function (e) {
    var clipboardData = (e.originalEvent && e.originalEvent.clipboardData) || window.clipboardData;
    var textoPegado = clipboardData ? clipboardData.getData('text') : '';

    if (textoPegado) {
        e.preventDefault();
        aplicarTextoSeniat(textoPegado);
    }
});

// Respaldo por si el navegador pega vía input/change sin disparar bien paste
$(document).on('input', '#texto_pegar_seniat', function () {
    var val = $(this).val();
    if (val && val.trim().length > 1) {
        aplicarTextoSeniat(val);
    }
});
$('#modalSeniat').one('shown.bs.modal', function () {
    $('#texto_pegar_seniat').val('').focus();
});
			function filtrarSubrutas() {
					var rutaSeleccionada = $('#idruta').val();

					// Ocultar todas las opciones excepto la opción por defecto
					$('#idsubruta option').each(function(){
						var rutaPadre = $(this).data('ruta');

						if (rutaPadre == rutaSeleccionada) {
							$(this).show().prop('disabled', false);
						} else if ($(this).val() !== "") {
							$(this).hide().prop('disabled', true);
						}
					});

					// Si el cliente no tiene subruta guardada o si cambió de ruta, se deselecciona la inválida
					var subrutaValida = $('#idsubruta option[value="' + $('#idsubruta').val() + '"]').is(':enabled');
					if (!subrutaValida) {
						$('#idsubruta').val("");
					}
				}

				// Ejecutar al cargar la página
				filtrarSubrutas();

				// Ejecutar cuando el usuario cambie la Ruta principal
				$('#idruta').change(function(){
					filtrarSubrutas();
				});
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
			  $("#diascre").val(5);
			$('input[name="recargo"]').prop('disabled', false); 
			  }
			  else { $("#diascre").attr("readonly",true);
			    $("#limitcre").attr("readonly",true); 
				$("#diascre").val(0);
				$("#limitcre").val(0);
				$('input[name="recargo"]').prop('disabled', true);
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
//de la validacion
function limpiarNombreSeniat(texto) {
    if (!texto) {
        return { rif: '', nombre: '' };
    }

    var limpio = texto
        .replace(/[\r\n]+/g, ' ')
        .replace(/\s+/g, ' ')
        .trim();

    var matchRif = limpio.match(/^(?:rif\s*:?\s*)?([VEJGPC])[\s\-]*(\d{7,10})(?:[\s\-]*(\d))?\b[\s:\-\–—]*(.*)$/i);

    if (matchRif) {
        var rifExtraido = (matchRif[1] + matchRif[2] + (matchRif[3] || '')).toUpperCase();
        var nombreExtraido = (matchRif[4] || '')
            .replace(/^(raz[oó]n\s*social|nombre\s*(o\s*raz[oó]n\s*social)?)\s*:?\s*/i, '')
            .replace(/^[\s:\-\–—]+/, '')
            .trim();

        return {
            rif: rifExtraido,
            nombre: nombreExtraido
        };
    }

    var soloNombre = limpio
        .replace(/^(raz[oó]n\s*social|nombre\s*(o\s*raz[oó]n\s*social)?)\s*:?\s*/i, '')
        .replace(/^[\s:\-\–—]+/, '')
        .trim();

    return {
        rif: '',
        nombre: soloNombre
    };
}

function aplicarTextoSeniat(textoCrudo) {
    var datos = limpiarNombreSeniat(textoCrudo);
    if (!datos.nombre && !datos.rif) return;

    if (datos.rif && $(seniatRifSelector).length) {
        $(seniatRifSelector).val(datos.rif).trigger('change');
    }

    if (datos.nombre && $(seniatDestinoSelector).length) {
        $(seniatDestinoSelector).val(datos.nombre).trigger('change');
    }

    $('#texto_pegar_seniat').val('');
    $('#modalSeniat').modal('hide');

    if (typeof toastr !== 'undefined') {
        toastr.success(datos.rif ? 'RIF y nombre cargados.' : 'Dato cargado: ' + datos.nombre);
    }
}
var seniatOrigenSelector = '#cedula';
var seniatDestinoSelector = '#nombre';
var seniatRifSelector = '#rif';

function abrirModalSeniat(selectorOrigen, selectorDestino, selectorRif) {
    seniatOrigenSelector = selectorOrigen || '#cedula';
    seniatDestinoSelector = selectorDestino || '#nombre';
    seniatRifSelector = selectorRif || '#rif';

    var valorActual = ($(seniatOrigenSelector).val() || '')
        .replace(/[^a-zA-Z0-9]/g, '')
        .toUpperCase();

    if (!valorActual) {
        if (typeof toastr !== 'undefined') {
            toastr.warning('Primero ingresa una cédula o RIF.');
        } else {
            alert('Primero ingresa una cédula o RIF.');
        }
        $(seniatOrigenSelector).focus();
        return;
    }

    $(seniatOrigenSelector).val(valorActual);
    $('#seniat_dato_actual').val(valorActual);
    $('#texto_pegar_seniat').val('');

    $('#modalSeniat').modal('show');
    setTimeout(function () {
        $('#texto_pegar_seniat').focus();
    }, 300);
}

function copiarDatoSeniat() {
    var dato = $('#seniat_dato_actual').val();
    if (!dato) return;

    if (navigator.clipboard && navigator.clipboard.writeText) {
        navigator.clipboard.writeText(dato);
    } else {
        var temp = document.getElementById('seniat_dato_actual');
        temp.select();
        document.execCommand('copy');
    }

    if (typeof toastr !== 'undefined') {
        toastr.info('Copiado: ' + dato);
    }
}

function abrirPortalSeniat() {
    var url = 'https://contribuyente.seniat.gob.ve/BuscaRif/BuscaRif.jsp';
    var width = 640;
    var height = 540;
    var left = (screen.width / 2) - (width / 2);
    var top = (screen.height / 2) - (height / 2);

    window.open(
        url,
        'SeniatConsulta',
        'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=' + width + ',height=' + height + ',top=' + top + ',left=' + left
    );
}

function autocompletarDesdeSeniat(e) {
    var clipboardData = e.clipboardData || window.clipboardData;
    var textoPegado = clipboardData ? clipboardData.getData('text') : '';

    if (textoPegado) {
        e.preventDefault();
        aplicarTextoSeniat(textoPegado);
    }
}
				</script>
			@endpush