@extends ('layouts.master')
@section ('contenido')
<div class="row">
    <div class="col-lg-12">
        <h3>Editar Ruta: {{ $ruta->nombre }}</h3>
    </div>

    <!-- FORMULARIO ENVOLVIENDO TODO -->
    <form action="{{route('updateruta')}}" id="formcategoria" method="POST" enctype="multipart/form-data">        
        {{csrf_field()}}
        <input type="hidden" name="id" value="{{$ruta->idruta}}">

        <div class="row">
            <!-- Datos de la Ruta Principal -->
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <input type="text" name="nombre" class="form-control" onchange="conMayusculas(this)" value="{{$ruta->nombre}}" placeholder="Nombre...">
                    @if($errors->first('nombre'))<p class='text-danger'>{{$errors->first('nombre')}}</p>@endif
                </div>
                <div class="form-group">
                    <label for="descripcion">Descripción</label>
                    <input type="text" name="descripcion" class="form-control" value="{{$ruta->descripcion}}" placeholder="Descripción...">
                </div>          
            </div>

            <!-- Sección de Subrutas -->
            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 mb-4">
                <div class="card shadow-sm border-0 h-100">
                    <div class="card-header bg-white py-3">
                        <h5 class="card-title fw-bold text-success mb-0">
                            <i class="fa fa-truck me-2"></i>Subrutas
                        </h5>
                    </div>
                    <div class="card-body">
                        <!-- Campos de Entrada -->
                        <div class="p-3 bg-light rounded mb-3 border">
                            <div class="row g-2">
                                <div class="col-md-6">
                                    <label class="form-label small fw-bold">Nombre Subruta</label>
                                    <input type="text" id="pnsruta" class="form-control form-control-sm" placeholder="Nombre">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label small fw-bold">Descripción</label>
                                    <input type="text" id="pdesruta" class="form-control form-control-sm" placeholder="Descripción">
                                </div>
                                <div class="col-12 text-end mt-2">
                                    <button type="button" id="bt_add" class="btn btn-success btn-sm px-3">
                                        <i class="fa fa-plus me-1"></i> Crear
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Tabla con Resultados -->
                        <div class="table-responsive">
                            <table id="detalles" class="table table-sm table-hover table-bordered align-middle mb-0">
                                <thead class="table-dark">
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Descripción</th>
                                        <th style="width: 50px;" class="text-center">Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($subrutas as $key => $p)
                                    <tr class="selected" id="fila{{ $key }}">
                                        <td>
                                            <input type="hidden" name="idsruta[]" value="{{ $p->idsubruta }}">
                                            <input type="hidden" name="nombresruta[]" value="{{ $p->nombre }}">
                                            {{ $p->nombre }}
                                        </td>
                                        <td>
                                            <input type="hidden" name="descripcionr[]" value="{{ $p->descripcion }}">
                                            {{ $p->descripcion }}
                                        </td>
                                        <td class="text-center">
                                            <button type="button" class="btn btn-outline-danger btn-xs" onclick="eliminar({{ $key }});">
                                                <i class="fa fa-times"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Botones de Acción -->
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center"> 
                <div class="form-group">
                    <a href="{{ url()->previous() }}" class="btn btn-danger btn-sm" id="btncancelar">Cancelar</a>
                    <button class="btn btn-primary btn-sm" id="btnguardar" type="submit">Guardar</button>
                    <div style="display: none" id="loading">
                        <img src="{{asset('img/sistema/loading30.gif')}}">
                    </div>
                </div>  
            </div>  
        </div>
    </form>  
</div>
@endsection

@push('scripts')
<script>
$(document).ready(function(){
    $('#bt_add').click(function(){            
        agregar();    
    });

    // Controlamos el submit a nivel del formulario para mostrar la animación
    $('#formcategoria').on('submit', function(){
        $('#loading').show();
        $('#btnguardar').hide();
        $('#btncancelar').hide();
    });
});

function conMayusculas(field) {
    field.value = field.value.toUpperCase();
}

var cont = {{ count($subrutas) }};

function agregar(){
    var ngrupo = $("#pnsruta").val();
    var cntgrupo = $("#pdesruta").val();   

    if (ngrupo != "" && cntgrupo != ""){
        var fila = '<tr class="selected" id="fila'+cont+'">' +
            '<td>' +
                '<input type="hidden" name="idsruta[]" value="">' + 
                '<input type="hidden" name="nombresruta[]" value="'+ngrupo+'">'+ngrupo+
            '</td>' +
            '<td>' +
                '<input type="hidden" name="descripcionr[]" value="'+cntgrupo+'">'+cntgrupo+
            '</td>' +
            '<td class="text-center">' +
                '<button type="button" class="btn btn-outline-danger btn-xs" onclick="eliminar('+cont+');"><i class="fa fa-times"></i></button>' +
            '</td>' +
        '</tr>';
        
        cont++;
        limpiar();
        $('#detalles tbody').append(fila);          
    } else {
        alert("Complete todos los campos de la subruta.");
    }
}

function limpiar(){
    $("#pnsruta").val("");
    $("#pdesruta").val("");
}

function eliminar(index){
    $("#fila" + index).remove();      
}
</script>
@endpush