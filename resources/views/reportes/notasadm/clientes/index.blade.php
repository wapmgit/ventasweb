@extends ('layouts.master')
@section ('contenido')
<div class="row">
		@include('reportes.notasadm.clientes.search')
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
			@include('reportes.notasadm.clientes.empresa')
              </div>
              <!-- /.row -->
              <!-- Table row -->
            <div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">	
				<div class="col-12 table-responsive">
					<table width="100%">
						<thead style="background-color: #E6E6E6">					
						  <th>Cliente</th>
						  <th>Tipo</th>
						  <th>Documento</th>
						  <th>Referencia</th>
						  <th>Emision</th>
						  <th>Monto</th> 
						  <th>Saldo</th>		
						</thead><?php $count=0; $deuda=0; $acump=0; $tmonto=0; $tdeuda=0;$tnc=$tnd=$tndsaldo=$tncsaldo=0; ?>
						@foreach ($datos as $q)
							<tr> <?php $count++; ?> 
							<td>{{ $q->rif}} {{ $q->nombre}}</td>
							<td>@php if($q->tipo==1){ echo "N/D"; $tnd=$tnd+$q->monto; $tndsaldo=$tndsaldo+$q->pendiente;}else{ echo "N/C"; $tnc=$tnc+$q->monto; $tncsaldo=$tncsaldo+$q->pendiente;} @endphp</td>
							<td>00-{{$q->ndocumento}} @php if($q->pordevolucion==1){ echo "*"; } @endphp</td>
							<td>{{$q->referencia}} </td>
							<td><?php echo date("d-m-Y",strtotime($q->fecha)); ?></td>
							<td><?php $tmonto=($tmonto+$q->monto);
							$tdeuda=($tdeuda+$q->pendiente);
							echo number_format( $q->monto,2,',','.')." $"; ?></td>

							<td><?php  echo number_format($q->pendiente, 2,',','.')." $"; ?></td>	
							</tr>
						@endforeach
						<tr><td><strong>Total</strong> "(*) por devolucion"</td>
						<td  colspan="3"><strong><?php echo "N/D ".number_format( $tnd, 2,',','.')."-> Saldo ".number_format( $tndsaldo, 2,',','.'); ?></strong></td>

						<td colspan="3"><strong><?php echo "N/C ".number_format( $tnc, 2,',','.')."-> Saldo ".number_format( $tncsaldo, 2,',','.'); ?></strong></td></tr>
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
			  window.location="{{route('repnotadmc')}}";
		});
	});
	</script>
	@endpush
@endsection