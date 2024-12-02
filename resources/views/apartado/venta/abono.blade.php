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
$fecha_a=$venta->fecha_emi;
function dias_transcurridos($fserver,$fecha_a)
{
$dias = (strtotime($fecha_a)-strtotime($fserver))/86400;
//$dias = abs($dias); $dias = floor($dias);
return $dias;
}
if (dias_transcurridos($fecha_a,$fserver) > $venta->dias){
  $recargo=1;
  echo "<div class='alert alert-danger'>
      <H4>LIMITE DE DIAS DE APARTADO VENCIDO!!! ".dias_transcurridos($fecha_a,$fserver)." Dias</H4>
      </div>";
};
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
@include('apartado.venta.modalrecargo')
		<h3 align="center"><u>  ABONO DE APARTADO </u></h3>	
	</div>	
	<div class="col-sm-3 invoice-col" align="center">
<img src="{{ asset('dist/img/'.$empresa->logo)}}" width="50%" height="80%" title="NKS">
	</div>	
              </div>
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<table width="100%">
		<tr>
		<td width="45%"><strong>Cliente</strong></td>
		<td width="15%"><strong>Telefono</strong></td>
		<td width="10%"><strong>N° Apartado</strong></td>
		<td width="10%"><strong>Fecha</strong></td>
		<td width="10%"><strong>Monto</strong></td>
		<td width="10%"><strong>Saldo</strong></td>
	<?php if($recargo==1){?>	<td width="10%"><strong>Recargo</strong></td><?php } ?>
			</tr>
			<tr>
			<td>{{$venta->cedula}} -> {{$venta->nombre}}</td>
			<td>{{$venta->telefono}}</td>
			<td><?php $idv=$venta->num_comprobante; echo add_ceros($idv,$ceros); ?></td>
			<td><?php echo " ".date("d-m-Y",strtotime($venta->fecha_emi)); ?></td>
			<td><?php echo number_format( $venta->total_venta, 2,',','.'); ?></td>
			<td><?php echo number_format( $venta->saldo, 2,',','.'); ?></td>
		<?php if($recargo==1){?>	<td><a class="dropdown-item" href="" data-target="#modal-recargo-{{$venta->idventa}}" data-toggle="modal"><i class="fa-solid fa-percent"></i> </a></td><?php } ?>
			</tr>
			<tr><td><strong>Recargo</strong></td>
			<td colspan="5"><strong>Observaciones</strong></td>
			</tr>
			<tr><td><?php echo number_format( $venta->recargo, 2,',','.'); ?></td>
			<td colspan="5">{{$venta->obs}}</td>
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
                          <th>Tipo</th>
                          <th>Monto</th>
						  <th>Tasa</th>
                          <th>Monto$</th>
                          <th>Fecha</th>
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
						   <td><?php echo " ".date("d-m-Y",strtotime($re->fecha)); ?></td>
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
                <?php } ?>
        </div>                   		
             <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-group">
         
                    <p>           <label for="num_comprobante">Fecha: </label><?php echo " ".date("d-m-Y h:i:s a",strtotime($venta->fecha_hora)); ?></br>
					Sistema de apartado a <?php echo $venta->dias; ?> dias, el incumplimiento de los dias tendra un incremento de <?php echo $venta->incremento; ?>%,
					del monto pendiente para la cancelacion total del Documento.
					</p>
                </div>
            </div> 
							@include('proveedores.pagar.modalmonedas')
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
                 <div class="form-group" align="center" style="background-color: #54b279">
				                       <label for="proveedor">&nbsp;</label>
				<a href="#" data-target="#modalm" data-toggle="modal"><button  class="btn btn-warning">Act. Tasas </button></a></td>

                    </div>
		</div>
<form action="{{route('saveabono')}}" id="formulario" method="POST" enctype="multipart/form-data" >    
<div class ="row" id="divdesglose" >
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					   <input type="hidden" value="{{$empresa->tc}}" id="valortasa" name="tc" class="form-control">
						<input type="hidden" value="{{$empresa->peso}}" id="valortasap" name="peso" class="form-control">
						<input type="hidden" value="" id="total_venta" name="total_venta" class="form-control">
						<input type="hidden" value="{{$empresa->fl}}" id="usafl"  class="form-control">
						<input type="hidden"  id="venta" name="venta" value="{{$venta->idventa}}" class="form-control">
					   <h3  align="center">TOTAL <input type="number" id="divtotal" value="{{$venta->saldo}}" disabled ><span id="pasapago" title="haz click para hacer cobro total">RESTA</span> <input type="number" id="resta" disabled value="{{$venta->saldo}}">
						<input type="hidden" name="tdeuda" id="tdeuda" value="{{$venta->saldo}}" class="form-control"> 
						</h3>
		</div>			
		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
						<div class="form-group">
						<select name="pidpago" id="pidpago" class="form-control">
						<option value="100" selected="selected">Selecione...</option>
						@foreach ($monedas as $m)<?php $count++;?>
						<option id=vm<?php echo $count; ?> value="{{$m-> idmoneda}}_{{$m->tipo}}_{{$m->valor}}">{{$m -> nombre}}</option>
						@endforeach
						</select>
						</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
						<div class="form-group">
						<input type="number" class="form-control" name="pmonto" id="pmonto" placeholder=""  min="1" step="0.01">
						</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
						<div class="form-group">
						<input type="text" name="preferencia" class="form-control" id="preferencia" onchange="conMayusculas(this);" placeholder="Referencia...">
						</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
						<div class="form-group">
						<button type="button" id="bt_pago" style="display: none" class="form-control" > <i class="fa fa-fw fa-plus-square"></i> </button>
						</div>
		</div>		
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<table id="det_pago" class="table table-striped table-bordered table-condensed table-hover">
                      <thead style="background-color: #54b279">
                          <th>Supr</th>
                          <th width="15%">Tipo</th>
						   <th width="15%">Monto</th>
                          <th>Monto $</th>
                          <th>Referencia</th>
                      </thead>
                      <tfoot> 
                      <th></th>
                          <th></th>
						   <th></th>
                          <th><h3>Total $</h3></th>
                          <th><h3 id="total_abono">$.  0.00</h3></th><input type="hidden" name="totala" id="totala" value="0.00">
                          </tfoot>
                      <tbody></tbody>
                    </table>
	
		</div>
			
		<div class="col-lg-12 ol-md-12 col-sm-12 col-xs-12" align="right">	
			<div class="col-lg-4 ol-md-4 col-sm-4 col-xs-4" align="right" style="display: none" id="cfl">
							¿ Forma Libre ? <input type="checkbox" id="convertir" name="convertir" />							
							</div>
					<div class="col-lg-8 ol-md-8 col-sm-8 col-xs-8" align="right">
						<button type="button" class="btn btn-danger btn-sm" id="regresar" data-dismiss="modal">Cancelar</button>
						<input name="_token" value="{{ csrf_token() }}" type="hidden" ></input>
						<button type="button" id="procesa" class="btn btn-primary btn-sm">Procesar</button>
						<div style="display: none" id="loading">  <img src="{{asset('img/sistema/loading30.gif')}}"></div>
					  
						</div>
		</div>
		</div>
	
</form>
        </div>
	</div>
@push ('scripts')
<script>
$(document).ready(function(){
	$('#pasapago').click(function(){
			datosbanco=$("#pidpago").val();
			if(datosbanco==100){
			alert('¡Debe seleccionar un tipo de Pago!');}
			else{ $("#pmonto").val($("#resta").val());
			document.getElementById('bt_pago').style.display=""; 
			$("#preferencia").focus();}
		})
				$('#procesa').click(function(){   
			document.getElementById('loading').style.display=""; 
			document.getElementById('procesa').style.display="none"; 
			document.getElementById('regresar').style.display="none"; 
			document.getElementById('formulario').submit(); 
		})
		$('#regresar').on("click",function(){
 window.location="{{route('apartado')}}";
  
});
$("#pidpago").change(mediopago);
	$('#bt_pago').click(function(){
			agregarpago();
			});   
});
// calculo pago
	function mediopago(){
	    document.getElementById('bt_pago').style.display="";		
	   var pesoresta =$("#resta").val();  
       var pesototal =$("#divtotal").val();
	   var tabono=$("#totala").val();
	   
	   var debe=(pesototal-tabono);
	     moneda= $("#pidpago").val();
		 tm=moneda.split('_');
		  tipom=tm[1];
		  valort=tm[2];
		   //alert(tipom);
		   	if (tipom==0){   
				$("#resta").val((pesototal-tabono).toFixed(2));  
				}  
			if (tipom==1){ 
				$("#resta").val((debe*valort).toFixed(2)); 
				$("#preferencia").val('Tc: '+valort);  				
			}
			if (tipom==2){   
				$("#resta").val((debe/valort).toFixed(2));  
				$("#preferencia").val('Tc: '+valort);  
				}  				
		t_pago=$("#pidpago").val();
    }
	acumpago=[];var contp=0; var tresta=0; var pagototal=0;
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
			  var tdoc=$("#tipodoc").val();
		var denomina=pmonto;
			acumpago[contp]=(pmonto);
			if (tipom==1){ 
			    var pesoresta =$("#resta").val();   
					$("#total_abono").text(pagototal/valort);
				    denomina=parseFloat(pmonto).toFixed(2);
					pmonto=(parseFloat(pmonto)/parseFloat(valort));		
					acumpago[contp]=(pmonto.toFixed(2)); 
			}  
				if (tipom==2){ 
			    var pesoresta =$("#resta").val();   
				$("#resta").val(pesoresta*valort);  
				$("#total_abono").text(pagototal*valort);
				    denomina=parseFloat(pmonto).toFixed(2);
					pmonto=(parseFloat(pmonto)*parseFloat(valort));		
					acumpago[contp]=(pmonto.toFixed(2)); 
			} 
        pagototal=parseFloat(pagototal)+parseFloat(acumpago[contp]); 
		//salert(pagototal);
        tventa=$("#divtotal").val();
        tresta=(parseFloat(tventa)-parseFloat(pagototal));
            $("#resta").val(tresta.toFixed(2));
            $("#tdeuda").val(tresta.toFixed(2));	
            var fila='<tr  id="filapago'+contp+'"><td align="center"><span onclick="eliminarpago('+contp+');"><i class="fa fa-fw fa-eraser"></i></span></td><td><input type="hidden" name="tidpago[]" value="'+idpago+'"><input type="hidden" name="tidbanco[]" value="'+tpago+'">'+tpago+'</td><td><input type="hidden" name="denominacion[]" value="'+denomina+'">'+denomina+'</td><td><input type="hidden" name="tmonto[]" value="'+pmonto+'">'+pmonto.toLocaleString('de-DE', { style: 'decimal',  decimal: '2' })+'</td><td><input type="hidden" name="tref[]" value="'+pref+'">'+pref+'</td></tr>';
            contp++;
            document.getElementById('bt_pago').style.display="none";
			document.getElementById('procesa').style.display="";
			$("#pidpago").val('100');
			$("#total_abono").text(pagototal.toFixed(2));
			$("#totala").val(pagototal.toFixed(2));
			limpiarpago();		 
             $('#det_pago').append(fila);
			 if(($("#tdeuda").val()==0) && (tdoc==1)&& ($("#usafl").val()==1)){
				document.getElementById('cfl').style.display="";
				}
		}else{ alert('¡El monto indicado no debe se mayor al saldo pendiente!');
		limpiarpago();		}
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
		//alert(var1);
        nv=(parseFloat(resta)+parseFloat(total));
        nc=(parseFloat(var1)-parseFloat(total));
        $("#resta").val(nv.toFixed(2));   
        $("#tdeuda").val(nv.toFixed(2));  
        $("#totala").val(nc.toFixed(2));
		pagototal=(parseFloat(pagototal)-parseFloat(total));
        $("#filapago" + index).remove();
        $("#total_abono").text(nc.toFixed(2));
			limpiarpago();
					if($("#tdeuda").val()==0){
				document.getElementById('cfl').style.display="";
				
				}else{ 
					document.getElementById('convertir').checked=false; 
					document.getElementById('cfl').style.display="none"; } 
			if(nc==0){
			document.getElementById('procesa').style.display="none";	
			}
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