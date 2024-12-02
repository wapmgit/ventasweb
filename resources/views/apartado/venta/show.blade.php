@extends ('layouts.master')
@section ('contenido')
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
$cntser=0;
$cntline=$cntser=0;
$fserver=date('Y-m-d');
?>
            <div class="invoice p-3 mb-3">
              <!-- title row -->
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
              <div class="row invoice-info">
			@include('apartado.venta.empresa')
              </div>
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<table width="100%"><tr><td width="45%"><strong>Cliente</strong></td><td width="15%"><strong>Telefono</strong></td><td width="40%"><strong>Direccion</strong></td>
			</tr>
			<tr><td>{{$venta->cedula}} -> {{$venta->nombre}}</td><td>{{$venta->telefono}}</td><td>{{$venta->direccion}}</td>
			</tr>
		</table></br>
	</div>

</div>
<div class ="row">
                                              
        <div class="col-md-12">
	
            <table id="detalles" width="100%">
                      <thead style="background-color: #A9D0F5">                    
                          <th width="7%">Codigo</th>
                          <th>Articulo</th>
                          <th>Cantidad</th>
                          <th>Unidad</th>
                          <th>Precio</th>
                          <th>Subtotal</th>
                      </thead>
                      <tbody>
                        @foreach($detalles as $det)
						<?php $cntline++; 
						if ($det->cantidad>0){?>
                        <tr >
						  <td>{{$det->codigo}}</td>
                          <td>{{$det->articulo}} <?php if($det->iva>0){echo "(G)"; }else { echo "(E)"; } ?></td>
                          <td>{{$det->cantidad}}</td>
                          <td>{{$det->unidad}}</td>
                          <td><?php echo number_format( $det->precio_venta, 2,',','.'); ?></td>
                          <td><?php echo number_format( ((($det->cantidad*$det->precio_venta)-$det->descuento)), 2,',','.'); ?></td>
                        </tr>	<?php if ($seriales <> NULL){?>
									@foreach($seriales as $ser) 
									<?php  if ($det->idarticulo == $ser->idarticulo){ $cntser++;?>
									<tr ><td colspan="6"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Chasis:</b> {{$ser->chasis}}
									<b>Motor:</b> {{$ser->motor}}
									<b>Color:</b> {{$ser->color}}
									<b>Año:</b> {{$ser->año}}</td>
									</tr>  
									<?php } ?>
									@endforeach
							<?php	} ?>

							<?php } ?>
                        @endforeach
						<?php for($i=($cntline+$cntser);$i<30;$i++){ echo "<tr><td>&nbsp;</td></tr>"; }?>
                      </tbody>
					       <tfoot>  
						<th></th>		
							<th><div align="right">Recargo:<?php echo " $ ".number_format(($venta->recargo), 2,',','.'); ?> </div></th>						
                          <th colspan="3"><div align="right">TOTAL: </div></th>
                          <th align="center"><b><font size="4"><?php echo " $ ".number_format(($venta->total_venta), 2,',','.'); ?> </b></font></th>
                          </tfoot>
            </table>
	
        </div>                   
				<?php if(count($recibos)>0){?>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"><h6 align="center">Desglose de pago</h6>
                  <table width="100%">
                      <thead style="background-color: #A9D0F5">                   
                          <th>Tipo</th>
                          <th>Monto</th>
						  <th>Tasa</th>
                          <th>Monto$</th>
                          <th>Ref.</th>                          
                      </thead>                    
                      <tbody>                        
                        @foreach($recibos as $re) <?php  $acum=$acum+$re->monto;?>
                        <tr >
                          <td>{{$re->idbanco}}</td>
                          <td><?php echo number_format( $re->recibido, 2,',','.'); ?></td>
						      <td> <?php if ($re->idpago==2){echo number_format( $re->tasap, 2,',','.'); }
							  if ($re->idpago==3){echo number_format( $re->tasab, 2,',','.'); }?></td>
						   <td><?php echo number_format( $re->monto, 2,',','.'); ?></td>
                          <td>{{$re->referencia}}</td>                        
                        </tr>
                        @endforeach
                        <tfoot >                    
                          <th colspan="3">Total</th>
						  <th><?php echo "$ ".number_format( $acum, 2,',','.');?></th>
                          <th ><h4 id="total"><b></b></h4></th>
                          </tfoot>
                      </tbody>
                  </table>
                </div><?php } ?>
	
             <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-group">
         
                    <p>           <label for="num_comprobante">Fecha: </label><?php echo " ".date("d-m-Y h:i:s a",strtotime($venta->fecha_hora)); ?></br>
					Sistema de apartado a <?php echo $venta->dias; ?> dias, el incumplimiento de los dias tendra un incremento de <?php echo $venta->incremento; ?>%,
					del monto pendiente para la cancelacion total del Documento.
					</p>
                </div>
            </div> 

@include('apartado.venta.modalfacturar')
			<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center">
					 <button type="button" id="regresar" class="btn btn-danger btn-sm" data-dismiss="modal" title="Presione Alt+flecha izq. para regresar">Regresar</button>
                     <button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button>
					<?php 
					if($venta->saldo==0){
					if(($venta->devolu==0)and($venta->impor==0)){?>	<a id="link" href="" data-target="#modalfacturar-{{$venta->idventa}}" data-toggle="modal">
						<button class="btn btn-info btn-sm">Facturar</button></a>    
					<?php 
					}
					} ?>						
				   </div>
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
 window.location="{{route('apartado')}}";
    });
$('#regresar').on("click",function(){
 window.location="{{route('apartado')}}";
  
});
});
</script>
@endpush
@endsection