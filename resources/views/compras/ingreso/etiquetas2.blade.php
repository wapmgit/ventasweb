@extends ('layouts.master')
@section ('contenido')
<style>
    /* Contenedor de las etiquetas: permite que se pongan una al lado de otra */
    #body {
        display: flex;
        flex-wrap: wrap; /* Para que salten de línea si no caben */
        gap: 10px; /* Espacio entre etiquetas */
        justify-content: center;
        background-color: #f4f4f4;
        padding: 20px;
    }

    .price-tag {
        width: 10cm;
        height: 4cm;
        background-color: #fff;
        border: 1px dashed #333; /* Más fino para que no gaste tanta tinta */
        border-radius: 5px;
        padding: 15px;
        box-sizing: border-box;
        position: relative;
        page-break-inside: avoid; /* Evita que una etiqueta se corte entre dos páginas */
    }

    /* Ajuste de fuentes para que el texto no se desborde */
    .product-name {
        font-size: 4mm; /* Bajé un poco el tamaño de 20mm para evitar desbordes */
        font-weight: bold;
        margin: 0;
        line-height: 1;
        text-transform: uppercase;
    }

    .product-desc {
        font-size: 2mm; 
        margin: 5px 0 0 0;
        color: #555;
    }

    /* Precio */
    .price-main {
        position: absolute;
        right: 15px;
        bottom: 25mm; 
        display: flex;
        align-items: baseline;
    }

    .currency-sym { font-size: 10mm; font-weight: bold; margin-right: 5px; }
    .integer-price { font-size: 13mm; font-weight: bold; line-height: 1; }
    .decimal-price { font-size: 8mm; font-weight: bold; vertical-align: super; }

    /* Footer y Código de barras */
    .footer {
        position: absolute;
        bottom: 15px;
        left: 15px;
        right: 15px;
        display: flex;
        justify-content: space-between;
        align-items: flex-end;
    }

    .barcode-visual {
        height: 10mm;		
        border-left: 2px solid black;
        border-right: 2px solid black;
        display: flex;
    }
    .barcode-visual img { width: 170px; height: 11mm;	 margin: 0 1px; }

    /* Estilos de Impresión */
    @media print {
        body { background: none; margin: 0; }
        .btn, #regresar, #imprimir, .form-group { display: none !important; } /* Oculta botones al imprimir */
        #body { background-color: white !important; padding: 0; }
        .price-tag { border: 1px solid #ddd; box-shadow: none; }
    }
</style>
<div class="row" id="body">
    @foreach($detalles as $det)
    <div class="price-tag">
        <div class="company-info">
            <p class="date-info"> {{ $det->codigo }}</p> 
        </div>

        <div class="header">
            <h5 class="product-name">{{ $det->articulo }}</h5>
        </div>

        <div class="price-main">
            <span class="currency-sym">$</span>
            @php
                // Separamos el precio en enteros y decimales
                $precio = number_format($det->precio1, 2, ',', '.');
                $partes = explode(',', $precio);
            @endphp
            <span class="integer-price">{{ $partes[0] }}.</span>
            <span class="decimal-price">{{ $partes[1] }}</span>
        </div>

        <div class="footer">
            <div class="barcode-section">            
                <div class="barcode-visual">
                   <div>
					<img src="https://bwipjs-api.metafloor.com/?bcid=code128&text={{ $det->codigo }}&scale=1&rotate=N&includetext" alt="Barcode">
					</div> 
                </div>
            </div>

            <div class="product-details" style="font-size: 3.5mm;">
                <p class="per-unit">Precio por unidad.</p>
            </div>
        </div>
    </div>
    @endforeach
</div>
         	<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center">
					<button type="button" id="regresar" class="btn btn-danger btn-xs" data-dismiss="modal">Regresar</button>
					<button type="button" id="imprimir" class="btn btn-primary btn-xs" data-dismiss="modal">Imprimir</button>
					 
                    </div>
                </div>  
@push ('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
  //  alert ('si');
  document.getElementById('imprimir').style.display="none";
  document.getElementById('regresar').style.display="none";
  window.print(); 
  window.location="{{route('compras')}}";
    });
$('#regresar').on("click",function(){
  window.location="{{route('compras')}}";
  
});
});
</script>
@endpush
@endsection