@extends ('layouts.master')
<?php $mostrar=0; ?>
@section ('contenido')
<?php $mostrar=1; ?>

<?php $acum=0;$efe=0;$deb=0;$che=0;$tra=0;
$cefe=0;?>

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
			@include('reportes.compras.porvencer.empresa')
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
			   <div class="col-12 table-responsive">
				<table width="100%">
				<thead >			   
				  <th>Nombre </th>
				  <th>Stock</th>
				  <th>Fecha Vencimiento</th>
				  <th>Dias</th>     
				</thead>
				<?php $ctra= 0; $acumventas=0; $smonto=0;$cche=0; $cdeb=0; $credito=0; $contado=0;$real=0; $count=0;$tventa=0;?>
               @foreach ($datos as $q)
				<?php $tventa=$tventa +$q->stock; ?>
				<tr>         
					<td>{{ $q->nombre}}</td>
					<td>{{ $q->stock}} </td>	
					<td> <?php echo date("d-m-Y",strtotime($q->vence)); ?> </td>	
					<td>{{ $q->dias_para_vencer}}</td>      
				</tr>
				@endforeach
				
				</table>
			</div>

		</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 		       
					<label>Usuario: </label>  {{ Auth::user()->name }}  
					<div class="form-group" align="center">
					<button type="button" id="imprimir" class="btn btn-primary bnt-sm" data-dismiss="modal">Imprimir</button> 
					</div>

				</div>
  
  </div>
@push ('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
  //  alert ('si');
  document.getElementById('imprimir').style.display="none";
  window.print(); 
window.location="{{route('comprasarticulo')}}";
    });

});

</script>

@endpush
@endsection