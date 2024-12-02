<div class="modal fade" id="modal-recargo-{{$venta->idventa}}">
<form action="{{route('recargoapartado')}}" method="POST" enctype="multipart/form-data" >
{{csrf_field()}}
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-primary">
			    <div class="modal-header ">
                     <h5 class="modal-title">Recargo en Apartado </h5>
				     <button type="button" class="close" data-dismiss="modal" 
			        	aria-label="Close">
                     <span aria-hidden="true">×</span>
                      </button>
                 
			    </div>
	    	</div>
			<div class="modal-body">

	<p>¿Confirme Recargo de <?php echo $venta->incremento; ?>% a Apartado N°
	APA{{ $venta->idventa}} </br>
	 <?php 
			$mrecargo=($venta->total_venta*($venta->incremento/100));
			$ntventa=$venta->total_venta+($venta->total_venta*($venta->incremento/100));
			$nsaldo=$venta->saldo+($venta->total_venta*($venta->incremento/100));
	 ?> 
	<b>Total Recargo:</b> <?php echo number_format(  $mrecargo, 2,',','.'); ?> $</br>
	<b>Total Documento:</b> <?php echo number_format( $ntventa, 2,',','.'); ?> $</br>
	<b>Total Saldo:</b> <?php echo number_format( $nsaldo, 2,',','.'); ?> $
		<input type="hidden" name="id"  value="{{$venta->idventa}}" >
		<input type="hidden" name="mrecargo"  value="{{$mrecargo}}" >
		<input type="hidden" name="mventa"  value="{{$ntventa}}" >
		<input type="hidden" name="msaldo"  value="{{$nsaldo}}" >
	</p>
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

   