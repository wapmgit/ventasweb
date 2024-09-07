

			  <div class="modal fade modal-slide-in-right" aria-hidden="true"
role="dialog" tabindex="-1" id="modalretiro">
	{!!Form::open(array('url'=>'/bancos/retiro','method'=>'POST','autocomplete'=>'off','id'=>'formulariocliente','files'=>'true'))!!}
 {{Form::token()}}
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" 
				aria-label="Close">
                     <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title">Registro de Retiro Bancario</h4>
			</div>
			<div class="modal-body">
								<div class="row">

									<div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
										  <div class="form-group">
											    <label for="nombre">Numero: </label>
											<input type="text" name="numero" required value="<?php echo add_ceros($idv,$ceros,$bco); ?>" class="form-control" placeholder="Numero...">
											<input type="hidden" name="idbanco" value="{{$banco->idbanco}}" class="form-control" >
										</div>
									</div>
									
									<div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
									  <div class="form-group">
										<label for="saco">Clasificador de transaccion</label>
				                             <select name="clasificador" class="form-control selectpicker" data-live-search="true">
				                      @foreach ($clasificador as $clasi)
				                             <?php if($clasi->tipo <> 1){ ?>
				                              <option value="{{$clasi->idcod}}">{{$clasi->codigo}} - {{$clasi->descrip}}</option> <?php } ?>
				                              @endforeach
				                              </select>
										</div>
									</div>
									<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
										 <div class="form-group">
											    <label for="nombre">Beneficiario</label>
										    <select name="cliente"  class="form-control selectpicker" data-live-search="true">
				                      @foreach ($clientes as $cli)
				                              <option value="{{$cli->idproveedor}}">{{$cli->cedula}} - {{$cli->nombre}}</option> 
				                              @endforeach
				                              </select>
										</div>
									</div>
									<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
										 <div class="form-group">
											    <label for="nombre">Concepto</label>
											<input type="text" name="concepto"  required value="" class="form-control" placeholder="Concepto...">
										</div>
									</div>	
									<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
										 <div class="form-group">
											    <label for="nombre">Observacion</label>
											<input type="text" name="observacion"  value="" class="form-control" placeholder="observacion...">
										</div>
									</div>
						<div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
										 <div class="form-group">
											    <label for="nombre">Monto</label>
											<input type="number" required name="monto" step="0.01" value="" class="form-control" placeholder="monto...">
										</div>
									</div>
								
				   
											
								</div>
			</div>
		<div class="modal-success">
			<div class="modal-footer">
			 <div class="form-group">
				<button type="button" class="btn btn-default btn-outline pull-left" data-dismiss="modal">Cerrar</button>
				<button type="submit" id="btn_ncliente" class="btn btn-primary btn-outline pull-right">Confirmar</button>
				</div>
			</div>
				</div>
		</div>
	</div>
	{{Form::Close()}}

</div>