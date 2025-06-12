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
             
				</div>
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
                <div class="col-12 table-responsive" id="PuntosCanjeados">
					<table width="100%">
					 <thead >

					<th>Codigo</th>
					<th>Nombre</th>
					<th>Stock</th>
					<th>Apart.</th>
					<th>Costo</th>
					<th>Iva</th>
					<th>Utilidad</th>
					<th>Precio 1</th>
					<th>Utilidad 2</th>
					<th>Precio 2</th>
					
				</thead><?php $count=0; $apart=0;$costo=0;$costoacum=0; $precioacum=0;?>
               @foreach ($lista as $q)
				<tr> <?php $count++; 
				$apart=$apart+$q->apartado;
					$costoacum=$q->stock+$costoacum;
					$costo=$costo+($q->costo*$q->stock);
					$precioacum=$q->stock*$q->precio1+$precioacum;
					?> 

					<td>{{ $q->codigo}}</td>
					<td>{{ $q->nombre}}</td>
					<td>{{ $q->stock}}</td>
					<td>{{ $q->apartado}}</td>
					<td><?php echo number_format( $q->costo, 2,',','.'); ?></td>
					<td>{{ $q->iva}}</td>
					<td>{{$q->utilidad}} %</td>
					<td><?php echo number_format( $q->precio1, 2,',','.'); ?></td>	
					<td>{{$q->util2}} %</td>
					<td><?php echo number_format( $q->precio2, 2,',','.'); ?></td>  
				</tr>

				@endforeach
				<tr >
				  <td colspan="2"><?php echo "<strong>Articulos: ".$count."</strong>"; ?></td>
				  <td><?php echo "<strong>".number_format($costoacum, 2,',','.')."</strong>"; ?></td>
				  <td><?php echo "<strong>".number_format($apart, 2,',','.')."</strong>"; ?></td>
				  <td ><?php echo "<strong>".number_format($costo, 2,',','.')." $</strong>"; ?></td>
				  <td></td>
				  <td></td>
				  <td><?php echo "<strong>".number_format($precioacum, 2,',','.')." $</strong>"; ?></td>
				  <td></td>     
					<td></td></tr>
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
	window.print(); 
	window.location="{{route('reportearticulos')}}";
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