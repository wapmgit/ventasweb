
<div class="modal fade" id="modalaggart" >
<form action="{{route('addarticuloshein')}}" id="formularioadd" method="POST" enctype="multipart/form-data" >         
        {{csrf_field()}}
	<div class="modal-dialog modal-lg" >	
		<div class="modal-content bg-primary">
			    <div class="modal-header ">
                     <h5 class="modal-title">Agregar Articulo a Pedido <?php $idv=$venta->num_comprobante; echo add_ceros($idv,$ceros); ?></h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
                 
			    </div>
			<div class="modal-body">	
				<div class="row">	
					<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
			<table align="center" width="100%">
			<tr><td><label>Codigo</label></td><td><label>Descripcion</label></td><td><label>Cantidad</label></td><td><label>Precio</label></td><td><label>Envio</label></td></tr>
			<tr>
			<td><input type="text" name="pcodigo" id="pcodigo"   onchange="conMayusculas(this)" class ="form-control" placeholder="Codigo" required></td>
			<td><input type="text" name="pdescri" id="pdescri"  class ="form-control" placeholder="Descripcion" required></td>
			<td><input type="number" name="pcantidad" id="pcantidad" class ="form-control" placeholder="Cantidad" min="1" required></td>
			<td><input type="number" name="pprecio_venta" id="pprecio_venta" step="0.001" class ="form-control" placeholder="Precio" required></td>
			<td><input type="number" name="envio" id="envio" step="0.001" class ="form-control" placeholder="Envio" required></td>
			</tr>
			</table>
					</div>
   
			   </div>
			
				</div> 			
				<div class="modal-footer justify-content-between">
				<input type="hidden" value="{{$venta->idpedido}}" name="idpedido"  class ="form-control" >
				<button type="button"  class="btn btn-outline-light" id="btncerrar"  data-dismiss="modal">Cerrar</button>
				  <input name="_token" value="{{ csrf_token() }}" type="hidden" ></input>
				<button   type="submit" id="btnsubmit"  class="btn btn-outline-light" >Confirmar</button>
			</div>
			</div>

		</div>
			

	</form>

	</div>