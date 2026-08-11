@extends ('layouts.master')
@section ('contenido')   
<?php 
$acum=0; 
$ceros=5;  
$acumnc=0;
function add_ceros($numero,$ceros) {
  $digitos=strlen($numero);
  $recibo="";
  for ($i=0;$i<8-$digitos;$i++){
    $recibo.="0";
  }
  return $recibo.$numero;
};
$acumpeso=0;
$cntline=0;
$acumsub=0;

function adjustext($textoin,$nc){
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
    @page {
        size: 58mm auto;
        margin: 0mm;
    }
    header, nav, footer, aside, .no-print {
        display: none !important;
    }
}

/* Estructura general del ticket */
.ticket-container {
    width: 54mm; /* Dejamos 4mm de margen físico de seguridad */
    margin: 0 auto;
    padding: 2mm 0;
    font-family: 'Courier New', Courier, monospace; /* Fuente óptima para impresoras térmicas */
    color: #000000;
    font-weight: bold;
}

/* Encabezados y textos */
.ticket-header {
    text-align: center;
    font-size: 9pt;
    line-height: 1.1;
    margin-bottom: 5px;
}

.ticket-header .titulo {
    font-size: 11pt;
    font-weight: 900;
}

.ticket-info {
    font-size: 8.5pt;
    line-height: 1.2;
    text-align: left;
    margin-bottom: 5px;
}

/* Tabla de artículos */
.tabla-ticket {
    width: 100%;
    border-collapse: collapse;
    font-family: 'Courier New', Courier, monospace;
    font-size: 8.5pt;
    margin-top: 5px;
}

.tabla-ticket th, .tabla-ticket td {
    padding: 2px 0;
    text-align: left;
    word-break: break-word;
}

.tabla-ticket th {
    border-top: 1px dashed #000;
    border-bottom: 1px dashed #000;
    font-weight: bold;
}

.tabla-ticket td.border-top {
    border-top: 1px dashed #000;
}

.text-center { text-align: center !important; }
.text-right { text-align: right !important; }
.bold { font-weight: bold; }
</style>

<div class="ticket-container">

    <!-- CABECERA -->
    <div class="ticket-header">
        <div class="titulo"><?php echo nl2br(adjustext($empresa->nombre,26)); ?></div>
        <div>{{$empresa->rif}}</div>
        <div><small><?php echo nl2br(adjustext($empresa->direccion,30)); ?></small></div>
        <div>Telf: {{$empresa->telefono}}</div>
    </div>

    <!-- DATOS DE VENTA -->
    <div class="ticket-info">
        <b>Cliente:</b> {{$venta->cedula}} - {{$venta->nombre}}<br>
        <b>Dirección:</b> <small>{{$venta->direccion}}</small><br>
        <b>Doc:</b> <?php echo add_ceros($venta->num_comprobante, $ceros); ?><br>
        <b>Fecha:</b> <?php echo date("d-m-Y h:i:s a", strtotime($venta->fecha_hora)); ?><br>
        <b>Tasa:</b> {{$venta->tasa}} Bsf.
    </div> 

    <!-- DETALLE DE PRODUCTOS -->
    <table class="tabla-ticket">
        <thead>
            <tr>
                <th>Cant - Descripción</th>
            </tr>
        </thead>
        <tbody>
            @foreach($detalles as $det)
            <?php 
            $cntline++; 
            $acumpeso += (($det->cantidad * $det->cntgrp) * $det->peso);
            if($det->cantidad > 0){
                $acumsub += ($det->precio_venta * $det->cantidad);
                $texto = $det->cantidad . " " . $det->unidad . " * " . number_format($det->precio_venta, 2, ',', '.') . " - " . strtolower(trim(explode('*', $det->articulo)[0]));
            ?>
            <tr>
                <td>
                    <?php echo wordwrap($texto, 24, "\n", true); ?><br>
                    <div class="text-right bold">
                        - $<?php echo number_format(($det->cantidad * $det->precio_venta), 2, ',', '.'); ?>
                    </div>
                </td>
            </tr>
            <?php } ?>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <td class="border-top text-center bold" style="font-size: 10pt; padding-top: 4px;">
                    Bs: <?php echo number_format(($venta->total_venta * $venta->tasa), 2, ',', '.'); ?><br>
                    $: <?php echo number_format($acumsub, 2, ',', '.'); ?>
                </td>
            </tr>
            <?php if($empresa->printpeso == 1){ ?>  
            <tr>
                <td class="text-center bold" style="font-size: 8.5pt;">
                    Items: <?php echo $cntline; ?> | Peso: <?php echo number_format($acumpeso, 2, ',', '.'); ?>kg
                </td>
            </tr>
            <?php } ?>
        </tfoot>
    </table>

    <!-- PAGOS -->
    <?php if(count($recibos) > 0){ ?>
    <table class="tabla-ticket" style="margin-top: 5px;">
        <thead>
            <tr>
                <th>Tipo</th>
                <th class="text-right">Monto Bs</th>
                <th class="text-right">Monto $</th>
            </tr>
        </thead>
        <tbody>
            @foreach($recibos as $re)
            <?php $acum += $re->monto; ?>
            <tr>
                <td>{{$re->idbanco}}</td>
                <td class="text-right"><?php echo number_format($re->recibido, 2, ',', '.'); ?></td>
                <td class="text-right"><?php echo number_format($re->monto, 2, ',', '.'); ?></td>
            </tr>
            @endforeach
        </tbody>
    </table>
    <?php } ?>

    <div class="text-center bold" style="margin-top: 15px; font-size: 9pt;">
        Precios Insuperables...
    </div>

    <!-- BOTONES -->
    <div class="no-print text-center" style="margin-top: 15px;">
        <button type="button" id="regresar" class="btn btn-danger btn-xs">Regresar</button>
        <button type="button" id="imprimir" class="btn btn-primary btn-xs">Imprimir</button>
    </div>

</div>

@push ('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
        window.print(); 
        window.location = "{{route('ventas')}}";
    });

    $('#regresar').on("click", function(){
        window.location = "{{route('newventa')}}";
    });
});
</script>
@endpush
@endsection