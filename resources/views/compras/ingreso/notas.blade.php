@extends ('layouts.master')
@section ('contenido')
<?php 
$ceros=5;
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
		<h2 align="center"><u>  Nota de Entrega </u></h2>
		<h5 align="center"><?php echo add_ceros($ingreso->idcompra,$ceros); ?></h5>
		
	</div>
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
	<h5 align="center">IMPORTAR NOTA DE ENTREGA A COMPRAS</h5>
  <hr/>	 <form action="{{route('almacenanota')}}" id="formarticulo" method="POST" enctype="multipart/form-data" >         
        {{csrf_field()}}
		    <div class="row">
			
	      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <div class="form-group">
                	<label for="tipo_comprobante">Emision</label>
                         <input type="date" name="emision" class="form-control" value="{{$ingreso->emision}}">
                </div>
				</div>
				         	      <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <div class="form-group">
                    <label for="serie_comprobante">Serie-Documento</label>
                    <input type="text" name="serie_comprobante" value="{{$ingreso->serie_comprobante}}" class="form-control"placeholder="Numero del Documento" > 
                    <input type="hidden" name="id" value="{{$ingreso->idcompra}}" class="form-control" > 
                </div>
            </div>
			            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <div class="form-group">
                    <label for="num_comprobante">Numero Control</label>
                    <input type="text" required name="num_comprobante" id="num_comprobante" value="{{$ingreso->num_comprobante}}" class="form-control" placeholder="Numero de Control">
                </div>
            </div>
				</div>
            <div class ="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="table-responsive">
                  <table id="detalles" class="table table-striped table-bordered table-condensed table-hover">
                      <thead style="background-color: #A9D0F5">
                     
                          <th>Articulo</th>
                          <th>Cantidad</th>
                          <th>Precio Compra</th>
                          <th>Iva</th>
                          <th>Neto</th>
                          <th>Subtotal</th>
                      </thead>
                          <?php  $cnt=0; $mo=0; $abono=0; $acum=0; $pc=0;?>
                      <tbody>
                        @foreach($detalles as $det)
                        <?php $cnt++;  $mo=$mo+($det->subtotal); $pc= $det->cantidad*$det->precio_compra ?>
                        <tr >
                          <td>{{$det->articulo}}</td>
                          <td> <input id="cnt<?php echo $cnt; ?>"   type="number" readonly style="width: 60px" name="cantidad[]" value="{{$det->cantidad}}"></td>
                          <td> <input id="p<?php echo $cnt; ?>" onchange="javascript:calcular({{$cnt}});" step="0.01" type="number" style="width: 60px"  name="precio[]" value="{{$det->precio_compra}}"></td>
                          <td><input  id="iva<?php echo $cnt; ?>" type="number" style="width: 60px" name="iva[]" readonly value="{{$det->iva}}"></td>
                           <td><input  id="neto<?php echo $cnt; ?>" type="number" style="width: 60px" name="neto[]" readonly value="{{$pc}}"></td>
                          <td><input  id="sub<?php echo $cnt; ?>" type="number" style="width: 80px" name="subt[]" readonly  value="{{$det->subtotal}}">
						  <input type="hidden" name="detalle[]"  value="{{$det->iddetalle}}">
						  </td>
                        </tr>
                        @endforeach
                      </tbody> 
                      <tfoot> 
                     
                          <th colspan="5">TOTAL:</th>
                          <th ><input type="hidden" style="width: 80px" name="tcompra" id="tcompra" value="{{$mo}}"><h4 id="total"><b> <?php  echo number_format( $mo, 2,',','.'); ?> $</b></h4></th>
                          </tfoot>
                  </table>
				  </div>
				  </div>

     
        </div>				
		<div class="row">
                  <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <label >Base Imponible: </label>  <input  id="tbase" type="number" style="width: 80px" name="tbase" readonly  value="{{$ingreso->base}}">
                    </div>
                     <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <label >Iva: </label> <input  id="tiva" type="number" style="width: 80px" name="tiva" readonly  value="{{$ingreso->miva}}">
                    </div>
                     <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <label >Exento: </label> <input  id="texe" type="number" style="width: 80px" name="texe" readonly  value="{{$ingreso->exento}}">                 
					</div>
                    </div>
            	
             <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="form-group">
                    <label for="num_comprobante">Fecha:</label>
                    <p><?php echo date("d-m-Y",strtotime($ingreso->fecha_hora)); ?></p>
                </div>
            </div> 		
			<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center">
					 <button type="button" id="regresar" class="btn btn-danger" data-dismiss="modal" title="Presione Alt+flecha izq. para regresar">Regresar</button>
                     <button type="submit" id="send" class="btn btn-primary" data-dismiss="modal">Convertir</button>
                    </div>
                </div>  
				</form>
            </div> 
			@push ('scripts')
<script>
$(document).ready(function(){
	var acumneto=0;

$('#regresar').on("click",function(){
    window.location="{{route('compras')}}";
  
});
$('#send').on("click",function(){
	  document.getElementById('send').style.display="none";  
});
});
function calcular(cnt){
	tcomp=$("#tcompra").val();
	sbant=$("#neto"+cnt).val();
	cant=$("#cnt"+cnt).val();
	pc=$("#p"+cnt).val();
	iva=$("#iva"+cnt).val();
	miva=$("#tiva").val(); 
	mbase=$("#tbase").val();
	mexe=$("#texe").val();
	var nneto=(cant*pc);
	vneto=$("#neto"+cnt).val();
	var subant= $("#sub"+cnt).val();	
//
if(iva > 0){
	var mexeant=0;
	var ivant=(sbant*(iva/100));
	var sb=(nneto*(1+(iva/100)));
	var niva=(nneto*((iva/100)));
$("#tiva").val((((miva-ivant)+niva)));	
$("#tbase").val((((mbase-vneto)+nneto)));
}else{
	sb=cant*pc;
	ivant=0;
	var mexeant=vneto;
	$("#texe").val((((mexe-mexeant)+sb)));
}

$("#neto"+cnt).val(nneto);
$("#sub"+cnt).val(sb.toFixed(2));
$("#tcompra").val(((tcomp-subant)+sb).toFixed(2));
$("#total").html(((tcomp-subant)+sb).toFixed(2));
}
</script>
@endpush
@endsection