<div class="modal fade" id="modalserial-{{$q->idserial}}">
<form action="{{route('editserial')}}" method="get" enctype="multipart/form-data" >
{{csrf_field()}}
	<div class="modal-dialog">
		<div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Editar Datos de Serial </h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
			<div class="modal-body">
<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				 <div class="form-group">
				 <label for="direccion">Chasis</label>
					<input type="text" name="chasis" class="form-control" value="{{$q->chasis}}" >           
					<input type="hidden" name="id" class="form-control" value="{{$q->idserial}}" >           
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					 <div class="form-group">
					 <label for="direccion">Motor</label>
					<input type="text" name="motor" class="form-control" value="{{$q->motor}}">           			
					</div>			
				</div>			
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				 <div class="form-group">
				 <label for="direccion">Placa</label>
				<input type="text" name="placa" class="form-control" value="{{$q->placa}}">           
				</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<div class="form-group">
				 <label for="direccion">Color</label>
				<input type="text" name="color" class="form-control" value="{{$q->color}}">           
			   </div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				 <div class="form-group">
				 <label for="direccion">Año</label>
				<input type="text" name="ano" class="form-control" value="{{$q->año}}">           
			   </div>
				</div>
				</div>
			
			</div>
			<div class="modal-footer">
				<button type="button"  class="btn btn-default" data-dismiss="modal">Cerrar</button>
				  <button type="submit" class="btn btn-primary btn-outline pull-right">Confirmar</button>
			</div>
		</div>
	</div>

   </form>  
</div>