 <?php $year= date("Y");?>
<div class="card">
        <div class="card-header">
          <h3 class="card-title">Indique la fecha para la consulta</h3>
          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
              <i class="fas fa-times"></i>
            </button>
          </div>
        </div>	<form action="{{route('utilidadventas')}}" method="GET" enctype="multipart/form-data" >         
			{{csrf_field()}}
        <div class="card-body p-0"></br>
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
			<div class="form-group">
				<label>Mes</label>
			<select name="mes" class="form-control">
            				<option value="01">Enero</option>
            				<option value="02">Febrero</option>
            				<option value="03">Marzo</option>
            				<option value="04">Abril</option>
            				<option value="05">Mayo</option>
            				<option value="06">Junio</option>
            				<option value="07">Julio</option>
            				<option value="08">Agosto</option>
            				<option value="09">Septiembre</option>
            				<option value="10">Octubre</option>
            				<option value="11">Noviembre</option>
            				<option value="12">Diciembre</option>
            			</select>
			</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<div class="form-group">
					<label>Año</label>
				<input type="number" class="form-control" step="1" value="<?php echo $year; ?>" name="ano">
				</div>	
			</div>
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
			<div class="form-group">
			<label>Tasa Bcv</label>
			<input type="number" class="form-control" step="0.01" value="{{$empresa->tc}}" name="tasa">
			</div>	
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"></br>
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