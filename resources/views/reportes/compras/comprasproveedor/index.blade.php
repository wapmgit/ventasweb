@extends ('layouts.master')
<?php $mostrar=0; ?>
@section ('contenido')
<?php $mostrar=1; ?>
<div class="row" >
	@include('reportes.compras.comprasproveedor.search')
</div>

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
			@include('reportes.compras.comprasproveedor.empresa')
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
			   <div class="col-12 table-responsive">

			   				<table width="100%">
				<thead >			   
				  <th>Articulo </th>
				  <th>Cantidad</th>
				  <th>P. compra Promedio</th>
				  <th>Stock</th>
				  <th>Minimo</th>     
				</thead>
				<?php $cnt= 0; $acumund=0; $smonto=0; $astoc=0; $cdeb=0; $credito=0; $contado=0;$real=0; $count=0;$tventa=0;?>
               @foreach ($datos as $q)
			   <?php $cnt++;   $acumund=$acumund+ $q->tcantidad; $smonto=$smonto+($q->tcantidad*$q->prom_compra); 
			   $astoc=$astoc+$q->stock;
			   ?> 
				<tr>         
					<td>{{ $q->nombre}}</td>
					<td>{{ $q->tcantidad}} </td>
					<td><?php 	echo number_format(($q->prom_compra), 2,',','.');  ?></td>
					<td>{{ $q->stock}}</td>
					<td>{{$q->minimo}}</td>       
				</tr>
				@endforeach
				<tr><td align="left"> Total Items: <strong>{{$cnt}}</strong></td>
				<td><strong>{{$acumund}}</strong> Unds.</td>
				<td><strong><?php 	echo number_format(($smonto), 2,',','.');  ?></strong> $.</td>
				<td><strong>{{$astoc}}</strong> Unds.</td>
				</tr>
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
window.location="{{route('comprasproveedor')}}";
    });

});

</script>

@endpush
@endsection