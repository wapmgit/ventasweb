@extends ('layouts.master')
<?php $mostrar=0; 
$usuario= Auth::user()->name; ?>
@section ('contenido')
<?php $mostrar=1; ?>

<?php $acum=0;$efe=0;$deb=0;$che=0;$tra=0;
$cefe=0;?>
  <!-- Main content -->
            <div class="invoice p-3 mb-3">
              <!-- title row -->
              <div class="row">
                <div class="col-12">
                  <h4>
                     <img src="{{asset('dist/img/iconosistema.png')}}" title="NKS"> Sistema de Ventas SysVent@s
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
                <!-- /.col -->
	<div class="col-sm-4 invoice-col">

				  <h4>Corte de Caja</h4>
                <?php echo date("d-m-Y",strtotime($searchText)); ?> al <?php echo date("d-m-Y",strtotime($searchText2)); ?>
			
	</div>
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
                <div class="col-6 table-responsive">
					<table width="100%">
						<thead style="background-color: #E6E6E6">					  
						<th>Facturas</th>
						<th>Contado</th>
						<th>Credito</th>
						</thead>
							<?php $ctra= 0; $cche=0; $cdeb=0; $tcobranza=0; $tcobro=0; $credito=0; $acumc=0;$contado=0; $count=0; $vcredito=0; $tingreso=0; $vcontado=0; ?>
					   @foreach ($datos as $q)
					   <?php $count++;
					   if($q->saldo>0){ $vcredito=$vcredito+$q->total_venta; }else{
						   $vcontado=$vcontado+ $q->total_venta;
					   }
						 $acum=$acum+ $q->total_venta; 			  
						if($q->estado=="Contado"){ $acumc=$acumc+ $q->total_venta; }?> 
						@endforeach	 
					<tbody>
						<tr>
						<td><?php echo $count; ?></td>
						<td><?php   echo number_format($vcontado, 2,',','.')." $"; ?></td>
						<td><?php echo number_format($vcredito, 2,',','.')." $"; ?></td>
										  
						</tr>
					</tbody>		
					</table>
				</div>
    <div class="col-6 table-responsive">
					<table width="100%">
      <thead style="background-color: #E6E6E6">
        
          <th>Alicuota</th>
          <th>Venta</th>
          <th>BIVA</th>
          <th>IVA</th>
        </thead> <?php $ivaventa=0; $sumaiva=0; $acumgravado=0; $ivasale=0;?>
		  @foreach ($impuestos as $imp)
      <tr >
          <td> @if ($imp->iva==0) Exento @else {{$imp->iva}} @endif </td>
          <td><?php $sumaiva=($imp->montoventa-$imp->gravado);$ivaventa=($ivaventa+$imp->montoventa); echo number_format($imp->montoventa, 2,',','.')." $"; ?></td>
          <td><?php 
            if ($imp->iva == 0 ){ echo 0;}else{ $acumgravado=($acumgravado+$imp->gravado);
			echo number_format($imp->gravado, 2,',','.')." $"; }?></td>
          <td><?php 
		   if ($imp->iva == 0 ){ echo 0;}else{ $ivasale=$ivasale+$sumaiva; 
		   echo number_format(($imp->montoventa-$imp->gravado), 2,',','.')." $"; }?></td>
        @endforeach
        </tr>
		<tr >
		  <td ><strong>Total</strong></td>
          <td><strong><?php  echo number_format($ivaventa, 2,',','.')." $"; ?></strong></td>
          <td><strong><?php echo number_format($acumgravado, 2,',','.')." $"; ?></strong></td>
          <td><strong><?php echo number_format(($ivasale), 2,',','.')." $"; ?></strong></td>
		</tr>
      </table>
    </div>
  

     <div class="col-6 table-responsive">
		<table width="100%">
      <thead >
        
          <tr><td colspan="3" align="center" style="background-color: #E6E6E6"> <strong>Desglose de Ventas</strong></td></tr>
          <th>Moneda</th>
          <th>Recibido</th>
          <th>monto</th>
          
        </thead>
         @foreach ($pagos as $cob)
		   <?php $tingreso=$tingreso+$cob->monto; ?>
      <tr >
          <td><?php  echo $cob->idbanco; ?></td>
          <td><?php echo number_format($cob->recibido, 2,',','.'); ?></td>
          <td><?php  echo number_format($cob->monto, 2,',','.')." $"; ?></td>
        </tr>
        @endforeach
        <tr><td colspan="2" align="center"><strong>Total Desglose de ventas</strong></td><td><strong><?php echo number_format($tingreso, 2,',','.')." $"; ?></strong></td></tr>
      </table>
    </div>
    <div class="col-6 table-responsive">
					<table width="100%">
      <thead>
          <tr><td colspan="3" align="center" style="background-color: #E6E6E6"> <strong>Desglose de Cobranza</strong></td></tr>
		<th>Moneda</th>
		<th>Recibido</th>
		<th>Monto</th> </thead>
         @foreach ($cobranza as $cob)
		 <?php  $tcobranza=$tcobranza+$cob->monto; ?> 
        <tr>
          <td><?php  echo$cob->idbanco; ?></td>
          <td><?php echo number_format($cob->recibido, 2,',','.'); ?></td>
             <td><?php  echo number_format($cob->monto, 2,',','.')." $"; ?></td>
        </tr>
        @endforeach
		    <tr><td colspan="2" align="center"><strong>Total Desglose de Cobranza</strong></td><td><strong><?php echo number_format($tcobranza, 2,',','.')." $"; ?></strong></td></tr>
      </table>
      </table>
	  </div>
    <div class="col-12 table-responsive">
					<table width="100%">
      <thead>
          <tr><td colspan="3" align="center" style="background-color: #E6E6E6"> <strong>Distribucion de Ingresos</strong></td></tr>
		<th>Moneda</th>
		<th>Recibido</th>
		<th>Monto</th> </thead>
         @foreach ($ingresos as $cob) <?php $tcobro=$tcobro+$cob->monto;?>	
        <tr>
          <td><?php  echo$cob->idbanco; ?></td>
          <td><?php echo number_format($cob->recibido, 2,',','.'); ?></td>
          <td><?php  echo number_format($cob->monto, 2,',','.')." $"; ?></td>
        </tr>
        @endforeach
		    <tr><td colspan="2" align="center"><strong>Total Ingresos</strong></td><td><strong><?php echo number_format($tcobro, 2,',','.')." $"; ?></strong></td></tr>
      </table>
      </table>
	  </div>
     <div class="col-12 table-responsive">
					<table width="100%">
        <thead style="background-color: #E6E6E6">
          <th>Monto Devoluciones</th>
          <th>Total Caja</th>
       
        </thead>
         @foreach ($devolucion as $dev)
        <tr >       
          <td><strong><?php $devolu=$dev->totaldev; echo number_format($devolu, 2,',','.')." $"; ?></strong></td>
          <td><strong><?php $caja=($tingreso+$tcobranza); echo "$ ".number_format($caja, 2,',','.'); ?></strong></td>
        
        </tr>
        @endforeach
    </table>
    </div>		       
                     <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
					   <label>Usuario: </label>  {{ Auth::user()->name }}  
                    <div class="form-group" align="center">
                     <button type="button" id="imprimir" class="btn btn-primary" data-dismiss="modal">Imprimir</button> 
                    </div>
                </div>
                   
</div><!-- /.box-body -->
</div><!-- /.box -->
             

@push ('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
  //  alert ('si');
  document.getElementById('imprimir').style.display="none";
  window.print(); 
  window.location="../reportes/corte";
    });

});

</script>

@endpush
@endsection