<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Pedido - {{str_pad($venta->num_comprobante, 8, '0', STR_PAD_LEFT)}}</title>
    
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
<!-- BOTONES DE ACCIÓN (NO SE IMPRIMEN) -->
<div class="no-print" style="text-align: center; margin: 5px;">
    <button type="button" id="regresar" style="padding: 3px 8px; background-color: #f44336; color: white; border: none; cursor: pointer; font-size: 8pt;">Regresar</button>
    <button type="button" id="imprimir" style="padding: 3px 8px; background-color: #008CBA; color: white; border: none; cursor: pointer; font-size: 8pt;">Imprimir</button>
</div>

<!-- CONTENEDOR PRINCIPAL DEL TICKET -->
<div class="ticket-container" align="center">
    
    <!-- ENCABEZADO DE LA EMPRESA (Simplificado para 58mm) -->
    <div class="text-center" style="line-height: 1.1; margin-bottom: 5px;">
        <span class="bold" style="font-size: 10pt;">{{$empresa->nombre}}</span><br>
        RIF: {{$empresa->rif}}<br>
        {{$empresa->direccion}}<br>
        Telf: {{$empresa->telefono}}
    </div>

    <!-- DATOS DEL CLIENTE Y PEDIDO (Más compacto) -->
    <div style="font-size: 10pt; line-height: 1.2; margin-bottom: 5px;">
       {{$venta->cedula}} - {{$venta->nombre}}<br>
        PED: <span class="bold">{{str_pad($venta->num_comprobante, 8, '0', STR_PAD_LEFT)}}</span><br>
        Fec: {{date("d-m-Y h:i a", strtotime($venta->fecha_hora))}}
    </div>

    <!-- TABLA DE DETALLE DE PRODUCTOS (Ajustada para 58mm) -->
    <table class="tabla-ticket" style="margin-bottom: 5px;">
        <thead>
            <tr>
                <th width="25%">Cant</th>
                <!-- Combinamos Desc y Precio para ahorrar espacio horizontal -->
                <th width="75%">Descripción / Precio($) <th>
            </tr>
        </thead>
        <tbody>
            @php $acumsub = 0; @endphp
            @foreach($detalles as $det)
                @if($det->cantidad > 0)
                    @php $acumsub += ($det->precio_venta * $det->cantidad); @endphp
                    <tr>
                        <td class="text-center">{{$det->cantidad}} {{$det->unidad}}</td>
                        <td align="left">
                           
							<?php 	echo adjustext($det->articulo, 20); ?><br>
                            <span style="font-size: 10pt;">(${{number_format($det->precio_venta, 2, ',', '.')}} x {{$det->cantidad}})</span>
                        </td>
                    </tr>
                @endif
            @endforeach
        </tbody>
    </table>

    <!-- TOTALES (Más destacados) -->
    <table class="tabla-ticket" style="margin-top: 5px;">
        <tr>
            <td width="25%" class="text-right bold">
                TOTAL($):
            </td>
            <td width="75%" class="text-right bold border-top" style="font-size: 11pt;">
                ${{number_format($acumsub, 2, ',', '.')}}
            </td>
        </tr>
    </table>

    <!-- PIE DE TICKET -->
    <div class="text-center" style="margin-top: 8px; font-size: 10pt;">
        Precios Insuperables...<br>
        ¡Gracias por su compra!
    </div>
</div>

<!-- JAVASCRIPT IDÉNTICO PARA AUTO-IMPRESIÓN Y AUTO-CIERRE -->
<script>
    // Acción del botón Regresar
    document.getElementById('regresar').addEventListener('click', function() {
        window.close();
        setTimeout(function(){
            window.location = "{{route('pedidos')}}";
        }, 100);
    });

    // Acción del botón Imprimir
    document.getElementById('imprimir').addEventListener('click', function() {
        window.print();
    });

    // --- GESTIÓN DEL CIERRE AUTOMÁTICO ---

    var despuesDeImprimir = function() {
        console.log('Diálogo de impresión cerrado.');
        window.close(); // Cerramos la ventana/emergente
    };

    // Soporte para navegadores modernos
    if (window.matchMedia) {
        var mediaQueryList = window.matchMedia('print');
        mediaQueryList.addListener(function(mql) {
            if (!mql.matches) {
                despuesDeImprimir();
            }
        });
    }

    // Evento estándar
    window.onafterprint = despuesDeImprimir;

    // AUTO-IMPRIMIR AL CARGAR (Opcional, pero recomendado para POS)
    window.onload = function() {
        setTimeout(function() {
            window.print();
        }, 150); // Un pelín más de retardo para asegurar la carga
    };
</script>

</body>
</html>