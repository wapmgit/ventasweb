@extends ('layouts.master')

@section ('contenido')

@php
    $cntart = 1990;
    $fserver = date('Y-m-d');
    $nivel = Auth::user()->nivel;
    $fecha_a = $empresa->fechavence;

    function dias_transcurridos($fecha_a, $fserver) {
        return (strtotime($fecha_a) - strtotime($fserver)) / 86400;
    }

    $vencida = (dias_transcurridos($fecha_a, $fserver) < 0) ? 1 : 0;
@endphp

@if($vencida == 1)
    <div class="alert alert-danger alert-dismissible fade show mb-3" role="alert">
        <h4 class="alert-heading"><i class="icon fa fa-ban"></i> ¡LICENCIA DE USO DE SOFTWARE VENCIDA!</h4>
        Contacte inmediatamente a su Técnico de soporte para restablecer el servicio.
    </div>
@endif

<div class="row mb-2">
    <div class="col-sm-12 d-flex justify-content-between align-items-center">
        <h3 class="m-0 font-weight-bold text-dark"><i class="fa fa-cart-plus"></i> Nuevo Ingreso de Compra</h3>
        <div>
            @include('compras.ingreso.modalarticulo')
            @include('compras.ingreso.modalproveedor')
        </div>
    </div>
</div>

<form action="{{route('guardarcompra')}}" method="POST" enctype="multipart/form-data">          
    {{csrf_field()}}

    <!-- Card Datos Principales -->
    <div class="card card-outline card-primary shadow-sm mb-4" id="proveedor">
        <div class="card-header">
            <h3 class="card-title font-weight-bold"><i class="fa fa-file-text-o"></i> Datos del Documento y Proveedor</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <input type="hidden" value="{{$empresa->tc}}" id="valortasa" name="tc" class="form-control">
                <input type="hidden" value="{{$empresa->peso}}" id="valortasap" name="peso" class="form-control">
                <input type="hidden" name="vtasa" id="vtasa" value="{{$empresa->tc}}">

                <!-- Proveedor -->
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="form-group">
                        <label for="proveedor">Proveedor</label>
                        <a href="" data-target="#modalproveedor" data-toggle="modal" title="Agregar Proveedor" class="ml-1">
                            <span class="label label-success"><i class="fa fa-plus"></i> Nuevo</span>
                        </a>
                        <select id="idproveedor" name="idproveedor" class="form-control selectpicker" data-live-search="true">
                            @foreach ($personas as $per)
                                <option value="{{$per->idproveedor}}">{{$per->nombre}}</option> 
                            @endforeach
                        </select>
                    </div>
                </div>

                <!-- Tipo Comprobante -->
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="tipo_comprobante">Tipo comprobante</label>
                        <select name="tipo_comprobante" class="form-control">
                            <option value="FAC">Factura</option>
                            <option value="N/E">Nota de Entrega</option>
                        </select>
                    </div>
                </div>

                <!-- Emisión -->
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="emision">Emisión</label>
                        <input type="date" name="emision" class="form-control" value="{{ $fserver }}">
                    </div>
                </div>

                <!-- Serie / Documento -->
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="serie_comprobante">Número Documento</label>
                        <input type="text" name="serie_comprobante" maxlength="19" value="{{old('serie_comprobante')}}" class="form-control" placeholder="Número del Documento"> 
                    </div>
                </div>

                <!-- Num Comprobante / Control -->
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="num_comprobante">Número Control</label>
                        <input type="text" required name="num_comprobante" maxlength="19" id="num_comprobante" value="{{old('num_comprobante')}}" class="form-control" placeholder="Número de Control">
                    </div>
                </div>

                <!-- Moneda / Tasa -->
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label class="d-flex justify-content-between align-items-center">
                            <span>Compra:</span>
                            <span>
                                <label class="radio-inline mb-0 mr-1"><input name="precio" type="radio" id="cbs" value="2"> Bs</label>
                                <label class="radio-inline mb-0"><input name="precio" type="radio" id="dls" value="1" checked="checked"> $</label>
                            </span>
                        </label>
                        <div class="input-group">
                            <div class="input-group-prepend"><span class="input-group-text">Tasa</span></div>
                            <input type="number" name="tasacompra" step="any" id="tasacompra" readonly value="{{$empresa->tc}}" class="form-control">
                        </div>
                    </div>
                </div>

                <!-- Días Crédito -->
                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="diascre">Días Crédito</label>
                        <input type="number" required name="diascre" value="0" max="99" class="form-control">
                    </div>
                </div>

                <!-- Observaciones -->
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="form-group mb-0">
                        <label for="nota">Observación</label>
                        <input type="text" name="nota" maxlength="200" value="" class="form-control" placeholder="Escriba una observación o nota relevante...">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Card Selección de Artículos -->
    <div class="card card-outline card-info shadow-sm mb-4" id="divarticulos">
        <div class="card-header">
            <h3 class="card-title font-weight-bold"><i class="fa fa-cubes"></i> Detalle de Artículos</h3>
        </div>
        <div class="card-body">
            <div class="row align-items-end mb-3">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="form-group mb-0">
                        <label>
                            <i class="fa fa-fw fa-refresh text-info" id="refresh" style="cursor: pointer;" title="Actualizar lista"></i> 
                            Artículo 
                            <a href="" data-target="#modalarticuloid" data-toggle="modal"><span class="label label-success"><i class="fa fa-plus-circle"></i> Nuevo</span></a>
                        </label>
                        <select name="pidarticulo" id="pidarticulo" class="form-control selectpicker" data-live-search="true">
                            @foreach ($articulos as $articulo)
                                @php $cntart++; @endphp
                                <option value="{{$articulo->idarticulo}}_{{$articulo->iva}}_{{$articulo->serial}}">{{$articulo->articulo}}</option> 
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="col-lg-2 col-md-2 col-sm-3 col-xs-12">
                    <div class="form-group mb-0">
                        <label for="cantidad">Cantidad</label>
                        <input type="number" name="pcantidad" min="0.1" id="pcantidad" class="form-control" placeholder="Cantidad">
                    </div>
                </div>

                <div class="col-lg-2 col-md-2 col-sm-3 col-xs-12">
                    <div class="form-group mb-0">
                        <label for="precio_compra">Precio Compra</label>
                        <input type="text" step="any" name="pprecio_compra" id="pprecio_compra" class="form-control" placeholder="Precio">
                    </div>
                </div>

                <div class="col-lg-2 col-md-2 col-sm-3 col-xs-12">
                    <div class="form-group mb-0">
                        <label for="precio_venta">Descto. %</label>
                        <input type="number" value="0" name="pprecio_venta" id="pprecio_venta" class="form-control" placeholder="Desc.">
                    </div>
                </div>

                <div class="col-lg-2 col-md-2 col-sm-3 col-xs-12">
                    <div class="form-group mb-0">
                        <button type="button" id="bt_add" @if($vencida == 1) style="display: none" @endif class="btn btn-success btn-block">
                            <i class="fa fa-plus"></i> Agregar
                        </button>
                    </div>
                </div>
            </div>

            <!-- Tabla de Detalles -->
            <div class="table-responsive">
                <table id="detalles" class="table table-striped table-bordered table-hover table-sm">
                    <thead class="bg-primary text-white">
                        <th width="4%" class="text-center">Supr</th>
                        <th>Artículo</th>
                        <th width="8%">Cantidad</th>
                        <th>Precio</th>
                        <th>Precio Bs</th>
                        <th>Descto.</th>
                        <th>Precio Compra</th>
                        <th>Neto</th>
                        <th>Subtotal</th>
                    </thead>
                    <tfoot class="bg-light"> 
                        <tr>
                            <th colspan="8" class="text-right"><h4><strong>TOTAL:</strong></h4></th>
                            <th class="text-center"><h4 id="total" class="text-primary font-weight-bold">$. 0.00</h4></th>
                            <input type="hidden" name="total_venta" id="total_venta">
                        </tr>
                    </tfoot>
                    <tbody></tbody>
                </table>
            </div>

            <!-- Totales Desglosados -->
            <div class="row mt-3 p-2 bg-light border rounded">
                <div class="col-md-4 text-center">
                    <div class="form-group mb-0">
                        <strong>Base Imponible: </strong>
                        <input type="text" class="form-control d-inline-block text-center font-weight-bold" style="width: 120px;" name="base" id="pbase" value="0" placeholder="Base" readonly>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="form-group mb-0">
                        <strong>IVA: </strong>
                        <input type="text" class="form-control d-inline-block text-center font-weight-bold" style="width: 120px;" name="iva" id="piva" value="0" placeholder="IVA" readonly>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="form-group mb-0">
                        <strong>Exento: </strong>
                        <input type="text" class="form-control d-inline-block text-center font-weight-bold" style="width: 120px;" name="exento" id="pexento" value="0" placeholder="Exento" readonly>
                    </div>
                </div>
            </div>

            <!-- Botones de Acción -->
            <div class="col-12 mt-3 text-right" id="guardar">
                <div class="form-group mb-0">
                    <button class="btn btn-success btn-lg" id="bguardar" type="button"><i class="fa fa-calculator"></i> Totalizar</button>
                    <button class="btn btn-secondary btn-lg" type="button" id="btncancelar" data-dismiss="modal"><i class="fa fa-times"></i> Cancelar</button>
                </div>
            </div>
        </div>
    </div> 

    <!-- Panel de Desglose de Pago (Oculto inicialmente) -->
    <div class="card card-outline card-success shadow-sm mb-4" id="divdesglose" style="display: none">
        <div class="card-header">
            <h3 class="card-title font-weight-bold"><i class="fa fa-money"></i> Desglose de Pago</h3>
        </div>
        <div class="card-body">
            <div class="row text-center mb-3">
                <div class="col-12">
                    <div class="alert alert-info">
                        <h3 class="m-0">
                            <strong>TOTAL:</strong> 
                            <input type="number" id="divtotal" value="" disabled class="text-center font-weight-bold border-0 bg-transparent" style="width: 150px;">
                            <span id="pasapago" title="haz click para hacer cobro total" class="badge badge-warning" style="cursor: pointer;">RESTA:</span> 
                            <input type="number" id="resta" disabled value="" class="text-center font-weight-bold border-0 bg-transparent" style="width: 150px;">
                            <input type="hidden" name="tdeuda" id="tdeuda" value="">
                        </h3>
                    </div>
                </div>
            </div>

            <div class="row align-items-center">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="form-group">
                        <label>Método de Pago</label>
                        <select name="pidpago" id="pidpago" class="form-control">
                            <option value="100" selected="selected">Seleccione...</option>
                            @foreach ($monedas as $m)
                                <option value="{{$m->idmoneda}}_{{$m->tipo}}_{{$m->valor}}">{{$m->nombre}}</option> 
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="form-group">
                        <label>Monto</label>
                        <input type="number" class="form-control" name="pmonto" id="pmonto" placeholder="Monto" min="1" step="0.01">
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="form-group">
                        <label>Referencia</label>
                        <input type="text" name="preferencia" class="form-control" id="preferencia" onchange="conMayusculas(this);" placeholder="Referencia...">
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="form-group">
                        <label>&nbsp;</label>
                        <button type="button" id="bt_pago" class="btn btn-info btn-block"><i class="fa fa-plus-square"></i> Agregar Pago</button>
                    </div>
                </div>
            </div>

            <div class="table-responsive my-3">
                <table id="det_pago" class="table table-striped table-bordered table-sm">
                    <thead class="bg-success text-white">
                        <th width="5%" class="text-center">Supr</th>
                        <th width="20%">Tipo</th>
                        <th width="20%">Monto</th>
                        <th width="20%">Monto $</th>
                        <th>Referencia</th>
                    </thead>
                    <tfoot> 
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th class="text-right"><h3>Total $</h3></th>
                            <th><h3 id="total_abono" class="text-success font-weight-bold">$. 0.00</h3></th>
                            <input type="hidden" value="0" name="totala" id="totala">
                        </tr>
                    </tfoot>
                    <tbody></tbody>
                </table>
            </div>

            <div class="row align-items-center">
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12">
                    <div class="form-group mb-0">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="recalcular" name="recalcular" checked>
                            <label class="custom-control-label font-weight-bold" for="recalcular">¿Recalcular Precios?</label>
                        </div>
                    </div>
                </div>                         
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 text-right">
                    <button type="button" class="btn btn-secondary" id="regresar" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Regresar</button>
                    <input name="_token" value="{{ csrf_token() }}" type="hidden">
                    <button type="submit" id="procesa" class="btn btn-primary"><i class="fa fa-check-circle"></i> Procesar</button>
                    <div style="display: none" id="loading" class="mt-2">  
                        <img src="{{asset('img/sistema/loading30.gif')}}">
                    </div>
                </div>                             
            </div>
        </div>
    </div>

    @include('compras.ingreso.modalseriales')
</form>

@push ('scripts')
<script>
    var Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 3000
    });

    function abrir(url) {
        open(url,'','top=300,left=500,width=500,height=650');
    }

    var auxcompra = 0;
    var cont = 0;
    var total = 0, tmiva = 0, tneto = 0, texe = 0, precio_tasa = 0;
    var subtotal = [];
    var arrayiva = [];
    var arraybase = [];
    var arrayexento = [];

    // =========================================================================
    // FUNCIONES PARA LOCALSTORAGE (AUTO-GUARDADO)
    // =========================================================================
    
    function guardarBorrador() {
        let detalles = [];
        $('#detalles tbody tr').each(function() {
            let row = $(this);
            detalles.push({
                idarticulo: row.find('input[name="idarticulo[]"]').val(),
                articulo: row.find('td:eq(1)').text(),
                cantidad: row.find('input[name="cantidad[]"]').val(),
                precio_compra: row.find('input[name="precio_compra[]"]').val(),
                ptasa: row.find('input[name="ptasa[]"]').val(),
                descuento: row.find('input[name="descuento[]"]').val(),
                precio: row.find('input[name="precio[]"]').val(),
                neto: row.find('td:eq(7)').text(),
                iva: row.find('input[name="iva[]"]').val(),
                exento: row.find('input[name="exento[]"]').val(),
                base: row.find('input[name="base[]"]').val(),
                stotal: row.find('input[name="stotal[]"]').val()
            });
        });

        let borrador = {
            idproveedor: $('#idproveedor').val(),
            tipo_comprobante: $('select[name="tipo_comprobante"]').val(),
            emision: $('input[name="emision"]').val(),
            serie_comprobante: $('input[name="serie_comprobante"]').val(),
            num_comprobante: $('#num_comprobante').val(),
            precio_tipo: $('input[name="precio"]:checked').val(),
            tasacompra: $('#tasacompra').val(),
            diascre: $('input[name="diascre"]').val(),
            nota: $('input[name="nota"]').val(),
            detalles: detalles,
            totales: {
                total: total,
                tmiva: tmiva,
                tneto: tneto,
                texe: texe
            }
        };

        localStorage.setItem('borrador_compra_sysventas', JSON.stringify(borrador));
    }

    function cargarBorrador() {
        let datos = localStorage.getItem('borrador_compra_sysventas');
        if (!datos) return;

        try {
            let borrador = JSON.parse(datos);

            // Restaurar campos del encabezado
            if (borrador.idproveedor) $('#idproveedor').val(borrador.idproveedor).selectpicker('refresh');
            if (borrador.tipo_comprobante) $('select[name="tipo_comprobante"]').val(borrador.tipo_comprobante);
            if (borrador.emision) $('input[name="emision"]').val(borrador.emision);
            if (borrador.serie_comprobante) $('input[name="serie_comprobante"]').val(borrador.serie_comprobante);
            if (borrador.num_comprobante) $('#num_comprobante').val(borrador.num_comprobante);
            if (borrador.diascre) $('input[name="diascre"]').val(borrador.diascre);
            if (borrador.nota) $('input[name="nota"]').val(borrador.nota);

            if (borrador.precio_tipo) {
                $('input[name="precio"][value="' + borrador.precio_tipo + '"]').prop('checked', true);
                if (borrador.precio_tipo == "2") {
                    auxcompra = 1;
                    $('#tasacompra').attr("readonly", false);
                }
            }

            // Restaurar Tabla de Artículos
            if (borrador.detalles && borrador.detalles.length > 0) {
                borrador.detalles.forEach(function(item) {
                    subtotal[cont] = parseFloat(item.stotal);
                    arrayiva[cont] = parseFloat(item.iva);
                    arraybase[cont] = parseFloat(item.base);
                    arrayexento[cont] = parseFloat(item.exento);

                    var fila = '<tr class="selected" id="fila' + cont + '">' +
                        '<td><button class="btn btn-danger btn-xs" onclick="eliminar(' + cont + ');"><i class="fa fa-times"></i></button></td>' +
                        '<td><input type="hidden" name="idarticulo[]" value="' + item.idarticulo + '">' + item.articulo + '</td>' +
                        '<td><input type="text" class="form-control form-control-sm" style="width: 60px" name="cantidad[]" readonly="true" value="' + item.cantidad + '"></td>' +
                        '<td><input type="text" name="precio_compra[]" readonly="true" class="form-control form-control-sm" style="width: 100px" value="' + item.precio_compra + '"></td>' +
                        '<td><input type="text" name="ptasa[]" readonly="true" class="form-control form-control-sm" style="width: 100px" value="' + item.ptasa + '"></td>' +
                        '<td><input type="number" readonly="true" name="descuento[]" class="form-control form-control-sm" style="width: 80px" value="' + item.descuento + '"></td>' +
                        '<td><input type="number" readonly="true" name="precio[]" class="form-control form-control-sm" style="width: 100px" value="' + item.precio + '"></td>' +
                        '<td>' + item.neto + '</td>' +
                        '<td><input type="hidden" name="iva[]" value="' + item.iva + '"><input type="hidden" name="exento[]" value="' + item.exento + '"><input type="hidden" name="base[]" value="' + item.base + '"><input type="number" name="stotal[]" class="form-control form-control-sm" style="width: 100px" readonly="true" value="' + item.stotal + '"></td>' +
                        '</tr>';

                    $('#detalles').append(fila);
                    cont++;
                });

                total = borrador.totales.total;
                tmiva = borrador.totales.tmiva;
                tneto = borrador.totales.tneto;
                texe = borrador.totales.texe;

                $("#total").html("$ : " + total.toFixed(2));
                $("#total_venta").val(total.toFixed(2));
                $("#divtotal").val(total.toFixed(2));
                $("#resta").val(total.toFixed(2));
                $("#piva").val(tmiva.toFixed(2));
                $("#pbase").val(tneto.toFixed(2));
                $("#pexento").val(texe.toFixed(2));

                evaluar();
            }

            toastr.info('Se ha restaurado un borrador de compra pendiente.', 'Borrador Recuperado');
        } catch (e) {
            console.error("Error al cargar borrador:", e);
        }
    }

    function limpiarBorrador() {
        localStorage.removeItem('borrador_compra_sysventas');
    }
	var auxcompra=0;
		$("#pcantidad").change(validar); 
		$("#pprecio_compra").change(validartexto);  
    // =========================================================================
    // INICIALIZACIÓN
    // =========================================================================

    $(document).ready(function() {
        // Cargar borrador si existe al ingresar a la vista
        cargarBorrador();

        // Auto-guardar cuando cambien inputs del formulario principal
        $('#idproveedor, select[name="tipo_comprobante"], input[name="emision"], input[name="serie_comprobante"], #num_comprobante, input[name="diascre"], input[name="nota"]').on('change keyup', function() {
            guardarBorrador();
        });
		$('[data-widget="pushmenu"]').PushMenu('collapse'); //oculatr menu
        document.getElementById('pprecio_compra').addEventListener('keypress', function(e) { validarenter(e); });        
        document.getElementById('pcantidad').addEventListener('keypress', function(e) { validarno(e); });          
        document.getElementById('pprecio_venta').addEventListener('keypress', function(e) { validarno(e); });          

        $('#bt_add').click(function() {   
            if (auxcompra == 0) { agregar(); }
            if (auxcompra == 1) { agregarbs(); }
        });

        $("#pidarticulo").change(function() {
            $("#pcantidad").focus();
            $("#pcantidad").val(1);
            $("#pprecio_compra").val(0);        
            $("#pprecio_venta").val(0);       
        });

        $('#pasapago').click(function() {
            datosbanco = $("#pidpago").val();
            if (datosbanco == 100) {
                alert('¡Debe seleccionar un tipo de Pago!');
            } else { 
                $("#pmonto").val($("#resta").val());
                document.getElementById('bt_pago').style.display = ""; 
                $("#preferencia").focus();
            }
        });

        $("#pidpago").change(mediopago);

        $('#bt_pago').click(function() {     
            agregarpago();
        });

        // Limpiar localStorage al procesar la compra exitosamente
        $('#procesa').click(function() {
            abono = $("#totala").val();
            tv = $("#total_venta").val();
            var t1 = parseFloat(abono);
            
            document.getElementById('loading').style.display = ""; 
            document.getElementById('procesa').style.display = "none"; 
            document.getElementById('regresar').style.display = "none"; 

            limpiarBorrador(); // <--- Se borra el borrador al enviar

            Toast.fire({
                icon: 'success',
                title: 'Compra Procesada con éxito.'
            });
        });

        $('#bguardar').click(function() {        
            var auxmonto = $("#divtotal").val();      
            auxmonto = parseFloat(auxmonto.replace(/,/g, "")).toFixed(2);
            $("#resta").val(auxmonto);
            $("#divtotal").val(auxmonto);
            var nc = $("#num_comprobante").val();
            if (nc == "") { 
                toastr.warning('Indique Número de Documento y Número de Control.');
            } else {
                $('#divarticulos').fadeOut("fast");
                $('#divdesglose').fadeIn("fast");
            }
        });

        $('#regresar').click(function() {
            $('#divdesglose').fadeOut("fast");
            $('#divarticulos').fadeIn("fast");
            $("#totala").val(0);
        });

        $('#cbs').click(function() {
            auxcompra = 1;
            $('#tasacompra').attr("readonly", false);
            guardarBorrador();
        });

        $('#dls').click(function() {
            auxcompra = 0;
            $('#tasacompra').attr("readonly", true);
            guardarBorrador();
        });

        $('#btncancelar').click(function() {   
            var total = 0; 
            $("#total").html("$ : " + total);
            $("#total_venta").val(total);
            $("#divtotal").val(total);
            $("#resta").val(total);
            $("#piva").val(total);
            $("#pbase").val(total);
            $("#pexento").val(total);
            for (var i = 0; i < cont; i++) {
                $("#fila" + i).remove(); 
                arrayiva[i] = 0; 
                arraybase[i] = 0; 
                arrayexento[i] = 0; 
                subtotal[i] = 0;  
            }
            limpiarBorrador(); // <--- Limpia borrador al cancelar
        });

        // Modales de Artículo y Proveedor
        $("#Nenviar").on("click", function() {               
            if ($("#codigo").val() == "") { 
                toastr.warning('Debe indicar Código de Artículo.');
            } else {
                var form1 = $('#formarticulo');
                var url1 = '{{route("almacenaarticulo")}}';
                var data1 = form1.serialize();
                $.post(url1, data1, function(result) {  
                    var resultado = result;
                    var nombre = resultado[0].articulo;   
                    var id = resultado[0].idarticulo;         
                    var iva = resultado[0].iva;           
                    var serial = resultado[0].serial;         
                    $("#pidarticulo")
                        .append('<option selected value="' + id + '_' + iva + '_' + serial + '">' + nombre + '</option>')
                        .selectpicker('refresh');
                    $('select[name=pidarticulo]').change();
                    Toast.fire({ icon: 'success', title: 'Artículo Registrado con éxito.' });
                    $("#formarticulo")[0].reset();
                });
            }
        });

        $("#Nenviar2").on("click", function() {
            if ($("#cnombre").val() == "") { 
                toastr.warning('Debe indicar Nombre de Proveedor');
            } else {
                document.getElementById('Nenviar2').style.display = "none";
                var form2 = $('#formularioproveedor');
                var url2 = '{{route("almacenaproveedor")}}';
                var data2 = form2.serialize();         
                $.post(url2, data2, function(result) {  
                    var resultado2 = result;
                    var nombre2 = resultado2[0].nombre;   
                    var id2 = resultado2[0].idproveedor;          
                    $("#idproveedor")
                        .append('<option selected value="' + id2 + '">' + nombre2 + '</option>')
                        .selectpicker('refresh');
                    $('select[name=idproveedor]').change();
                    Toast.fire({ icon: 'success', title: 'Proveedor Registrado con éxito.' });
                    $("#formularioproveedor")[0].reset();
                    guardarBorrador();
                });
                document.getElementById('Nenviar2').style.display = "";
            }
        });     

        function validarno(e) {
            let tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 13) { event.preventDefault(); }
        }   

        function validarenter(e) {
            let tecla = (document.all) ? e.keyCode : e.which;
            if (tecla == 13) { 
                if (auxcompra == 0) { agregar(); }
                if (auxcompra == 1) { agregarbs(); }
                event.preventDefault();                                                 
            }
        }
    });

    // =========================================================================
    // LÓGICA DE TABLA DE ARTÍCULOS
    // =========================================================================

    $("#refresh").on("click", function() {
        $("#pidarticulo").empty();
        $.ajax({
            url: "{{ route('actuartic') }}",
            type: 'POST', 
            data: { _token: "{{ csrf_token() }}" },
            success: function(response) {
                var r3 = response;
                rows = r3.length; 
                $("#pidarticulo").append('<option value="1000" selected="selected">Seleccione..</option>');
                for (j = 0; j < rows; j++) {
                    $("#pidarticulo").append('<option value="' + r3[j].idarticulo + '_' + r3[j].iva + '_' + r3[j].serial + '">' + r3[j].articulo + '</option>');
                }
                $("#pidarticulo").selectpicker('refresh');
                $("#pidarticulo").selectpicker('toggle');
            },
            error: function(xhr) { console.log(xhr.responseText); }
        });
        toastr.info('¡Lista de Artículos Actualizada!.');
    });

    function agregar() { 
        var precio = 0;
        articulo = $("#pidarticulo option:selected").text();
        newarticulo = $("#pidarticulo").val();
        cantidad = $("#pcantidad").val();
        precio_compra = $("#pprecio_compra").val();
        descuento = $("#pprecio_venta").val();
        pdesc = ((100 - descuento) / 100);
        
        if (descuento > 0) {
            precondesc = trunc((precio_compra * pdesc), 8);
            precio = precondesc; 
        } else {
            precio = trunc((precio_compra), 8);
        }
        
        precio_tasa = (precio * $("#vtasa").val()).toFixed(2);
        artiva = articulo.split('-');
        newartiva = newarticulo.split('_');
        viva = newartiva[1];
        mserial = newartiva[2];
        narticulo = artiva[1];
        idarticulo = newartiva[0]; 

        if (idarticulo != "" && cantidad > 0 && precio_compra != "") {          
            neto = (cantidad * precio);
            if (viva == 0) { 
                subtotal[cont] = neto; miva = 0; arrayiva[cont] = 0;  
                arraybase[cont] = 0; texe = texe + neto; arrayexento[cont] = neto; 
            } else { 
                subtotal[cont] = (neto * (viva / 100)) + neto;
                arrayexento[cont] = 0;
                miva = (neto * (viva / 100)); 
                arrayiva[cont] = miva.toFixed(2);
                arraybase[cont] = neto;
                tneto = tneto + neto; 
            }
            tmiva = tmiva + miva;
            total = total + subtotal[cont];

            var fila = '<tr class="selected" id="fila' + cont + '">' +
                '<td><button class="btn btn-danger btn-xs" onclick="eliminar(' + cont + ');"><i class="fa fa-times"></i></button></td>' +
                '<td><input type="hidden" name="idarticulo[]" value="' + idarticulo + '">' + narticulo + '</td>' +
                '<td><input type="text" class="form-control form-control-sm" style="width: 60px" name="cantidad[]" readonly="true" value="' + cantidad + '"></td>' +
                '<td><input type="text" name="precio_compra[]" readonly="true" class="form-control form-control-sm" style="width: 100px" value="' + precio_compra + '"></td>' +
                '<td><input type="text" name="ptasa[]" readonly="true" class="form-control form-control-sm" style="width: 100px" value="' + precio_tasa + '"></td>' +
                '<td><input type="number" readonly="true" name="descuento[]" class="form-control form-control-sm" style="width: 80px" value="' + descuento + '"></td>' +
                '<td><input type="number" readonly="true" name="precio[]" class="form-control form-control-sm" style="width: 100px" value="' + precio + '"></td>' +
                '<td>' + neto.toFixed(2) + '</td>' +
                '<td><input type="hidden" name="iva[]" value="' + arrayiva[cont] + '"><input type="hidden" name="exento[]" value="' + arrayexento[cont] + '"><input type="hidden" name="base[]" value="' + arraybase[cont] + '"><input type="number" name="stotal[]" class="form-control form-control-sm" style="width: 100px" readonly="true" value="' + subtotal[cont].toFixed(2) + '"></td>' +
                '</tr>';

            cont++;
            limpiar();
            $("#total").html("$ : " + total.toFixed(2));
            $("#total_venta").val(total.toFixed(2));
            $("#divtotal").val(total.toFixed(2));
            $("#resta").val(total.toFixed(2));
            $("#pidarticulo").selectpicker('toggle');

            evaluar();
            $('#detalles').append(fila);
            $("#piva").val(tmiva.toFixed(2));
            $("#pbase").val(tneto.toFixed(2));
            $("#pexento").val(texe.toFixed(2));

            if (mserial == 1) { 
                $("#modalseriales").modal("show");
                for (var m = 0; m < cantidad; m++) {
                    var fila2 = '<tr class="selected"><td><input type="hidden" name="artserial[]" value="' + idarticulo + '"><input type="text" name="chasis[]" value=""></td><td><input type="text" name="motor[]" value=""></td><td><input type="text" name="placa[]" style="width: 70px" value=""></td><td><input type="text" name="color[]" style="width: 70px" value=""></td><td><input type="number" name="ano[]" style="width: 50px" maxlength="4" value=""></td></tr>';
                    $('#tableseriales').append(fila2);
                }
            }

            guardarBorrador(); // <--- Auto-guardar tras agregar elemento
        } else {
            toastr.error('Error Al Ingresar El Artículo, ¡Verifique!.');
        }
    }

    function agregarbs() {  
        var precio = 0;
        tasacompra = $('#tasacompra').val();
        idarticulo = $("#pidarticulo").val();
        articulo = $("#pidarticulo option:selected").text();
        newarticulo = $("#pidarticulo").val();
        cantidad = $("#pcantidad").val();
        precio_compra = ($("#pprecio_compra").val() / tasacompra);
        precio_venta = ($("#pprecio_venta").val() / tasacompra);
        precio_tasa = (precio_compra * tasacompra).toFixed(2);
        descuento = $("#pprecio_venta").val();
        pdesc = ((100 - descuento) / 100);

        if (descuento > 0) {
            precondesc = trunc((precio_compra * pdesc), 8);
            precio = precondesc; 
        } else {
            precio = trunc((precio_compra), 8);
        }

        artiva = articulo.split('-');
        newartiva = newarticulo.split('_');
        viva = newartiva[1];
        mserial = artiva[5];
        narticulo = artiva[1];
        idarticulo = newartiva[0]; 

        if (idarticulo != "" && cantidad > 0 && precio_compra != "") {  
            neto = (cantidad * precio);
            if (viva == 0) { 
                subtotal[cont] = neto; miva = 0; arrayiva[cont] = 0;  
                arraybase[cont] = 0; texe = texe + neto; arrayexento[cont] = neto; 
            } else { 
                subtotal[cont] = (neto * (viva / 100)) + neto;
                arrayexento[cont] = 0;
                miva = (neto * (viva / 100)); 
                arrayiva[cont] = miva;
                arraybase[cont] = neto;
                tneto = tneto + neto; 
            }
            tmiva = tmiva + miva;
            total = total + subtotal[cont];

            var fila = '<tr class="selected" id="fila' + cont + '">' +
                '<td><button class="btn btn-danger btn-xs" onclick="eliminar(' + cont + ');"><i class="fa fa-times"></i></button></td>' +
                '<td><input type="hidden" name="idarticulo[]" value="' + idarticulo + '">' + narticulo + '</td>' +
                '<td><input type="text" class="form-control form-control-sm" style="width: 60px" name="cantidad[]" readonly="true" value="' + cantidad + '"></td>' +
                '<td><input type="text" name="precio_compra[]" readonly="true" class="form-control form-control-sm" style="width: 100px" value="' + precio_compra + '"></td>' +
                '<td><input type="text" name="ptasa[]" readonly="true" class="form-control form-control-sm" style="width: 100px" value="' + precio_tasa + '"></td>' +
                '<td><input type="number" readonly="true" name="descuento[]" class="form-control form-control-sm" style="width: 80px" value="' + descuento + '"></td>' +
                '<td><input type="number" readonly="true" name="precio[]" class="form-control form-control-sm" style="width: 100px" value="' + precio + '"></td>' +
                '<td>' + neto.toFixed(2) + '</td>' +
                '<td><input type="hidden" name="iva[]" value="' + arrayiva[cont] + '"><input type="hidden" name="exento[]" value="' + arrayexento[cont] + '"><input type="hidden" name="base[]" value="' + arraybase[cont] + '"><input type="number" name="stotal[]" class="form-control form-control-sm" style="width: 100px" readonly="true" value="' + subtotal[cont].toFixed(2) + '"></td>' +
                '</tr>';

            cont++;
            limpiar();
            $("#total").html("$ : " + (total).toFixed(2));
            $("#total_venta").val((total.toFixed(2)));
            $("#divtotal").val(total.toFixed(2));
            $("#resta").val((total));
            evaluar();
            $('#detalles').append(fila);
            $("#piva").val(tmiva.toFixed(2));
            $("#pbase").val(tneto.toFixed(2));
            $("#pexento").val(texe.toFixed(2));

            if (mserial == 1) { 
                $("#modalseriales").modal("show");
                for (var m = 0; m < cantidad; m++) {
                    var fila2 = '<tr class="selected"><td><input type="hidden" name="artserial[]" value="' + idarticulo + '"><input type="text" name="chasis[]" value=""></td><td><input type="text" name="motor[]" value=""></td><td><input type="text" name="placa[]" style="width: 70px" value=""></td><td><input type="text" name="color[]" style="width: 70px" value=""></td><td><input type="text" name="ano[]" style="width: 50px" value=""></td></tr>';
                    $('#tableseriales').append(fila2);
                }
            }

            guardarBorrador(); // <--- Auto-guardar tras agregar elemento
        } else {
            toastr.error('Error Al Ingresar El Artículo, ¡Verifique!.');
        }
    }

    function eliminar(index) {   
        total = subtotal[index];
        iva = arrayiva[index];
        base = arraybase[index];
        exe = arrayexento[index];
        auxexe = $("#pexento").val();
        auxbase = $("#pbase").val();
        resta = $("#total_venta").val();
        auxiva = $("#piva").val();

        nbase = (parseFloat(auxbase) - parseFloat(base)); if (nbase < 0) { tneto = 0; nbase = 0; }
        niva = (parseFloat(auxiva) - parseFloat(iva)); if (niva < 0) { tmiva = 0; niva = 0; }
        nexe = (parseFloat(auxexe) - parseFloat(exe)); if (nexe < 0) { texe = 0; nexe = 0; }
        nv = (parseFloat(resta) - (total));

        texe = nexe;
        tmiva = niva;
        tneto = nbase;

        $("#total").html("$" + nv.toFixed(2));
        $("#divtotal").val(nv.toFixed(2));
        $("#piva").val(niva.toFixed(2));
        $("#pexento").val(nexe.toFixed(2));
        $("#pbase").val(nbase.toFixed(2));
        $("#total_venta").val(nv.toFixed(2));   
        $("#resta").val((nv.toFixed(2)));        
        $("#fila" + index).remove();

        subtotal[index] = (nv);   
        total = subtotal[index];  
        evaluar();

        guardarBorrador(); // <--- Auto-guardar tras eliminar elemento
    }

    function limpiar() {
        $("#pcantidad").val("");
        $("#pprecio_compra").val("");
        $("#total_venta").val(total);
        $("#pprecio_venta").val("");
    }

    function mediopago() {
        document.getElementById('bt_pago').style.display = "";       
        var pesoresta = $("#resta").val();   
        var pesototal = $("#divtotal").val();
        var tabono = $("#totala").val();
        var debe = (pesototal - tabono);

        moneda = $("#pidpago").val();
        tm = moneda.split('_');
        var idmoneda = tipom = tm[0];
        tipom = tm[1];
        valort = tm[2];
        moneda = $("#pidpago option:selected").text();

        if (tipom == 0) {   
            $("#resta").val(pesototal - tabono);      
            $("#preferencia").val("");              
        }   
        if (tipom == 1) { 
            $("#resta").val((debe * valort).toFixed(2)); 
            $("#preferencia").val('Tc: ' + valort);
        }
        if (tipom == 2) {   
            $("#resta").val((debe / valort).toFixed(2)); 
            $("#preferencia").val('Tc: ' + valort); 
        }   
        $("#pmonto").attr('placeholder', 'Monto ' + moneda);
        t_pago = $("#pidpago").val();     
    }

    function evaluar() {
        if (total > 0) {
            $("#guardar").show();
        } else {
            $("#guardar").hide();
        }
    }

    function validar() {   
        datosarticulo = $("#pidarticulo option:selected").text();
        arti = datosarticulo.split('-');
        st = arti[3];
        $("#pprecio_compra").val("" + st); 
        if (auxcompra == 1) {
            var tasac = $("#tasacompra").val();
            $("#pprecio_compra").val((tasac * st).toFixed(2)); 
        }
    }

    function validartexto() {
        datosarticulo = $("#pidarticulo option:selected").text();
        arti = datosarticulo.split('-');
        st = arti[3];
        st = st * 1;
        var dato = $("#pprecio_compra").val();
        if (dato == "") {
            alert("EL CAMPO NO PUEDE SER VACÍO");
        } else if (isNaN(dato) == true) {
            alert("DATO NO VÁLIDO");
        }
        if (dato < st) {
            Toast.fire({
                icon: 'info',
                title: '¡Costo indicado por debajo del costo anterior!.'
            });
            document.getElementById('pprecio_compra').focus();
        }
    }

    // Lógica de pagos
    acumpago = []; var contp = 0; var pagototal = 0; var tresta = 0;
    function agregarpago() { 
        vresta = $("#resta").val();    
        idpago = $("#pidpago").val();
        tpago = $("#pidpago option:selected").text();
        pmonto = $("#pmonto").val();
        pref = $("#preferencia").val();

        moneda = $("#pidpago").val();
        tm = moneda.split('_');
        tipom = tm[1];
        valort = tm[2];
        idpago = tm[0];

        if (parseFloat(pmonto) <= parseFloat(vresta)) {
            var denomina = pmonto;
            acumpago[contp] = (pmonto);
            if (tipom == 1) { 
                var pesoresta = $("#resta").val();   
                $("#total_abono").text(pagototal / valort);
                denomina = pmonto;
                pmonto = pmonto / valort;       
                acumpago[contp] = (pmonto.toFixed(2)); 
            }   
            if (tipom == 2) { 
                var pesoresta = $("#resta").val();   
                $("#resta").val(pesoresta * valort);  
                $("#total_abono").text(pagototal * valort);
                denomina = pmonto;
                pmonto = pmonto * valort;       
                acumpago[contp] = (pmonto.toFixed(2)); 
            }           
            pagototal = parseFloat(pagototal) + parseFloat(acumpago[contp]); 
            tventa = $("#divtotal").val();
            tresta = (parseFloat(tventa) - parseFloat(pagototal));
            $("#resta").val(tresta.toFixed(2));
            $("#tdeuda").val(tresta.toFixed(2));  

            var fila = '<tr id="filapago' + contp + '"><td align="center"><span onclick="eliminarpago(' + contp + ');" style="cursor:pointer;" class="text-danger"><i class="fa fa-trash"></i></span></td><td><input type="hidden" name="tidpago[]" value="' + idpago + '"><input type="hidden" name="tidbanco[]" value="' + tpago + '">' + tpago + '</td><td><input type="hidden" name="denominacion[]" value="' + denomina + '">' + denomina + '</td><td><input type="hidden" name="tmonto[]" value="' + pmonto + '">' + pmonto.toLocaleString('de-DE', { style: 'decimal', decimal: '2' }) + '</td><td><input type="hidden" name="tref[]" value="' + pref + '">' + pref + '</td></tr>';
            contp++;
            document.getElementById('bt_pago').style.display = "none";
            $("#pidpago").val('100');
            $("#total_abono").text(pagototal.toFixed(2));
            $("#totala").val(pagototal.toFixed(2));
            limpiarpago();     
            $('#det_pago').append(fila);
        } else { 
            toastr.info('¡El monto indicado no debe ser mayor al saldo pendiente!.');
            limpiarpago(); 
        }
    }

    function limpiarpago() {
        $("#pmonto").val("");
        $("#preferencia").val("");
    }

    function eliminarpago(index) {
        $("#pidpago").val('100');
        total = acumpago[index];
        tventa = $("#divtotal").val();
    }
</script>
@endpush
@endsection