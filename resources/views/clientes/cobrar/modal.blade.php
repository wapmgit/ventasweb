 <div class="modal fade" id="modal">
	  <form action="{{route('pagocxc')}}" method="get" enctype="multipart/form-data" >    
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Abono Total de Facturas $</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
			<div class="modal-body">
				<p>Seleccione Moneda:
				@foreach ($datos as $cat1)<?php $salpt=$salpt+$cat1->saldo; ?>		
				<input type="hidden" value="{{$cat1->idventa}}" name="factura[]" class ="form-control"></input>
				<input type="hidden" value="{{$cat1->saldo}}" name="saldo[]" class ="form-control"></input>
					@endforeach
				</p>
					<select name="pidpagomodal" id="pidpagomodal" class="form-control">					
						@foreach ($monedas as $mo)	<?php $cntpt++; ?>				
							<option id=vmpt<?php echo $cntpt; ?>  value="{{$mo->idmoneda}}_{{$mo->tipo}}_{{$mo->valor}}_{{$mo->nombre}}">{{$mo->idmoneda}}-{{$mo->nombre}}</option>					
						@endforeach
						</select>
						<label>Monto</label>
		<input type="text" value="{{$salpt}}" name="mntpt" id="mntpt" readonly class ="form-control"></input>
		<input type="hidden" value="{{$salpt}}" name="mntptreal" id="mntptreal" class ="form-control"></input>
		  <input type="hidden" name="cliente" value="{{$cliente->id_cliente}}" >
			</div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
              <button type="submit" id="btnpt" class="btn btn-primary">Confirmar </button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
		</form>
        <!-- /.modal-dialog -->
      </div>
