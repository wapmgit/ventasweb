@extends('layouts.master')
@section('contenido')
<div class="row">
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small card -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3><?php echo count($articulos); ?></h3>

                <p>Articulos</p>
              </div>
              <div class="icon">
                <i class="fas fa-shopping-cart"></i>
              </div>
              <a href="{{route('articulos')}}" class="small-box-footer">
                ver <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small card -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3><?php echo count($proveedor); ?></h3>

                <p>Proveedores</p>
              </div>
              <div class="icon">
                <i class="fas fa-line-chart"></i>
              </div>
              <a href="{{route('proveedores')}}" class="small-box-footer">
                ver <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small card -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3><?php echo count($clientes); ?></h3>

                <p>Clientes</p>
              </div>
              <div class="icon">
                <i class="fas fa-user-plus"></i>
              </div>
              <a href="{{route('clientes')}}" class="small-box-footer">
                ver <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small card -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h3><?php echo count($vendedores); ?></h3>

                <p>Vendedores</p>
              </div>
              <div class="icon">
                <i class="fas fa-truck"></i>
              </div>
              <a href="{{route('vendedores')}}" class="small-box-footer">
                Ver <i class="fas fa-arrow-circle-right"></i>
              </a>
            </div>
          </div>
          <!-- ./col -->
        </div>
        <!-- /.row -->
   <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- /.col (LEFT) -->
          <div class="col-md-12">
 
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Compras/Ventas</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="barChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>

          </div>
          <!-- /.col (RIGHT) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
   <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- /.col (LEFT) -->
          <div class="col-md-12">
 
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Resumen</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <div class="card-body">
			      <table width="100%">
        <thead >
          <th>Item</th>
          <th>Enero</th><th>Febrero</th><th>Marzo</th><th>Abril</th><th>Mayo</th><th>Junio</th><th>Julio</th><th>Agosto</th><th>Septiembre</th><th>Octubre</th><th>Noviembre</th><th>Diciembre</th>
        </thead>    
		<tbody>
	<tr>
    <td style="background-color: #2b92da" align="center"><strong>Compras</strong></td>
    @foreach($mesesCompras as $totalCompra)
        <td>{{ number_format($totalCompra, 2, ',', '.') }}</td>
    @endforeach
</tr>

<!-- Fila de Ventas -->
<tr>
    <td style="background-color: #34bf75" align="center"><strong>Ventas</strong></td>
    @foreach($mesesVentas as $totalVenta)
        <td>{{ number_format($totalVenta, 2, ',', '.') }}</td>
    @endforeach
</tr>
		</tbody>
      </table>
              </div>
              <!-- /.card-body -->
            </div>

          </div>
          <!-- /.col (RIGHT) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
</div>
@push('scripts')

<script>
$(document).ready(function(){
	var ventasData = @json($mesesVentas);  
	var comprasData = @json($mesesCompras);
  $(function () {
    /* ChartJS
     * -------
     * Here we will create a few charts using ChartJS
     */

    //--------------
    //- AREA CHART -
    //--------------

    // Get context with jQuery - using jQuery's .get() method.
  

    var areaChartData = {
      labels: ["Enero","Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"],
      datasets: [
        {
          label               : 'Compras',
          backgroundColor     : 'rgba(60,141,188,0.9)',
          borderColor         : 'rgba(60,141,188,0.8)',
          pointRadius          : false,
          pointColor          : '#3b8bba',
          pointStrokeColor    : 'rgba(60,141,188,1)',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(60,141,188,1)',
		 data: @json($mesesCompras)
        },
        {
          label               : 'Ventas',
          backgroundColor     : 'rgba(38, 147, 9, 1)',
          borderColor         : 'rgba(38, 147, 9, 1)',
          pointRadius         : false,
          pointColor          : 'rgba(38, 147, 9, 1)',
          pointStrokeColor    : '#c1c7d1',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(38, 147, 9,1)',
		  data: @json($mesesVentas)
        },
      ]
    }
    //-------------
    //- BAR CHART -
    //-------------
    var barChartCanvas = $('#barChart').get(0).getContext('2d')
    var barChartData = $.extend(true, {}, areaChartData)
    var temp0 = areaChartData.datasets[0]
    var temp1 = areaChartData.datasets[1]
    barChartData.datasets[0] = temp1
    barChartData.datasets[1] = temp0

   var barChartOptions = {
      responsive              : true,
      maintainAspectRatio     : false,
      datasetFill             : false,
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      },
      // Configuración del tooltip (cuando pasas el mouse)
      tooltips: {
        callbacks: {
          label: function(tooltipItem, data) {
            // Obtiene el nombre del dataset (ej: "Ventas" o "Compras")
            var label = data.datasets[tooltipItem.datasetIndex].label || '';
            var value = tooltipItem.yLabel; // El valor numérico de esa barra/punto
            
            // Formatea el número a dos decimales con toLocaleString
            var valorFormateado = Number(value).toLocaleString('es-VE', { 
                minimumFractionDigits: 2, 
                maximumFractionDigits: 2 
            });

            return label + ': ' + valorFormateado;
          }
        }
      }
    }

    new Chart(barChartCanvas, {
      type: 'bar',
      data: barChartData,
      options: barChartOptions
    })

  })
    })
</script>
@endpush
@endsection
