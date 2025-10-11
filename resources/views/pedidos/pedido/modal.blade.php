<div class="modal fade modal-slide-in-right" aria-hidden="true"
role="dialog" tabindex="-1" id="modal-{{$venta->idpedido}}">
<form action="{{route('facpedido')}}" id="forimportar" method="POST" enctype="multipart/form-data" >         
        {{csrf_field()}}
	<div class="modal-dialog modal-xl">
		<div class="modal-content">
			<div class="modal-header ">
                     <h5 class="modal-title">Importar documento a Factura</h5>
				     <button type="button" class="close" data-dismiss="modal" 
			        	aria-label="Close">
                     <span aria-hidden="true">×</span>
                      </button>
                 
			</div>
			<div class="modal-body">
			<div class="row">
					<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
				<p>Confirma Convertir en factura el  Pedido {{$venta->idpedido}}?</p>
				</div><div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
				<label for="cliente">Cliente</label>
                    	<select name="idcliente" id="idcliente" class="form-control selectpicker" data-live-search="true">						
                           @foreach ($personas as $cli)
                           <option value="{{$cli -> id_cliente}}" <?php if($cli -> id_cliente==$venta->idcliente){ echo "selected";} ?>>{{$cli -> cedula}}-{{$cli -> nombre}}</option> 
                           @endforeach
                        </select>
						</div>
						<div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
			           <div class="form-group">
					   <label for="serie_comprobante">Fecha Emision</label>
					<input type="date" name="fecha_emi"  id="fecha_emi" value="<?php echo $fserver; ?>" class="form-control">
					</div>
					</div>
					<div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
<div class="form-group">
						<label for="serie_comprobante"># Control</label>
						<input type="text" style="background-color:#edefef" name="control" value="00-" size="12" class="form-control" > 
					</div>	
					</div>
				<div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
            		 <div class="form-group">
            	
						<input type="hidden" name="idventa"  value="{{$venta->idpedido}}" >
						<input type="hidden" name="serie_comprobante"  value="A" >
                        @foreach($detalles as $cat1)
						<?php if($cat1->cantidad > 0 ){ ?>
                <input type="hidden" value="{{$cat1->idarticulo}}" name="idarticulo[]" class ="form-control"></input>
				<input type="hidden" value="{{$cat1->cantidad}}" name="cantidad[]" class ="form-control"></input>
                <input type="hidden" value="{{$cat1->costo}}" name="costo[]" class ="form-control"></input>
                <input type="hidden" value="{{$cat1->precio}}" name="preciop[]" class ="form-control"></input>
                <input type="hidden" value="{{$cat1->precio_venta}}" name="precio[]" class ="form-control"></input>
                <input type="hidden" value="{{$cat1->descuento}}" name="descuento[]" class ="form-control"></input>
						<?php } ?>
                        @endforeach
            		</div>
            	</div>
				
		
			<div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
			           <div class="form-group">
							<input type="hidden" value="<?php echo $acumexe; ?>" name="texe" >
						  <input type="hidden" value="<?php echo $acumiva; ?>" name="total_iva" >
						  <input type="hidden" value="<?php echo $acumbase; ?>" name="total_base" >
						  <input type="hidden" value=" {{$empresa->tc}}" name="tasa">
           </div>
		   </div>
		   </div>
		   <div class ="row" id="divdesglose">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<h3 align="center">TOTAL <input type="number" id="divtotal" value="{{$venta->total_venta}}" disabled ><span id="pasapago" title="haz click para hacer cobro total">RESTA</span> <input type="number" id="resta" disabled value="{{$venta->total_venta}}">
					<input type="hidden" name="tdeuda" id="tdeuda" value=""  >		
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
					<div class="form-group">
					<select name="pidpago" id="pidpago" class="form-control">
					<option value="100" selected="selected">Selecione...</option>
					@foreach ($monedas as $m)
					 <option value="{{$m-> idmoneda}}_{{$m->tipo}}_{{$m->valor}}">{{$m -> nombre}}</option> 
					@endforeach
					</select>
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
					<div class="form-group">
					<input type="number" class="form-control" name="pmonto" id="pmonto" placeholder="Esperando Seleccion"  min="1" step="0.01">
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
					<div class="form-group">
					<input type="text" name="preferencia" class="form-control" id="preferencia" onchange="conMayusculas(this);" placeholder="Referencia...">
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
					<div class="form-group">
					<button type="button" id="bt_pago" class="form-control" > <i class="fa fa-fw fa-plus-square"></i> </button>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="table-responsive">
						<table id="det_pago" class="table table-striped table-bordered table-condensed table-hover">
						  <thead style="background-color: #54b279">
							  <th>Supr</th>
							  <th width="15%">Tipo</th>
							   <th width="15%">Monto</th>
							  <th>Monto $</th>
							  <th>Referencia</th>

						  </thead>
							<tfoot> 
							<th></th>
							  <th></th>
							   <th></th>
							  <th><h3>Total $</h3></th>
							  <th><h3 id="total_abono">$.  0.00</h3></th><input type="hidden" name="totala" id="totala" value="0.00">
							  </tfoot>
							<tbody></tbody>
						</table>
					</div>
				</div>
		

					<div class="col-lg-4 ol-md-4 col-sm-6 col-xs-6"  align="left" id="formato">
						<input type="hidden" value="{{$empresa->facfiscalcredito}}" id="faccredito" ></input>
								<input type="hidden" value="{{$empresa->fl}}" id="usafl" ></input>
						<select name="formato"  class="form-control">
												<option value="tcartap" <?php if($empresa->formatofac=="tcarta"){ echo "Selected";} ?>>Carta</option>
							<option value="tnotabsp" <?php if($empresa->formatofac=="tnotabs"){ echo "Selected";} ?>>Nota Bs</option>
							<option value="tnotadsp" <?php if($empresa->formatofac=="tnotads"){ echo "Selected";} ?>>Nota $</option>
							<option value="recibop" <?php if($empresa->formatofac=="recibo"){ echo "Selected";} ?>>Tikect $</option>
							<option value="recibobsp" <?php if($empresa->formatofac=="recibobs"){ echo "Selected";} ?>>Tikect Bs</option>
							</select>					
								</div>
					<div  class="col-lg-4 ol-md-4 col-sm-6 col-xs-6" align="right" style="display: none" id="cfl">
								¿ Forma Libre ? <input type="checkbox" id="convertir" name="convertir" />							
								</div>
				</div>	
					</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
				<button type="submit" id="sendpedido" class="btn btn-primary">Confirmar</button>
			</div>
		</div>
	</div>
</form>

</div>