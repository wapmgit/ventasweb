	<div class="col-sm-6 invoice-col">
		{{$empresa->nombre}}
			<address>
			<strong>{{$empresa->rif}}</strong><br>
					{{$empresa->direccion}}<br>
					Tel: {{$empresa->telefono}}<br>
			</address>
	</div>
                <!-- /.col -->
	<div class="col-sm-3 invoice-col">
		<h3 align="center"><u>  SISTEMA DE APARTADO </u></h3><div align="center">
		<?php $idv=$venta->num_comprobante; echo add_ceros($idv,$ceros); ?>
		<span><strong><?php if($venta->devolu>0){ echo "**Anulado**";} ?></span></strong></div>		
	</div>	
	<div class="col-sm-3 invoice-col" align="center">
<img src="{{ asset('dist/img/'.$empresa->logo)}}" width="50%" height="80%" title="NKS">
	</div>