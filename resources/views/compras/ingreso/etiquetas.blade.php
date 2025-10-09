@extends ('layouts.master')
@section ('contenido')
<?php $v1=0; ?>
	<div class="invoice p-3 mb-3">
	<div class="row">
		@include('compras.ingreso.settings')
</div>
<div class="row">
			@foreach($detalles as $det)<?php $v1++; ?>
			<div class="col-lg-6  col-md-6 col-sm-6 col-xs-6" >
                    <div class="form-group" align="center">
					 <p id="<?php echo "code".$v1; ?>" style="color: black; font-size: 20px;" align="center">{{$det->codigo}} </p>
					 <p id="<?php echo "name".$v1; ?>" style="color: black; font-size: 20px;" align="center" > {{$det->articulo}} </p>
						 <p id="<?php echo "price".$v1; ?>" style="color: black; font-size: 20px;" align="center" > {{$det->precio1}} $ </p>
</bR>                   
				   </div>
                </div>  
            @endforeach	
			<input type="hidden" class="form-control" id="reg" name="reg" value="{{$v1}}">
			</div>
         	<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center">
                     <button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button>
					 <button type="button" id="regresar" class="btn btn-danger btn-sm" data-dismiss="modal">Regresar</button>
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
  window.location="{{route('compras')}}";
  
});
});
function aumentarTamano(aux) {
var reg=$("#reg").val();
		for(var i=1;i<=reg;i++){
	 const elemento = document.getElementById(aux+i);	 
	 let tamanoActual = parseFloat(elemento.style.fontSize);
		elemento.style.fontSize = (tamanoActual + 2) + "px"; }
}

function disminuirTamano(aux) {
var reg=$("#reg").val();
		for(var i=1;i<=reg;i++){
	 const elemento = document.getElementById(aux+i);	 
	 let tamanoActual = parseFloat(elemento.style.fontSize);
		elemento.style.fontSize = (tamanoActual - 2) + "px"; }
}
function cambiarcolor(aux,color) {
var reg=$("#reg").val();
var color=$("#"+color).val(); 
		for(var i=1;i<=reg;i++){
	 const elemento = document.getElementById(aux+i);	 
		 elemento.style.color = color; }
}

</script>
@endpush
@endsection