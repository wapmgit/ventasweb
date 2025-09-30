@extends ('layouts.master')
@section ('contenido')
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
                    </div>
                </div>                
                </div>
       </div>
</div>	
@endsection
@push ('scripts')
<script>

$(document).ready(function(){
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

});

</script>

@endpush