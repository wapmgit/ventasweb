@extends ('layouts.master')
<?php $mostrar=0; ?>
@section ('contenido')
<?php $mostrar=1; ?>
    <?php
$fecha_actual= date("Y/m/d");
function dias_pasados($fecha_inicial,$fecha_final)
{
$dias = (strtotime($fecha_inicial)-strtotime($fecha_final))/86400;
$dias = abs($dias); $dias = floor($dias);
return $dias;
}
?>
<div class="row">
		@include('reportes.ventas.venci_cobro.search')
</div>
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
			@include('reportes.ventas.venci_cobro.empresa')
              </div>

	<div class="row">
		<div class="table-responsive">
			<table  id="tabla" width="100%">
							<thead style="background-color: #E6E6E6">
								<th>Documento</th>
								<th>Cliente</th>
								<th>Telefono</th>
								<th>Vendedor</th>
								<th>Credito</th>
								<th>Fecha Emi.</th>
								<th>dias.Venc.</th>
								<th>Monto</th>
								
							</thead>
							<?php $total=0; $countnd=0; $acummn=0; $count=0; $diascre=0; $p=0; ?>	
						   @foreach ($datos as $cat)<?php $p++; $cntnc=0; ?>
						<tbody>
							<tr>
								<td>{{$cat->serie_comprobante}}-{{$cat->num_comprobante}}</td>
								<td>{{ $cat->cedula}} {{ $cat->nombre}}
								@foreach ($nc as $c)							
								<?php if (($c->id_cliente==$cat->id_cliente)and ($cntnc==0)){																						
								echo " <strong>* N/C: ".number_format($c->tnc,2,',','.')." *</strong>";							
								 } ?>		
								 @endforeach	
								</td>
								
								<td>{{ $cat->telefono}}</td>
								<td>{{ $cat->vendedor}}</td>
								<td>{{ $cat->diascre}}</td>
								<td><?php echo date("d-m-Y",strtotime($cat->fecha_hora)); ?></td>
								<td><?php $diascre=((int)$cat->diascre-dias_pasados($fecha_actual,$cat->fecha_hora));
								if($diascre <= 0){ ?>  <font style="color:#FF0000";><?php echo $diascre;?> </font> 
								<?php }else { echo $diascre; }

								?></td>
								<td><?php $count++; $total=$total+$cat->acumulado; echo number_format( $cat->acumulado, 2,',','.')." $"; ?></td>
							</tr>
							
							@endforeach
						@foreach ($notasnd as $nd)
						<tr>
						<?php $acummn=$acummn+$nd->tnotas;
						$total=$total+$nd->tnotas;
						$countnd++;
						?>
						<td>N/D-{{$nd->idnota}}</td>
						<td>{{$nd->nombre}}</td>
						<td>{{$nd->cedula}}</td>
						<td></td>
						<td></td>
						<td><?php echo date("d-m-Y",strtotime($nd->fecha)); ?></td>
						<td><?php $diascre=((int)$cat->diascre-dias_pasados($fecha_actual,$nd->fecha));
						if($diascre <= 0){ ?>  <font style="color:#FF0000";><?php echo $diascre;?> </font> 
							<?php }else { echo $diascre; }
								?></td>
						<td><?php echo number_format($nd->tnotas, 2,',','.'); ?></td>
						</tr> 
								@endforeach
						</tbody>
						<tfoot>
						<tr>
						<td colspan="2">Facturas:{{$count}}</td>
						<td colspan="2">Notas debito:{{$countnd}}</td>
						<td colspan="2"></td>	
						<td>Total $</td>	
						<td><?php echo number_format($total, 2,',','.'); ?></td>					
						</tr>
						</tfoot>
						</table>

						
</div>
    </div>
			</div>
                  	</div><!-- /.row -->
                     <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center">
                     <button type="button" id="imprimir" class="btn btn-primary" data-dismiss="modal">Imprimir</button>
                    </div>
                </div>
                   
                </div><!-- /.box-body -->
              </div><!-- /.box -->

@push ('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
  //  alert ('si');
  document.getElementById('imprimir').style.display="none";
  window.print(); 
  window.location="{{route('ventasarticulo')}}";
    });
	$("#filtro").on("change",function(){
		var variable=$("#filtro").val();							
		if( variable==1){
			document.getElementById('divopt').style.display=""; 
			document.getElementById('divend').style.display=""; 
			document.getElementById('divcli').style.display="none"; 
			document.getElementById('divrv').style.display="none"; 	
			$("#idcliente").val(0);
		}
		if( variable==2){
			document.getElementById('divopt').style.display=""; 
			document.getElementById('divend').style.display="none";
			document.getElementById('divrv').style.display="none"; 			
			document.getElementById('divcli').style.display=""; 
			$("#idvendedor").val(0);
		}
		if( variable==3){
			document.getElementById('divopt').style.display="none"; 
			document.getElementById('divrv').style.display=""; 
			$("#idvendedor").val(0);
		}
		
	});
});

</script>

@endpush
@endsection