@extends ('layouts.master')
@section ('contenido')
<?php 		$longitud = count($proveedores);
			$array = array();
			foreach($proveedores as $t){
			$arrayidcliente[] = $t->idproveedor;
			}
			$longitudn = count($gastos);
			$arrayn = array();
			foreach($gastos as $n){
			$arraynidcliente[] = $n->idproveedor;
			} 			
			for ($i=0;$i<$longitud;$i++){
				for($j=0;$j<$longitudn;$j++){
				if ($arrayidcliente[$i]==$arraynidcliente[$j]){
					$arraynidcliente[$j]=0;
				};
				}
			}			
			?>
<?php $acumnd=$tmonto=$acumnc=0;?>
<?php 		

			$longitudnd = count($notasnd);
			$arrayn = array();
			foreach($notasnd as $n){
			$arrayndidcliente[] = $n->idproveedor;
			} 			
			for ($k=0;$k<$longitud;$k++){
				for($m=0;$m<$longitudnd;$m++){
				if ($arrayidcliente[$k]==$arrayndidcliente[$m]){
					$arrayndidcliente[$m]=0;
				};
				//echo $arrayndidcliente[$m];
				}
			}			
			?>
	<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h3>Cuentas por Pagar </h3>
		@include('proveedores.pagar.search')
	</div>
</div>
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-condensed table-hover">
				<thead>
					
					<th>Nombre</th>
					<th>Rif</th>
					<th>Telefono</th>
					<th>Monto</th>
					<th>N/D</th>
					<th>N/C</th>
					<th>Opciones</th>
				</thead>
				<?php $acumnd=$acumnc=0; $nd=$nc=0;?>
               @foreach ($proveedores as $cat)
			   <?php $tmonto=($tmonto+$cat->acumulado); $nd=$nc=0;?>
				<tr>
					
					<td><small>{{ $cat->nombre}}</small></td>
					<td><small>{{ $cat->rif}}</small></td>
					<td><small>{{ $cat->telefono}}</small></td>
					 @foreach ($gastos as $not) <?php if($cat->idproveedor==$not->idproveedor){ 
					 $acumnd=$acumnd+$not->tpendiente; $acumnc=$not->tpendiente; }?>
					 @endforeach	
					<td><?php echo number_format(($cat->acumulado+$acumnc), 2,',','.')." $"; ?>		
					@foreach ($notas as $not) <?php if($cat->idproveedor==$not->idproveedor){ 
					 if($not->tipo==1){$acumnd=$acumnd+$not->tnotas; $nd=$not->tnotas;}if($not->tipo==2){ $acumnc=$acumnc+$not->tnotas; $nc=$not->tnotas;} }?>
					 @endforeach</td>
				
					 	<td><?php echo number_format( $nd, 2,',','.')." $";?></td>
					<td><?php echo number_format( $nc, 2,',','.')." $";?></td><td>
			@if($rol->abonarcxp==1)	<a href="{{route('showcxp',['id'=>$cat->idproveedor])}}"><button class="btn btn-info btn-xs">Abono</button></a>@endif
			@if($rol->crearcompra==1)	<a href="{{route('faccompra',['id'=>$cat->idproveedor])}}"><button class="btn btn-success btn-xs">Facturar</button></a>@endif
                  
					</td>
				</tr>
				@endforeach
				@foreach ($gastos as $not)
				 	<?php 
					$nc=0;$nd=0;
					for ($i=0;$i<$longitudn;$i++){
						if ($not->idproveedor==$arraynidcliente[$i]){?>
				<tr>
					<td><small>{{$not->nombre}}</small></td>
					<td><small>{{$not->rif}}</small></td>
					<td><small>{{$not->telefono}}</small></td>
					<td><?php $acumnd=$acumnd+$not->tpendiente; echo number_format( $not->tpendiente, 2,',','.')." $";?>
					@foreach ($notas as $n) <?php if($n->idproveedor==$not->idproveedor){ 
					 if($n->tipo==1){$acumnd=$acumnd+$n->tnotas; $nd=$n->tnotas;}if($n->tipo==2){ $acumnc=$acumnc+$n->tnotas; $nc=$n->tnotas;} }?>
					 @endforeach</td>
					<td><?php echo number_format( $nd, 2,',','.')." $";?></td>
					<td><?php echo number_format( $nc, 2,',','.')." $";?></td>
					<td>
					<a href="{{route('showcxp',['id'=>$not->idproveedor])}}"><button class="btn btn-info btn-xs">Abono</button></a>
					<a href="{{route('faccompra',['id'=>$not->idproveedor])}}"><button class="btn btn-success btn-xs">Facturar</button></a>
					</td>
				</tr>
						<?php }
					} ?>
				@endforeach
					 @foreach ($notasnd as $not)
				 	<?php for ($i=0;$i<$longitudnd;$i++){
						if ($not->idproveedor==$arrayndidcliente[$i]){?>
				<tr>
					<td><small>{{$not->nombre}}</small></td>
					<td><small>{{$not->rif}}</small></td>
					<td><small>{{$not->telefono}}</small></td>						
									
					<td><?php $acumnd=$acumnd+$not->tnotas; echo number_format( $not->mnotas, 2,',','.')." $";?></td>
					<td>
					@foreach ($notas as $no) 
					
					<?php if($no->idproveedor==$arrayndidcliente[$i]){ 
					if($no->tipo==2){ $acumnc=$acumnc+$no->tnotas; $nc=$no->tnotas;} }
					?>
					 @endforeach
					<?php echo number_format(($nc), 2,',','.')." $";?>
					</td>
					<td><?php echo number_format(($not->tnotas-$nc), 2,',','.')." $";?></td>
					<td>
				@if($rol->abonarcxp==1)<a href="{{route('showcxp',['id'=>$not->idproveedor])}}"><button class="btn btn-info btn-xs">Abono</button></a>@endif
					</td>
				</tr>
						<?php }
					} ?>
				@endforeach
				<tr><td colspan="4"> <button class="btn bg-olive btn-flat margin"><strong>Cuentas por Pagar: <?php echo number_format($tmonto,2,',','.')." $"; ?> </strong></button></td>
				<td colspan="2"><button type="button" class="btn btn-primary btn-flat margin"><strong><?php echo "Gastos: ".number_format( $acumnd, 2,',','.')." $";?></strong></button></td>
				<td><button type="button" class="btn btn-warning btn-flat margin"><strong><?php echo "Total: ".number_format( ($acumnd+$tmonto), 2,',','.')." $";?></strong></button></td>
				</tr>
			
			</table>
		</div>
		{{$proveedores->render()}}
	</div>
</div>

@endsection