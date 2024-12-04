@extends ('layouts.master')
@section ('contenido')
<div class="row">
		@include('reportes.compras.seriales.search')
</div>
<?php $acum=0;$efe=0;$deb=0;$che=0;$tra=0;$ctra=0;$cche=0; $cdeb=0;
$cefe=0;?>
 <!-- Main content -->
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
			@include('reportes.compras.seriales.empresa')
              </div>
              <!-- /.row -->
              <!-- Table row -->
            <div class="row">
				<div class="col-12 table-responsive">
					<table width="100%">
					<thead style="background-color: #E6E6E6">
					
					  <th>Proveedor</th>
					  <th>Comprobante</th>
					  <th>Emision</th> 
					  <th>Articulo</th>
					  <th>Chasis</th>
					  <th>Motor</th>
					  <th>Placa</th>		
					  <th>Color</th>		
					  <th>Año</th>		
					  <th>Opc.</th>		
					</thead><?php $count=0; $deuda=0; $acump=0; $tmonto=0; $tdeuda=0;$tbase=$texento=$tmiva=0; ?>
					@foreach ($datos as $q)
						<tr> <?php $count++; ?> 
							
							<td>{{ $q->proveedor}}</td>
							<td> {{$q->num_comprobante}}</td>	
							<td><?php echo date("d-m-Y",strtotime($q->emision)); ?></td>	
							<td> {{$q->articulo}}</td>	
							<td> {{$q->chasis}}</td>	
							<td> {{$q->motor}}</td>	
							<td> {{$q->placa}}</td>	
							<td> {{$q->color}}</td>	
							<td> {{$q->año}}</td>	
							<td>        <div class="btn-group">
                    <button type="button" class="btn btn-success btn-xs">Detalles</button>
                    <button type="button" class="btn btn-success dropdown-toggle btn-xs" data-toggle="dropdown">
                      <span class="sr-only"></span>
                    </button>
                    <div class="dropdown-menu" role="menu">
				@if($rol->editserial==1)<a class="dropdown-item" href="" data-target="#modalserial-{{$q->idserial}}" data-toggle="modal">Editar</a> @endif

                 @if($rol->printcertificado==1)  <?php if($q->idventa != 0){?>   <a class="dropdown-item" href="{{route('certificado',['id'=>$q->idserial])}}">Cert.</a> <?php } ?> @endif
                
                    </div>
                  </div></td>	
						</tr>
						@include('reportes.compras.seriales.modalserial')
					@endforeach

					</table>
				</div>

				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 		       
					<label>Usuario: </label>  {{ Auth::user()->name }}  
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
  document.getElementById('imprimir').style.display="none";
  window.print(); 
  window.location="{{route('resumencompras')}}";
    });

});
</script>
@endpush
@endsection