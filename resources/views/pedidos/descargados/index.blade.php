@extends ('layouts.master')
@section ('contenido')
<div class="row">

  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
@include('almacen.articulo.empresa')
    <span > <h4>Pedidos </h4><?php $k=0;$acump=0;?>    </span>
  </div>
  
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	    <table id="tablepedidos" class="table table-striped table-bordered table-condensed table-hover">
      <thead style="background-color: #E6E6E6" >
	  <th id="campo">Id</th>
	  <th >Fecha</th>
	  <th>Cliente</th>
		<th>Monto Pedido</th>

		</thead>
		<tbody>
         @foreach ($datos3 as $cob)	 <?php $k++; ?>	 
        <tr>
		<td><a href="/recibir-pedidos">
		<a href="{{route('bajarpedido',['id'=>$cob->id_pedido])}}" onclick="return confirm('¿ Confirma descargar el pedido ?')"><i class="fa fa-fw fa-cloud-download"> </i></a>
		{{$cob->id_pedido}} </td>
	<td><?php echo date("d-m-Y h:i:s a",strtotime($cob->fecha)); ?> </td>
		
		<td><?php echo $nombresc[$k-1];	?></td>
		<td>{{$cob->total_pedido}}</td>
        </tr>
		@endforeach  
		</tbody>
		<tfoot>
	  <th >Id</th>
	  <th >Fecha</th>
	  <th>Cliente</th>
		<th>Monto Pedido</th>	
</tfoot>
		   </table>
	  </div>       
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 		       
                     <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
					   <label>Usuario: </label>  {{ Auth::user()->name }}  
                    <div class="form-group" align="center">
                     <button type="button" id="imprimir" class="btn btn-primary" data-dismiss="modal">Imprimir</button> 
                    </div>
                </div>                  
</div><!-- /.box-body -->
</div><!-- /.box -->
             

@push ('scripts')
<script>
$(document).ready(function(){
	
	   $('#tablepedidos').DataTable({ 
"order":[[0, "desc"]]

    }); 
	
    $('#imprimir').click(function(){
  //  alert ('si');
  document.getElementById('imprimir').style.display="none";
  window.print(); 
  window.location="/pedido/pedido";
    });

});

</script>

@endpush
@endsection