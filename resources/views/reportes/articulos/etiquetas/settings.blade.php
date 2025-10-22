 <div class="card">
	<div class="card-header">
		<h3 class="card-title">Configuracion</h3>
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
			<div class="col-lg-6  col-md-6 col-sm-6 col-xs-12" >
				<form action="{{route('reporteetiquetas')}}" method="GET" enctype="multipart/form-data" >         
			{{csrf_field()}}  		
			<div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
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
			<div class="col-lg-6  col-md-6 col-sm-6 col-xs-12" >
			<table border="1" width="100%" align="cenetr">
			<tr><td></td><td><b>tamaño</b></tD><td><b> Color</b></td></tr>
			<tR>
			<td><b>Codigo</b></td><td><button onclick="aumentarTamano('code')">+</button>
								<button onclick="disminuirTamano('code')">-</button></tD>
							<td><input  onchange="cambiarcolor('code','colorcode')" id="colorcode" type="color" value="#fffff" /></td>
			</tR>
			<tR>
			<td><b>Nombre</b></td><td><button onclick="aumentarTamano('name')">+</button>
								<button onclick="disminuirTamano('name')">-</button></tD>
							<td><input  onchange="cambiarcolor('name','colorname')" id="colorname" type="color" value="#fffff" /></td>
			</tR>
			<tR>
			<td><b>Precio</b></td><td><button onclick="aumentarTamano('price')">+</button>
								<button onclick="disminuirTamano('price')">-</button></tD>
							<td><input  onchange="cambiarcolor('price','colorprice')" id="colorprice" type="color" value="#fffff" /></td>
			</tR>
			</table>
			</div> 
		</div>
	</div>
		
</div>