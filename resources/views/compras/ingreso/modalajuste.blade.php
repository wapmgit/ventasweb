<div class="modal fade modal-slide-in-right" aria-hidden="true"
role="dialog" tabindex="-1" id="modaldevolucion-{{$det->idarticulo}}">

	<form action="{{route('ajustecompra')}}" id="forajustep" method="get" enctype="multipart/form-data" >         
        {{csrf_field()}}
	<div class="modal-dialog">
		<div class="modal-content">
				<div class="modal-header ">
                     <h5 class="modal-title">Ajuste Compra -> {{$ingreso->idingreso}}</h5>
				     <button type="button" class="close" data-dismiss="modal" 
			        	aria-label="Close">
                     <span aria-hidden="true">×</span>
                      </button>
                 
			    </div>
			<div class="modal-body">
			<div class="row">
			<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
			<label>Articulo:  {{$det->articulo}}</label>
			</div>
				<div class="col-lg-4 col-sm-4 col-md-4 col-xs-12">
            		 <div class="form-group">
            			<label for="nombre">Nueva Cantidad</label>
            			<input type="number" step="0.01" name="cantidad" min="0" required value="{{$det->cantidad}}" class="form-control">
					<input type="hidden" name="idcompra"  value="{{$ingreso->idingreso}}" >
						<input type="hidden" name="idarticulo"  value="{{$det->idarticulo}}" >
					<input type="hidden" name="iddetalle"  value="{{$det->iddetalle_compra}}" >
					<input type="hidden" name="base"  value="{{$ingreso->base}}" >
					<input type="hidden" name="miva"  value="{{$ingreso->miva}}" >
					<input type="hidden" name="exe"  value="{{$ingreso->exento}}" >
					<input type="hidden" name="plink"  value="0" >
            		</div>
            	</div>
			<div class="col-lg-4 col-sm-4 col-md-4 col-xs-12">
            		 <div class="form-group">
            			<label for="nombre">Descuento</label>
            			<input type="number" step="0.001" name="descuento" min="0" required value="{{$det->descuento}}" class="form-control">

            		</div>
            	</div>
				<div class="col-lg-4 col-sm-4 col-md-4 col-xs-12">
            		 <div class="form-group">
            			<label for="nombre">Nuevo Precio</label>
            			<input type="number" step="0.001" name="precio" min="0.01" required value="{{$det->precio_compra}}" class="form-control">

            		</div>
            	</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Cerrar</button>
				<button type="submit" class="btn btn-primary btn-sm">Confirmar</button>
			</div>
		</div>
	</div>
	</form>

</div>