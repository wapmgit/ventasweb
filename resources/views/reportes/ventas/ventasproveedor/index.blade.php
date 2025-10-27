@extends ('layouts.master')
<?php $mostrar=0; ?>
@section ('contenido')
<?php $mostrar=1; ?>
<div class="row">
		@include('reportes.ventas.ventasproveedor.search')
</div>
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
			@include('reportes.ventas.ventasproveedor.empresa')
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
			   <div class="col-12 table-responsive">
				<table width="100%">
					<thead style="background-color: #E6E6E6" >    
					  <th>Articulo</th>
					  <th>Cantidad Compras</th>
					  <th>Cantidad Ventas</th>
					</thead>
						<?php $tcompra= 0; $cche=0; $cdeb=0; $credito=0; $contado=0;$real=0; $count=0;$tventa=0; $auxp=$auxpv=0;?>
					@foreach ($datos as $q)
					<?php $count++; $tcompra=$tcompra +($q->comprado); 
						?>
					<tr>        
					  <td>{{ $q->nombre}} </td>
					  <td><?php echo number_format($q->comprado, 2,',','.');?></td>
					  <td>	@foreach ($ventas as $v)
					  <?php  if($q->idarticulo == $v->idarticulo){ 
							echo number_format($v->vendido, 2,',','.');							
					  } ?>
							@endforeach
					  </td>
      
					</tr>
					@endforeach
					<tr><td colspan="2" align="left"><strong> Total Items:</strong></td><td><strong>{{$count}}</strong></td></tr>
				</table>
			</div>
			</div>
                  	</div><!-- /.row -->
                     <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
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
  window.location="{{route('ventasproveedor')}}";
    });

});

</script>

@endpush
@endsection