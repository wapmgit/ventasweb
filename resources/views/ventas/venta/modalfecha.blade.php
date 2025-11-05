
<div class="modal fade" id="modalfecha" >
<form action="{{route('ajusfechafac')}}" id="formulario" method="POST" enctype="multipart/form-data" >         
        {{csrf_field()}}
	<div class="modal-dialog" >	
		<div class="modal-content bg-primary">
			    <div class="modal-header ">
                     <h5 class="modal-title">Ajustar Fecha de Emision</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
                 
			    </div>
			<div class="modal-body">
		
				<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
				<label id="art"></label>
				</div>
					<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
            		 <div class="form-group">
            			<label for="nombre">Nueva Fecha de Emision</label>
            			<input type="date" class="form-control" name="vfecha_emi"  value="{{$venta->fecha_emi}}">
            			<input type="hidden" class="form-control" name="vidventa"  value="{{$venta->idventa}}">

            		</div>
            	</div>
			</div>
	
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
				<button type="submit"  class="btn btn-primary">Confirmar</button>
			</div>
		</div>
			

	</div>
	</form>

</div>


  @push ('scripts')
<script> 

 $('#senddevolu').on("click",function(){ 

 document.getElementById('formulario').submit(); })

	</script>
@endpush
	
   