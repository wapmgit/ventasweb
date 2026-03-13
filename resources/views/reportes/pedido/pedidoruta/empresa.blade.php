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

				  <h4>Reporte Pedidos</h4><span><?php echo "Vendedor: ".$filtro;  ?></span></br>
				  <span><?php echo "Ruta: ".$filtroruta;  ?></span>
	</div>