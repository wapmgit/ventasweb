@extends ('layouts.master')
@section ('contenido')
<?php
$fserver = date('Y-m-d');
$fecha_a = $empresa->fechavence;
function dias_transcurridos($fecha_a, $fserver)
{
    $dias = (strtotime($fecha_a) - strtotime($fserver)) / 86400;
    return $dias;
}
$vali = count($personas);
$vencida = 0;
if (dias_transcurridos($fecha_a, $fserver) < 0) {
    $vencida = 1;
    echo "<div class='alert alert-danger'>
        <h4><i class='fa fa-exclamation-triangle'></i> LICENCIA DE USO DE SOFTWARE VENCIDA</h4>
        Contacte a su técnico de soporte.
    </div>";
}
$count = 0;
?>

@include('compras.ingreso.modalproveedor')
@include('proveedores.pagar.modalmonedas')

<style>
.gasto-section-card {
    background: #ffffff;
    border: 1px solid #e3e8ee;
    border-radius: 6px;
    box-shadow: 0 2px 6px rgba(15, 23, 42, 0.04);
    margin-bottom: 18px;
    position: relative;
}
.gasto-section-card.card-top-layer {
    z-index: 20;
}
.gasto-section-card.card-mid-layer {
    z-index: 10;
}
.gasto-section-header {
    background: #f8fafc;
    border-bottom: 1px solid #e3e8ee;
    padding: 10px 16px;
    font-weight: 600;
    color: #1e293b;
    border-radius: 6px 6px 0 0;
    display: flex;
    align-items: center;
    justify-content: space-between;
}
.gasto-section-body {
    padding: 16px;
}
    .moneda-toggle-group {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        background: #f1f5f9;
        padding: 2px 8px;
        border-radius: 4px;
        margin-left: 6px;
        font-size: 12px;
    }
    .moneda-toggle-group label {
        margin: 0;
        cursor: pointer;
        font-weight: 600;
    }
    .total-resumen-box {
.total-resumen-box {
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 6px;
    padding: 14px 16px;
    margin-bottom: 16px;
    width: 100%;
}
.total-resumen-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    background: #ffffff;
    border: 1px solid #e2e8f0;
    border-radius: 6px;
    padding: 10px 14px;
    width: 100%;
}
.total-resumen-item strong {
    font-size: 14px;
    letter-spacing: 0.4px;
    white-space: nowrap;
}
.total-resumen-item input.form-control {
    flex: 1;
    width: 100%;
    min-width: 0;
    font-size: 18px;
    font-weight: 700;
    text-align: right;
    height: 40px;
}
#pasapago {
    cursor: pointer;
    color: #0d6efd;
    text-decoration: underline;
}
    .table-pagos-custom thead th {
        background-color: #2f855a !important;
        color: #ffffff;
        font-weight: 600;
        border-color: #276749 !important;
    }
.gasto-actions-bar {
    display: flex;
    justify-content: flex-end;
    align-items: right;
    flex-wrap: wrap;
    gap: 10px;
    width: 100%;
    padding-top: 8px;
}
</style>

<div class="row">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <h3 style="margin-top: 0; margin-bottom: 14px; font-weight: 700; color: #0f172a;">
            <i class="fa fa-file-text-o text-primary"></i> Nuevo Gasto
        </h3>
    </div>
</div>

<form action="{{ route('guardargasto') }}" method="POST" enctype="multipart/form-data">
    {{ csrf_field() }}

    {{-- Bloque 1: Datos principales del documento --}}
    <div class="gasto-section-card">
        <div class="gasto-section-header">
            <span><i class="fa fa-info-circle text-primary"></i> Datos del Comprobante</span>
        </div>
        <div class="gasto-section-body">
            <div class="row" class="gasto-section-card card-top-layer">
                <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12" >
                    <div class="form-group">
                        <input type="hidden" value="{{ $empresa->tc }}" id="valortasa" name="tc" class="form-control">
                        <input type="hidden" value="{{ $empresa->peso }}" id="valortasap" name="peso" class="form-control">
                        <label for="idproveedor">
                            Razón Social
                            <a href="" data-target="#modalproveedor" data-toggle="modal" style="margin-left: 6px;">
                                <span class="label label-success">Nuevo <i class="fa fa-fw fa-user"></i></span>
                            </a>
                        </label>
                        <select name="idproveedor" id="idproveedor" class="form-control selectpicker" data-live-search="true">
                            @foreach ($personas as $per)
                                <option value="{{ $per->idproveedor }}">{{ $per->nombre }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="col-lg-2 col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="concepto">Factura</label>
                        <input type="text" name="documento" id="concepto" value="{{ old('concepto') }}" class="form-control" placeholder="Documento Fac">
                    </div>
                </div>

                <div class="col-lg-2 col-md-3 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="control">Nro Control</label>
                        <input type="text" name="control" id="control" value="{{ old('control') }}" class="form-control" placeholder="Nro Control">
                    </div>
                </div>

                <div class="col-lg-2 col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="tasacompra" style="display: flex; align-items: center; flex-wrap: wrap;">
                            <span>Tasa</span>
                            <span class="moneda-toggle-group">
                                <label><input name="tregistro" type="radio" id="cbs" value="2"> Bs</label>
                                <label><input name="tregistro" type="radio" id="dls" value="1" checked="checked"> $</label>
                            </span>
                        </label>
                        <input type="number" name="tasa" step="any" id="tasacompra" readonly value="{{ $empresa->tc }}" class="form-control">
                        <input type="hidden" value="1" id="optasa">
                    </div>
                </div>

                <div class="col-lg-2 col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="tgasto">Tipo Gasto</label>
                        <select name="tgasto" id="tgasto" class="form-control selectpicker" data-live-search="true">
                            @foreach ($tgasto as $per)
                                <option value="{{ $per->idgasto }}">{{ $per->nombregasto }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- Bloque 2: Detalle del gasto y montos fiscales --}}
    <div class="gasto-section-card card-mid-layer" <?php if ($vali == 0) { ?> style="display: none" <?php } ?> id="cgasto">
        <div class="gasto-section-header">
            <span><i class="fa fa-calculator text-success"></i> Detalle e Importes</span>
        </div>
        <div class="gasto-section-body">
            <div class="row">
                <div class="col-lg-9 col-md-8 col-sm-12 col-xs-12">
                    <div class="form-group">
                        <label for="descripcion">Descripción</label>
                        <input type="text" id="descripcion" name="descripcion" value="" class="form-control" placeholder="Descripción del gasto">
                    </div>
                </div>

                <div class="col-lg-3 col-md-4 col-sm-12 col-xs-12">
                    <div class="form-group">
                        <label for="emision">Emisión</label>
                        <input type="date" id="emision" name="emision" class="form-control" value="<?php echo $fserver; ?>">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="bi">Base Imponible</label>
                        <input type="number" name="base" id="bi" step="0.01" class="form-control" min="0" value="0">
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="iva">Impuesto</label>
                        <input type="number" name="iva" id="iva" step="0.01" class="form-control" min="0" value="0">
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="exe">Exento</label>
                        <input type="number" name="exento" id="exe" step="0.01" class="form-control" min="0" value="0">
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="pcosto">
                            Total <span class="badge bg-info" style="display:none; margin-left: 4px;" id="idmends"></span>
                        </label>
                        <input type="number" name="monto" id="pcosto" step="0.01" class="form-control" placeholder="Total">
                        <input type="hidden" name="montods" id="pcostods" step="0.01" class="form-control">
                    </div>
                </div>
            </div>

            <div class="row" id="guardar" align="right">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="gasto-actions-bar">
                        <input name="_token" value="{{ csrf_token() }}" type="hidden">
                        <button class="btn btn-primary" type="button" id="btnguardar">
                            <i class="fa fa-arrow-right"></i> Procesar
                        </button>
                        <button class="btn btn-danger" type="reset" id="btncancelar">
                            <i class="fa fa-times"></i> Cancelar
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    {{-- Bloque 3: Desglose de pagos --}}
    <div class="gasto-section-card" id="divdesglose" style="display: none">
        <div class="gasto-section-header">
            <span><i class="fa fa-money text-warning"></i> Desglose de Pago</span>
            <a href="#" data-target="#modalm" data-toggle="modal" class="btn btn-warning btn-xs">
                <i class="fa fa-refresh"></i> Act. Tasas
            </a>
        </div>
        <div class="gasto-section-body">
         <div class="total-resumen-box">
    <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="margin-bottom: 8px;">
            <div class="total-resumen-item">
                <strong>TOTAL</strong>
                <input type="number" id="divtotal" class="form-control" value="" disabled>
            </div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="margin-bottom: 8px;">
            <div class="total-resumen-item">
                <strong id="pasapago" title="Haz clic para hacer cobro total">RESTA</strong>
                <input type="number" id="resta" class="form-control" disabled value="">
                <input type="hidden" name="tdeuda" id="tdeuda" value="">
            </div>
        </div>
    </div>
</div>

            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="pidpago">Medio de Pago</label>
                        <select name="pidpago" id="pidpago" class="form-control">
                            <option value="100" selected="selected">Seleccione...</option>
                            @foreach ($monedas as $m)
                                <?php $count++; ?>
                                <option id="vm<?php echo $count; ?>" value="{{ $m->idmoneda }}_{{ $m->tipo }}_{{ $m->valor }}">{{ $m->nombre }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="col-lg-2 col-md-6 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="pmonto">Monto</label>
                        <input type="number" class="form-control" name="pmonto" id="pmonto" placeholder="0.00" min="1" step="0.01">
                    </div>
                </div>

                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="preferencia">Referencia</label>
                        <input type="text" name="preferencia" class="form-control" id="preferencia" onchange="conMayusculas(this);" placeholder="Referencia...">
                    </div>
                </div>

                <div class="col-lg-2 col-md-4 col-sm-6 col-xs-12">
                    <div class="form-group">
                        <label for="fecha_emi">Fecha</label>
                        <input type="date" name="fecha_emi" id="fecha_emi" value="<?php echo $fserver; ?>" class="form-control control">
                    </div>
                </div>

                <div class="col-lg-2 col-md-4 col-sm-12 col-xs-12">
                    <div class="form-group">
                        <label style="display: block;">&nbsp;</label>
                        <button type="button" id="bt_pago" class="btn btn-success btn-block">
                            <i class="fa fa-fw fa-plus-square"></i> Agregar
                        </button>
                    </div>
                </div>
            </div>

            <div class="table-responsive" style="margin-top: 8px;">
                <table id="det_pago" class="table table-striped table-bordered table-condensed table-hover table-pagos-custom">
                    <thead>
                        <tr>
                            <th width="6%">Supr</th>
                            <th width="18%">Tipo</th>
                            <th width="16%">Monto</th>
                            <th width="16%">Monto $</th>
                            <th width="24%">Referencia</th>
                            <th width="20%">Fecha</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th class="text-right"><h4 style="margin: 0;">Total $</h4></th>
                            <th colspan="2">
                                <h4 id="total_abono" style="margin: 0; font-weight: 700;">$. 0.00</h4>
                                <input type="hidden" value="0" name="totala" id="totala">
                            </th>
                        </tr>
                    </tfoot>
                    <tbody></tbody>
                </table>
            </div>

<div class="gasto-actions-bar" style="margin-top: 12px;"  align="right">
    <div style="display: none" id="loading">
        <img src="{{ asset('img/sistema/loading30.gif') }}" alt="Cargando...">
    </div>
    <button type="button" class="btn btn-danger" id="regresar" data-dismiss="modal">
        <i class="fa fa-arrow-left"></i> Cancelar
    </button>
    <button type="submit" id="procesa" class="btn btn-primary">
        <i class="fa fa-check"></i> Procesar
    </button>
    <input name="_token" value="{{ csrf_token() }}" type="hidden">
</div>
        </div>
    </div>
</form>

@push ('scripts')
<script>
$(document).ready(function(){
    $("#guardar").hide();
    $("#bi").change(calc_iva);
    $("#iva").change(sumtotal);
    $("#exe").change(sumtotal);

    $('#btnguardar').click(function(){
        if($("#concepto").val() == ""){
            alert('Debe indicar Concepto.');
        } else {
            if($("#pcosto").val() == ""){
                alert('Debe Monto.');
            } else {
                $('#guardar').fadeOut("fast");
                $('#divdesglose').fadeIn("fast");
            }
        }
    });

    $('#regresar').click(function(){
        $('#divdesglose').fadeOut("fast");
    });

    $('#pasapago').click(function(){
        datosbanco = $("#pidpago").val();
        if(datosbanco == 100){
            alert('¡Debe seleccionar un tipo de Pago!');
        } else {
            $("#pmonto").val($("#resta").val());
            document.getElementById('bt_pago').style.display = "";
            $("#preferencia").focus();
        }
    });

    $("#pidpago").change(mediopago);

    $('#procesa').click(function(){
        document.getElementById('loading').style.display = "";
        document.getElementById('procesa').style.display = "none";
        document.getElementById('regresar').style.display = "none";
    });

    $('#bt_pago').click(function(){
        agregarpago();
    });

    // registrar nuevo proveedor
    $("#Nenviar2").on("click", function(){
        if ($("#cnombre").val() == ""){
            alert('Debe indicar Nombre de Provedor');
        } else {
            document.getElementById('Nenviar2').style.display = "none";
            var form2 = $('#formularioproveedor');
            var url2 = form2.attr('action');
            var data2 = form2.serialize();

            $.post(url2, data2, function(result){
                var resultado2 = result;
                console.log(resultado2);
                var nombre2 = resultado2[0].nombre;
                var id2 = resultado2[0].idproveedor;
                $("#idproveedor")
                    .append('<option value="' + id2 + '">' + nombre2 + '</option>')
                    .selectpicker('refresh');
                alert('Proveedor Registrado con exito');
                $("#formularioproveedor")[0].reset();
                document.getElementById('cgasto').style.display = "";
            });
            document.getElementById('Nenviar2').style.display = "";
        }
    });

    $('#cbs').click(function(){
        $('#tasacompra').attr("readonly", false);
        $('#optasa').val(2);
    });

    $('#dls').click(function(){
        $('#tasacompra').attr("readonly", true);
        $('#optasa').val(1);
    });
});
function calc_iva(){
	 var base = $("#bi").val();
	 var miva= parseFloat(base)*(16/100);
	$("#iva").val(miva);
	sumtotal();
}
function sumtotal(){
    var opt = $('#optasa').val();
    var tasa = $('#tasacompra').val();

    var total = $("#bi").val();
    var total2 = $("#iva").val();
    var total3 = $("#exe").val();
    var ttp = parseFloat(total) + parseFloat(total2) + parseFloat(total3);
    var ttpds = (parseFloat(ttp) / parseFloat(tasa)).toFixed(3);

    $("#pcosto").val(ttp);
    $("#pcostods").val(ttpds);
    $("#idmends").text("$ " + ttpds);
    var total = $("#pcosto").val();

    $("#guardar").show();
    $("#divtotal").val(total);
    $("#resta").val(total);
    $("#tdeuda").val(total);

    if(opt == 2){
        document.getElementById('idmends').style.display = "";
        $("#divtotal").val(ttpds);
        $("#resta").val(ttpds);
        $("#tdeuda").val(ttpds);
    }
}

// agrego tipo pago
acumpago = []; var contp = 0; var pagototal = 0; var tresta = 0;

function agregarpago(){
    vresta = $("#resta").val();
    idpago = $("#pidpago").val();
    tpago = $("#pidpago option:selected").text();
    pmonto = $("#pmonto").val();
    pref = $("#preferencia").val();
    fecha = $("#fecha_emi").val();
    moneda = $("#pidpago").val();
    tm = moneda.split('_');
    tipom = tm[1];
    valort = tm[2];
    idpago = tm[0];

    if(parseFloat(pmonto) <= parseFloat(vresta)){
        var denomina = pmonto;
        acumpago[contp] = (pmonto);

        if (tipom == 1){
            var pesoresta = $("#resta").val();
            $("#total_abono").text(pagototal / valort);
            denomina = pmonto;
            pmonto = pmonto / valort;
            acumpago[contp] = (pmonto.toFixed(2));
        }
        if (tipom == 2){
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

        var fila = '<tr id="filapago' + contp + '"><td align="center"><span onclick="eliminarpago(' + contp + ');"><i class="fa fa-fw fa-eraser"></i></span></td><td><input type="hidden" name="tidpago[]" value="' + idpago + '"><input type="hidden" name="tidbanco[]" value="' + tpago + '">' + tpago + '</td><td><input type="hidden" name="denominacion[]" value="' + denomina + '">' + denomina + '</td><td><input type="hidden" name="tmonto[]" value="' + pmonto + '">' + pmonto + '</td><td><input type="hidden" name="tref[]" value="' + pref + '">' + pref + '</td><td><input type="hidden" name="fecha[]" value="' + fecha + '">' + fecha + '</td></tr>';

        contp++;
        document.getElementById('bt_pago').style.display = "none";
        $("#pidpago").val('10');
        $("#total_abono").text(pagototal.toFixed(2));
        $("#totala").val(pagototal.toFixed(2));
        $("#pidpago").val('100');
        limpiarpago();
        $('#det_pago').append(fila);
    } else {
        alert('¡El monto indicado no debe se mayor al saldo pendiente!');
        limpiarpago();
    }
}

function limpiarpago(){
    $("#pmonto").val("");
    $("#preferencia").val("");
}

function eliminarpago(index){
    $("#pidpago").val('100');
    total = acumpago[index];
    resta = $("#resta").val();
    var1 = $("#total_abono").text();
    nv = (parseFloat(resta) + parseFloat(total));
    nc = (parseFloat(var1) - parseFloat(total));
    $("#resta").val(nv);
    $("#tdeuda").val(nv);
    $("#totala").val(nc);
    pagototal = (parseFloat(pagototal) - parseFloat(total));
    $("#filapago" + index).remove();
    $("#total_abono").text(nc.toFixed(2));
}

function mediopago(){
    document.getElementById('bt_pago').style.display = "";
    var pesototal = $("#divtotal").val();
    var tabono = $("#totala").val();
    var debe = (pesototal - tabono);
    datosbanco = $("#pidpago").val();
    moneda = $("#pidpago").val();
    tm = moneda.split('_');
    var idmoneda = tipom = tm[0];
    tipom = tm[1];
    valort = tm[2];
    moneda = $("#pidpago option:selected").text();

    if (tipom == 0){
        $("#resta").val(pesototal - tabono);
        $("#preferencia").val("");
    }
    if (tipom == 1){
        $("#resta").val((debe * valort).toFixed(2));
        $("#preferencia").val('Tc: ' + valort);
    }
    if (tipom == 2){
        $("#resta").val((debe / valort).toFixed(2));
        $("#preferencia").val('Tc: ' + valort);
    }
    $("#pmonto").attr('placeholder', 'Monto ' + moneda);
}

function actmonedas(aux, id, t){
    var dato = $("#vm" + aux).val();
    var nv = $("#valor" + aux).val();
    var ndato = id + '_' + t + '_' + nv;
    $("#vm" + aux).val(ndato);
    $("#vmm" + aux).val(ndato);
    $("#vmpt" + aux).val(ndato);
    alert('Monto Actualizado.');
}
</script>
@endpush
@endsection