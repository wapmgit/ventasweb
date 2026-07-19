<div class="modal modal-danger" aria-hidden="true"
role="dialog" tabindex="-1" id="modal-detalle{{$g->idgasto}}">
<form action="{{route('altaarticulo')}}" method="POST" enctype="multipart/form-data" >
{{csrf_field()}}
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-primary">
			    <div class="modal-header ">
                     <h5 class="modal-title">Detalle {{$g->nombregasto}} </h5>
				     <button type="button" class="close" data-dismiss="modal" 
			        	aria-label="Close">
                     <span aria-hidden="true">×</span>
                      </button>
                 
			    </div>
	    	</div>
			<div class="modal-body">
			 <div class="tabla-falsa">
					<!-- Fila de Encabezados (Se ocultará en móviles) -->
					<div class="celda encabezado">Proveedor</div>
					<div class="celda encabezado">Documento</div>

					<div class="celda encabezado">Monto</div>
					<div class="celda encabezado">Saldo</div>
					@foreach ($datos as $qd)<?php if($qd->tipogasto==$g->idgasto) {?>
					<!-- Fila de Datos 1 -->
					<div class="celda">{{ $qd->nombre}}</div>
					<div class="celda">GTO-{{$qd->documento}}</div>
					<div class="celda"><?php  echo number_format($qd->monto, 2,',','.')." $"; ?></div>
					<div class="celda"><?php  echo number_format($qd->saldo, 2,',','.')." $"; ?></div>
					<?php } ?>
				@endforeach
				</div>
		</div>  <!-- del modal body-->
			<div class="modal-primary">
			    <div class="modal-footer">
                    <div class="form-group">
                    <button type="button" class="btn btn-default btn-outline pull-left" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary btn-outline pull-right">Confirmar</button>
                    </div>
		    	</div>
			</div>
	</div>
			
    </form>   
</div>
</div>