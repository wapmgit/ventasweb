@extends ('layouts.master')
@section ('contenido')


<div class="row">
@include('comisiones.comision.modalreglas')
<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
		<h3>Comisiones</h3>
</div>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
 @if($rol->editreglacomi==1) <a href="" data-target="#modalreglas" data-toggle="modal"><button  class="btn btn-warning btn-xs">Reglas de Comision</button></a> @endif
</div> <div class="col-12">
@include('comisiones.comision.search')</div>
  <div class="col-12">
        @if (session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="fa fa-check-circle mr-1"></i> {{ session('success') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        @endif
</div>
</div>
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-condensed table-hover">
				<thead>
				
					<th>Vendedor</th>
					<th>Telefono</th>
					<th>Monto facturado</th>
					<th>Comision Aprox.</th>
					<th>Opciones</th>
				</thead>
				<?php $total=0; $totalc=0; ?>
               @foreach ($vendedor as $vend)
			          @foreach ($ventas as $cat)
					  <?php if ($vend->id_vendedor==$cat->idvendedor){?>
						<tr>				
							<td>{{ $vend->nombre}}</td>
							<td>{{ $vend->telefono}}</td>
							<td><?php $total=$total+$cat->monto; echo number_format( $cat->monto, 2,',','.')." $"; ?></td>
							<td><?php $totalc=$totalc+$cat->montocomision; echo number_format( $cat->montocomision, 2,',','.')." $"; ?></td>
							<td>
							<a href="{{route('detallecomision',['id'=>$vend->id_vendedor])}}"><button class="btn btn-primary btn-xs">Detalles</button></a>                 
							</td>
						</tr>
					  <?php } ?>
					@endforeach
				@endforeach
				<tr ><td colspan="5"><button type="button" class="btn bg-olive btn-flat margin"><strong><?php echo "Comisiones por Pagar: ".number_format( $totalc, 2,',','.')." $";?></strong></button></td></tr>
			</table>
		</div>
		{{$ventas->render()}}
	</div>
</div>
@endsection
@push('scripts')
<script>
$(document).ready(function(){
    $('#bt_add').click(function(){            
        agregar();    
    });
});

// Inicializar contadores con la cantidad de filas cargadas desde el servidor
var cont = {{ count($regla) }};
function agregar(){
    ngrupo = $("#input_desde").val();
    cntgrupo = $("#input_hasta").val();
    valgrupo = $("#input_porcentaje").val();        
    if (ngrupo != "" && cntgrupo != "" && valgrupo != ""){
        var fila = '<tr class="selected" id="fila'+cont+'">' +
            '<td>' +
                '<input type="hidden" name="idregla[]" value="">' + // ID vacío para nuevos premios
                '<input type="hidden" name="desde[]" value="'+ngrupo+'">'+ngrupo+
            '</td>' +
            '<td><input type="hidden" name="hasta[]" value="'+cntgrupo+'">'+cntgrupo+'</td>' +
            '<td><input type="hidden" name="porcentaje[]" value="'+valgrupo+'">'+valgrupo+'  %</td>' +
            '<td class="text-center"><button type="button" class="btn btn-outline-danger btn-xs" onclick="eliminar('+cont+');"><i class="fa fa-times"></i></button></td>' +
        '</tr>';
        cont++;
        limpiar();
        $('#detalles tbody').append(fila);          
    } else {
        alert("Error al ingresar premio, complete todos los campos.");
    }
}

function limpiar(){
    $("#input_desde").val("");
    $("#input_hasta").val("");
    $("#input_porcentaje").val("");
}

function eliminar(index){
    $("#fila" + index).remove();      
}

</script>
@endpush