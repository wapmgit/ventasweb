@extends ('layouts.master')
@section ('contenido')
<?php $acum=0; 
$ceros=5;  $acumnc=0; $cto=0;
function add_ceros($numero,$ceros) {
  $numero=$numero;
	$digitos=strlen($numero);
  $recibo=" ";
  for ($i=0;$i<8-$digitos;$i++){
    $recibo=$recibo."0";
  }
return $insertar_ceros = $recibo.$numero;
};
function truncar($numero, $digitos)
{
    $truncar = 10**$digitos;
    return intval($numero * $truncar) / $truncar;
}
?>
<div class="invoice p-3 mb-3">
<div class="row">
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
	</div>	
	<div class="col-sm-3 invoice-col" align="center">
<img src="{{ asset('dist/img/'.$empresa->logo)}}" width="50%" height="80%" title="NKS">
	</div>
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<table width="100%" border="1">
	<tr><td><small><b>DOCUMENTO: </small></b><?php  $idv=$venta->idventa; echo "NOT".add_ceros($idv,$ceros); ?></td><td><td><small><b>FECHA DE EMISION: </small></b><?php echo date("d-m-Y",strtotime($venta->fecha_emi)); ?></td><td><small><b>CONDICION: </small></b>Contado</td></tr>
	<tr><td colspan="4"><small><b>NOMBRE Y APELLIDO O RAZON SOCIAL: </b> </small>{{$venta->nombre}} <b>RIF: </b> {{$venta->cedula}}</td></tr>
	<tr><td colspan="4"  width="50%"><small><b>DOMICILIO FISCAL: </b> {{$venta->direccion}} </small><b>TELF: </b> {{$venta->telefono}}</td></tr>
	</table>
	</div>

<?php $des=$aux=$subbs=0; $acumsub=0; $cntline=$cntser=0;?>
</div>
<div class ="row">
                                              
        <div class="col-md-12">
	
            <table id="detalles" width="100%" border="1">
                      <thead>                    
							<th>Codigo</th>
                          <th>Descripcion</th>
                          <th>Cantidad</th>
                          <th>Unidad.</th>
                          <th>Precio</th>
                          <th>Descto.</th>
                          <th>P. Venta</th>                    
                          <th>Subtotal</th>
                      </thead>
                 
                      <tbody>
                        @foreach($detalles as $det)
						<?php $cntline++; $acumsub=$acumsub+($det->precio_venta*$det->cantidad);?>
                        <tr >
						     <td>{{$det->codigo}}</td>
                          <td>{{$det->articulo}}</td>
                          <td>{{$det->cantidad}}</td>
                          <td>{{$det->unidad}}</td>
						     <td><?php echo number_format( ($det->precio), 2,',','.'); ?></td>
                          <td>{{$det->descuento}}%</td>
                          
                          <td><?php echo number_format( ($det->precio_venta), 2,',','.'); ?></td>
                          <td><?php echo number_format( ($det->precio_venta*$det->cantidad), 2,',','.'); ?></td>
                        </tr>
								<?php if ($seriales <> NULL){?>
									@foreach($seriales as $ser) 
									<?php  if ($det->idarticulo == $ser->idarticulo){ $cntser++;?>
									<tr ><td colspan="6"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Chasis:</b> {{$ser->chasis}}
									<b>Motor:</b> {{$ser->motor}}
									<b>Color:</b> {{$ser->color}}
									<b>Placa:</b> {{$ser->placa}}
									<b>Año:</b> {{$ser->año}}</td>
									</tr>  
									<?php } ?>
									@endforeach
							<?php	} ?>
						
                        @endforeach
						<?php for($i=($cntline+$cntser);$i<16;$i++){ echo "<tr><td>&nbsp;</td></tr>"; }?>
                      </tbody>
            </table>
			  <table id="detalles" width="100%" border="1">
			               <tr>      
					<td ><b>TOTAL:</b></td>
					<td colspan="7" align="right"><b><font size="4"><?php echo "$ ".number_format(($acumsub), 2,',','.')." "; ?>&nbsp;</b></font></td>
		</tr>
			</table>
        </div>                   
		@if(Auth::user()->nivel=="A")
			<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center">
					 <button type="button" id="regresar" class="btn btn-danger btn-sm" data-dismiss="modal" title="Presione Alt+flecha izq. para regresar">Regresar</button>
                     <button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button>
                    </div>
			</div>  
		@else
			<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center">
					 <button type="button" id="regresarvc" class="btn btn-danger btn-sm" data-dismiss="modal" title="Presione Alt+flecha izq. para regresar">Regresar</button>
                     <button type="button" id="imprimirvc" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button>
                    </div>
			</div> 
			@endif
        </div>
	</div>
@push ('scripts')
<script>
$(document).ready(function(){

	
$('#regresar').on("click",function(){
  window.location="{{route('ventas')}}";
  
});		  
    $('#imprimirvc').click(function(){
  //  alert ('si');
  document.getElementById('imprimirvc').style.display="none";
  document.getElementById('regresarvc').style.display="none";
  window.print(); 
  window.location="{{route('ventacaja')}}";
    });
$('#regresarvc').on("click",function(){
  window.location="{{route('ventacaja')}}";
  
});
    $('#imprimir').click(function(){
  //  alert ('si');
  document.getElementById('imprimir').style.display="none";
  document.getElementById('regresar').style.display="none";
  window.print(); 
 
  window.location="{{route('ventas')}}";
    });
});
</script>
@endpush
@endsection