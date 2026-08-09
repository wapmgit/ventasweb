<div class="modal fade modal-slide-in-right" aria-hidden="true"
role="dialog" tabindex="-1" id="modalact-{{$ingreso->idingreso}}">
<form action="{{route('actpreciocompra')}}" method="POST" enctype="multipart/form-data" >
{{csrf_field()}}
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-primary">
			    <div class="modal-header ">
                     <h5 class="modal-title">Ajustar  Costo/Precio Articulos</h5>
				     <button type="button" class="close" data-dismiss="modal" 
			        	aria-label="Close">
                     <span aria-hidden="true">×</span>
                      </button>
                 
			    </div>
	    	</div>
			<div class="modal-body">
				<div class="row">
				<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
					<p>¿Confirme Ajustar Precios de Articulos?
					{{ $ingreso->tipo_comprobante.':'.$ingreso->serie_comprobante.'-'.$ingreso->num_comprobante}}
						
					</p>
					
					</div>
					<div class="col-lg-6 col-sm-6 col-md-6 col-xs-6">
					<input type="hidden" name="id"  value="{{$ingreso->idingreso}}" >
						<label>Tasa Compra</label><input type="number" name="tasac"  value="{{$ingreso->tasa}}" >
					</diV>
					<div class="col-lg-6 col-sm-6 col-md-6 col-xs-6">
						<label>Tasa Paralela</label><input type="number" name="tasap"  value="1" step="0.001" required min="1" >
					@foreach($detalles as $det)
					<input name="idarticulo[]" type="hidden" value="{{$det->idarticulo}}">
					@endforeach
					</div>
					
				</div>  <!-- del modal body-->
			</div>  <!-- del modal body-->
			<div class="modal-primary">
			    <div class="modal-footer">
                    <div class="form-group">
                    <button type="button" class="btn btn-default btn-outline pull-left" data-dismiss="modal">Cerrar</button>
                    <button type="submit" id="btnactart" class="btn btn-primary btn-outline pull-right">Confirmar</button>
                    </div>
		    	</div>
			</div>
	</div>
			
      
</div></form> 
</div>