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
						<input type="hidden" name="utilneta" id="utilneta" value="{{$acumenvio}}" >
            		
            	</div>		
            	</div>		
			  <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                    <div class="form-group">
                        <label for="precio_venta">Costo</label>
                        <input type="number" name="costo" id="costo" readonly class ="form-control" value="{{$acumcosto}}"  >
                    </div>
                    </div>
				 <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                    <div class="form-group">
                        <label for="precio_venta">Utilidad</label>
                        <input type="number" name="utilidad" id="utilidad" readonly class ="form-control" value="{{$acumenvio}}"  >
                    </div>
                    </div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                    <div class="form-group">
                        <label for="precio_venta">Pagado</label>
                        <input type="number" name="pagopedido" id="pagado" class ="form-control" value="{{$acumcosto}}"  >
                    </div>
                    </div>
					<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                    <div class="form-group">
                        <label for="precio_venta">Gastos</label>
                        <input type="number" name="gastopedido" id="gasto" class ="form-control" value="0"  >
                    </div>
                    </div>
						<div class="col-lg-8 col-sm-8 col-md-8 col-xs-8">
            		 <div class="form-group">
            			<p>Utilidad Neta en Campaña, <span id="vutilneta">{{$acumenvio}}</span>$
						</p>
						
            		
            	</div>		
            	</div>	
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <div class="form-group">
                        <label for="precio_venta">Comision Vendedores (%)</label>
                        <input type="number" name="comivende"  class ="form-control" value="1"  >
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