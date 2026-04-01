 <div class="card">
	<div class="card-header">
		<h3 class="card-title">Seleccione Grupo</h3>
			<div class="card-tools">
				<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
					<i class="fas fa-minus"></i>
				</button>
				<button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
					<i class="fas fa-times"></i>
				</button>
			</div>
	</div>
	<div class="card-body p-0"></br>
		<div class="row"> 		
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
							<form action="{{route('reporteetiquetas')}}" method="GET" enctype="multipart/form-data" >         
			{{csrf_field()}} 
				<select name="grupo" class="form-control selectpicker" data-live-search="true">
                            <option value="0">Seleccione Grupo..</option> 
						   @foreach ($categorias as $per)
                           <option value="{{$per -> idcategoria}}">{{$per -> nombre}}</option> 
                           @endforeach
                        </select>
			</div>

			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
				<div class="form-group">
				<div class="input-group">
					<span class="input-group-btn">
						<button type="submit" class="btn btn-primary btn-sm">consultar</button>
					</span>
				</div>
				</div>
			</div>
			</form>
		

		</div>
	</div>
		
</div>