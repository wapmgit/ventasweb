@extends ('layouts.master')
@section ('contenido')   
<?php 
$acum = 0; 
$ceros = 5;  
$acumnc = 0;

function add_ceros($numero, $ceros) {
    $digitos = strlen($numero);
    $recibo = "";
    for ($i = 0; $i < 8 - $digitos; $i++) {
        $recibo .= "0";
    }
    return $recibo . $numero;
};

$acumpeso = 0;
$cntline = 0;
$acumsub = 0;

function adjustext($textoin, $nc) {
    $ancho_maximo = $nc;
    $lineas = explode("\n", $textoin);
    $contenido_formateado = "";
    foreach ($lineas as $linea) {
        $contenido_formateado .= wordwrap($linea, $ancho_maximo, "\n", true) . "\n";
    }
    return $contenido_formateado;
}
?>     

<style>
/* Reglas globales de impresión */
@media print {
    /* Ocultar elementos que no son el ticket */
    header, nav, footer, aside, .no-print, .col-lg-12, .form-group, #regresar, #imprimir {
        display: none !important;
    }

    /* Definición estricta del tamaño de página del ticket */
    @page {
        size: 80mm auto; /* Fuerza el ancho del papel */
        margin: 0mm !important;    /* Elimina márgenes físicos definidos por el driver/navegador */
    }

    /* Ajustes para el cuerpo de la página durante la impresión */
    html, body {
        width: 80mm !important;
        margin: 0 !important;
        padding: 0 !important;
        overflow: hidden; /* Evita barras de desplazamiento */
        -webkit-print-color-adjust: exact; /* Ayuda a que las líneas punteadas se impriman bien */
    }
}

/* Contenedor principal del ticket - Todo el contenido va aquí */
/* He reducido a 68mm para un margen de seguridad extra y evitar cortes a la derecha */
.ticket-container {
    width: 68mm !important;
    max-width: 68mm !important;
    margin: 0 auto !important; /* Centra el ticket en el rollo de 80mm */
    padding: 0;
    font-family: 'Courier New', Courier, monospace; /* Fuente de alta nitidez para térmicas */
    color: #000000;
    font-weight: bold;
    box-sizing: border-box; /* Asegura que el padding no altere el ancho */
}

/* Encabezado de la empresa */
.ticket-header {
    text-align: center;
    font-size: 9.5pt;
    line-height: 1.1;
    margin-bottom: 6px;
    width: 100%;
}

.ticket-header .titulo {
    font-size: 11.5pt;
    font-weight: 900;
}

/* Información del cliente / Pedido */
.ticket-info {
    font-size: 9pt;
    line-height: 1.2;
    text-align: left;
    margin-bottom: 8px;
    width: 100%;
}

/* Tabla de artículos - Se asegura de no desbordarse */
.tabla-ticket {
    width: 100% !important;
    max-width: 100% !important;
    table-layout: fixed; /* Fuerza a las columnas a respetar las anchuras indicadas */
    border-collapse: collapse;
    font-family: 'Courier New', Courier, monospace;
    font-size: 9pt;
}

.tabla-ticket th, .tabla-ticket td {
    padding: 2px 0;
    vertical-align: top;
    word-wrap: break-word; /* Evita que textos largos empujen la tabla afuera */
    overflow-wrap: break-word;
}

/* Estilos de bordes y alineación */
.tabla-ticket th {
    border-top: 1px dashed #000;
    border-bottom: 1px dashed #000;
    font-weight: bold;
}

.tabla-ticket tbody td {
    border-bottom: 1px dotted #000;
}

.tabla-ticket td.border-top {
    border-top: 1px dashed #000;
}

/* Clases de utilidad */
.text-center { text-align: center !important; }
.text-right { text-align: left !important; }
.bold { font-weight: bold; }
</style>
<div class="ticket-container">

    <!-- CABECERA DE LA EMPRESA -->
    <div class="ticket-header">
        <div class="titulo"><?php echo nl2br(adjustext($empresa->nombre, 34)); ?></div>
        <div>{{$empresa->rif}}</div>
        <div><?php echo nl2br(adjustext($empresa->direccion, 38)); ?></div>
        <div>Telf: {{$empresa->telefono}}</div>
    </div>

    <!-- DATOS DEL PEDIDO -->
    <div class="ticket-info">
        <b>Cliente:</b> {{$venta->cedula}} -> {{$venta->nombre}}<br>
        <b>Dirección:</b> {{$venta->direccion}}<br>
        <b>PEDIDO:</b> <?php echo add_ceros($venta->num_comprobante, $ceros); ?><br>
        <b>Fecha:</b> <?php echo date("d-m-Y h:i:s a", strtotime($venta->fecha_hora)); ?>
    </div>

    <!-- TABLA DE PRODUCTOS -->
    <table class="tabla-ticket">
        <thead>
            <tr>
                <th width="25%">Cant-Und</th>
                <th width="75%">Descripción / Precio</th>
            </tr>
        </thead>
        <tbody>
            @foreach($detalles as $det)
            <?php 
            $cntline++; 
            $acumpeso = $acumpeso + (($det->cantidad * $det->cntgrp) * $det->peso);
            if($det->cantidad > 0){
                $acumsub = $acumsub + ($det->precio_venta * $det->cantidad);
                $texto = strtolower($det->articulo) . " " . number_format($det->precio_venta, 2, ',', '.');
            ?>
            <tr>
                <td>{{$det->cantidad}}->{{$det->unidad}}</td>
                <td align="left">
                    <?php echo nl2br(wordwrap($texto, 32, "\n", true)); ?>
                </td>
            </tr>
            <?php } ?>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <td colspan="2" class="border-top text-center bold" style="font-size: 11pt; padding-top: 5px;">
                    $: <?php echo number_format($acumsub, 2, ',', '.'); ?>
                </td>
            </tr>
            <?php if($empresa->printpeso == 1){ ?>  
            <tr>
                <td colspan="2" class="text-center bold" style="font-size: 9pt;">
                    Items: <?php echo $cntline; ?> ---> Peso Total: <?php echo number_format($acumpeso, 2, ',', '.'); ?> kg
                </td>
            </tr>
            <?php } ?>
        </tfoot>
    </table>

    <div class="text-center bold" style="margin-top: 15px; font-size: 9.5pt;">
        Precios Insuperables...
    </div>

    <!-- BOTONES (NO SE IMPRIMEN) -->
    <div class="no-print text-center" style="margin-top: 15px;">
        <button type="button" id="regresar" class="btn btn-danger btn-xs">Regresar</button>
        <button type="button" id="imprimir" class="btn btn-primary btn-xs">Imprimir</button>
    </div>

</div>

@push ('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
        document.getElementById('imprimir').style.display = "none";
        document.getElementById('regresar').style.display = "none";
        window.print(); 
        window.location = "{{route('pedidos')}}";
    });

    $('#regresar').on("click", function(){
        window.location = "{{route('pedidos')}}";
    });
});
</script>
@endpush
@endsection