@extends ('layouts.master')
@section ('contenido')
<?php 
$acum=0; $efe=0; $deb=0; $che=0; $tra=0; $cefe=0;

// === PRE-CÁLCULO DE TOTALES ===
$total = 0; 
$count = 0; 
$cli = array();

// 1. Recorrer pacientes
foreach ($pacientes as $cat) {
    $mon = $cat->acumulado;
    $count++; 
    $total += $cat->acumulado;
}
?>

<!-- Main content -->
<div class="invoice p-3 mb-3">
    <!-- Header/Title -->
    <div class="row">
        <div class="col-12">
            <h4>
                <img src="{{asset('dist/img/iconosistema.png')}}" title="NKS"> SysVent@s
                <small class="float-right"></small>
            </h4>
        </div>
    </div>

    <!-- Info row -->
    <div class="row invoice-info">
        @include('pedidoshein.cobrar.empresa')
    </div>

    <!-- SECCIÓN SUPERIOR: TOTAL Y BOTÓN DE IMPRESIÓN -->
    <div class="row my-3 p-2 bg-light border rounded align-items-center no-print">
        <div class="col-md-6 col-sm-12">
            <h5 class="m-0">
                <strong>Total a Cobrar: </strong> 
                <span class="badge badge-success">{{ number_format($total, 2, ',', '.') }} $</span>
                <small class="text-muted ml-2">({{ $count }} Clientes)</small>
            </h5>
        </div>
        <div class="col-md-6 col-sm-12 text-md-right text-sm-center mt-2 mt-md-0">
            <button type="button" class="btn btn-primary btn-sm btn-imprimir">
                <i class="fas fa-print"></i> Imprimir
            </button>
        </div>
    </div>

    <!-- Table row -->
    <div class="row">
        <div class="col-12 table-responsive">
         <table class="table table-striped table-hover table-sm" width="100%">
                <thead style="background-color: #E6E6E6">
                    <th>Cliente</th>
                    <th>Cédula</th>
                    <th>Teléfono</th>
                    <th>Monto</th>								
                </thead>
                <tbody>
                    @foreach ($pacientes as $cat)
                        <?php 
                        $mon = $cat->acumulado;                 
                        
                        ?>
                        <tr>
                            <td><small>{{ $cat->nombre }}</small></td>
                            <td>{{ $cat->cedula }}</td>
                            <td>{{ $cat->telefono }}</td>
                            <td>{{ number_format($mon, 2, ',', '.') }} $</td>
                        </tr>
                    @endforeach
                </tbody>
                <tfoot>
                    <tr style="background-color: #f2f2f2;">
                        <td><strong>Clientes: {{ $count }}</strong></td>
                        <td></td>
                        <td><strong>Total:</strong></td>
                        <td><strong>{{ number_format($total, 2, ',', '.') }} $</strong></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>		        

    <!-- SECCIÓN INFERIOR: USUARIO, TOTAL Y BOTÓN DE IMPRESIÓN -->
    <div class="row mt-3 pt-2 border-top">
        <div class="col-md-6 col-sm-12">
            <label><strong>Usuario: </strong> {{ Auth::user()->name }}</label>
        </div>
        <div class="col-md-6 col-sm-12 text-md-right text-sm-center no-print">
            <button type="button" class="btn btn-primary btn-sm btn-imprimir">
                <i class="fas fa-print"></i> Imprimir
            </button>
        </div>
    </div>

</div><!-- /.invoice -->

@push ('scripts')
<style>
    @media print {
        .no-print {
            display: none !important;
        }
    }
</style>

<script>
$(document).ready(function(){
    $('.btn-imprimir').click(function(){
        window.print(); 
        window.location = "{{ route('reportecxc') }}";
    });
});
</script>
@endpush
@endsection