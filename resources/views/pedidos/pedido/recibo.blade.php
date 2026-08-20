<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Venta {{str_pad($venta->num_comprobante, 8, '0', STR_PAD_LEFT)}}</title>
    
    <!-- 
      IMPORTANTE: NO INCLUIR AQUÍ LA HOJA DE ESTILOS DE BOOTSTRAP.
      SOLO INCLUIREMOS ESTE BLOQUE CSS ESPECÍFICO PARA EL TICKET.
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
                size: 80mm auto; /* Fuerza el ancho del papel térmico de 58mm */
                margin: 0 !important; /* Elimina márgenes físicos del navegador */
            }

            /* Ocultar elementos de la interfaz web (botones) */
            .no-print, #contenedor-botones {
                display: none !important;
            }

            /* Estilo para el cuerpo de la página durante la impresión */
            html, body {
                width: 74mm !important; /* Ocupamos todo el ancho del papel */
                margin: 0 !important;
                padding: 0 !important;
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
                width: 74mm !important; /* Ancho útil real */
                margin: 0 auto !important; /* Centra el contenido en el rollo */
                padding: 0;
            }

            /* Tablas ajustadas al ancho útil */
            table.tabla-ticket {
                width: 100% !important;
				 max-width: 100% !important;
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

<!-- BOTONES DE ACCIÓN (NO SE IMPRIMEN) -->
<div class="no-print" style="text-align: center; margin: 10px;">
    <button type="button" id="regresar" style="padding: 5px 10px; background-color: #f44336; color: white; border: none; cursor: pointer;">Regresar</button>
    <button type="button" id="imprimir" style="padding: 5px 10px; background-color: #008CBA; color: white; border: none; cursor: pointer;">Imprimir</button>
</div>

<!-- CONTENEDOR PRINCIPAL DEL TICKET -->
<div class="ticket-container" align="center">
    
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
		Direccion:{{strtoupper($venta->direccion)}}<br>
        VENTA : <span class="bold" style="font-size: 11pt;">{{str_pad($venta->num_comprobante, 8, '0', STR_PAD_LEFT)}}</span><br>
        Fecha  : {{date("d-m-Y h:i:s a", strtotime($venta->fecha_hora))}}
    </div>

    <!-- TABLA DE DETALLE DE PRODUCTOS -->
    <table class="tabla-ticket" style="margin-bottom: 5px;">
        <thead>
            <tr>
                <th width="25%">Cant</th>
                <th width="75%">Descripción - Precio($)</th>
            </tr>
        </thead>
        <tbody>
            @php $acumsub = $cntline= $acumpeso=0; @endphp
            @foreach($detalles as $det)
                @if($det->cantidad > 0)
                    @php $acumsub += ($det->precio_venta * $det->cantidad);
					$cntline++; $acumpeso=$acumpeso+(($det->cantidad*$det->cntgrp)*$det->peso);
					@endphp
                    <tr>
                        <td class="text-center">{{$det->cantidad}} {{$det->unidad}}</td>
                        <td align="left">
                            {{strtolower($det->articulo)}} - <span style="font-size: 10pt;">({{number_format($det->precio_venta, 2, ',', '.')}} x {{$det->cantidad}}) ${{number_format(($det->precio_venta * $det->cantidad), 2, ',', '.')}}</span>
                        </td>
                    </tr>
                @endif
            @endforeach
        </tbody>
		 <tfoot>  
		<th colspan="2"  class="text-right bold" ><div align="center">Items: <?php echo $cntline;  ?> --->
                       Peso Total: <?php echo number_format($acumpeso, 2,',','.'); ?> </div></th>
					   
		</tfoot>
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