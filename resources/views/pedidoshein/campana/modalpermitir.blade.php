<div class="modal fade" id="modalpermitir{{$campana->id}}" tabindex="-1" role="dialog" aria-hidden="true">
<form action="{{route('estatuscampana')}}" method="POST" enctype="multipart/form-data" >
{{csrf_field()}}
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <!-- Título que cambiará según el enlace -->
                <h5 class="modal-title" id="tituloModal{{$campana->id}}">Cambiar Estado</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p id="textoModal{{$campana->id}}">¿Está seguro de realizar esta acción?</p>
				<input type="hidden" name="campana"  value="{{$campana->id}}" >
				<input type="hidden" name="valor" id="valor" value="" >
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <!-- Botón de confirmar cuyo texto también puede cambiar -->
                <button type="submit" class="btn btn-primary" id="btnConfirmarEstado{{$campana->id}}">Confirmar</button>
            </div>
        </div>
    </div>
				
    </form>  
</div>