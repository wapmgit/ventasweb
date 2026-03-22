<div class="card">
       <div class="card-header">
          <h3 class="card-title">Indique Parametros</h3>
          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>
	<form action="{{route('listapreciosdesc')}}" method="GET" enctype="multipart/form-data" >         
			{{csrf_field()}}
        <div class="card-body p-0"></br>
		<div class="row">
		
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
					
				<div class="form-group"><label> Valida Hasta </label>
				<div class="input-group">
					<input type="date" class="form-control" name="searchText"  value="{{$fserver}}">
				</div>
				</div>
			
			</div>

	<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<div class="form-group"><label> Descuento %</label>
				<div class="input-group">
					<input type="number" class="form-control" name="descuento" min="1" value="10">
				</div>
				</div>	
			</div>

			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
				<div class="form-group"><label></label>
				<div class="input-group">
					<span class="input-group-btn">
						<button type="submit" class="btn btn-primary btn-sm">Aplicar</button>
					</span>
				</div>
				</div>
			</div>
	</div>
	</div>
		</form>
	</div>

