<div class="modal fade" id="modaldireccionedit">

	<div class="modal-dialog">
		<div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Detalle Direccion </h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
			<div class="modal-body">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				 <div class="form-group">
				 <label for="direccion">Casa N°, Edif. Apto N°.</label>
					<input type="text" name="casa" class="form-control" value="{{$cliente->casa}}" >           
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
					 <div class="form-group">
					 <label for="direccion">Avenida,Calle,Esquina.</label>
					<input type="text" name="avenida" class="form-control" value="{{$cliente->avenida}}">           			
					</div>			
				</div>			
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				 <div class="form-group">
				 <label for="direccion">Urbanizacion Barrio.</label>
				<input type="text" name="barrio" class="form-control" value="{{$cliente->barrio}}">           
				</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				<div class="form-group">
				 <label for="direccion">Ciudad.</label>
				<input type="text" name="ciudad" class="form-control" value="{{$cliente->ciudad}}">           
			   </div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				 <div class="form-group">
				 <label for="direccion">Distrito, Munic. o Parroquia.</label>
				<input type="text" name="municipio" class="form-control" value="{{$cliente->municipio}}">           
			   </div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				 <div class="form-group">
				 <label for="direccion">Entidad Federal.</label>
				<input type="text" name="entidad" class="form-control" value="{{$cliente->entidad}}">           
			   </div>
			</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
				 <div class="form-group">
				 <label for="direccion">Codigo Postal.</label>
				<input type="text" name="codpostal" class="form-control" value="{{$cliente->codpostal}}">           
			   </div>
				</div>
			</div>											
			<div class="modal-footer">
				<button type="button"  class="btn btn-default" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>


</div>