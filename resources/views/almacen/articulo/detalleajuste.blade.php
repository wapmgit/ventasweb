@extends ('layouts.master')
@section ('contenido')

<?php 
$ceros=5;
function add_ceros($numero,$ceros) {
  $numero=$numero+1;
$digitos=strlen($numero);
  $recibo=" ";
  for ($i=0;$i<8-$digitos;$i++){
    $recibo=$recibo."0";
  }
return $insertar_ceros = $recibo.$numero;
};
?>	
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
				@include('compras.ajuste.empresa')
              </div>
	<div class="row">
		<div class="col-md-3">
			<div class="form-group">
                    	<label for="concepto">Concepto: </label></br> {{$ajuste->concepto}}  
			</div>
		</div>
		<div class="col-md-3">
			<div class="form-group">
			<label for="concepto">Responsable: </label></br> {{$ajuste->responsable}}
			</div>
		</div>
		<div class="col-md-3">
                <div class="form-group">
                	<label for="monto">Monto: </label></br> <?php echo number_format( $ajuste->monto, 2,',','.'); ?>
                     <p></p>
                </div>
		</div>
		<div class="col-md-3">
                <div class="form-group">
				<label for="monto">Fecha: </label> </br> <?php echo date("d-m-Y h:i:s a",strtotime($ajuste->fecha_hora)); ?>
			<p></p>
                </div>
		</div>
	</div>
            <div class ="row">
        	   <div class="col-12 table-responsive">
					<table width="100%">
                      <thead style="background-color: #A9D0F5">
                     
                          <th>Articulo</th>
                          <th>Cantidad</th>
                          <th>Tipo</th>
                          <th>Costo</th>
                          <th>Valorizado</th>
                      </thead>
                     <tbody>
                      
                        @foreach($detalles as $det)
                        <tr <?php if($det->idarticulo == $articulo){ echo "style='background-color: #E8F8F5'"; } ?>>
                          <td>{{$det->articulo}}</td>
                          <td>{{$det->cantidad}}</td>
                          <td>{{$det->tipo_ajuste}}</td>
                          <td><?php echo number_format( $det->costo, 2,',','.'); ?></td>
                          <td><?php echo number_format( ($det->cantidad*$det->costo), 2,',','.'); ?></td>
                        </tr>
                        @endforeach
                      </tbody> <tfoot> 
                     
                          <th colspan="4">TOTAL:</th>
                          <th ><b><?php echo number_format( $ajuste->monto, 2,',','.')." $"; ?> </b></th>
                          </tfoot>
                  </table>
                    </div>

                </div>
                  
 
			<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center">

					 <button type="button" id="regresar" class="btn btn-danger btn-sm" data-dismiss="modal" title="Presione Alt+flecha izq. para regresar">Regresar</button>
                     <button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button>
                    </div>
                </div> 
            	
        </div>
@push ('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
  //  alert ('si');
  document.getElementById('imprimir').style.display="none";
  document.getElementById('regresar').style.display="none";
  window.print(); 
   window.location.href="/kardexarticulo/{{$articulo}}";
    });
$('#regresar').on("click",function(){
   window.location.href="/kardexarticulo/{{$articulo}}";
  
});
});
</script>
@endpush
@endsection