@extends ('layouts.master')
<?php $mostrar=0; ?>

@section ('contenido')
<?php $mostrar=1; ?>
<?php
$fecha_actual = date("Y/m/d");
function dias_pasados($fecha_inicial, $fecha_final)
{
    $dias = (strtotime($fecha_inicial) - strtotime($fecha_final)) / 86400;
    $dias = abs($dias); 
    $dias = floor($dias);
    return $dias;
}

// === PRE-CÁLCULO DE TOTALES ===
$total = 0; 
$acumtventa = 0; 
$countnd = 0; 
$acummn = 0; 
$count = 0;

foreach ($datos as $cat) {
    $count++;
    $acumtventa += $cat->total_venta;
    $total += $cat->acumulado;
}

foreach ($notasnd as $nd) {
    $countnd++;
    $acummn += $nd->tnotas;
    $acumtventa += $nd->monto;
    $total += $nd->tnotas;
}
?>

<div class="row">
    @include('reportes.ventas.venci_cobro.search')
</div>

<!-- Main content -->
<div class="invoice p-3 mb-3">
    <!-- Title row -->
    <div class="row">
        <div class="col-12">
            <h4>
                <img src="{{asset('dist/img/iconosistema.png')}}" title="NKS"> SysVent@s
                <small class="float-right"></small>
            </h4>
        </div>
    </div>

    <!-- Info row -->
    <div class="row invoice-info">
        @include('reportes.ventas.venci_cobro.empresa')
    </div>

    <!-- SECCIÓN SUPERIOR: TOTALES Y BOTÓN DE IMPRESIÓN -->
    <div class="row my-3 p-2 bg-light border rounded align-items-center no-print">
        <div class="col-md-8 col-sm-12">
            <h5 class="m-0">
                <strong>Total Venta: </strong> 
                <span class="badge badge-info mr-2">{{ number_format($acumtventa, 2, ',', '.') }} $</span>
                <strong>Saldo Pendiente: </strong> 
                <span class="badge badge-danger">{{ number_format($total, 2, ',', '.') }} $</span>
                <small class="text-muted ml-2">({{ $count }} Fact. / {{ $countnd }} N/D)</small>
            </h5>
        </div>
        <div class="col-md-4 col-sm-12 text-md-right text-sm-center mt-2 mt-md-0">
            <button type="button" class="btn btn-primary btn-sm btn-imprimir">
                <i class="fas fa-print"></i> Imprimir
            </button>
        </div>
    </div>

    <!-- Table row -->
    <div class="row">
        <div class="col-12 table-responsive">
            <table id="articulostable" class="table table-striped table-hover table-sm" width="100%">
                <thead style="background-color: #E6E6E6">
                    <th>Documento</th>
                    <th>Cliente</th>
                    <th>Teléfono</th>
                    <th>Vendedor</th>
                    <th>Crédito</th>
                    <th>Fecha Emi.</th>
                    <th>Días Venc.</th>
                    <th>Monto</th>
                    <th>Saldo</th>
                </thead>
                <tbody>
                    @foreach ($datos as $cat)
                        <?php $cntnc = 0; ?>
                        <tr>
                            <td>{{ $cat->serie_comprobante }}-{{ $cat->num_comprobante }}</td>
                            <td>
                                <small>{{ $cat->nombre }}</small>
                                @foreach ($nc as $c)                            
                                    <?php if (($c->id_cliente == $cat->id_cliente) && ($cntnc == 0)) {                                                                                    
                                        echo " <strong>* N/C: ".number_format($c->tnc, 2, ',', '.')." *</strong>";                          
                                    } ?>        
                                @endforeach    
                            </td>
                            <td>{{ $cat->telefono }}</td>
                            <td><small>{{ $cat->vendedor }}</small></td>
                            <td>{{ $cat->diascre }}</td>
                            <td>{{ date("d-m-Y", strtotime($cat->fecha_hora)) }}</td>
                            <td>
                                <?php 
                                $diascre = ((int)$cat->diascre - dias_pasados($fecha_actual, $cat->fecha_hora));
                                if ($diascre <= 0) { ?> 
                                    <font style="color:#FF0000;">{{ $diascre }}</font> 
                                <?php } else { 
                                    echo $diascre; 
                                } ?>
                            </td>
                            <td>{{ number_format($cat->total_venta, 2, ',', '.') }} $</td>
                            <td>{{ number_format($cat->acumulado, 2, ',', '.') }} $</td>
                        </tr>
                    @endforeach

                    @foreach ($notasnd as $nd)
                        <tr>
                            <td>N/D-{{ $nd->idnota }}</td>
                            <td>{{ $nd->nombre }}</td>
                            <td>{{ $nd->telefono }}</td>
                            <td></td>
                            <td></td>
                            <td>{{ date("d-m-Y", strtotime($nd->fecha)) }}</td>
                            <td>
                                <?php 
                                $diascre = ((int)($cat->diascre ?? 0) - dias_pasados($fecha_actual, $nd->fecha));
                                if ($diascre <= 0) { ?> 
                                    <font style="color:#FF0000;">{{ $diascre }}</font> 
                                <?php } else { 
                                    echo $diascre; 
                                } ?>
                            </td>
                            <td>{{ number_format($nd->monto, 2, ',', '.') }} $</td>
                            <td>{{ number_format($nd->tnotas, 2, ',', '.') }} $</td>
                        </tr> 
                    @endforeach        
                </tbody>
                <tfoot>
                    <tr style="background-color: #f2f2f2;">
                        <td colspan="2"><b>Facturas: {{ $count }}</b></td>
                        <td colspan="2"><b>Notas Débito: {{ $countnd }}</b></td>
                        <td colspan="2"></td> 
                        <td><b>Total $</b></td> 
                        <td><b>{{ number_format($acumtventa, 2, ',', '.') }}</b></td>                   
                        <td><b>{{ number_format($total, 2, ',', '.') }}</b></td>                 
                    </tr>
                </tfoot>                            
            </table>
        </div>
    </div>        

    <!-- SECCIÓN INFERIOR: TOTALES Y BOTÓN DE IMPRESIÓN -->
    <div class="row mt-3 pt-2 border-top">
        <div class="col-md-6 col-sm-12">
            <label><strong>Usuario: </strong> {{ Auth::user()->name }}</label>
        </div>
        <div class="col-md-6 col-sm-12 text-md-right text-sm-center no-print">
            <button type="button" class="btn btn-primary btn-sm btn-imprimir">
                <i class="fas fa-print"></i> Imprimir
            </button>
        </div>
    </div>
</div>

@push ('scripts')
<style>
@media print {
    /* Oculta controles de DataTables, botones de impresión y elementos con la clase no-print */
    .no-print,
    .dataTables_length,
    .dataTables_filter,
    .dataTables_info,
    .dataTables_paginate,
    .dt-buttons,
    .btn-imprimir {
        display: none !important;
    }

    /* Oculta los iconos/flechas de ordenamiento en DataTables */
    table.dataTable thead th.sorting:before,
    table.dataTable thead th.sorting:after,
    table.dataTable thead th.sorting_asc:before,
    table.dataTable thead th.sorting_asc:after,
    table.dataTable thead th.sorting_desc:before,
    table.dataTable thead th.sorting_desc:after {
        display: none !important;
    }
}
</style>

<script>
$(document).ready(function(){
    $('.btn-imprimir').click(function(){
        window.print();
        window.location = "{{ route('reportecxcvencida') }}";
    });

    $("#filtro").on("change", function(){
        var variable = $("#filtro").val();                           
        if (variable == 1) {
            document.getElementById('divopt').style.display = ""; 
            document.getElementById('divend').style.display = ""; 
            document.getElementById('divcli').style.display = "none"; 
            document.getElementById('divrv').style.display = "none";    
            $("#idcliente").val(0);
        }
        if (variable == 2) {
            document.getElementById('divopt').style.display = ""; 
            document.getElementById('divend').style.display = "none";
            document.getElementById('divrv').style.display = "none";          
            document.getElementById('divcli').style.display = ""; 
            $("#idvendedor").val(0);
        }
        if (variable == 3) {
            document.getElementById('divopt').style.display = "none"; 
            document.getElementById('divrv').style.display = ""; 
            $("#idvendedor").val(0);
        }
    });
});

$(function () {
    $("#articulostable").DataTable({
        "searching": false,
        "bPaginate": false,
        "bInfo": false,
        "responsive": true, 
        "lengthChange": false, 
        "autoWidth": false,
        "buttons": ["copy", "csv", "excel", "pdf", {
            extend: 'print',
            exportOptions: {
                modifier: {
                    order: 'current',
                    page: 'all',
                    search: 'applied'
                }
            },
            customize: function (win) {
                $(win.document.body).find('.dt-buttons').remove();
            }
        }, "colvis"]
    }).buttons().container().appendTo('#articulostable_wrapper .col-md-6:eq(0)');
});
</script>
@endpush
@endsection