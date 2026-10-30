@extends ('layouts.master')
@section ('contenido')
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h3>Cuentas por Cobrar </h3>
		@include('clientes.cobrar.search')
	</div>
	</div>
 
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-condensed table-hover">
				<thead>				
					<th>Nombre</th>
					<th>Cedula</th>
					<th>Telefono</th>
					<th>Vendedor</th>
					<th>Monto</th>
					<th>N/D</th>
					<th>N/C</th>
					<th>Saldo</th>
					<th>Opciones</th>
				</thead>
				<?php $total=$nd=$nc=0; $acdumt=0; $acumnd=$acumnc=0; ?>
				<tbody>
               @foreach ($cuentasPorCobrar as $cat)
				<tr>
				<?php $nd=$nc=0;
				$cel=trim($cat->telefono);
				$cel =str_replace('-', '', $cel);
				$cel =str_replace('(', '', $cel);
				$cel =str_replace(')', '', $cel);
				$cel =str_replace(' ', '', $cel);
				$acumnd=$acumnd+$cat->total_nd; $acumnc=$acumnc+$cat->total_nc;
				?>
					<td><small>{{ $cat->nombre}}
					</small></td>
					<td><small>{{ $cat->cedula}}</small></td>
					<td><small>{{ $cat->telefono}}</small></td>
					<td><small>{{ $cat->vendedor}}</small></td>
					<td><?php $total=$total+$cat->saldo_ventas; echo number_format( $cat->saldo_ventas, 2,',','.')." $";?></td>
					<td><?php echo number_format( $cat->total_nd, 2,',','.')." $";?></td>
					<td><?php echo number_format( $cat->total_nc, 2,',','.')." $";?></td>
					<td><?php echo number_format( $cat->total_deuda, 2,',','.')." $";?></td>
					<td>	<div id="whatsapp">
					@if($rol->abonarcxc==1)<a href="{{route('showcxc',['id'=>$cat->id_cliente])}}"><button class="btn btn-info btn-xs">Abono</button></a>@endif
					@if($rol->crearventa==1)<a href="{{route('facventa',['id'=>$cat->id_cliente])}}"><button class="btn btn-primary btn-xs">Facturar</button></a>@endif										
   <a href="https://api.whatsapp.com/send/?phone=<?php echo $cat->codpais.$cel; ?>&text=Hola%20,<?php echo $empresa->nombre ?>,%20te%20recuerda
%20cuenta%20pendiente%20por%20<?php echo number_format($cat->total_deuda, 2,',','.')." $";?>%20.%20Contactanos%20para%20mas%20detalles" target="_blank">
<i class="fa-brands fa-whatsapp"></i>
   </a></div></td>
				</tr>
				@endforeach
				<tr>
				<td  align="center"><button type="button" class="btn bg-olive btn-flat margin"><strong><?php echo "Ventas: ".number_format( $total, 2,',','.')." $";?></strong></button></td>
				<td colspan="3" align="center"><button type="button" class="btn btn-warning btn-flat margin"><strong><?php echo "Debito: ".number_format( $acumnd, 2,',','.')." $";?></strong></button></td>
				<td colspan="3" align="center"><button type="button" class="btn btn-primary btn-flat margin"><strong><?php echo "Credito: ".number_format( $acumnc, 2,',','.')." $";?></strong></button></td>
				<td colspan="2" align="center"><button type="button" class="btn bg-black btn-flat margin"><strong><?php echo "Total: ".number_format( (($total+$acumnd)-$acumnc), 2,',','.')." $";?></strong></button></td>
				</tr>
				</tbody>
			</table>{{$cuentasPorCobrar->render()}}
		</div>
		
	</div>
</div>

@endsection
@push('scripts')
<script>
  
</script>
@endpush
