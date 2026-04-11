@extends ('layouts.master')
@section ('contenido')
<?php $acum=0; $acum2=0;$cont=0;?>
<div class="row">
	<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
		<h3>Documentos activos para Comision</h3>

	</div>
</div>
	
<div class="row">
	  <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<div class="form-group">
                      <label for="proveedor">Vendedor</label>
                   <p>{{$vendedor->nombre}}</p>
                    </div>
            </div>
             <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                 <div class="form-group">
                      <label for="proveedor">Cedula</label>
                   <p>{{$vendedor->cedula}}</p>
                    </div>
            </div>
            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                 <div class="form-group">
                      <label for="proveedor">Telefono</label>
                   <p>{{$vendedor->telefono}}</p>
                    </div>
            </div>
		<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
                 <div class="form-group">
                      <label for="proveedor">% Comision</label>
                   <p>{{$vendedor->comision}}</p>
                    </div>
            </div>
</div>

<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="table-responsive">
	<form action="{{route('guardarcomision')}}" method="POST" enctype="multipart/form-data" >         
        {{csrf_field()}}
			<table width="100%">
				<thead style="background-color: #A9D0F5">
					<th>Cliente</th>
					<th>Cedula</th>
					<th>N° Comprobante</th>
					<th>Fecha Doc.</th>
					<th>Fecha Emi.</th>
					<th>Monto Doc.</th>
					<th>Monto Comision</th>
									
				</thead>
               @foreach ($venta as $cat)
               <?php $cont++;
               $acum2=$cat->total_venta+$acum2; 
			       $acum=$acum+$cat->montocomision; 
               ?>
			   
				<tr>   <div class="form-group">
				<input type="hidden" name="idventa[]"  value="{{$cat->idventa}}"></div>
					<td>{{$cat->nombre}}</td>
					<td>{{$cat->cedula}}</td>
					<td>{{$cat->tipo_comprobante}}:{{$cat->serie_comprobante}}-{{$cat->num_comprobante}}</td>
					<td><?php echo date("d-m-Y h:i:s a",strtotime($cat->fecha_hora)); ?></td>
					<td><?php echo date("d-m-Y",strtotime($cat->fecha_emi)); ?></td>
					<td><?php echo number_format($cat->total_venta, 2,',','.')." $"; ?> </td>
					<td><?php echo number_format($cat->montocomision, 2,',','.')." $"; ?> </td>		
				</tr>
				<?php if(count($detalle)>0){ ?>
				<tr><td colspan="2"><b>Articulo</b></td><td><b>Cantidad</b></td><td><b>Precio</b></td><td><b>%Comi.</b></td><td><b>Moto. Comi</b></td></tr>
							 @foreach ($detalle as $det)
							 <?php if($cat->idventa==$det->idventa){ ?>
							 <tr style="background-color: #DFF2FE">
								<td colspan="2"><small>{{$det->nombre}}</small></td>
								<td><small>{{$det->cantidad}}</small></td>
								<td><small>{{$det->precio_venta}}</small></td>
								<td><small>{{$det->pcomiarti}}</small></td>
								<td><small>{{$det->mcomiarti}}</small></td>
							 </tr>
								<?php } ?>
							@endforeach
				<?php } ?>
				@endforeach
				<tr>
				<td><?php echo $cont." Documentos"; ?></td><td></td><td></td><td></td><td><strong>TOTAL:</strong></td>
				<td style="background-color: #A9D0F5"><?php echo number_format($acum2, 2,',','.')." $"; ?> </td><td style="background-color: #A9D0F5"><?php echo number_format($acum, 2,',','.')." $"; ?> </td><td></td>
				</tr>
			</table>
			@if($empresa->calc_comi==1)
			<span><small>Se Incluye Comision individual por Articulos.</small></span>
			@endif
		</div>
		
	</div>
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="btnes"  align="center"></br>
			<div class="form-group">				
				<input type="hidden" name="vendedor"  value="{{$vendedor->id_vendedor}}">
				<input type="hidden" name="mventas"  value="<?php echo $acum2; ?>">
				<input type="hidden" name="mcomision"  value="<?php echo $acum; ?>">
            	<button class="btn btn-info btn-sm" id="btnsubmit" type="submit">Generar Comision</button>
				@if($empresa->calc_comi==1)
			<?php if(count($detalle)==0){ ?>	<a  href="{{route('vercomisiondetallada',['id'=>$vendedor->id_vendedor])}}"><button  class="btn btn-success btn-sm"   type="button" id="btnvdet">Ver Detalles</button></a> <?php }else{ ?>
				<a  href="{{route('detallecomision',['id'=>$vendedor->id_vendedor])}}"><button  class="btn btn-success btn-sm"type="button" id="btnodet" >ocultar Detalles</button></a>  <?php } ?>
				@endif
			<button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button>
			<a href="{{route('comisiones')}}"><button  class="btn btn-danger btn-sm"  type="button" id="btnback">Regresar</button></a>
            </div>
		</div>	
		</form>
</div>

@endsection

@push ('scripts')
<script>

$(document).ready(function(){
    $('#imprimir').click(function(){
	document.getElementById('btnes').style.display="none";
  window.print(); 
  window.location="{{route('comisiones')}}";
    });
    $('#imprimir').click(function(){
	document.getElementById('btnsubmit').style.display="none";
    });
});

</script>

@endpush