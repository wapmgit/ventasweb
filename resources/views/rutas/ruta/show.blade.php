@extends ('layouts.master')
@section ('contenido')
<style>
    .etiqueta-cliente {
        background-color: rgba(255, 255, 255, 0.9) !important;
        border: 1px solid #007bff !important;
        border-radius: 4px !important;
        color: #333 !important;
        font-weight: bold !important;
        font-size: 11px !important;
        padding: 2px 6px !important;
        box-shadow: 0 2px 4px rgba(0,0,0,0.2);
    }
</style>
		  <!-- Main content -->
	<div class="invoice p-3 mb-3">
              <!-- title row -->
              <div class="row">
                <div class="col-12">
                  <h4>
              <img src="{{asset('dist/img/iconosistema.png')}}" title="NKS">SysVent@s
                    <small class="float-right"></small>
                  </h4>
                </div>
                <!-- /.col -->
              </div>
              <!-- info row -->
              <div class="row invoice-info">
				<div class="col-sm-6 invoice-col">
				{{$empresa->nombre}}
                  <address>
                    <strong>{{$empresa->rif}}</strong><br>
                   {{$empresa->direccion}}<br>
                     Tel: {{$empresa->telefono}}<br>
                  </address>
				</div>
                <!-- /.col -->
				<div class="col-sm-3 invoice-col">

				  <h4>Clientes en Ruta</h4>
              
				</div>
					<div class="col-sm-3 invoice-col" align="center">
				<img src="{{ asset('dist/img/'.$empresa->logo)}}" width="50%" height="80%" title="NKS">
				</div>
              </div>
		<div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

                 <div class="form-group">
                      <label for="proveedor">Nombre</label>
                   <p>{{$ruta->nombre}}</p>
                    </div>
            </div>
             <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

                 <div class="form-group">
                      <label for="proveedor">Descripcion</label>
                   <p>{{$ruta->descripcion}}</p>
                    </div>
            </div>

		</div>
        <div class ="row">
                <div class="panel panel-primary">
                <div class="panel-body">
                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <table id="detalles" width="100%">
                      <thead style="background-color: #E6E6E6">
                     
                          <th>Cedula</th>
                          <th>Nombre</th>
                          <th>Telefono</th>
                          <th>Direccion</th>
                          <th>Ult. Compra</th>
              </thead><?php $acumcosto=0; $cont=0; $acumprecio2=0; $acumprecio=0; $acum=0; $monto=0;?>
                      <tbody>
                        @foreach($clientes as $det) <?php $cont++; ?>
                        <tr >
                          <td><small>{{$det->cedula}}</small></td>
                          <td><small>{{$det->nombre}}</small></td>
                          <td><small><small>{{$det->codpais}}{{$det->telefono}}</small></small></td>
                          <td><small><small>{{$det->direccion}}</small></small></td>
                          <td><small><?php echo date("d-m-Y ",strtotime($det->lastfact)); ?></small></td>                       
                        </tr>
                        @endforeach
                      </tbody> 
					  <tr style="background-color: #E6E6E6"><td colspan="2"><strong>Total: <?php echo $cont. " Clientes."; ?></strong></td>
					  <td><strong></strong></td>
					  <td><strong></strong></td>
					  <td><strong></strong></td>
					  <td><strong></strong></td></tr>
                  </table>
                 
                    </div>
                </div>   
				<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center"></br>
					 <button type="button" id="regresar" class="btn btn-danger btn-sm" data-dismiss="modal" title="Presione Alt+flecha izq. para regresar">Regresar</button>
                     <button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button> 
                    <button type="button" id="btn-toggle-mapaon" class="btn btn-sm btn-outline-secondary">
						Ver Mapa
					</button>
					<button type="button" id="btn-toggle-mapa" class="btn btn-sm btn-outline-secondary">
						Ocultar Mapa
					</button>
					</div>
                </div>                
                </div>
       </div>
	   <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
	  <div class="card" id="contenedor-mapa">
		<div class="card-header bg-primary text-white">
			<h5 class="m-0">Mapa de Clientes - Ruta #{{ $ruta->idruta }}</h5>
		</div>
		<div class="card-body p-0">
			<!-- Contenedor del Mapa -->
			<div id="mapa-ruta" style="height: 500px; width: 100%;"></div>
		</div>
	</div> 
	<script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
</div>	
@endsection
@push ('scripts')
<script>

$(document).ready(function(){
	document.getElementById('btn-toggle-mapa').style.display="none"; 
		document.getElementById('contenedor-mapa').style.display="none"; 
		$('#imprimir').click(function(){
	  document.getElementById('imprimir').style.display="none";
		document.getElementById('repreciar').style.display="none";
		document.getElementById('regresar').style.display="none";
	  window.print(); 
	window.location="{{route('iruta')}}";
		});
		$('#regresar').click(function(){
	window.location="{{route('iruta')}}";
		});
	 $("#btn-toggle-mapaon").click(function(){ 
document.getElementById('contenedor-mapa').style.display=""; 
document.getElementById('btn-toggle-mapa').style.display=""; 
document.getElementById('btn-toggle-mapaon').style.display="none"; 
	 })		
});

</script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // 1. Obtener la lista de clientes convertida a JSON desde PHP
        const clientes = @json($clientes);

        // Validar si existen clientes con coordenadas
        if (clientes.length === 0) {
            alert("No hay clientes con coordenadas registradas en esta ruta.");
            return;
        }

        // 2. Inicializar el mapa centrado en la primera coordenada (por defecto)
        const primerCliente = clientes[0];
        const map = L.map('mapa-ruta').setView([primerCliente.latitud, primerCliente.longitud], 13);

        // 3. Cargar las imágenes del mapa (OpenStreetMap)
        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; OpenStreetMap'
        }).addTo(map);

        // Arreglo para guardar los marcadores y auto-ajustar el zoom
        const bounds = [];

        // 4. Recorrer los clientes y colocar los marcadores (pines)
        clientes.forEach(cliente => {
            const lat = parseFloat(cliente.latitud);
            const lng = parseFloat(cliente.longitud);

            if (!isNaN(lat) && !isNaN(lng) && (lng != 0)) {
                // Crear marcador
                const marker = L.marker([lat, lng]).addTo(map);
				marker.bindTooltip(cliente.nombre, {
					permanent: true,       // Mantiene el texto siempre visible
					direction: 'right',    // Posiciona el texto a la derecha del pin ('top', 'bottom', 'left', 'right')
					offset: [10, 0],       // Separa un poco el texto del icono para mayor claridad
					className: 'etiqueta-cliente' // Clase CSS personalizada para estilo
				});
                // Crear globo informativo (Popup) al hacer clic sobre el pin
                marker.bindPopup(`
                    <strong>${cliente.nombre}</strong><br>
                    <small>${cliente.direccion || 'Sin dirección'}</small><br>
                    <a href="https://maps.google.com/?q=${lat},${lng}" target="_blank" class="btn btn-sm btn-outline-primary mt-1">
                        Ver en Google Maps
                    </a>
                `);

                bounds.push([lat, lng]);
            }
        });

        // 5. Ajustar automáticamente el encuadre del mapa para mostrar TODOS los pines de la ruta
        if (bounds.length > 0) {
            map.fitBounds(bounds, { padding: [30, 30] });
        }
    });
</script>
@endpush