@extends ('layouts.master')
@section ('contenido')
<div class="row">
		@include('reportes.compras.gastos.search')
</div>
<?php $acum=0;$efe=0;$deb=0;$che=0;$tra=0;$ctra=0;$cche=0; $cdeb=0;
$cefe=0;?>
    <style>
        /* Contenedor principal que actúa como la estructura de la tabla */
        .tabla-falsa {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 4 columnas de igual tamaño */
            gap: 1px; /* Espacio que simula los bordes */
            background-color: #cccccc; /* Color del borde */
            border: 1px solid #cccccc;
            font-family: sans-serif;
        }

        /* Estilo general para celdas y encabezados */
        .celda {
            padding: 12px;
            background-color: #ffffff;
        }

        /* Estilo exclusivo para la fila de encabezados */
        .encabezado {
            background-color: #f2f2f2;
            font-weight: bold;
            text-transform: uppercase;
            font-size: 0.9em;
        }

        /* Diseño responsivo para pantallas móviles */
        @media (max-width: 600px) {
            .tabla-falsa {
                grid-template-columns: 1fr; /* Cambia a una sola columna */
                background-color: transparent;
                border: none;
                gap: 15px; /* Espacio entre tarjetas */
            }
            .encabezado {
                display: none; /* Oculta los encabezados en móviles */
            }
            .celda {
                border: 1px solid #ddd;
                border-bottom: none;
            }
            .celda:last-child {
                border-bottom: 1px solid #ddd; /* Cierra el borde inferior de la "tarjeta" */
            }
        }
    </style>
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
			@include('reportes.compras.gastos.empresa')
              </div>
              <!-- /.row -->
              <!-- Table row -->
            <div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">	
				<div class="col-12 table-responsive">
					<table width="100%">
						<thead style="background-color: #E6E6E6">
						  <th>Rif</th>
						  <th>Proveedor</th>
						  <th>Tipo</th>
						  <th>Documento</th>
						  <th>Emision</th>
						  <th>Monto</th> 
						  <th>Pagado</th>		
						</thead><?php $count=0; $deuda=0; $acump=0; $tmonto=0; $tdeuda=0;$tbase=$texento=$tmiva=0; ?>
						@foreach ($datos as $q)
							<tr> <?php $count++; ?> 
							<td>{{ $q->rif}}</td>
							<td>{{ $q->nombre}}</td>
								   <td>{{$q->nombregasto}}</td>
								   <td>GTO-{{$q->documento}}</td>
								   <td><?php echo date("d-m-Y",strtotime($q->emision)); ?></td>
							<td><?php $tmonto=($tmonto+$q->monto);
							$tdeuda=($tdeuda+$q->saldo);
							echo number_format( $q->monto,2,',','.')." $"; ?></td>

							<td><?php $deuda=($q->monto-$q->saldo); echo number_format($deuda, 2,',','.')." $"; ?></td>	
							</tr>
						@endforeach
						<tr><td colspan="5"><strong>Total</strong></td><td><strong><?php echo number_format( $tmonto, 2,',','.'); ?></strong></td>

						<td><strong><?php echo "Por pagar: ".number_format( $tdeuda, 2,',','.')." $"; ?></strong></td></tr>
					</table>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">	
				<div class="col-12 table-responsive">
					<table width="100%">
						<thead >        
						  <tr><td colspan="3" style="background-color: #E6E6E6" align="center"><strong>Desglose de Pagos<strong></td></tr>
						  <th>Moneda</th>
						  <th>Entregado</th>
						  <th>Monto</th>
						</thead>
							 @foreach ($pagos as $q)
							<tr >
							<td>{{$q->idbanco}}</td>
							<td><?php echo number_format($q->recibido, 2,',','.'); ?></td>
							<td><?php $acump=$acump+$q->monto; echo number_format($q->monto, 2,',','.')." $"; ?></td>
							</tr>   
							@endforeach
							<tr><td align="center" colspan="3"> <strong> Total Pagos: <?php echo number_format($acump, 2,',','.')." $"; ?></strong></td></tr>
							<tr><td align="center" colspan="3"> <strong> Total Periodo: <?php echo number_format($tpago->monto, 2,',','.')." $"; ?></strong></td></tr>
					</table>
				</div>
			</div><?php $acummtgasto=$acumsgasto=0;?>
			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
						<div class="col-12 table-responsive">
					<table width="100%">
						<thead >        
						  <tr><td colspan="3" style="background-color: #E6E6E6" align="center"><strong>Resumen Tipo Gasto<strong></td></tr>
						  <th>Gasto</th>
						  <th>Monto</th>
						  <th>Saldo</th>
						</thead>
							 @foreach ($tiposg as $g)
							 <?php $acummtgasto=$acummtgasto+$g->mgasto; $acumsgasto=$acumsgasto+$g->saldogasto;?>
							<tr>
							<td><a  class="filap1" href=""  data-target="#modal-detalle{{$g->idgasto}}" data-toggle="modal"><i class="fa fa-fw fa-eye"></i></a>{{$g->nombregasto}}</td>
							<td><?php echo number_format($g->mgasto, 2,',','.'); ?></td>
							<td><?php echo number_format($g->saldogasto, 2,',','.')." $"; ?></td>
							</tr>  
						@include('reportes.compras.gastos.modal')						
							@endforeach
							<tr><td><strong>Total</strong></td>
							<td><strong><?php echo number_format($acummtgasto, 2,',','.')." $"; ?></strong></td>
							<td><strong><?php echo number_format($acumsgasto, 2,',','.')." $"; ?></strong></td>
							</tr>
					</table>
				</div>
			</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 		       
					<label>Usuario: </label>  {{ Auth::user()->name }}  
					<div class="form-group" align="center">
					<button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button> 
					</div>
				</div>
			</div>
 </div>
	@push ('scripts')
	<script>
	$(document).ready(function(){
		$('#imprimir').click(function(){
			$(".filap1").remove();
			  document.getElementById('imprimir').style.display="none";
			  window.print(); 
			  window.location="{{route('resumengastos')}}";
		});
	});
	</script>
	@endpush
@endsection