<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Catálogo de Productos</title>
    <style>
        /* Márgenes reducidos en la página para maximizar el área imprimible */
        @page {
            margin: 8mm 6mm 8mm 6mm;
        }

        body {
            font-family: Arial, sans-serif;
            font-size: 10px;
            margin: 0;
            padding: 0;
        }

        table.catalogo-grid {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
        }

        td.celda-producto {
            width: 25%; /* 4 columnas por fila (100% / 4) */
            padding: 3px;
            vertical-align: top;
            text-align: center;
        }

        .box {
            border: 1px solid #dcdcdc;
            padding: 4px;
            background: #ffffff;
            /* Altura fija calculada para que 5 filas quepan exactamente en una hoja Carta */
            height: 180px; 
            box-sizing: border-box;
        }

        .img-producto {
            width: 110px;
            height: 110px;
            object-fit: contain;
            display: block;
            margin: 0 auto;
        }

        .no-imagen {
            height: 110px;
            line-height: 110px;
            background-color: #f5f5f5;
            color: #888;
            font-size: 9px;
            border: 1px dashed #ccc;
        }

        .contenedor-nombre {
            height: 28px;
            overflow: hidden;
            margin-top: 4px;
            line-height: 1.1;
        }

        .nombre-producto {
            margin: 0;
            font-size: 9px;
            font-weight: bold;
            color: #333333;
        }

        .precio-box {
            background-color: #17a2b8;
            color: #ffffff;
            font-size: 11px;
            font-weight: bold;
            padding: 3px;
            margin-top: 4px;
            border-radius: 2px;
        }

        /* Regla de Dompdf para salto de página forzado */
        .page-break {
            page-break-after: always;
        }
    </style>
</head>
<body><table width="100%" style="border-collapse: collapse; margin-bottom: 5px; height: 80px;">
    <tr>
        <td width="25%" style="vertical-align: middle;">
            {{-- Logo con dimensiones explícitas --}}
            @php
                $logoPath = public_path('dist/img/'.$empresa->logo); // Ajusta la ruta de tu logo
            @endphp
            @if(file_exists($logoPath))
                <img src="{{ $logoPath }}" width="80" height="80" style="object-fit: contain;">
            @endif
        </td>
        <td width="75%" style="vertical-align: middle; text-align: right; line-height: 1.2;">
            <h2 style="margin: 0; padding: 0; font-size: 16px; color: #333;">{{$empresa->nombre}}</h2>
            <p style="margin: 2px 0; font-size: 10px; color: #555;">RIF / NIT: {{$empresa->rif}}</p>
            <p style="margin: 2px 0; font-size: 10px; color: #555;">Teléfono: {{$empresa->telefono}} </p>
            <p style="margin: 2px 0; font-size: 10px; color: #555;">{{$empresa->direccion}}</p>
        </td>
    </tr>
</table>
  <table class="catalogo-grid">
        <tr>
            @foreach($datos as $index => $det)
                
                {{-- 
                    SALTO DE PÁGINA DINÁMICO:
                    - Página 1: Se corta al producto #16 para dar espacio al encabezado.
                    - Páginas siguientes: Se cortan cada 20 productos (20, 40, 60...).
                --}}
                @if(($index == 16) || ($index > 16 && ($index - 16) % 20 == 0))
                    </tr>
                    </table>
                    <div class="page-break"></div>
                    <table class="catalogo-grid">
                    <tr>
                {{-- Salto de FILA normal cada 4 productos --}}
                @elseif($index > 0 && $index % 4 == 0)
                    </tr><tr>
                @endif

                @php
                    $rutaImagen = public_path('img/articulos/' . $det->imagen);
                @endphp

                <td class="celda-producto">
                    <div class="box">
                        @if(!empty($det->imagen) && file_exists($rutaImagen))
                            <img src="{{ $rutaImagen }}" class="img-producto">
                        @else
                            <div class="no-imagen">Sin imagen</div>
                        @endif

                        <div class="contenedor-nombre">
                            <p class="nombre-producto">{{ $det->nombre }}</p>
                        </div>

                        <div class="precio-box">
                            $ {{ $det->precio1 }} <small style="font-size: 8px;">{{ $det->unidad }}</small>
                        </div>
                    </div>
                </td>

            @endforeach
        </tr>
    </table>

</body>
</html>