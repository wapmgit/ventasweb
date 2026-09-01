@extends('layouts.master')
<?php $mostrar=0; ?>
@section('contenido')
<?php $mostrar=1; ?>

<div class="row" id="search">
    @include('reportes.articulos.catalogo.search')
</div>

<style>
    /* Estilos para vista Web */
    .cabecera { background: linear-gradient(to bottom, #B3E5FC, #FAFAFA); padding: 2px; }
    .pie { background: linear-gradient(to bottom, #FAFAFA, #B3E5FC); padding: 2px; }
    .bordeimagen { border: 1px solid #0D47A1; padding: 5px; }

    .card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        max-width: 300px;
        margin: 10px auto;
        text-align: center;
        font-family: arial;
    }

    .price { color: grey; font-size: 22px; }

    /* =========================================================
       REGLAS CRÍTICAS DE IMPRESIÓN (EVITA EL MONTADO EN PDF)
       ========================================================= */
    @media print {
        @page {
            size: letter;
            margin: 10mm 10mm 10mm 10mm;
        }

        /* Ocultar elementos innecesarios */
        #search, #imprimir, .no-print {
            display: none !important;
        }

        /* Corregir desbordamientos y wrappers */
        body, html, .invoice, .row {
            overflow: visible !important;
            height: auto !important;
        }

        /* EVITAR QUE LAS TARJETAS SE SEPAREN O SE MONTEN ENTRE PÁGINAS */
        .card-producto {
            page-break-inside: avoid !important;
            break-inside: avoid !important;
			position: relative !important;
            display: inline-block !important;
            float: left !important;
            width: 48% !important; /* Muestra 2 productos por fila de forma estable */
            margin: 1% !important;
            box-shadow: none !important;
            border: 1px solid #ccc !important;
			overflow: hidden !important;
        }

        /* Control estricto de imágenes para evitar desborde */
        .img-catalogo {
            max-width: 100% !important;
            height: 180px !important;
            object-fit: contain !important;
            display: block !important;
            margin: 0 auto !important;
        }

        /* Encabezados y pies de página */
        .cabecera, .pie {
            background: none !important;
            page-break-inside: avoid !important;
        }
		* {
        -webkit-print-color-adjust: exact !important; /* Chrome, Safari, Edge, PDF Printers */
        print-color-adjust: exact !important;         /* Estándar CSS */
        color-adjust: exact !important;               /* Compatibilidad Firefox */
    }

    /* 2. REFORZAR EL ESTILO DE LA CAJA DEL PRECIO */
    .card .cabecera {
        background: #000000 !important; /* Fondo sólido oscuro para evitar problemas con gradients */
        color: #ffffff !important;      /* Texto blanco legible */
        border: 1px solid #000 !important;
        padding: 5px !important;
    }

    .card .cabecera h3 {
        color: #ffffff !important;
        margin: 0 !important;
    }
    }
</style>

<!-- Main content -->
<div class="invoice p-6 mb-6">
    <!-- title row -->
    <div class="cabecera">
        <div class="row">
            <div class="col-12">
                <h4>
                    <img src="{{asset('dist/img/iconosistema.png')}}" title="NKS"> SysVent@s
                </h4>
            </div>
        </div>
        <!-- info row -->
        <div class="row invoice-info">
            @include('reportes.articulos.catalogo.empresa')
        </div>
    </div>
    
    <hr size="2px" color="black" />

    <!-- Table row / Productos -->
    <div class="row">
        @foreach($datos as $det)
            <div class="col-lg-3 col-md-4 col-sm-6 card-producto">
                <div class="card">
                    <img class="img-catalogo" src="{{ asset('/img/articulos/'.$det->imagen)}}" alt="{{$det->nombre}}">
                    
                    @if(strlen($det->nombre) <= 30)
                        <h4>{{ $det->nombre }}</h4>
                    @else
                        <h6>{{ $det->nombre }}</h6>
                    @endif

                    <div class="card card-dark cabecera">
                        <h3>$ {{ $det->precio1 }} {{ $det->unidad }}</h3>
                    </div>
                </div>
            </div>
        @endforeach	
    
        <div class="col-12 pie">
            <hr size="2px" color="black" />
            <label>Usuario: </label> {{ Auth::user()->name }}
            <div class="form-group no-print" align="center">
                <button type="button" id="imprimir" class="btn btn-primary btn-sm">Imprimir</button>
				<a href="{{ route('catalogo.pdf') }}" class="btn btn-danger btn-sm" target="_blank">
    <i class="fa fa-file-pdf"></i> Descargar PDF Directo
</a>
            </div>
        </div>
    </div>
</div>

@push('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
        window.print();
    });
});
</script>
@endpush
@endsection