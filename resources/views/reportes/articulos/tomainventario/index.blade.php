@extends ('layouts.master')
<?php $mostrar=0; ?>
@section ('contenido')
<?php $mostrar=1; ?>
<div class="row">
		@include('reportes.articulos.tomainventario.search')
</div>
<?php $acum=0;$i=0;$deb=0;$che=0;$tra=0; $acumcnt=0; $acumcntrec=0;
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
			@include('reportes.articulos.tomainventario.empresa')
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
                <div class="col-12 table-responsive">
      <table width="100%">
        <thead style="background-color: #E6E6E6">
          
          <th>Articulo</th>
          <th>Und.</th>
          <th>Stock</th>

        </thead>
  
		<tbody>           
		@foreach ($lista as $q)   <?php $i++; ?>
		<tr <?php if (($i%2)==0){ echo "style='background-color: #D4E6F1 !important'";}?>>
			<td>{{$q->nombre}}</td>
			<td>{{$q->unidad}}</td>
			<td>_______</td>
        </tR>
		@endforeach	 
		</tbody>
		<tfoot>
		<Tfoot>
			
      </table></br>
    </div>


                     <div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
					   <label>Usuario: </label>  {{ Auth::user()->name }}  
                    <div class="form-group" align="center">
                     <button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button> 
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
window.location="{{route('tomainventario')}}";
    });

});

</script>

@endpush
@endsection