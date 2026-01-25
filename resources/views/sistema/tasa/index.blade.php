@extends ('layouts.master')
@section ('contenido')
<?php $cont=0; $cntm=0; ?>
<div class="row px-3" >
		<div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
			<div class="form-group">
				<label >{{$empresa->nombre}}</label></br>
				<label >{{$empresa->rif}}</label></br>	
				<label >{{$empresa->direccion}}. Tel: {{$empresa->telefono}}</label>
			 </div>  
	    </div>
</div>
<div class="panel panel-primary">
<div class="panel-body">
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
  
        <h3 align="center">TASAS DE CAMBIO <?php if($tasabcv>0){?><i class="fa-solid fa-paste" id="tasabcv"></i><?php echo number_format( $tasabcv, 2,',','.')."Bcv."; }?> </h3>

</div>
 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<form action="{{route('updatetasas')}}" method="POST" enctype="multipart/form-data" >         
			{{csrf_field()}}
		<table align="center">
			<tr><td><strong>Moneda</strong></td><td><strong>Valor</strong></td><td><strong>Actualizar</strong></td></tr>
				@foreach ($monedas as $cat1)	<?php 
			
				if($cat1->tipo>0){	$cont++; 
					$tm="E";
					if($cat1->tipom=="N"){$cntm++; $tm="N";}
				?>			
				<tr>
				<td><input  type="text" readonly value="{{$cat1->nombre}}" name="nombre" class ="form-control"></input></td>
				<td><input type="number" readonly value="{{$cat1->valor}}" name="v" class ="form-control"></input></td>
				<td><input  type="hidden" value="{{$cat1->idmoneda}}" name="idmoneda[]" class ="form-control"></input>
				<input type="number" value="{{$cat1->valor}}" name="valor[]" id="vm<?php echo $cont; ?>" step="0.01" class ="form-control"></input>
				 <input  type="hidden" value="<?php echo $tm; ?>" id="tm<?php echo $cont; ?>" class ="form-control"></input>
				</td>
			</tr>
				<?php } ?>
				@endforeach
				
		</table>
  </div>  

 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center"></br>
 <input  type="hidden" value="<?php echo $cont; ?>" id="cntm" class ="form-control"></input>
 <input  type="hidden" value="{{$tasabcv}}" id="tasa" class ="form-control"></input>
       <div class="form-group">
          <input name="_token" value="{{ csrf_token() }}" type="hidden" ></input>
			@if($rol->acttasa==1) <button type="submit" id="" class="btn btn-primary" >Confirmar</button> @endif
       
	   </div> 
	  </form>  
  </div>
  </div>
</div>
@push ('scripts')
<script>
$(document).ready(function(){
	
    $("#Cenviar").on("click",function(){
      
         var form1= $('#actasa');
        var url1 = form1.attr('action');
        var data1 = form1.serialize();
  
    $.post(url1,data1,function(result){  
      var resultado=result;
          console.log(resultado); 
     $("#actasa")[0].reset();
        });
  
          });
	$('#tasabcv').on("click",function(){
			var nm=$("#cntm").val();
			var tasa=trunc($("#tasa").val(),2);
		for(var i=1;i<(nm+1);i++){
			var tm=$("#tm"+i).val();
			if(tm=="N"){
				$("#vm"+i).val(tasa);
			}
			 }
			
		});
});
function trunc (x, posiciones = 0) {
  var s = x.toString()
  var l = s.length
  var decimalLength = s.indexOf('.') + 1
  if(decimalLength>0){
  var numStr = s.substr(0, decimalLength + posiciones)
  }else{
	  numStr = s
  }
  return Number(numStr)
}
</script>
@endpush     
@endsection