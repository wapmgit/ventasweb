<div class="modal fade modal-slide-in-right" aria-hidden="true"
role="dialog" tabindex="-1" id="modal-cerrar-{{$campana->id}}">
<form action="{{route('cerrarcampana')}}" method="POST" enctype="multipart/form-data" >
{{csrf_field()}}
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-primary">
			    <div class="modal-header ">
                     <h5 class="modal-title">Cerrar Campaña</h5>
				     <button type="button" class="close" data-dismiss="modal" 
			        	aria-label="Close">
                     <span aria-hidden="true">×</span>
                      </button>
                 
			    </div>
	    	</div>
			<div class="modal-body">
				<div class="row">
				<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
            		 <div class="form-group">
            			<p>¿Confirma Cerrar Campaña?</br>
						<small>Genera Cuenta por pagar al Proveedor.</small>
						</p>
						<input type="hidden" name="campana"  value="{{$campana->id}}" >
						<input type="hidden" name="costo"  value="{{$acumcosto}}" >
						<input type="hidden" name="utilidad"  value="{{$acumenvio}}" >
            		
            	</div>		
            	</div>		

				
			    </div>  <!-- del row -->
		</div>  <!-- del modal body-->
			<div class="modal-primary">
			    <div class="modal-footer">
                    <div class="form-group">
                    <button type="button" class="btn btn-default btn-outline pull-left" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary btn-outline pull-right">Confirmar</button>
                    </div>
		    	</div>
			</div>
	</div>
			
    </form>   
</div>
</div>