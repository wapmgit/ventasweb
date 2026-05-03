@extends ('layouts.master')
@section ('contenido')
	<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
			<h3>Editar Tipo Gasto: {{ $data->nombregasto}}</h3>
        <form action="{{route('updatetgasto')}}" id="formcategoria" method="POST" enctype="multipart/form-data" >       
        {{csrf_field()}}

            <div class="form-group">
            	<label for="nombre">Nombre</label>
				   <input type="hidden" name="id" class="form-control" value="{{$data->idgasto}}">
            	<input type="text" name="nombre" class="form-control" value="{{$data->nombregasto}}" placeholder="Nombre...">
				@if($errors->first('nombregasto'))<P class='text-danger'>{{$errors->first('nombregasto')}}</p>@endif
		   </div>
          <div class="form-group">
            			<label >Grupo</label>
            			<select name="clasi" id="clasi" class="form-control">
            				<option value="1" <?php if($data->clasi==1){ echo "selected";} ?>>Gastos fijos</option>
            				<option value="2"  <?php if($data->clasi==2){ echo "selected";} ?>>Gastos variables</option>
            				<option value="3"  <?php if($data->clasi==3){ echo "selected";} ?>>Gastos Indirectos</option>
            				<option value="4"  <?php if($data->clasi==4){ echo "selected";} ?>>Gastos Directos</option>
            			</select>
				</div>           
		</div>
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">	
            <div class="form-group">
				<button class="btn btn-danger btn-sm" id="btncancelar" type="reset">Cancelar</button>
            	<button class="btn btn-primary btn-sm" id="btnguardar" type="submit">Guardar</button>
				<div style="display: none" id="loading">  <img src="{{asset('img/sistema/loading30.gif')}}"></div>
            </div>	
			</div> 	</form>  
	</div>
@endsection
  @push('scripts')
<script>
        $(document).ready(function(){
			$('#btnguardar').click(function(){   
		document.getElementById('loading').style.display=""; 
		document.getElementById('btnguardar').style.display="none"; 
		document.getElementById('btncancelar').style.display="none"; 
		document.getElementById('formcategoria').submit(); 
		})
       });
	    function conMayusculas(field) {
            field.value = field.value.toUpperCase()
}
</script>
@endpush