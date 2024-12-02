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
?>   	 
<div align="center">
<div id="areaimprimir"  class="col-lg-3 col-md-3 col-sm-3 col-xs-3" >
			<div style="line-height:70%" width="90%">
			<label><small><small><b>{{$empresa->nombre}}</b></small></small></br>
			<small><small>{{$empresa->rif}}</small></small></br>
			<small><small><small>{{$empresa->direccion}}</small></small></small></br>
			<small><small>Telf:{{$empresa->telefono}}</small></small></br>
					 
			<small><small> <small>  {{$venta->cedula}} -> {{$venta->nombre}}</br>
				{{$venta->direccion}}</small></small></small> </br>
			<small><small>	Documento:  <?php $idv=$venta->num_comprobante; echo add_ceros($idv,$ceros); ?></small></small> </label>  
			<small><small>	ABONO</small></small> </label>  
			</div>    

                  <table id="desglose" style="line-height:80%" border="0"  width="100%">
                      <thead>                  
                          <td><font size="1"><small>Tipo</small></font></td>
                          <td><font size="1"><small>Monto</small></font></td>
                          <td><font size="1"><small>Monto$</small></font></td>                        
                          <td><font size="1"><small>Fecha</small></font></td>                        
                      </thead>                     
                      <tbody>                       

                        <tr >
                          <td><font size="1"><small>{{$recibos->idbanco}}</small></font></td>
                          <td><font size="1"><small><?php echo number_format( $recibos->recibido, 2,',','.'); ?></small></font></td>
						  <td><font size="1"><small><?php echo number_format( $recibos->monto, 2,',','.'); ?></small></font></td>                       
						  <td><font size="1"><small><?php echo date("d-m-Y",strtotime($recibos->fecha)); ?></small></font></td>                       
                        </tr>
                        <tfoot >                    
                          </tfoot>
                      </tbody>
                  </table>
           
                <div ><small><font size="1">
                    <p><?php echo "Fecha Apartado:".date("d-m-Y h:i:s a",strtotime($venta->fecha_hora)); ?></p></font></small>
                </div>
</div>
</div>
     <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center">
					 <button type="button" id="regresar" class="btn btn-danger btn-xs" data-dismiss="modal">Regresar</button>
                     <button type="button" id="imprimir" class="btn btn-primary btn-xs" onclick="printdiv('areaimprimir');" >Imprimir</button>
                    </div>
                </div>  
			
@push ('scripts')
<script>
$(document).ready(function(){

});
  function printdiv(divname){
		document.getElementById('imprimir').style.display="none";
		document.getElementById('regresar').style.display="none";
	 	var printcontenido =document.getElementById(divname).innerHTML;
		var originalcontenido = document.body.innerHTML;
		document.body.innerHTML =printcontenido;
	  	window.print();
	  	window.location="{{route('apartado')}}";
	  	document.body.innerHTML=originalcontenido;
  }
  $('#regresar').on("click",function(){
  window.location="{{route('apartado')}}";
  
});

</script>
@endpush
@endsection