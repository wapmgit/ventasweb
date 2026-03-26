
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

				  <h4>Reporte de Vencimientos por Cobro</h4>
			<?php echo "al ".$fecha_actual;
				if (($opc)==1){ echo "</br> Vendedor: ".$persona; }
				if (($opc)==2){ echo "</br> Cliente: ".$persona; }
				if (($opc)==3){ echo "</br> Cliente: ".$persona; }
				
				?>
	</div>