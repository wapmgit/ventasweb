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

				  <h4>Articulos Pedidos en Campaña</h4>
              
				</div>
					<div class="col-sm-3 invoice-col" align="center">
				<img src="{{ asset('dist/img/'.$empresa->logo)}}" width="50%" height="80%" title="NKS">
				</div>
              </div>
		<div class="row">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">

                 <div class="form-group">
                      <label for="proveedor">Nombre</label>
                   <p>{{$campana->codigo}}</p>
                    </div>
            </div>
             <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                 <div class="form-group">
                      <label for="proveedor">Creado</label>
                   <p>{{$campana->creado}}</p>
                    </div>
            </div>
			    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                 <div class="form-group">
                      <label for="proveedor">Cierre</label>
                   <p>{{$campana->cierre}}</p>
                    </div>
            </div>
			  <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
				<div class="form-group">
                      <label for="proveedor">Estatus</label>
                   <p>	@php if($campana->estatus==0){ echo "Activa"; }
						if($campana->estatus==1){ echo "Cerrada"; }
						if($campana->estatus==2){ echo "Anulada"; } @endphp </p>
                    </div>
              
            </div>
		</div>

        <div class ="row">
                <div class="panel panel-primary">
                <div class="panel-body">
                   <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <table id="detalles" width="100%">
                      <thead style="background-color: #E6E6E6">
                     
                          <th>Codigo</th>
                          <th>Descripcion</th>
                          <th>cantidad</th>
                          <th>Costo</th>
                          <th>Envio</th>
                          <th>SubTotal</th>
              </thead><?php $acumcosto=0; $cont=0; $acumprecio2=0; $acumenvio=0; $acum=0; $monto=0;?>
                      <tbody>
                        @foreach($articulos as $det) <?php $cont++; ?>
                        <tr > <?php $acumcosto=($acumcosto+($det->costo*$det->cantidad)); $acum=($acum+$det->cantidad);
						 $monto=($monto+($det->subtotal));  $acumenvio=($acumenvio+($det->envio*$det->cantidad));  ?>
                          <td>{{$det->codigo}}</td>
                          <td>{{$det->descripcion}}</td>
                          <td>{{$det->cantidad}}</td>
                          <td>{{$det->costo}}</td>
                          <td>{{$det->envio}}</td>
                          <td>{{$det->subtotal}}</td>
                          
                        </tr>
                        @endforeach
                      </tbody>   
					  <tr style="background-color: #E6E6E6"><td colspan="2"><strong>Total: <?php echo $cont. " Articulos."; ?></strong></td>
					   <td><strong><?php echo number_format($acum, 2,',','.');?></strong></td>
					 <td><strong><?php echo number_format($acumcosto, 2,',','.');?></strong></td>					
					
					  <td><strong><?php echo number_format($acumenvio, 2,',','.');?></strong></td>
					  <td><strong><?php echo number_format($monto, 2,',','.');?></strong></td></tr>
                  </table>
                 
                    </div>
                </div>   
						@include('pedidoshein.campana.modal')
				<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center"></br>
					@php if($campana->estatus==0) { @endphp<button id="repreciar"  class="btn btn-warning btn-sm" ><a href="" data-target="#modal-cerrar-{{$campana->id}}" data-toggle="modal">Cerrar Campaña</a></button>@php } @endphp
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
	window.location="{{route('campana')}}";
		});
		$('#regresar').click(function(){
	window.location="{{route('campana')}}";
		});

});

</script>

@endpush