<div class="row">
        <div class="card-header">
          <h3 class="card-title">Seleccione Grupo</h3>
          <div class="card-tools">
            <button type="button" class="btn btn-tool" id="remove"  data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>	<form action="{{route('catalogo')}}" method="GET" enctype="multipart/form-data" >         
			{{csrf_field()}}
        <div class="card-body p-0"></br>
		<div class="row">
		
			<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
				<select name="grupo" class="form-control selectpicker" data-live-search="true">
                            <option value="0">Todos...</option> 
						   @foreach ($grupo as $per)
                           <option value="{{$per -> idcategoria}}">{{$per -> nombre}}</option> 
                           @endforeach
                        </select>
			</div>
			 <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">		
           <div class="form-group">
				<label for="tipo_precio">Tipo de Precio </label><br>
				<label for="precio1"> P 1 </label> <input name="precio" type="radio" <?php  if( $precio==1){ echo "checked='checked'"; } ?> value="1">
				<label for="precio2"> P 2 </label> <input name="precio" type="radio" <?php  if( $precio==2){ echo "checked='checked'"; } ?>  value="2">
				<label for="precio2"> P 3 </label> <input name="precio" type="radio" <?php  if( $precio==3){ echo "checked='checked'"; } ?>  value="3">
           </div>
		</div>

			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">	
				<div class="form-group">
				<div class="input-group">
					<span class="input-group-btn">
						<button type="submit" class="btn btn-primary btn-sm">consultar</button>
					</span>
				</div>
				</div>
			</div>
	</div>
	</div>
		</form>
	</div>

