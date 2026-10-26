@extends ('layouts.master')
@section ('contenido')
<?php $cont=0; $cntm=0; $dif=0;?>
<div class="row px-3" >
		<div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
			<div class="form-group">
				<label >{{$empresa->nombre}}</label></br>
				<label >{{$empresa->rif}}</label></br>	
				<label >{{$empresa->direccion}}. Tel: {{$empresa->telefono}}</label>
			 </div>  
	    </div>
</div>
<div class="panel panel-primary">
<div class="panel-body">
  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
  
        <h3 align="center">TASAS DE CAMBIO </h3>
</div>
	<div class="col-12">
        @if (session('mensaje'))
            <div class="alert alert-primary alert-dismissible fade show" role="alert">
                <i class="fa fa-check-circle mr-1"></i> {{ session('mensaje') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        @endif
	</div>
<?php if($tasabcv>0){
	$date = new DateTime($fechatasa);
	?>
<section class="content">
      <div class="container-fluid">
        <h5 class="mb-2">Fecha: <?php echo $date->format('d/m/Y'); ?></h5>
        <div class="row">
                <div class="col-md-4 col-sm-6 col-12">
            <div class="info-box">
		 <i class="nav-icon">BCV</i>
              <div class="info-box-content">
                <span class="info-box-number">
				<i class="fa-solid fa-paste" id="tasabcv"></i><?php echo number_format( $tasabcv, 2,',','.')." Bs."; ?>
				</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
              <div class="col-md-4 col-sm-6 col-12">
            <div class="info-box">
			<i class="nav-icon">PROM.</i>
              <div class="info-box-content">
                <span class="info-box-number">
				<?Php echo number_format( $tasap, 2,',','.')." Bs.";?>
				</span>

              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
              <div class="col-md-4 col-sm-6 col-12">
            <div class="info-box">
			<i class="nav-icon">Dif %</i>

              <div class="info-box-content">
                <span class="info-box-number">
				<?php echo number_format( $dif=((($tasap-$tasabcv)/$tasabcv)*100), 2,',','.'); ?>
				</span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->



          <!-- /.col -->
        </div>
        <!-- /.row -->
  
  </div>
  </section>
<?php } ?>
<!-- SECCIÓN DE LA GRÁFICA Y SU FILTRO (AHORA FUERA DEL FORM PRINCIPAL) -->
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mb-3">
            <div class="card card-primary">
                <div class="card-header">
                    <h3 class="card-title">Histórico de Tasas</h3>
                    <div class="card-tools">
                        <!-- Formulario de filtro independiente -->
                        <form method="GET" action="{{ route('vertasas') }}" id="formFiltroTasa">
                            <select name="periodo" class="form-control form-control-sm text-dark" onchange="document.getElementById('formFiltroTasa').submit()">
                                <option value="quincena" {{ request('periodo') == 'quincena' ? 'selected' : '' }}>Últimos 15 días</option>
                                <option value="mes_actual" {{ request('periodo', 'mes_actual') == 'mes_actual' ? 'selected' : '' }}>Este mes</option>
                                <option value="mes_anterior" {{ request('periodo') == 'mes_anterior' ? 'selected' : '' }}>Mes anterior</option>
                                <option value="todos" {{ request('periodo') == 'todos' ? 'selected' : '' }}>Histórico completo</option>
                            </select>
                        </form>
				
                    </div>
				<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Expandir / Ocultar">
                    <i class="fas fa-minus"></i>
                </button>
                </div>
                <div class="card-body">
                    <canvas id="graficaTasas" style="min-height: 200px; height: 200px; max-height: 200px; max-width: 100%;"></canvas>
                </div>
            </div>
        </div>
 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<form action="{{route('updatetasas')}}" method="POST" enctype="multipart/form-data" >         
			{{csrf_field()}}

		<table align="center">
			<tr><td><strong>Moneda</strong></td><td><strong>Valor</strong></td><td><strong>Actualizar</strong></td></tr>
				@foreach ($monedas as $cat1)	<?php 
			
				if($cat1->tipo>0){	$cont++; 
					$tm="E";
					if($cat1->tipom=="N"){$cntm++; $tm="N";}
				?>			
				<tr>
				<td><input  type="text" readonly value="{{$cat1->nombre}}" name="nombre" class ="form-control"></input></td>
				<td><input type="number" readonly value="{{$cat1->valor}}" name="v" class ="form-control"></input></td>
				<td><input  type="hidden" value="{{$cat1->idmoneda}}" name="idmoneda[]" class ="form-control"></input>
				<input type="number" value="{{$cat1->valor}}" name="valor[]" id="vm<?php echo $cont; ?>" step="0.01" class ="form-control"></input>
				 <input  type="hidden" value="<?php echo $tm; ?>" id="tm<?php echo $cont; ?>" class ="form-control"></input>
				</td>
			</tr>
				<?php } ?>
				@endforeach
		<tr><td colspan="2"><div class="form-group">
				<?php if ($dif == 0 ){?><label> Indique % dif Cambiario</label><?php } ?>
				<input  <?php if ($dif > 0 ){?> type="hidden" <?php } else {?> type="number" <?php } ?> name="difc" value="<?php echo $dif; ?>"  class ="form-control"></input>
            	<label for="productor">¿ Actualizar Precio 2 por Tasa Diferencial ?</label>
				<input type="checkbox" name="actprec" id="cbx1"  >
				
		
            </div></td></tR>
		</table>
  </div>  

 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center"></br>
 <input  type="hidden" value="<?php echo $cont; ?>" id="cntm" class ="form-control"></input>
 <input  type="hidden" value="{{$tasabcv}}" id="tasa" name ="tasa" class ="form-control"></input>
 <input  type="hidden" value="{{$tasap}}" id="tasapro" name ="tasapro" class ="form-control"></input>
       <div class="form-group">
          <input name="_token" value="{{ csrf_token() }}" type="hidden" ></input>
			@if($rol->acttasa==1) <button type="submit" id="" class="btn btn-primary" >Confirmar</button> @endif
       
	   </div> 
	  </form>  
  </div>
  </div>
</div>
@push ('scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
$(function () {
    // Convertimos los datos de Laravel a arrays de JavaScript de forma segura
    const fechas = {!! json_encode($tasasHistoricas->pluck('fecha')) !!};
    const bcvData = {!! json_encode($tasasHistoricas->pluck('tasadolar')) !!};
    const promData = {!! json_encode($tasasHistoricas->pluck('tasapromedio')) !!};

    const ctx = document.getElementById('graficaTasas').getContext('2d');
    
    new Chart(ctx, {
        type: 'line',
        data: {
            labels: fechas,
            datasets: [
                {
                    label: 'Tasa BCV',
                    data: bcvData,
                    borderColor: 'rgba(60,141,188,1)',
                    backgroundColor: 'rgba(60,141,188,0.1)',
                    borderWidth: 2,
                    fill: true,
                    tension: 0.1
                },
                {
                    label: 'Tasa Promedio',
                    data: promData,
                    borderColor: 'rgba(210, 214, 222, 1)',
                    backgroundColor: 'rgba(210, 214, 222, 0.1)',
                    borderWidth: 2,
                    fill: true,
                    tension: 0.1
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: {
                    beginAtZero: false
                }
            }
        }
    });
});
$(document).ready(function(){
	
    $("#Cenviar").on("click",function(){
      
         var form1= $('#actasa');
        var url1 = form1.attr('action');
        var data1 = form1.serialize();
  
    $.post(url1,data1,function(result){  
      var resultado=result;
          console.log(resultado); 
     $("#actasa")[0].reset();
        });
  
          });
	$('#tasabcv').on("click",function(){
			var nm=$("#cntm").val();
			var tasa=trunc($("#tasa").val(),2);
		for(var i=1;i<(nm+1);i++){
			var tm=$("#tm"+i).val();
			if(tm=="N"){
				$("#vm"+i).val(tasa);
			}
			 }
			
		});
});
function trunc (x, posiciones = 0) {
  var s = x.toString()
  var l = s.length
  var decimalLength = s.indexOf('.') + 1
  if(decimalLength>0){
  var numStr = s.substr(0, decimalLength + posiciones)
  }else{
	  numStr = s
  }
  return Number(numStr)
}
</script>
@endpush     
@endsection