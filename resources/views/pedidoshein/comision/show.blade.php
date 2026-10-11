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
$cntser=0;$recargo=0;
$cntline=$cntser=0;
$acum=0; $acum2=$aux=0;$auxn=0;$acumn=0;$acumf=0;$count=0; $count2=0; $contdoc=0; $montonc=0;$link="A";
$mrecargo=$ntventa=$nsaldo=0;
$fserver=date('Y-m-d');
$fecha_a=$data->fecha;
function dias_transcurridos($fserver,$fecha_a)
{
$dias = (strtotime($fecha_a)-strtotime($fserver))/86400;
//$dias = abs($dias); $dias = floor($dias);
return $dias;
}
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
			  	<div class="col-sm-6 invoice-col">
				{{$empresa->nombre}}
			<address>
			<strong>{{$empresa->rif}}</strong><br>
					{{$empresa->direccion}}<br>
					Tel: {{$empresa->telefono}}<br>
			</address>
	</div>
<div class="col-sm-3 invoice-col">
		<h3 align="center"><u>  ABONO/PAGO COMISION</u></h3>	
	</div>	
	<div class="col-sm-3 invoice-col" align="center">
<img src="{{ asset('dist/img/'.$empresa->logo)}}" width="50%" height="80%" title="NKS">
	</div>	
              </div>
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<table width="100%">
		<tr>
		<td width="30%"><strong>Vendedor</strong></td>
		<td width="15%"><strong>Telefono</strong></td>
		<td width="10%"><strong>#Comision</strong></td>
		<td width="10%"><strong>Campaña</strong></td>
		<td width="10%"><strong>Monto Comision</strong></td>
		<td width="10%"><strong>Pendiente</strong></td>
		<td width="10%"><strong>Fecha</strong></td>
		<td width="10%"><strong>% Comi</strong></td>
			</tr>
			<tr>
			<td>{{$data->cedula}} -> {{$data->nombre}}</td>
			<td>{{$data->telefono}}</td>
			<td><?php $idv=$data->idcomision; echo add_ceros($idv,$ceros); ?></td>
			<td>{{$data->codigo}}</td>
			<td><?php echo number_format( $data->montocomision, 2,',','.'); ?></td>
			<td><?php echo number_format( $data->pendiente, 2,',','.'); ?></td>	
			<td><?php echo " ".date("d-m-Y",strtotime($data->fecha)); ?></td>			
			<td><?php echo number_format( $data->porcentaje, 2,',','.'); ?></td>		
			</tr>
		</table></br>
	</div>

</div>
<div class ="row">
                                              
        <div class="col-md-12">	
		<?php if(count($recibos)>0){?>
				<h6 align="center">Desglose de Abono</h6>
                  <table width="100%">
                      <thead style="background-color: #A9D0F5">                   
                          <th>Moneda</th>
                          <th>Monto</th>
                          <th>Concepto</th>
                          <th>Fecha</th>                        
                      </thead>                    
                      <tbody>                        
                        @foreach($recibos as $re) <?php  $acum=$acum+$re->monto;?>
                        <tr >
                          <td>{{$re->moneda}}</td>
                          <td><?php echo number_format( $re->monto, 2,',','.'); ?></td>
						       <td>{{$re->concepto}}</td>
						   <td><?php echo " ".date("d-m-Y",strtotime($re->fecha_mov)); ?></td>                                           
                        </tr>
                        @endforeach
                      </tbody>
                  </table>
                <?php } ?>
        </div>                   		
 <button type="button" class="btn btn-danger btn-sm" id="atras" data-dismiss="modal">Regresar</button>
        </div>
			<form action="{{route('saveabonocomishein')}}" method="POST" id="otro" enctype="multipart/form-data" >         
        {{csrf_field()}}
 <div class ="row" id="divdesglose" > 	

				  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<h3 align="center">ABONO/PAGO DE COMISIONES</h3>
                    </div>
      
				  <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">

                 <div class="form-group">
                      <label for="proveedor">Vendedor</label>
                   <p><input type="text" name="nombre" readonly id="nombre" class="form-control" value=" {{$data->nombre}}"></p>
                    </div>
            </div>
				  <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">

                 <div class="form-group">
                      <label for="proveedor">Documento</label>
                   <p><input type="text" name="comision"  readonly  id="comision" class="form-control" value=" {{$data->idcomision}}"></p>
                    </div>
            </div>
				  <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">

                 <div class="form-group">
                      <label for="proveedor">Monto Comision </label>
                   <p><input type="number" name="monto" id="monto" readonly   class="form-control" value="{{$data->pendiente}}"></p>
                   <p><input type="hidden" name="montoreal" id="montoreal"   class="form-control" value="{{$data->pendiente}}"></p>
                   <p><input type="hidden" name="banco" id="banco"   class="form-control" value=""></p>
                   <p><input type="hidden" name="total_abono" id="total_abono"   class="form-control" value=""></p>
                    </div>
            </div>  
										 <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
					<div class="form-group">
					    <label for="proveedor">Moneda</label>
					<select name="pidpago" id="pidpago" class="form-control">
					<option value="100" selected="selected">Selecione...</option>
					@foreach ($monedas as $m)
					 <option value="{{$m-> idmoneda}}_{{$m->tipo}}_{{$m->valor}}">{{$m -> nombre}}</option> 
					@endforeach
					</select>
					</div>
				</div>
			<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
			<div class="form-group">
                      <label for="proveedor">Observacion</label>
                   <p><input type="text" name="observacion" id="referencia" class="form-control" value=""></p>
                    </div>
			</div>
			  <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
    <div class="form-group">
                      <label for="proveedor">Monto a Cancelar</label>
                   <p><input type="number" step='0.01' name="pagado" id="pagado"  requered  min="0.01"  class="form-control" value=""></p>
                    </div>
                    </div>
		
					 
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"><div align="center">
        <button type="button" class="btn btn-danger btn-sm" id="regresar" data-dismiss="modal">Cancelar</button>
        <input name="_token" value="{{ csrf_token() }}" type="hidden" ></input>
	
        <button type="button" id="procesa" class="btn btn-primary btn-sm" style="display: none">Procesar</button>
      </div>
        </div>

 </div></form>
	</div>
@push ('scripts')
<script>
 $(document).ready(function(){
if( $("#monto").val() ==0){
	document.getElementById('divdesglose').style.display = "none";  
}
  document.getElementById('atras').addEventListener('click', function() {
        window.location = "{{route('comisionvendedorshein')}}";
		
    });
     $('#regresar').click(function(){
		 $("#pagado").val(0);
		$('#divdesglose').fadeOut("fast");
    });  
	   $("#pagado").on("change",function(){
			var mc=$("#monto").val();
		   var pg=$("#pagado").val();
		   if(pg>mc){
			   alert('El monto indicado es mayor al monto de la comision.');
			   $("#pagado").val("");
			   $("#pagado").focus();
		   }else{	 
		 
			moneda= $("#pidpago").val();
			tm=moneda.split('_');
			tipom=tm[1];
			valort=tm[2];
			idpago=tm[0];
			
			$("#banco").val(idpago);
			if(tipom==0){
					$("#total_abono").val(pg);
			}
		   	if (tipom==1){ 		
		  		
				$("#total_abono").val(pg/valort);					
			}  
				if (tipom==2){   
				$("#total_abono").val(pg*valort);
			}  
		   $('#procesa').fadeIn("fast"); 
		   }
    }); 
	   $('#procesa').on("click",function(){
   
         var tv= $("#monto").val();
         var t1=$("#pagado").val();
		
		 if (t1==""){ alert ('Monto a pagar no pude ser vacio.'); return true;} 
		 if (t1==0){ alert ('Monto a pagar no pude ser 0.');return true; }		
       if (tv>t1){ alert ('Abono  Procesado con exito.');    
	   document.getElementById('procesa').style.display = "none";  
		document.getElementById('otro').submit();
		 
	   }
          if (tv==t1){ alert ('Pago Procesado con Exito.'); 
		  	document.getElementById('otro').submit();
		}
      });
		   $("#monto").on("click",function(){
  $('#pagado').val($('#monto').val());
    $('#procesa').fadeIn("fast");
    }); 
		$("#pidpago").change(mediopago);
   });
 
	   function mediopago(){
		$("#monto").val($("#montoreal").val());     
		//   alert();	
var mcomip= $("#monto").val();  
	     moneda= $("#pidpago").val();
		 tm=moneda.split('_');
		 var idmoneda=tipom=tm[0];
		  tipom=tm[1];
		  valort=tm[2];
		   moneda= $("#pidpago option:selected").text();
		   //alert(tipom);
		   	if (tipom==0){   
 				
				}  
			if (tipom==1){ 
				$("#monto").val((mcomip*valort).toFixed(2));  
				$("#referencia").val('Tc: '+valort);
			}
			if (tipom==2){   
				$("#monto").val((mcomip/valort).toFixed(2));  
				$("#referencia").val('Tc: '+valort); 
				}  
			//alert(mcomip);
		t_pago=$("#pidpago").val();	   
    }
		function actmonedas(aux,id,t){
	var dato=$("#vm"+aux).val();
var nv=$("#valor"+aux).val();
var ndato=id+'_'+t+'_'+nv;	
$("#vm"+aux).val(ndato);
$("#vmm"+aux).val(ndato);
}
</script>
@endpush
@endsection