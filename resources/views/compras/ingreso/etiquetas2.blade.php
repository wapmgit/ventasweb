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
        font-size: 3.5mm; /* Reducí ligeramente a 3.5mm para ganar espacio */
        font-weight: bold;
        margin: 0;
        line-height: 1.1;
        text-transform: uppercase;
        
        /* Nuevas propiedades para nombres largos */
        word-wrap: break-word;        /* Rompe palabras muy largas si es necesario */
        overflow-wrap: break-word;    /* Estándar moderno para salto de línea */
        max-height: 1.8cm;            /* Limita el alto máximo (aprox 2 o 3 líneas) */
        overflow: hidden;             /* Oculta el exceso si supera las 3 líneas */
        display: -webkit-box;         
        -webkit-line-clamp: 3;        /* Muestra máximo 3 líneas y corta con '...' si excede */
        -webkit-box-orient: vertical;
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
	<div class="row no-print">
		 <div class="card">
	<div class="card-header">
		<h3 class="card-title">Indicar Tipo de Precio</h3>
			<div class="card-tools">
				<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
					<i class="fas fa-minus"></i>
				</button>
				<button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
					<i class="fas fa-times"></i>
				</button>
			</div>
	</div>
	<div class="card-body p-0"></br>
		<div class="row">
			<div class="col-lg-12  col-md-12 col-sm-1 col-xs-12" >
			<div class="form-check-inline">
                        <input class="form-check-input selector-precio" type="radio" name="flexRadioDefault" id="flexRadioDefault1" value="1" <?php if($empresa->precioeti=="precio1"){ echo "checked"; }?> >
                        <label class="form-check-label" for="flexRadioDefault1">
                            Precio 1
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <input class="form-check-input selector-precio" type="radio" name="flexRadioDefault" id="flexRadioDefault2" value="2"  <?php if($empresa->precioeti=="precio2"){ echo "checked"; }?> >
                        <label class="form-check-label" for="flexRadioDefault2">
                            Precio 2
                        </label>
                    </div>
                    <div class="form-check-inline">
                        <input class="form-check-input selector-precio" type="radio" name="flexRadioDefault" id="flexRadioDefault3" value="3"  <?php if($empresa->precioeti=="precio3"){ echo "checked"; }?> >
                        <label class="form-check-label" for="flexRadioDefault3">
                            Precio 3
                        </label>
                    </div>
						</div> 
		</div>
	</div>
		
</div>
</div>
<div class="row" id="body">
    @foreach($detalles as $det)
	@php
        // Preparamos los formatos formateados para cada precio de antemano
        $p1 = number_format($det->precio1, 2, ',', '.');
        $p2 = number_format($det->precio2, 2, ',', '.');
        $p3 = number_format($det->precio3, 2, ',', '.');

        $partesP1 = explode(',', $p1);
        $partesP2 = explode(',', $p2);
        $partesP3 = explode(',', $p3);
    @endphp
    <div class="price-tag" data-entero-1="{{ $partesP1[0] }}" data-decimal-1="{{ $partesP1[1] }}"
         data-entero-2="{{ $partesP2[0] }}" data-decimal-2="{{ $partesP2[1] }}"
         data-entero-3="{{ $partesP3[0] }}" data-decimal-3="{{ $partesP3[1] }}">
        <div class="company-info">
            <p class="date-info"> {{ $det->codigo }}</p> 
        </div>

        <div class="header">
            <h5 class="product-name">{{ $det->articulo }}</h5>
        </div>

        <div class="price-main">
            <span class="currency-sym">$</span>
           
           <span class="integer-price">{{ $partesP1[0] }}.</span>
            <span class="decimal-price">{{ $partesP1[1] }}</span>
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
	$('.selector-precio').on('change', function() {
        let tipo = $(this).val(); // Obtiene '1', '2' o '3'

        $('.price-tag').each(function() {
            let entero = $(this).data('entero-' + tipo);
            let decimal = $(this).data('decimal-' + tipo);

            // Actualiza los spans internos de cada etiqueta respetando el formato visual
            $(this).find('.integer-price').text(entero + '.');
            $(this).find('.decimal-price').text(decimal);
        });
    });
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