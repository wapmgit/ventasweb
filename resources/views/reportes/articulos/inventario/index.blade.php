@extends ('layouts.master')
@section ('contenido')
  <!-- Main content -->
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
				<div class="col-sm-8 invoice-col">
				{{$empresa->nombre}}
                  <address>
                    <strong>{{$empresa->rif}}</strong><br>
                   {{$empresa->direccion}}<br>
                     Tel: {{$empresa->telefono}}<br>
                  </address>
				</div>
                <!-- /.col -->
					<div class="col-sm-4 invoice-col">

				  <h4>Articulos de Inventario</h4>
             <div id="conf"><tr><td><b>Ocultar</b></td>
			 <td>Cod WEb  <input type="checkbox"  id="mcodweb"></td>
			 <td>Unidad  <input  type="checkbox"  id="muni"></td>
			 <td>Peso <input  type="checkbox" id="mpeso"></td></tr>
			 </div>
				</div>
              </div>
              <!-- /.row -->
<?php $i=0; ?>
              <!-- Table row -->
              <div class="row">
                <div class="col-12 table-responsive" id="PuntosCanjeados">
					<table width="100%">
					 <thead style="background-color: #A9CCE3 !important">

					<th id="pd">Codigo <i class="fa fa-fw fa-eye" title="Ocultar" id="ocultarpd"></i></th>
					<td ><b>CodigoWeb </b></td>
					<td><b>Nombre</b></td>
					<td ><b>Unidad</b></td>
					<td ><b>Peso</b></td>
					<th>Stock</th>
					<th id="ad">Apart. <i class="fa fa-fw fa-eye" title="Ocultar" id="ocultarad"></i></th>
					<th>Costo</th>
					<th>Iva</th>
					<th id="p1a">Utilidad</th>
					<th id="p1">Precio 1 <i class="fa fa-fw fa-eye" title="Ocultar" id="ocultarp1"></th>
					<th id="p2a">Utilidad 2</th>
					<th id="p2">Precio 2 <i class="fa fa-fw fa-eye" title="Ocultar" id="ocultarp2"></i></th>
					
				</thead><?php $count=0; $apart=0;$costo=0;$costoacum=0; $precioacum=0;?>
               @foreach ($lista as $q)
			    <?php $i++; ?>
				<tr <?php if (($i%2)==0){ echo "style='background-color: #D4E6F1 !important'";}?>> <?php $count++; 
				$apart=$apart+$q->apartado;
					$costoacum=$q->stock+$costoacum;
					$costo=$costo+($q->costo*$q->stock);
					$precioacum=$q->stock*$q->precio1+$precioacum;
					?> 

					<td class="filap1"><small>{{ $q->codigo}}</small></td>
					<td ><small>{{ $q->codweb}}</small></td>
					<td>{{ $q->nombre}}</td>
					<td>{{ $q->unidad}}</td>
					<td>{{ $q->peso}}</td>
					<td>{{ $q->stock}}</td>
					<td class="filaad">{{ $q->apartado}}</td>
					<td><?php echo number_format( $q->costo, 2,',','.'); ?></td>
					<td>{{ $q->iva}}</td>
					<td class="filap11" >{{$q->utilidad}} %</td>
					<td class="filap11" ><?php echo number_format( $q->precio1, 2,',','.'); ?></td>	
					<td class="filap2">{{$q->util2}} %</td>
					<td class="filap2"><?php echo number_format( $q->precio2, 2,',','.'); ?></td>  
				</tr>

				@endforeach
				<tr >
				<td class="filap1"></td> 
				<td></td>
				  <td ><?php echo "<strong>Articulos: ".$count."</strong>"; ?></td>
				  <td></td>
				  <td></td>
				  <td><?php echo "".number_format($costoacum, 2,',','.').""; ?></td>
				  <td class="filaad"><?php echo "".number_format($apart, 2,',','.').""; ?></td>
				  <td ><?php echo "".number_format($costo, 2,',','.')." $"; ?></td>
				  <td ></td>
				  <td class="filap11"></td>
				  <td class="filap11"><?php echo "".number_format($precioacum, 2,',','.')." $"; ?></td>
				  <td class="filap2"></td>     
				  <td class="filap2"></td>
				  </tr>
					</table>
                </div>
				
				<div class="row no-print">
					<div class="col-12">
						<label>Usuario: {{ Auth::user()->name }}</label>  
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center">
                     <button type="button" id="imprimir" class="btn btn-primary bn-sm" data-dismiss="modal">Imprimir</button>
					<button onclick="htmlExcel('PuntosCanjeados', 'Nks_Inventario')" class="btn btn-warning bn-sm">XLS</button>                   
				   </div>
                </div>
              </div>
			</div>
@push ('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
	document.getElementById('imprimir').style.display="none";
	document.getElementById('conf').style.display="none";
	document.getElementById('ocultarad').style.display="none";
	document.getElementById('ocultarp1').style.display="none";
	document.getElementById('ocultarp2').style.display="none";
	document.getElementById('ocultarpd').style.display="none";
	window.print(); 
	window.location="{{route('reportearticulos')}}";
    });
	$('#ocultarpd').click(function(){
		document.getElementById('pd').style.display="none";
		$(".filap1").remove(); 
    });
		$('#mcodweb').click(function(){
			$(".codweb").toggle();
			$('td:nth-child(2)').toggle();	
    });
			$('#muni').click(function(){
			$(".uni").toggle();
			$('td:nth-child(4)').toggle();	
    });
				$('#mpeso').click(function(){
			$(".uni").toggle();
			$('td:nth-child(5)').toggle();	
    })
	
		$('#ocultarad').click(function(){
		document.getElementById('ad').style.display="none";
		$(".filaad").remove();
    });
		$('#ocultarp2').click(function(){
		document.getElementById('p2a').style.display="none";
		document.getElementById('p2').style.display="none";
		$(".filap2").remove();
    });
	$('#ocultarp1').click(function(){
		document.getElementById('p1a').style.display="none";
		document.getElementById('p1').style.display="none";
		$(".filap11").remove();
    });
});
	function htmlExcel(idTabla, nombreArchivo = '') {
	  let linkDescarga;
	  let tipoDatos = 'application/vnd.ms-excel';
	  let tablaDatos = document.getElementById(idTabla);
	  let tablaHTML = tablaDatos.outerHTML.replace(/ /g, '%20');

	  // Nombre del archivo
	  nombreArchivo = nombreArchivo ? nombreArchivo + '.xls' : 'Nks_Inventario.xls';

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