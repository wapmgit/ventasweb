@extends ('layouts.master')
@section ('contenido')
@include('almacen.articulo.empresa')
<div class="row" id="principal">
	<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
		<h3>Pedidos Shein
		<a  href="{{route('newpedidoshein')}}"> <button class="btn btn-primary btn-sm">Nuevo</button></a></h3>
		@include('pedidoshein.pedido.search')
	</div>
</div>
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-condensed table-hover">
				<thead>
					<th>Fecha</th>
					<th>Cliente</th>
					<th>Documento</th>
					<th>Total</th>
					<th>Saldo</th>
					<th>Campaña</th>
					<th>Opciones</th>
				</thead>
               @foreach ($ventas as $ven)
               <?php 
				$newdate=date("d-m-Y",strtotime($ven->fechapedido));
					?>
				<tr>
					<td><?php echo $newdate; ?></td>
					<td>{{ $ven->nombre}}</td>
					<td>
					{{ 'PED0'.$ven->idpedido}}	@php if($ven->anulado==1){ echo "<small>Anulado</small>"; } @endphp				
					</td>
					<td>{{ $ven->monto}}</td>
					<td>{{ $ven->saldo}}</td>
					<td>{{ $ven->codigo}}</td>				
<td>
  <div class="dropdown">
    <button class="btn btn-default btn-xs dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      Acciones <span class="caret"></span>
    </button>
    <ul class="dropdown-menu dropdown-menu-right">
      <li>
        <a href="{{route('showpedidoshein',['id'=>$ven->idpedido])}}">
          <i class="fa fa-eye text-success"></i> Ver detalles
        </a>
      </li> @php if($ven->anulado==0){ @endphp
	  <li> 
        <a href="{{route('abonopedidoshein',['id'=>$ven->idpedido])}}">
          <i class="fa fa-dollar text-success"></i> Abono
        </a>
      </li>
      <li>
        <a href="{{route('recibopedidoshein',['id'=>$ven->idpedido])}}">
          <i class="fa fa-print text-info"></i> Ticket 80mm
        </a>
      </li>
        <li role="separator" class="divider"></li>
        <li>
          <a href="#" data-toggle="modal" data-target="#modal-delete-{{$ven->idpedido}}" class="text-danger">
            <i class="fa fa-ban text-danger"></i> Anular pedido
          </a>
        </li>
	  @php }else{ @endphp
	   <li>
          <a href="#" class="text-danger">
            <i class="fa fa-ban text-danger"></i> Anulado
          </a>
        </li>@php } @endphp
    </ul>
  </div>
</td>
				</tr>
			@include('pedidoshein.pedido.modalanular')
				@endforeach
			</table>
		</div>
		{{$ventas->render()}}
	</div>
</div>
@push ('scripts')
<script>

$(document).ready(function() {    
const cuerpoDelDocumento = document.body;
cuerpoDelDocumento.onload = miFuncion;
function miFuncion() {
 // alert('La página terminó de cargar');
  	document.getElementById('imgcarga').style.display="none"; 
	document.getElementById('principal').style.display=""; 
} 

	$("#btn").click(function(){
		document.getElementById('imgcarga').style.display=""; 
		document.getElementById('principal').style.display="none"; 
	})

});

</script>
@endpush
@endsection