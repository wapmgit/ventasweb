@extends ('layouts.master')
@section ('contenido')

<?php $aux=0; $ceros=5; $acumexe=0; $exe=0;$acumiva=0; $fserver=date('Y-m-d'); $nstock=0; $acumitem=0;
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
$tasa=0;$acumsub=0;$acumiva=0; $acumbase=0; $auxf=0;$cxccli=0;$acumpeso=0;

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
			@include('pedidos.pedido.empresa')
              </div>
		
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<table width="100%"><tr><td width="30%"><strong>Cliente</strong></td><td width="13%"><strong>Telefono</strong></td><td width="27%"><strong>Direccion</strong></td><td width="15%"><strong>Documento</strong></td><td width="15%"><strong>Vendedor</strong></td>
						</tr>
						<tr><td>{{$venta->cedula}} -> {{$venta->nombre}}</td><td>{{$venta->telefono}}</td><td>{{$venta->direccion}}</td><td>{{$venta->tipo_comprobante}} <?php $idv=$venta->num_comprobante; echo add_ceros($idv,$ceros); $tasa=$empresa->tc; ?></td><td width="20%">{{$venta->nombrev}}</td>
						</tr>
					</table></br>
				</div>
			</div>          
		
            <div class ="row">
                <div class="panel panel-primary">
                <div class="panel-body">
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				  <div class="table-responsive">
                  <table id="detalles" width="100%">
                      <thead style="background-color: #A9D0F5">
					
                          <th>Articulo </th>
                          <th>Cantidad</th>
                          <th>Unidad</th>
						  <th>Precio</th>
                          <th>Descuento</th>
                          <th>Precio Venta</th>
                          <th>Subtotal</th>
                      </thead>
                      <tbody>
                        @foreach($detalles as $det)										
						<?php 
						$acumpeso=$acumpeso+(($det->cantidad*$det->cntgrp)*$det->peso);
						$nstock=$det->stock/$det->cntgrp;
						if ($det->cantidad>$nstock){ $auxf=1;}?>
                        <tr >
                          <td> {{$det->articulo}} @if($det->cntgrp>1) *{{$det->cntgrp}}UND  @endif
						  </td>
                          <td>
						 {{$det->cantidad}}
						
						  </td> 
                          <td align="center">{{$det->unidad}}</td>

                          <td>{{$det->precio}}</td>
                          <td>{{$det->descuento}}</td>
                          <td><?php echo number_format( $det->precio_venta, 2,',','.'); ?></td>
                          <td><?php echo number_format( ($det->cantidad*$det->precio_venta), 2,',','.'); ?></td>
                        </tr>
				
                        @endforeach
                      </tbody>
                  </table>
                    </div>
                    </div>
 
                </div>
                    
                </div>

             <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-group">
                    <label for="num_comprobante">Fecha:</label>
                    <p>{{$venta->fecha_hora}}</p>
                </div>
            </div> 
				<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12" id="divbtn">
                    <div class="form-group" align="center">
                     <button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button>
                    </div>
                </div>
        </div>
	</div>	
@push ('scripts')
<script>
$(document).ready(function(){
	 document.getElementById('bt_pago').style.display="none";
    $('#imprimir').click(function(){
	 	$(".filaoc").remove();
	  document.getElementById('linkmodal').style.display="none";
	  document.getElementById('divbtn').style.display="none";
	  document.getElementById('footerp').style.display="none";
	  window.print(); 
	  window.location="{{route('pedidos')}}";
    });
		$('#pasapago').click(function(){
		datosbanco=$("#pidpago").val();
		if(datosbanco==100){
		alert('¡Debe seleccionar un tipo de Pago!');}
		else{ $("#pmonto").val($("#resta").val());
		document.getElementById('bt_pago').style.display=""; 
		$("#preferencia").focus();}
	});
	$("#pidpago").change(mediopago);
	$("#id_cliente").change(mostrarcuenta);
	$('#bt_pago').click(function(){		
		agregarpago();
	});
	$("#pidarticulo").change(function(){
		 var tp= $("#tp").val();
		if (tp==1){  tpc=2;}
		if (tp==2) {   tpc=3;}	 
		else {   tpc=8;}
		document.getElementById('pcantidad').focus();
		datosarticulo=document.getElementById('pidarticulo').value.split('_');
	   $("#pprecio_venta").val(datosarticulo[tpc]);
      $("#pf").val(datosarticulo[tpc]);
	  $("#pcostoarticulo").val(datosarticulo[4]);
     $("#pcantidad").attr("step",datosarticulo[7]);
     $("#pcantidad").attr("min",datosarticulo[7]);
	 $("#pcantidad").val(datosarticulo[7]);
	 $("#usag").val(datosarticulo[9]); 
     $("#idarticulo").val(datosarticulo[0]);
		  document.getElementById('btnsubmit').style.display="";
	});
	$('#btnsubmit').click(function(){
		document.getElementById('btnsubmit').style.display="none";
		});	

	$('#btncerrar').click(function(){
      $("#pprecio_venta").val(0);
      $("#pf").val(0);
	  $("#pcostoarticulo").val(0);
      $("#pcantidad").val("1");
      $("#idarticulo").val(0);
		});
	$('#sendpedido').click(function(){	
		limit= $("#limitcre").val();
		cxccli= $("#cxccli").val();
		clave= $("#claveaut").val();
		abono= $("#totala").val();
        tv= $("#total_venta").val();
		rest= $("#resta").val();
		var t1=parseFloat(abono);
		if(limit==0){ limit=parseFloat(rest)+parseFloat(cxccli)+1;}
		if(rest <= 0){
		document.getElementById('sendpedido').style.display="none";
		document.getElementById('forimportar').submit();
		}else{
			var valicxc=parseFloat(rest)+parseFloat(cxccli);
		if (valicxc > limit){
			$("#modalpedido").modal('hide');
(async () => {
  const { value: password } = await Swal.fire({
    title: "Limite de Credito Excedido",
    input: "password",
    inputLabel: "Ingrese Clave de Autorizacion",
    inputPlaceholder: "Ingrese Clave",
    inputAttributes: {
      maxlength: "15",
      autocapitalize: "off",
      autocorrect: "off"
    }
  });
  if (password==clave) {
document.getElementById('sendpedido').style.display="none";
		document.getElementById('forimportar').submit();
  } else {
    Swal.fire('Clave Incorrecta');
  }
})();
		}else{
	document.getElementById('sendpedido').style.display="none";
		document.getElementById('forimportar').submit();

		}
		}
});
});

 function mediopago(){
	   	document.getElementById('bt_pago').style.display="";		
	   var pesoresta =$("#resta").val();  
       var pesototal =$("#divtotal").val();
	   var tabono=$("#totala").val();
	   var debe=(pesototal-tabono);

	     moneda= $("#pidpago").val();
		 tm=moneda.split('_');
		 var idmoneda=tipom=tm[0];
		  tipom=tm[1];
		  valort=tm[2];
		   moneda= $("#pidpago option:selected").text();
		   //alert(tipom);
		   	if (tipom==0){   
				$("#resta").val(pesototal-tabono); 		
				$("#preferencia").val(""); 				
				}  
			if (tipom==1){ 
				$("#resta").val((debe*valort).toFixed(2));  
				$("#preferencia").val('Tc: '+valort);
			}
			if (tipom==2){   
				$("#resta").val((debe/valort).toFixed(2));  
				$("#preferencia").val('Tc: '+valort); 
				}  
				$("#pmonto").attr('placeholder','Monto '+moneda);
		t_pago=$("#pidpago").val();	   
    }
		function mostrarcuenta(){ 
		
		dato=document.getElementById('id_cliente').value.split('_');

		var limi= dato[1];
		$("#limitcre").val(limi);
		
			var formc= $('#forimportar');
			var urlc = '{{route("ventacxc")}}';
			var datac = formc.serialize();
    $.post(urlc,datac,function(result){  
      var resultadoc=result;
          console.log(resultadoc);
		  		rows=resultadoc.length; 			
			if(rows>0){
				var ms=resultadoc[0].monto.toFixed(2);
					$("#cxccli").val(ms);
			}else{ $("#cxccli").val(0);
			}
            });
		}
	   var cli=$("#id_cliente").val();
	var pagototal=0;
	acumpago=[];var contp=0; var tresta=0;
	function agregarpago(){ 
	
        vresta=$("#resta").val();    
		idpago=$("#pidpago").val();
        tpago= $("#pidpago option:selected").text();
        pmonto= $("#pmonto").val();
        pref= $("#preferencia").val();

		moneda= $("#pidpago").val();
		 tm=moneda.split('_');
		  tipom=tm[1];
		  valort=tm[2];
		idpago=tm[0];
		 
		if(parseFloat(pmonto)<=parseFloat(vresta)){
			var denomina=pmonto;
			acumpago[contp]=(pmonto);
			//	alert(acumpago[contp]);
		
			if (tipom==1){ 
			    var pesoresta =$("#resta").val();  
					//$("#resta").val(pesoresta/valort);  
					$("#total_abono").text(pagototal/valort);
				    denomina=pmonto;
					pmonto=(pmonto/valort);		
					acumpago[contp]=(pmonto.toFixed(2)); 
			}  
				if (tipom==2){ 
			    var pesoresta =$("#resta").val();   
				$("#resta").val(pesoresta*valort);  
				$("#total_abono").text(pagototal*valort);
				    denomina=pmonto;
					pmonto=pmonto*valort;		
					acumpago[contp]=(pmonto.toFixed(2)); 
			}            
			pagototal=parseFloat(pagototal)+parseFloat(acumpago[contp]); 
		
			tventa=$("#divtotal").val();
			tresta=(parseFloat(tventa)-parseFloat(pagototal));
            $("#resta").val(tresta.toFixed(2));
            $("#tdeuda").val(tresta.toFixed(2));	
			
            var fila='<tr  id="filapago'+contp+'"><td align="center"><span onclick="eliminarpago('+contp+');"><i class="fa fa-fw fa-eraser"></i></span></td><td><input type="hidden" name="tidpago[]" value="'+idpago+'"><input type="hidden" name="tidbanco[]" value="'+tpago+'">'+tpago+'</td><td><input type="hidden" name="denominacion[]" value="'+denomina+'">'+denomina+'</td><td><input type="hidden" name="tmonto[]" value="'+pmonto+'">'+pmonto.toLocaleString('de-DE', { style: 'decimal',  decimal: '2' })+'</td><td><input type="hidden" name="tref[]" value="'+pref+'">'+pref+'</td></tr>';
            contp++;
            document.getElementById('bt_pago').style.display="none";
			$("#pidpago").val('100');
			$("#pmonto").attr('placeholder','Esperando Seleccion');
			$("#total_abono").text(pagototal.toFixed(2));
			$("#totala").val(pagototal.toFixed(2));
			// alert($("#totala").val());
           limpiarpago();		
			$("#pidpago").focus();		   
            $('#det_pago').append(fila);
			if($("#faccredito").val()==0){		
			if(($("#tdeuda").val()==0) && ($("#usafl").val()==1)){
				document.getElementById('cfl').style.display="";
				}
			}else{
					document.getElementById('cfl').style.display="";
			}
		}else { alert('¡El monto indicado no debe se mayor al saldo pendiente!');
			limpiarpago();		
			}
	}
	function limpiarpago(){
        $("#pmonto").val("");
        $("#preferencia").val("");
    }
	function eliminarpago(index){
	    $("#pidpago").val('100');
        total=acumpago[index];
		tventa=$("#divtotal").val();
        var1=$("#total_abono").text();
		resta=parseFloat(tventa)-parseFloat(var1);
        nv=(parseFloat(resta)+parseFloat(total));
        nc=(parseFloat(var1)-parseFloat(total));
        $("#resta").val(nv);   
        $("#tdeuda").val(nv);  
		$("#totala").val(nc);
        pagototal=(parseFloat(pagototal)-parseFloat(total));
        $("#filapago" + index).remove();
        $("#total_abono").text(nc.toFixed(2));
		$("#totala").val(nc.toFixed(2));
		document.getElementById('procesa').style.display="none"; 
		if($("#tdeuda").val()==0){
				document.getElementById('cfl').style.display="";
				
				}else{ 
				//	$("#convertir").attr("checked",false);
					document.getElementById('convertir').checked=false; 
					document.getElementById('cfl').style.display="none"; } 
    }
</script>

@endpush
@endsection