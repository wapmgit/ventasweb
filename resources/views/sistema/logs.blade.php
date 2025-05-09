@extends ('layouts.master')
@section ('contenido')
<?php
 $fserver=date('Y-m-d');
$fecha_a=$empresa -> fechavence;
function dias_transcurridos($fecha_a,$fserver)
{
$dias = (strtotime($fecha_a)-strtotime($fserver))/86400;
//$dias = abs($dias); $dias = floor($dias);
return $dias;
}
$vencida=0;
if (dias_transcurridos($fecha_a,$fserver) < 0){
  $vencida=1;
  echo "<div class='alert alert-danger'>
      <H2>LICENCIA DE USO DE SOFTWARE VENCIDA!!!</H2> contacte su Tecnico de soporte.
      </div>";
};
?>
<style>
#list  p {
    font: arial;
    font-size: 14px;
    background-color: #EAEDED ;
}</style>
<div class="invoice p-3 mb-3">
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="list">
 <p><iframe src="{{'dist/errors.txt'}}" frameborder="0" height="400"
      width="95%"></iframe></p>
		</div>

	</div>
	</div>
@endsection