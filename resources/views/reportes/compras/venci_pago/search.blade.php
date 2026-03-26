
<div class="card">
        <div class="card-header">
          <h3 class="card-title">Indique Filtro para la consulta</h3>
          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>	<form action="{{route('reportecxpvencida')}}" method="GET" enctype="multipart/form-data" >         
			{{csrf_field()}}
        <div class="card-body p-0"></br>
		<div class="row">
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
	<div class="form-group">
           <div class="form-group">
		<select name="opcion" id="filtro" class="form-control">
                            <option value="0">Filtrar por:</option> 
                            <option value="1">Proveedor</option> 
                            <option value="2">Vencidas</option> 
                        </select>
           </div>

	</div>	
	</div>
	<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id="divopt">
		<div id="divend" style="display:none">
			<div class="form-group">
				<div class="input-group">
				<label>Vendedor: </label>
					<select name="vendedor" class="form-control selectpicker" data-live-search="true">
						   @foreach ($proveedores as $per)
                           <option value="{{$per -> idproveedor}}">{{$per -> nombre}}</option> 
                           @endforeach
					</select>
				</div>
			</div>	
		</div>			
	</div>
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" id="divrv" style="display:none">
		<div id="divendr" >
			<div class="form-group">
				<div class="input-group"><b>Vendedor</b>

				</div>
			</div>	
		</div>
		<div id="divclir">
			<div class="form-group">
				<div class="input-group"><b>Ruta</b>

				</div>
			</div>
		</div>				
	</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
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