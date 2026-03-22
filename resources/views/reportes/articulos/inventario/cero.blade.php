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

				  <h4>Articulos con Stock Minimo</h4>
              
				</div>
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row" >
                <div class="table-responsive" >
					<table  id="arttable" width="100%" >
						<thead style="background-color: #E6E6E6">
						<th>#</th>
						<th>Codigo</th>
						<th>Nombre</th>
						<th>Existencia</th>
						<th>Minimo</th>
						<th>Costo</th>
					  <th>Iva</th>
					  <th>Util.</th>
					  <th>Prec. 1</th>
					   <th>Util. 2</th>
					  <th>Prec. 2</th>					
						</thead><?php $count=0; $costo=0;$costoacum=0; $precioacum=0;?>
						@foreach ($lista as $q)
						<?php
							if($q->stock <= $q->minimo){ $count++; 
							$costoacum=$q->stock+$costoacum;
							$costo=$costo+($q->costo*$q->stock);
							$precioacum=$q->stock*$q->precio1+$precioacum;
							?> 
							<tr> 
							<td>{{ $count}}</td>
							<td>{{ $q->codigo}}</td>
							<td><small>{{ $q->nombre}}</small></td>
							<td>{{ $q->stock}}</td>
							<td>{{ $q->minimo}}</td>
							
							  <td><?php echo number_format( $q->costo, 2,',','.'); ?></td>
							  <td>{{ $q->iva}} %</td>
							<td>{{$q->utilidad}} %</td>
							<td><?php echo number_format( $q->precio1, 2,',','.'); ?></td>	
							<td>{{$q->util2}} %</td>
							<td><?php echo number_format( $q->precio2, 2,',','.'); ?></td>  
							</tr>
							<?php } ?>
						@endforeach

					</table>
				</div>
			</div>
			<div class="col-lg-12 col-md-12 csol-sm-6 col-xs-12">
                    <div class="form-group" align="center"></br>
                     <button type="button" id="imprimir" class="btn btn-primary bnt-sm" data-dismiss="modal">Imprimir</button>
					
                    </div>
                </div>
</div>


@push ('scripts')
<script>
$(document).ready(function(){ 
    $('#imprimir').click(function(){
  	$('#arttable').DataTable().destroy();

// 2. Volvemos a inicializar con los cambios
$("#arttable").DataTable({
		"searching": false,
		"bPaginate": false,
		"bInfo":false,
});
  document.getElementById('imprimir').style.display="none";
  window.print(); 
  window.location="{{route('stockcero')}}";
    });

});
	$(function () {  
	$("#arttable").DataTable({
		"searching": false,
		"bPaginate": false,
		"bInfo":false,
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf",{
            extend: 'print',
            // La magia ocurre aquí:
            exportOptions: {
                // Esto asegura que solo se exporte el contenido de la tabla
                // y no los elementos de la interfaz de DataTables
                modifier: {
                    page: 'all'
                }
            },
            customize: function (win) {
                // Esto remueve físicamente el contenedor de botones de la ventana de impresión
                $(win.document.body).find('.dt-buttons').remove();
            }
        }, "colvis"]
    }).buttons().container().appendTo('#arttable_wrapper .col-md-6:eq(0)');
	});
</script>

@endpush
         
@endsection