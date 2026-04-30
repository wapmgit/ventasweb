<div class="modal fade modal-slide-in-right" aria-hidden="true"
role="dialog" tabindex="-1" id="modalfecha">
<form action="{{route('detallecomisionfiltro')}}" method="GET" enctype="multipart/form-data" >    
	<div class="modal-dialog">
		<div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Filtrar por fecha </h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
			<div class="modal-body">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<table width="100%">
				<tr><td>Desde</td><td><div class="form-group">
				<div class="input-group">
					<input type="date" class="form-control" name="desde"  value="">
				</div>
				</div></td></tr>
				<tr><td>Hasta</td><td><div class="form-group">
				<div class="input-group">
					<input type="date" class="form-control" name="hasta" value="">
				</div>
				</div></td></tr>
				</table>

			<input type="hidden" value="{{$vendedor->id_vendedor}}" name="vendedor" class ="form-control"></input>
			</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
				<button type="submit" class="btn btn-primary">Confirmar</button>
			</div>
		</div>
	</div>
</form>
</div>
