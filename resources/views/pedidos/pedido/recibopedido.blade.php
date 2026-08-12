<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Pedido {{str_pad($venta->num_comprobante, 8, '0', STR_PAD_LEFT)}}</title>
    
    <!-- 
      IMPORTANTE: NO INCLUIR AQUÍ LA HOJA DE ESTILOS DE BOOTSTRAP.
      SOLO INCLUIREMOS ESTE BLOQUE CSS ESPECÍFICO PARA EL TICKET.
    -->
    <style>
        /* Reglas globales de impresión */
        @media print {
            /* Configuración estricta de la página del ticket */
            @page {
                size: 80mm auto; /* Fuerza el ancho del papel térmico */
                margin: 0 !important; /* Elimina márgenes físicos del navegador */
            }

            /* Ocultar elementos de la interfaz web que no son el ticket */
            header, nav, footer, aside, .no-print, #regresar, #imprimir, 
            /* Ocultamos las clases de Bootstrap por si acaso alguna se coló en el HTML */
            .navbar, .sidebar, .breadcrumb, .col-lg-12, .form-group, .btn {
                display: none !important;
            }

            /* Estilo para el cuerpo de la página durante la impresión */
            html, body {
                width: 80mm !important; /* Ocupamos todo el ancho del papel */
                margin: 0 !important;
                padding: 0 !important;
                /* Fuente MONOSPACE para máxima nitidez en térmicas */
                font-family: 'Courier New', Courier, monospace;
                font-weight: bold;
                font-size: 10pt; /* Tamaño de fuente base */
                color: #000;
                overflow: hidden; /* Evita barras de desplazamiento */
                -webkit-print-color-adjust: exact; /* Fuerza la impresión de líneas punteadas */
            }

            /* Contenedor principal que envuelve el ticket */
            /* He reducido ligeramente a 72mm para margen de seguridad y evitar cortes */
            .ticket-container {
                width: 72mm !important;
                max-width: 72mm !important;
                margin: 0 auto !important; /* Centra el ticket en el rollo de 80mm */
                padding: 0;
                box-sizing: border-box; /* Asegura que el padding no altere el ancho */
            }

            /* Tablas forzadas al 100% de los 72mm útiles */
            table.tabla-ticket {
                width: 100% !important;
                max-width: 100% !important;
                table-layout: fixed; /* Fuerza a respetar las anchuras indicadas */
                border-collapse: collapse;
                margin: 0;
                padding: 0;
                /* CORRECCIÓN: Mantenemos monospace para nítidez */
                font-family: 'Courier New', Courier, monospace;
                font-weight: bold;
                font-size: 9pt; /* Ligeramente menor para el detalle de items */
            }

            table.tabla-ticket th, table.tabla-ticket td {
                padding: 2px 0; /* Padding vertical mínimo */
                vertical-align: top;
                word-wrap: break-word; /* Evita que textos largos empujen la tabla afuera */
                overflow-wrap: break-word;
            }

            /* Bordes y alineación */
            table.tabla-ticket th {
                border-top: 1px dashed #000;
                border-bottom: 1px dashed #000;
                font-weight: bold;
                text-align: center;
            }

            table.tabla-ticket tbody td {
                border-bottom: 1px dotted #000; /* Línea punteada entre items */
            }

            table.tabla-ticket td.border-top {
                border-top: 1px dashed #000; /* Borde superior para los totales */
            }
        }

        /* Clases de utilidad */
        .text-center { text-align: center !important; }
        .text-right { text-align: right !important; }
        .bold { font-weight: bold; }
    </style>
</head>
<body>

<!-- BOTONES DE ACCIÓN (NO SE IMPRIMEN) -->
<div class="no-print" style="text-align: center; margin: 10px;">
    <button type="button" id="regresar" style="padding: 5px 10px; background-color: #f44336; color: white; border: none; cursor: pointer;">Regresar</button>
    <button type="button" id="imprimir" style="padding: 5px 10px; background-color: #008CBA; color: white; border: none; cursor: pointer;">Imprimir</button>
</div>

<!-- CONTENEDOR PRINCIPAL DEL TICKET -->
<div class="ticket-container">
    
    <!-- ENCABEZADO DE LA EMPRESA -->
    <div class="text-centerheader" style="line-height: 1.1; margin-bottom: 8px;">
        <span class="bold" style="font-size: 11pt;">{{$empresa->nombre}}</span><br>
        RIF: {{$empresa->rif}}<br>
        {{$empresa->direccion}}<br>
        Telf: {{$empresa->telefono}}
    </div>

    <!-- DATOS DEL CLIENTE Y PEDIDO -->
    <div style="font-size: 9pt; line-height: 1.2; margin-bottom: 8px;">
        Cliente: {{$venta->cedula}} - {{$venta->nombre}}<br>
        PEDIDO : <span class="bold" style="font-size: 11pt;">{{str_pad($venta->num_comprobante, 8, '0', STR_PAD_LEFT)}}</span><br>
        Fecha  : {{date("d-m-Y h:i:s a", strtotime($venta->fecha_hora))}}
    </div>

    <!-- TABLA DE DETALLE DE PRODUCTOS -->
    <table class="tabla-ticket">
        <thead>
            <tr>
                <th width="20%">Cant</th>
                <th width="80%">Descripción - Precio($)</th>
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
                            {{strtolower($det->articulo)}} - ${{number_format($det->precio_venta, 2, ',', '.')}}
                        </td>
                    </tr>
                @endif
            @endforeach
        </tbody>
    </table>

    <!-- TOTALES -->
    <table class="tabla-ticket" style="margin-top: 5px;">
        <tr>
            <td width="20%" class="text-right bold">
                TOTAL($):
            </td>
            <td width="80%" class="text-right bold border-top" style="font-size: 12pt;">
                ${{number_format($acumsub, 2, ',', '.')}}
            </td>
        
    </table>

    <!-- PIE DE TICKET -->
    <div class="text-center" style="margin-top: 10px; font-size: 9pt;">
        Precios Insuperables...<br>
        ¡Gracias por su compra!
    </div>
</div>

<!-- JAVASCRIPT SIMPLE -->
<script>
    // Acción del botón Regresar
    document.getElementById('regresar').addEventListener('click', function() {
        window.location = "{{route('pedidos')}}";
		
    });

    // Acción del botón Imprimir
    document.getElementById('imprimir').addEventListener('click', function() {
        // Lanzamos el diálogo de impresión directamente
        window.print(); 
		window.location="{{route('pedidos')}}";
    });

    // Opcional: Lanzar la impresión automáticamente al cargar la página
    // window.onload = function() {
    //     window.print();
    // };
</script>

</body>
</html>