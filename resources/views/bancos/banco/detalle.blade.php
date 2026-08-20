@extends ('layouts.master')
@section ('contenido')
<?php $cal=0;
switch ($datmoneda->tipo){
	case "1":
       $cal="/";
        break;
	case "2":
       $cal="*";
        break;
		default:
		$cal="/";
		break;
} ?>
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
   @include('bancos.banco.searchdetalle')
   </div>
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <h3 align="center">DETALLE DE MOVIMIENTOS BANCARIOS {{$banco->nombre}}</h3> 

      <table id="ing" class="table table-striped table-bordered table-condensed table-hover">
        <thead >
        <th width="3%">#Mov</th>
        <th width="10%">Fecha</th>
		<th width="8%">N&uacute;mero</th>
        <th>Clasificador</th>
		<th>Concepto</th>
		<th width="25%">Beneficiario</th>
        <th>Tipo</th>
        <th>Monto</th><?Php if($datmoneda->tipo >0 ){  echo "<th align='center'> Ref $</th>";  }?>
        <th>Usuario</th>
		</thead>
        <TBODY>
        <?php $tcompras=0; ?>
               @foreach ($movimiento as $q)
               <?php  $tcompras=($tcompras+$q->monto);?>
				<tr> 
	       <td><small>{{ $q->id_mov}}</small></td> 
          <td><small><?php  echo $fecha=date_format(date_create($q->fecha_mov),'d-m-Y h:i:s');?></small></td>
          <td> <small> <a href="{{route('showrecibo',['id'=>$q->id_mov])}}"> <strong>{{ $q->numero}}</strong></a></small></td>

          <td><small>{{ $q->descrip}}</small></td>
		  <td><small>{{ $q->concepto}}</small></td>
		  <td><small>{{ $q->identificacion}}</small></td>
          <td><small>{{ $q->tipo_mov}}</small></td>
          <td><small><?php
			echo number_format(($q->monto),'2','.',','); ?></small></td>	
		 <?php  if($datmoneda->tipo >0 ){  
			$monto = $q->monto;
			$tasa = $q->tasadolar;
			if($cal == '*') { $resultado = $monto * $tasa; }
			else { $resultado = $monto / $tasa; }
		 ?>	<td align="center"><small>
			 {{number_format(($resultado),'2','.',',')}}</small></td> <?php } ?> 
          <td><small>{{  $q->user}}</small></td>
				</tr> @endforeach
 
			</TBODY>
      <TFOOT>
           <th>#Mov</th>
         <th>Fecha</th>
          <th>N&uacute;mero</th>
          <th>Clasificador</th>
          <th>Concepto</th>
          <th>Beneficiario</th>
            <th>Tipo</th>
          <th>Monto</th>
		<?Php if($datmoneda->tipo >0 ){	 echo "<th align='center'>Ref $</th>"; }?>
          <th>Usuario</th>
      </TFOOT>
			</table>
   <table id="databanco" style="display:none">
        <thead >
        <th >Mov</th>
        <th >Fecha</th>
		<th>Numero</th>
        <th>Clasificador</th>
		<th>Concepto</th>
		<th >Beneficiario</th>
        <th>Tipo</th>
        <th>Monto</th>
        <th>Usuario</th>
		</thead>
<?php $tcompras=0; ?>
               @foreach ($movimiento as $q)
               <?php  $tcompras=($tcompras+$q->monto);?>
				<tr> 
	       <td>{{ $q->id_mov}}</td> 
          <td><?php  echo $fecha=date_format(date_create($q->fecha_mov),'d-m-Y h:i:s');?></td>
          <td> {{ $q->numero}}</td>
          <td>{{ $q->descrip}}</td>
		  <td>{{ $q->concepto}}</td>
		  <td>{{ $q->identificacion}}</td>
          <td>{{ $q->tipo_mov}}</td>
          <td><?php echo number_format(($q->monto),'2','.',','); ?></td>	
          <td>{{  $q->user}}</td>
				</tr> @endforeach    
			</table>
  </div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">
 
	<a href="{{route('showbanco',['id'=>$banco->idbanco])}}"  id="regresar"><button  class="btn btn-danger btn-sm btn-pull-left" >Regresar</button></a> 
<button onclick="htmlExcel('databanco', 'Mov_Bancos')" class="btn btn-warning btn-sm">Exportar XLS</button>       
	   <a ><button class="btn btn-primary btn-sm   pull-right" id="imprimir">Imprimir</button></a>           
	</div>
 

                  
   
@push ('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
  //  alert ('si');
  document.getElementById('imprimir').style.display="none";
  window.print(); 
  window.location="{{route('showbanco',['id'=>$banco->idbanco])}}";
    });

});
	function htmlExcel(idTabla, nombreArchivo = '') {
	  let linkDescarga;
	  let tipoDatos = 'application/vnd.ms-excel';
	  let tablaDatos = document.getElementById(idTabla);
	  let tablaHTML = tablaDatos.outerHTML.replace(/ /g, '%20');

	  // Nombre del archivo
	  nombreArchivo = nombreArchivo ? nombreArchivo + '.xls' : 'Mov_Bancos.xls';

	  // Crear el link de descarga
	  linkDescarga = document.createElement("a");

	  document.body.appendChild(linkDescarga);

	  if (navigator.msSaveOrOpenBlob) {
		let blob = new Blob(['\ufeff', tablaHTML], {
		  type: tipoDatos
		});
		navigator.msSaveOrOpenBlob(blob, nombreArchivo);
	  } else {
		// Crear el link al archivo
		linkDescarga.href = 'data:' + tipoDatos + ', ' + tablaHTML;

		// Setear el nombre de archivo
		linkDescarga.download = nombreArchivo;

		//Ejecutar la función
		linkDescarga.click();
	  }
	}
</script>

@endpush
@endsection