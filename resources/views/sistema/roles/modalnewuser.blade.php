<div class="modal modal-danger" aria-hidden="true"
role="dialog" tabindex="-1" id="modaluser">
<form action="{{route('newuser')}}" method="POST" enctype="multipart/form-data" >
{{csrf_field()}}
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-primary">
			    <div class="modal-header ">
                     <h5 class="modal-title">Crear Usuario</h5>
				     <button type="button" class="close" data-dismiss="modal" 
			        	aria-label="Close">
                     <span aria-hidden="true">×</span>
                      </button>
                 
			    </div>
	    	</div>
			<div class="modal-body">
<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
	 <div class="form-group">
            			<label for="nombre">Nombre</label>
            			<input type="text" name="nombre" id="nombre" required  class="form-control" placeholder="Nombre Usuario...">
					</div>
</div>
<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
	 <div class="form-group">
            			<label for="nombre">Mail</label>
            			<input type="text" name="mail" required  class="form-control" placeholder="xxx@xx.com">
					</div>
</div>
<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
	 <div class="form-group">
            			<label for="nombre">Contraseña</label>
            			<input type="password" name="pass" required  class="form-control" placeholder="contraseña">
					</div>
</div>
<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
	 <div class="form-group">
            			<label for="nombre">Nivel de Usuario</label>
            				<select name="nivel" class="form-control">          			            			
            				<option value="L">Limitado</option>
            				<option value="A">Administrador</option>         				
            			</select>
					</div>
</div>
		</div>  <!-- del modal body-->
			<div class="modal-primary">
			    <div class="modal-footer">
                    <div class="form-group">
                    <button type="button"  class="btn btn-default btn-outline pull-left" data-dismiss="modal">Cerrar</button>
                    <button type="submit" id="btn-nuser" class="btn btn-primary btn-outline pull-right">Confirmar</button>
                    </div>
		    	</div>
			</div>
	</div>
			
    </form>   
</div>
</div>