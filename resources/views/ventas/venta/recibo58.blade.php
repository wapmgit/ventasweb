<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Venta {{str_pad($venta->num_comprobante, 8, '0', STR_PAD_LEFT)}}</title>
    
    <!-- 
      IMPORTANTE: NO INCLUIR AQUÍ LA HOJA DE ESTILOS DE BOOTSTRAP.
      SÓLO INCLUIREMOS ESTE BLOQUE CSS ESPECÍFICO PARA EL TICKET DE 58mm.
    -->
    <style>	
		#contenedor-botones {
            text-align: center;
            margin-bottom: 10px;
        }
        button {
            padding: 5px 10px;
            cursor: pointer;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .text-center { text-align: center !important; }
        .text-right { text-align: right !important; }
        .bold { font-weight: bold; }
        /* Reglas globales de impresión */
        @media print {
            /* Configuración estricta de la página para 58mm */
            @page {
                size: 58mm auto; /* Fuerza el ancho del papel térmico de 58mm */
                margin: 0 !important; /* Elimina márgenes físicos del navegador */
            }

            /* Ocultar elementos de la interfaz web (botones) */
            .no-print, #contenedor-botones {
                display: none !important;
            }

            /* Estilo para el cuerpo de la página durante la impresión */
            html, body {
                width: 54mm !important; /* Ocupamos todo el ancho del papel */
                margin: 0 !important;
                padding: 0 5mm 0 0!important;
                /* Fuente MONOSPACE para máxima nitidez en térmicas */
                font-family: 'Courier New', Courier, monospace;
                font-weight: bold;
                /* Fuente reducida para 58mm */
                font-size: 10pt; 
                color: #000;
                overflow: hidden;
                -webkit-print-color-adjust: exact;
                line-height: 1.1;
            }

            /* Contenedor principal centrado con margen de seguridad */
            .ticket-container {
                width: 54mm !important; /* Ancho útil real */
                margin: 0 auto !important; /* Centra el contenido en el rollo */
                padding: 0;
            }

            /* Tablas ajustadas al ancho útil */
            table.tabla-ticket {
                width: 100% !important;
                border-collapse: collapse;
                margin: 0;
                padding: 0;
                font-family: 'Courier New', Courier, monospace;
                font-weight: bold;
                font-size: 10pt;
            }

            table.tabla-ticket th, table.tabla-ticket td {
                padding: 1px 0;
                vertical-align: top;
            }

            table.tabla-ticket th {
                border-top: 1px dashed #000;
                border-bottom: 1px dashed #000;
                text-align: center;
            }

            table.tabla-ticket tbody td {
                border-bottom: 1px dotted #000;
            }

            table.tabla-ticket td.border-top {
                border-top: 1px dashed #000;
            }
        }
 
    </style>
</head>
<body>
<?php
// --- FUNCIONES PHP (Limpias y al principio) ---
$acum = 0; $cntline = 0; $acumsub = 0; $acumpeso = 0;

function add_ceros($numero) {
    return str_pad($numero, 8, '0', STR_PAD_LEFT);
}

function adjustext($textoin, $nc) {
    return wordwrap($textoin, $nc, "\n", true);
}
?>
<!-- BOTONES (SOLO VISIBLES EN WEB, NO SE IMPRIMEN) -->
<div id="contenedor-botones" class="no-print">
    <button type="button" id="regresar" style="background-color: #f44336; color: white;">Regresar</button>
    <button type="button" id="imprimir" style="background-color: #008CBA; color: white;">Imprimir</button>
</div>

<!-- CONTENEDOR PRINCIPAL DEL TICKET -->
<div class="ticket-container" align="center">
    
    <!-- CABECERA DE LA EMPRESA -->
    <div class="text-center" style="line-height: 1.1; margin-bottom: 5px;">
        <span class="bold" style="font-size: 10pt;"><?php echo adjustext($empresa->nombre, 25); ?></span><br>
        RIF: {{$empresa->rif}}<br>
        <?php echo nl2br(adjustext($empresa->direccion, 30)); ?><br>
        Telf: {{$empresa->telefono}}
    </div>

    <!-- DATOS DE LA VENTA -->
    <div style="font-size: 8pt; margin-bottom: 5px; line-height: 1.2;">
        {{$venta->cedula}} - {{$venta->nombre}}<br>
       Dir: {{\Illuminate\Support\Str::limit($venta->direccion, 30)}}<br> 
        <span class="bold" style="font-size: 10pt;">VENTA Nro: <?php echo add_ceros($venta->num_comprobante); ?></span><br>
        Fec: {{date("d-m-Y h:i a", strtotime($venta->fecha_hora))}}<br>
        Tasa: {{$venta->tasa}} Bs/$.
    </div>

    <!-- DETALLE DE PRODUCTOS -->
    <table class="tabla-ticket" style="margin-bottom: 5px;">
        <thead>
            <tr>
                <th width="25%">Cant</th>
                <th width="75%">Descripción / Precio($) </th>
            </tr>
        </thead>
        <tbody>
            @foreach($detalles as $det)
                @if($det->cantidad > 0)
                    <?php 
                    $cntline++; 
                    $acumsub += ($det->precio_venta * $det->cantidad);
                    $acumpeso += (($det->cantidad * $det->cntgrp) * $det->peso);
                    // Limpiamos el nombre del artículo (tomamos solo lo antes del primer *)
                    $nombre_articulo = strtolower(trim(explode('*', $det->articulo)[0]));
                    ?>
                    <tr>
                        <td class="text-center">{{$det->cantidad}} {{$det->unidad}}</td>
                        <td align="left">
                            <?php echo adjustext($nombre_articulo, 20); ?><br>
                            <span style="font-size: 10pt;">(${{number_format($det->precio_venta, 2, ',', '.')}} x {{$det->cantidad}})</span>
                        </td>
                    </tr>
                @endif
            @endforeach
        </tbody>
    </table>

    <!-- TOTALES -->
    <table class="tabla-ticket" style="margin-bottom: 5px;">
        <tr>
            <td width="40%" class="text-right bold">TOTAL Bs:</td>
            <td width="60%" class="text-right bold border-top" style="font-size: 10pt;">
                Bs. <?php echo number_format(($venta->total_venta * $venta->tasa), 2, ',', '.'); ?>
            </td>
        </tr>
        <tr>
            <td class="text-right bold">Ref ($):</td>
            <td class="text-right bold" style="font-size: 10pt;">
                $ <?php echo number_format($acumsub, 2, ',', '.'); ?>
            </td>
        </tr>
    </table>

    <!-- INFORMACIÓN DE PESO (OPCIONAL) -->
    <?php if($empresa->printpeso == 1){ ?>
        <div class="text-center" style="font-size: 10pt; border-top: 1px dotted #ccc; padding-top: 2px;">
            Items: <?php echo $cntline; ?> --- Peso Tot: <?php echo number_format($acumpeso, 2, ',', '.'); ?> Kg.
        </div>
    <?php } ?>

    <!-- RESUMEN DE PAGOS -->
    <?php if(count($recibos) > 0){ ?>
        <table class="tabla-ticket" style="margin-top: 5px; font-size: 9pt;">
            <thead>
                <tr>
                    <th width="40%">Pago</th>
                    <th width="30%" class="text-right">Monto Bs</th>
                    <th width="30%" class="text-right">Monto $</th>
                </tr>
            </thead>
            <tbody>
                @foreach($recibos as $re)
                    <tr>
                        <td>{{\Illuminate\Support\Str::limit($re->idbanco, 10)}}</td>
                        <td class="text-right"><?php echo number_format($re->recibido, 2, ',', '.'); ?></td>
                        <td class="text-right"><?php echo number_format($re->monto, 2, ',', '.'); ?></td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    <?php } ?>

    <!-- PIE DE TICKET -->
    <div class="text-center" style="margin-top: 10px; font-size: 8pt; border-top: 1px dashed #000; padding-top: 3px;">
        ¡Gracias por su Venta!<br>
        Precios Insuperables...
    </div>

</div>

<!-- JAVASCRIPT DE AUTO-IMPRESIÓN Y AUTO-CIERRE -->
<script>
    // 1. Lanzar la impresión automáticamente al cargar la página
    window.onload = function() {
        // Pequeño retardo para asegurar que el navegador haya renderizado el HTML
        setTimeout(function() {
            window.print();
        }, 150);
    };



    // Acciones manuales para los botones (por si acaso)
    document.getElementById('imprimir').addEventListener('click', function() {
        window.print();
		  window.location = "{{route('ventas')}}";
    });
    document.getElementById('regresar').addEventListener('click', function() {
       window.location = "{{route('ventas')}}";
    });
</script>

</body>
</html>