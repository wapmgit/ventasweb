@extends ('layouts.master')
@section ('contenido')
<?Php $acumenvio =$acumcosto =0; ?>
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

				  <h4>Comision Campaña </h4>
              
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
		<div class="col-12">
        @if (session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="fa fa-check-circle mr-1"></i> {{ session('success') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        @endif
		</div>
        <div class ="row">
		@foreach($vendedores as $ve) 
			<div class="row mb-3">
    <div class="col-12">
        <div class="card card-outline card-secondary">
            <div class="card-header py-2">
                <h3 class="card-title font-weight-bold" style="font-size: 1rem;">{{$ve->nombre}}</h3>
            </div>
            <div class="card-body py-2">
                <div class="row">
                     <table  width="100%">
                      <thead style="background-color: #E6E6E6">                   
                          <th>Pedido</th>
                          <th>Cliente</th>
                          <th>Monto</th>
                          <th>Saldo</th>
              </thead>
			  
			  <?php $acumonto=0; $cont=0; $acumsaldo=0; $comi=0; $acum=0; $monto=0; $pedidosPagados = array();?>
                      <tbody>
                        @foreach($pedidos as $det) 
						<?php $cont++; if($ve->id_vendedor==$det->idvendedor){
						$acumonto=$acumonto+$det->monto;  $acumsaldo=$acumsaldo+$det->saldo;
						if($det->saldo==0){$comi=$comi+$det->monto; $pedidosPagados[] = $det;}
						?>
                        <tr > 
                          <td>{{$det->tipo_comprobante}} {{$det->idpedido}}</td>
                          <td>{{$det->nombre}}</td>
                          <td>{{number_format($det->monto, 2, ',', '.')}}</td>
                          <td>{{number_format($det->saldo, 2, ',', '.')}}</td>                          
                        </tr>
						<?php } ?>
                        @endforeach
                      </tbody>   
					  <tr style="background-color: #E6E6E6"><td colspan="2">
					  <strong>Total: <?php echo $cont. " Pedidos."; ?></strong> -----> Monto para Comision 
					  <a href="#" data-toggle="modal" data-target="#modal-comision-{{$ve->id_vendedor}}" class="text-primary font-weight-bold">
                                          {{ number_format($comi, 2, ',', '.') }} $ <i class="fas fa-eye ml-1"></i>
                     </a> </td>
					 <td><strong><?php echo number_format($acumonto, 2,',','.');?></strong></td>									
					  <td><strong><?php echo number_format($acumsaldo, 2,',','.');?></strong></td></tr>
                  </table>
				  <?php 
    $totalModalComision = 0;
    foreach($pedidosPagados as $pago) {
        $totalModalComision += $pago->monto;
    }
?>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- MODAL PARA MOSTRAR, INGRESAR PORCENTAJE Y GENERAR COMISIÓN -->
      <!-- MODAL CON CÁLCULO EN VIVO DE LA COMISIÓN -->
        <div class="modal fade" id="modal-comision-{{$ve->id_vendedor}}" tabindex="-1" role="dialog" aria-labelledby="modalLabel-{{$ve->id_vendedor}}" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <form action="{{ route('generarcomisionshein') }}" method="POST">
                    @csrf
                    <input type="hidden" name="id_vendedor" value="{{ $ve->id_vendedor }}">
                    <input type="hidden" name="id_campana" value="{{ $campana->id }}">
                    
                    <div class="modal-content">
                        <div class="modal-header bg-secondary">
                            <h5 class="modal-title" id="modalLabel-{{$ve->id_vendedor}}">Generar Comisión - Vendedor: {{$ve->nombre}}</h5>
                            <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            @if(count($pedidosPagados) > 0)
                                <!-- CAMPO DE PORCENTAJE Y VISTA PREVIA EN VIVO -->
                                <div class="row mb-3 align-items-center bg-light p-3 rounded border">
                                    <div class="col-md-6">
                                        <div class="form-group mb-0">
                                            <label for="porcentaje_{{$ve->id_vendedor}}" class="font-weight-bold text-dark">
                                                <i class="fas fa-percentage text-primary"></i> Porcentaje (%):
                                            </label>
                                            <!-- Agregamos una clase única con el ID del vendedor -->
                                            <input type="number" 
       step="0.01" 
       min="0.01" 
       max="100" 
       name="porcentaje" 
       id="input-porcentaje-{{$ve->id_vendedor}}" 
       class="form-control form-control-sm input-porcentaje" 
       data-id="{{$ve->id_vendedor}}" 
       data-base="{{$totalModalComision}}" 
       required 
       placeholder="Ej: 5 o 10">
                                        </div>
                                    </div>
                                    <div class="col-md-6 text-md-right mt-2 mt-md-0">
                                        <span class="text-muted d-block">Comisión Calculada:</span>
                                        <!-- Aquí se mostrará el monto en tiempo real -->
                                        <h4 class="text-success font-weight-bold m-0" id="lbl-comision-{{$ve->id_vendedor}}">0,00 $</h4>
                                    </div>
                                </div>

                                <table class="table table-sm table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th width="10%" class="text-center">#</th>
                                            <th>Pedido</th>
                                            <th>Cliente</th>
                                            <th>Monto del Pedido</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($pedidosPagados as $index => $pago)
                                            <tr>
                                                <td class="text-center">
                                                    <input type="checkbox" name="pedidos_ids[]" value="{{ $pago->idpedido }}" checked style="display:none;">
                                                    <i class="fas fa-check text-success"></i>
                                                </td>
                                                <td>{{$pago->tipo_comprobante}} {{$pago->idpedido}}</td>
                                                <td>{{$pago->nombre}}</td>
                                                <td>{{number_format($pago->monto, 2, ',', '.')}} $</td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                    <tfoot>
                                        <tr class="bg-light font-weight-bold">
                                            <td colspan="3" class="text-right">Total Base de Ventas Pagadas:</td>
                                            <td>
                                                {{number_format($totalModalComision, 2, ',', '.')}} $
                                                <input type="hidden" name="monto_base_ventas" value="{{ $totalModalComision }}">
                                                <input type="hidden" name="monto_comision" id="monto_comision-{{$ve->id_vendedor}}" value="{{ $totalModalComision }}">
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>
                            @else
                                <div class="alert alert-warning text-center m-0">
                                    Este vendedor no posee pedidos completamente pagados (Saldo en 0) en esta campaña para generar comisión.
                                </div>
                            @endif
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cancelar</button>
                            @if(count($pedidosPagados) > 0)
                                <button type="submit" class="btn btn-success btn-sm">
                                    <i class="fas fa-check-circle"></i> Generar Comisión
                                </button>
                            @endif
                        </div>
                    </div>
                </form>
            </div>
        </div>
		@endforeach
		</div>   
				
				<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center"></br>

					 <button type="button" id="regresar" class="btn btn-danger btn-sm" data-dismiss="modal" title="Presione Alt+flecha izq. para regresar">Regresar</button>
                     <button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button> 
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
$('.input-porcentaje').on('input', function(){
        let idVendedor = $(this).data('id');
        let baseVentas = parseFloat($(this).data('base')) || 0;
        let porcentaje = parseFloat($(this).val()) || 0;

        // Cálculo matemático
        let comisionCalculada = (baseVentas * porcentaje) / 100;

        // Formatear el número al estilo latino (separador de miles con punto, decimales con coma)
        let comisionFormateada = comisionCalculada.toLocaleString('es-VE', {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        });

        // Actualizar el texto del label en tiempo real dentro del modal correspondiente
        $('#lbl-comision-' + idVendedor).text(comisionFormateada + ' $');
        $('#monto_comision-' + idVendedor).val(comisionCalculada);
    });
});

</script>

@endpush