@extends ('layouts.master')
@section ('contenido')
            <div class="invoice p-3 mb-3">
              <!-- title row -->
              <div class="row">
                <div class="col-12">
                  <h4>
                   <img src="{{asset('dist/img/iconosistema.png')}}" title="NKS"> SysVent@s
                    <small class="float-right"></small>
                  </h4>
                </div>
                <!-- /.col -->
              </div>
              <!-- info row -->
              <div class="row invoice-info">
				<div class="col-sm-8 invoice-col">
				{{$empresa->nombre}}
                  <address>
                    <strong>{{$empresa->rif}}</strong><br>
                   {{$empresa->direccion}}<br>
                     Tel: {{$empresa->telefono}}<br>
                  </address>
	</div>
		<div class="col-sm-4 invoice-col">

                <?php 
				$corteHoy = date("d-m-Y");
				echo "<b>Fecha: ".date("d-m-Y",strtotime($corteHoy))."</b>"; ?>
			
	</div>
              </div>
              <!-- /.row -->
		<div class="row">
<div class="col-xs-12">
        <div class="table-responsive">
            <h3 class="text-center">SALDOS BANCARIOS</h3>
            <table class="table table-bordered text-center">
                <thead>
                    <tr>
                        <th class="text-center">Crédito</th>
                        <th class="text-center">Débito</th>
                        <th class="text-center">Saldo</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($bancos as $m)
                        @php
                            $credito = $m->total_credito;
                            $debito  = $m->total_debito;
                            $saldo   = $credito - $debito;

                            // Obtenemos los símbolos de este banco sin duplicar movimientos
                          $simbolo = isset($monedas[$m->idbanco]) 
							? $monedas[$m->idbanco]->first()->simbolo 
							: '';
                        @endphp

                        <tr style="background-color: #E6E6E6">        
                            <td colspan="3" class="text-center">
                                <strong>{{ $m->nombre }}</strong>
                            </td>
                        </tr>
                        <tr> 
                            <td>{{ number_format($credito, 2, '.', ',') }} {{ $simbolo }}</td>
                            <td>{{ number_format($debito, 2, '.', ',') }} {{ $simbolo }}</td>
                            <td>{{ number_format($saldo, 2, '.', ',') }} {{ $simbolo }}</td>   
                        </tr>                           
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
		  <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
							<div class="form-group" align="center">
							 <button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button>
							</div>
						</div>

		  </div>
  </div>


      @push ('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
  //  alert ('si');
  document.getElementById('imprimir').style.display="none";
  window.print(); 
  window.location="{{route('bancos')}}";
    });

});
	function conMayusculas(field) {
            field.value = field.value.toUpperCase()
}
</script>

@endpush   
@endsection