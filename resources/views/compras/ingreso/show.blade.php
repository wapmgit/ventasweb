@extends ('layouts.master')
@section ('contenido')
<?php
$ceros=5;$acumr=0;
function add_ceros($numero,$ceros) {
$digitos=strlen($numero);
  $recibo="";
  for ($i=0;$i<8-$digitos;$i++){
    $recibo=$recibo."0";
  }
return $insertar_ceros = $recibo.$numero;
}
$cntser=0;
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
				 @include('compras.ingreso.empresa')
              </div>
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<table width="100%"><tr><td width="30%"><strong>Rif -> Proveedor</strong></td><td width="20%"><strong>Telefono</strong></td><td width="30%"><strong>Direccion</strong></td><td width="20%"><strong>Documento</strong></td>
			</tr>
			<tr><td>{{$ingreso->rif}} -> {{$ingreso->nombre}} </td><td>{{$ingreso->telefono}}</td><td>{{$ingreso->direccion}}</td><td>{{$ingreso->tipo_comprobante}} {{$ingreso->num_comprobante}} {{$ingreso->serie_comprobante}} </td>
			</tr>
			</table></br>
		</div>
	</div>
	@include('compras.ingreso.modalactprecios')
            <div class ="row">
                <div class="panel panel-primary">
                <div class="panel-body">                                                       
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="table-responsive">
                  <table id="detalles" width="100%">
                      <thead style="background-color: #A9D0F5">
                     
                          <th>Articulo <!--<a href="" data-target="#modalact-{{$ingreso->idingreso}}" data-toggle="modal" ><i class="fa-solid fa-percent"></i></a>--></th>
                          <th>Cantidad</th>
                          <th>Precio Compra</th>
                          <th>Descuento</th>
                          <th>Neto</th>
                          <th>Subtotal</th>
                      </thead>
                          <?php  $mo=0; $abono=0; $acum=0;?>
                      <tbody>
                        @foreach($detalles as $det)
                        <?php  $mo=$mo+($det->subtotal); ?>
                        <tr >
                          <td>{{$det->articulo}}{{$det->idarticulo}}</td>
                          <td>{{$det->cantidad}}</td>
                          <td><?php echo number_format( $det->precio_compra, 2,',','.'); ?></td>
                          <td><?php echo number_format( $det->precio_venta, 2,',','.'); ?></td>
                           <td><?php echo number_format( $det->cantidad*$det->precio_compra, 2,',','.'); ?></td>
                          <td><?php echo number_format( $det->subtotal, 2,',','.'); ?></td>
                        </tr>
							<?php if ($ser <> NULL){?>
									@foreach($ser as $s) 
									<?php  if ($det->idarticulo == $s->idarticulo){ $cntser++;?>
									<tr ><td colspan="6"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Chasis:</b> {{$s->chasis}}
									<b>Motor:</b> {{$s->motor}}
									<b>Color:</b> {{$s->color}}
									<b>Año:</b> {{$s->año}}</td>
									</tr>  
									<?php } ?>
									@endforeach
							<?php	} ?>
									
                        @endforeach
                      </tbody> 
                      <tfoot>                    
                          <th colspan="5"><div align="right">TOTAL: </div></th>
                          <th ><b><font size="4"><?php  echo " $ ".number_format( $mo, 2,',','.'); ?></b></font></th>
                          </tfoot>
                  </table>
				  	<table width="100%"  border="1">  
						<th align="center">
						<strong>Base Imponible: </strong>  <?php echo number_format( $ingreso->base, 2,',','.'); ?>
						</th>	  
						<th align="center">
						<strong>IVA: </strong><?php echo number_format( $ingreso->miva, 2,',','.'); ?>
						</th><th align="center">
						<strong>    Exento: </strong><?php echo number_format( $ingreso->exento, 2,',','.'); ?>
						</th>
					</table>	
				  </div>
    
                    </div>

                </div>
                    
                </div>
              
     
        </div>
		 <div class ="row">
                <div class="panel panel-primary">
                <div class="panel-body">
               
				  		 <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<h6 align="center">Retencion</h6>
					<div class="table-responsive">
                  <table width="100%">
                      <thead style="background-color: #A9D0F5">
						<th>Nro Ret.</th>  
						<th>Documento</th>
                          <th>Monto</th>                     
                      </thead>
              
                      <tbody>
                     @foreach($ret as $r) <?php  $acumr=$acumr+$r->mretd;?>
                        <tr >
                          <td><?php echo add_ceros($r->idretencion,$ceros); ?></td>
						   <td>{{$r->documento}}</td>  
                          <td><?php echo number_format( $r->mretd, 2,',','.'); ?></dt>
						  </tr>
                        @endforeach
 
                       
                      </tbody>
                  </table>
					 </div>
					 </div>
					  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<h6 align="center">Desglose de pago</h6>
					<div class="table-responsive">
                  <table id="desglose" width="100%">
                      <thead style="background-color: #A9D0F5">
						<th>Tipo{{$ruta}}</th>
                          <th>Monto</th>
						  <th>Tasa</th>
                          <th>Monto$</th>
                          <th>Referencia</th>
                          
                      </thead>
              
                      <tbody>
                     @foreach($pago as $re) <?php  $acum=$acum+$re->monto;?>
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
                          <th ><b> Pendiente: <?php echo number_format( ($ingreso->total-$acum), 2,',','.');?></b></h4></th>
                          </tfoot>
                       
                      </tbody>
                  </table>
				  </div>
                    </div>
                </div></div></div>
				            	
             <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-group">
                    <label for="num_comprobante">Fecha: </label><?php echo " ".date("d-m-Y",strtotime($ingreso->fecha_hora)); ?>
                   
                </div>
            </div> 
				<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center">
					<input type="hidden" id="direccion" value="{{$ruta}}"></input>
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
  window.location="{{route('compras')}}";
    });
$('#regresar').on("click",function(){
	var dir=$("#direccion").val();
	
	if(dir==1){
		  window.location="{{route('compras')}}";
	}
	else{
  window.location="{{route('historico',['id'=>$ingreso->idproveedor])}}";
	}
  
});
});
</script>
@endpush
@endsection