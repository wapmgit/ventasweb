@extends ('layouts.master')
@section ('contenido')
<?php $acum=0;?>
<?php $acum=0; 
$ceros=5;  $acumnc=0;
function add_ceros($numero,$ceros) {
  $numero=$numero;
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
			@include('ventas.venta.empresa')
	</div>

	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<table width="100%" border="1">
	<tr><td><small><b>DOCUMENTO:</small></b><?php  $idv=$venta->idventa; echo "NOT".add_ceros($idv,$ceros); ?></td><td><td><small><b>FECHA DE EMISION: </small></b><?php echo date("d-m-Y",strtotime($venta->fecha_emi)); ?></td><td><small><b>CONDICION: </small></b>{{$venta->estado}}</td></tr>
	<tr><td colspan="4"><small><b>NOMBRE Y APELLIDO O RAZON SOCIAL: </b> </small>{{$venta->nombre}} <b>RIF: </b> {{$venta->cedula}}</td></tr>
	<tr><td colspan="4"  width="50%"><small><b>DOMICILIO FISCAL: </b> {{$venta->direccion}} </small><b>TELF: </b> {{$venta->telefono}}</td></tr>
	</table>
	</br>
		</div>
	</div>
	<div class ="row">
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                  <table width="100%">
                      <thead style="background-color: #A9D0F5">
                     
                          <th>Articulo</th>
                          <th>Cantidad</th>
                          <th>Descuento</th>
                          <th>precio venta</th>                        
                          <th>subtotal</th> 
                          <th>precio actual</th>
                            <th>subtotal Actual</th> 
                      </thead>
                  <?php $acumn=$np=0; ?>
                      <tbody>
                        @foreach($detalles as $det)
                        <tr >
                          <td>{{$det->articulo}}</td>
                          <td>{{$det->cantidad}}</td>
                          <td>{{$det->descuento}}</td>
                          <td><?php echo number_format( $det->precio_venta, 2,',','.'); ?></td>
                          <td><?php echo number_format( ($det->cantidad*$det->precio_venta), 2,',','.'); ?></td> <td> @foreach($articulos as $nprecio)<?php if ($det->idarticulo==$nprecio->idarticulo) { $np=$nprecio->precio1; echo number_format( $nprecio->precio1, 2,',','.'); }?>        
                              @endforeach </td>
                               <td><?php $acumn=($acumn+($det->cantidad*$np)); echo number_format( ($det->cantidad*$np), 2,',','.'); ?></td>
                        </tr>
                        @endforeach
                            <tfoot> 
                     
                          <th colspan="4">TOTAL:</th>
                          <th ><h4 id="total"><b><?php echo number_format($venta->total_venta, 2,',','.'); ?> $</b></h4></th>
                          <th></th>
                          <th ><h4><b><?php echo number_format($acumn, 2,',','.'); ?> $</b></h4></th>
                          </tfoot>
                      </tbody>
                  </table>
	</div>
	</div>

	<div class ="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><h6 align="center">Desglose de pago</h6>
                  <table width="100%">
                      <thead style="background-color: #A9D0F5">
						<th>Tipo</th>
                          <th>Monto</th>
						  <th>Tasa</th>
                          <th>Monto$</th>
                          <th>Referencia</th>
                          
                      </thead>
              
                      <tbody>
                     @foreach($abonos as $re) <?php  $acum=$acum+$re->monto;?>
                        <tr >
                          <td>{{$re->idbanco}}</td>
                          <td><?php echo number_format( $re->recibido, 2,',','.'); ?></td>
						      <td> <?php if ($re->idpago==2){echo number_format( $re->tasap, 2,',','.'); }
							  if ($re->idpago==3){echo number_format( $re->tasab, 2,',','.'); }?></td>
						   <td><?php echo number_format( $re->monto, 2,',','.'); ?></td>
                          <td>{{$re->referencia}}</td>                        
                        </tr>
                        @endforeach
                        <tfoot>                    
                          <th colspan="3">Total</th>
						  <th><?php echo number_format( $acum, 2,',','.');?> $</th>
                          <th ></th>
                          </tfoot>
                       
                      </tbody>
                  </table>
                    </div>
					        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><h6 align="center">N/C Aplicadas</h6>
                  <table width="100%">
                      <thead style="background-color: #A9D0F5">
						<th>Usuario</th>
                          <th>Referencia</th>
                          <th>Monto</th>
						  <th>Fecha</th>                         
                      </thead>
              
                      <tbody>
                     @foreach($notasc as $no) <?php  $acumnc=$acumnc+$no->monto;?>
                        <tr >
                          <td>{{$no->user}}</td>
						  <td>{{$no->referencia}}</td> 
                          <td><?php echo number_format( $no->monto, 2,',','.'); ?></td>
						   <td><?php echo date("d-m-Y ",strtotime($no->fecha)); ?></td>
                                                 
                        </tr>
                        @endforeach
                        <tfoot>                    
                          <th colspan="2">Total</th>
						  <th><?php echo number_format( $acumnc, 2,',','.');?> $</th>
                          <th ><b> Pendiente: <?php echo number_format( ($venta->total_venta-($acum+$acumnc)), 2,',','.');?></b></h4></th>
                          </tfoot>
                       
                      </tbody>
                  </table>
                    </div>
	</div>
             <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-group">
                    <label for="num_comprobante">Fecha:</label>
                    <p><?php echo date("d-m-Y h:i:s a",strtotime($venta->fecha_hora)); ?></p>
                </div>
            </div> 
     <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center">  
                      <a href="{{route('showcxc',['id'=>$venta->id_cliente])}}"><button id="regresar" class="btn btn-danger btn-sm">Regresar</button></a>
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
  window.location="{{route('showcxc',['id'=>$venta->id_cliente])}}";
    });

});

</script>

@endpush
@endsection