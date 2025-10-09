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
			<div class="col-lg-12  col-md-12 col-sm-1 col-xs-12" >
			<table border="1" width="100%">
			<tr><td></td><td>tamaño</tD><td> Color</td></tr>
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