@extends ('layouts.master')
@section ('contenido')
	<div class="row">
	 <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12"> 
		<h3>Editar Empresa</h3>
		</div>
		   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" align="center"> @if (($empresa->logo)!="")
                     <img src="{{ asset('dist/img/'.$empresa->logo)}}" width="100" height="80" title="Empresa">
                  @endif </div>
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
		
        <form action="{{route('updatempresa')}}" id="formcategoria" method="post" enctype="multipart/form-data" >       
        {{csrf_field()}}

            <div class="form-group">
            	<label for="nombre">Nombre</label>
            	<input type="text" name="nombre" class="form-control"  onchange="conMayusculas(this)"  value="{{$empresa->nombre}}" placeholder="Nombre...">
				@if($errors->first('nombre'))<P class='text-danger'>{{$errors->first('nombre')}}</p>@endif
		   </div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
            <div class="form-group">
            	<label for="descripcion">Rif</label>
            	<input type="text" name="rif" class="form-control" value="{{$empresa->rif}}" readonly placeholder="Rif...">
            </div>
	          
		</div>
	<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
            	 <div class="form-group">
            			<label for="imagen">Logo </label>
            			<input type="file" name="imagen"  class="form-control">
						<input type="hidden" id="tpeso" value="{{$empresa->peso}}">
            		</div>
            </div>

		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="form-group">
            	<label for="descripcion">Direccion</label>
            	<input type="text" name="direccion" class="form-control" value="{{$empresa->direccion}}" placeholder="Direccion...">
            </div>          
		</div>
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
            <div class="form-group">
            	<label for="descripcion">Telefono</label>
            	<input type="text" name="telefono" class="form-control" value="{{$empresa->telefono}}" placeholder="Telefono...">
            </div>
	          
		</div>
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
            <div class="form-group">
            	<label for="descripcion">Codigo Web</label>
            	<input type="number" name="codigo"  id="codweb" <?php if ($empresa->web == 0){ echo "disabled"; }   ?>  class="form-control" value="{{$empresa->codigo}}">
            </div>
	          
		</div> 
					<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
            <div class="form-group">
            	<label for="descripcion">Tasa ajuste</label>
            	<input type="number" name="tasaajuste" id="tespecial"  <?php if ($empresa->tespecial == 0){ echo "disabled"; }   ?> class="form-control" value="{{$empresa->tasaespecial}}">
            </div>
	          
		</div> 

		<div class="col-lg-6 col-sm-6 col-md-6 col-xs-6">
		
  <div class="card card-info">
            <div class="card-header">
              <h3 class="card-title">Opciones de Configuracion del Sistema</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body p-0">
              <table class="table">
                <thead>
                  <tr>
                    <th>SysVent@sWeb</th>
                
                    <th></th>
                  </tr>
                </thead>
                <tbody>

                  <tr>
                    <td>Actualizar Costo/Precio en Ajuste</td>
                 
                    <td class="text-right py-0 align-middle">
   <div class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success">
                      <input type="checkbox" name="actcosto" <?Php if($empresa->actcosto==1) echo "checked"; ?> class="custom-control-input" id="customSwitch1">
                      <label class="custom-control-label" for="customSwitch1"></label>
                    </div>
                    </td></tr>
                  <tr>
                    <td>Usa forma Libre</td>
                  
                    <td class="text-right py-0 align-middle">
   <div class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success">
                      <input type="checkbox" name="formal" <?Php if($empresa->fl==1) echo "checked"; ?> class="custom-control-input" id="customSwitch2">
                      <label class="custom-control-label" for="customSwitch2"></label>
                    </div>
                    </td>  </tr>
                  <tr>
                    <td>Maneja Tasa Espercial (Pesos)</td>
                  
                    <td class="text-right py-0 align-middle">
   <div class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success">
                      <input type="checkbox" name="tasaes" <?Php if($empresa->tespecial==1) echo "checked"; ?> class="custom-control-input" id="customSwitch3">
                      <label class="custom-control-label" for="customSwitch3"></label>
                    </div>
                    </td></tr>
					                  <tr>
                    <td>Maneja Tasa Diferencial (*Descuento por divisas %*)</td>
                  
                    <td class="text-right py-0 align-middle">
   <div class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success">
                      <input type="checkbox" name="tdif" <?Php if($empresa->tdif==1) echo "checked"; ?> class="custom-control-input" id="customSwitch1a">
                      <label class="custom-control-label" for="customSwitch1a"></label>
                    </div>
					<input type="number" name="tasadif" id="tasadif"  <?php if ($empresa->tdif == 0){ echo "disabled"; }   ?> class="form-control" value="{{$empresa->tasadif}}">
                    </td></tr>
                  <tr>
                    <td>Plataforma web</td>
             
                    <td class="text-right py-0 align-middle">
					<?php if ($rol->idrol == 1){  ?>
   <div class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success">
                      <input type="checkbox" name="web" <?Php if($empresa->web==1) echo "checked"; ?> class="custom-control-input" id="customSwitch4">
                      <label class="custom-control-label" for="customSwitch4"></label>
                    </div>
					<?php } ?>
                    </td></tr>
                  <tr>
                    <td>Usa Impresora de Tikect</td>
                 
                    <td class="text-right py-0 align-middle">
   <div class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success">
                      <input type="checkbox" name="tikect" <?Php if($empresa->tikect==1) echo "checked"; ?> class="custom-control-input" id="customSwitch5">
                      <label class="custom-control-label" for="customSwitch5"></label>
                    </div>
                    </td>
</tr>                  <tr>
                    <td>¿Usa Serie? <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"><input type="text" size="5" name="usaserie" id="usaserie"  <?php if ($empresa->usaserie == 0){ echo "disabled"; }   ?>  class="form-control" value="{{$empresa->serie}}">
					</div></td>     
                    <td class="text-right py-0 align-middle">
   <div class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success">
                      <input type="checkbox" name="serie" <?Php if($empresa->usaserie==1) echo "checked"; ?> class="custom-control-input" id="customSwitch6">
                      <label class="custom-control-label" for="customSwitch6"></label>
                    </div>
                    </td>
</tr>
                </tbody>
              </table>
            </div>
            <!-- /.card-body -->
          </div>
            </div>
    		<div class="col-lg-6 col-sm-6 col-md-6 col-xs-6">
		
  <div class="card card-info">
            <div class="card-header">
              <h3 class="card-title">Opciones de Configuracion del Sistema</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body p-0">
              <table class="table">
                <thead>
                  <tr>
                    <th>SysVent@sWeb</th>
                
                    <th></th>
                  </tr>
                </thead>
                <tbody>
				  <tr>
                    <td>Formato defecto de impresion
					</div></td>     
                    <td>
						<div class="form-group">
							<select name="formato" class="form-control">
							<option value="tcarta" <?php if($empresa->formatofac=="tcarta"){ echo "Selected";} ?>>Carta</option>
							<option value="tnotabs" <?php if($empresa->formatofac=="tnotabs"){ echo "Selected";} ?>>Nota Bs</option>
							<option value="tnotads" <?php if($empresa->formatofac=="tnotads"){ echo "Selected";} ?>>Nota $</option>
							<option value="recibo" <?php if($empresa->formatofac=="recibo"){ echo "Selected";} ?>>Tikect $</option>
							<option value="recibobs" <?php if($empresa->formatofac=="recibobs"){ echo "Selected";} ?>>Tikect Bs</option>
							</select>
										
						</div>
                    </td>
				</tr>
                 <tr>
                    <td>Lineas por Documento
					</div></td>     
                    <td>
				<input type="number" min="1" size="5" class="form-control" name="nlineas"  value="{{$empresa->nlineas}}">			   
                    </td>
				</tr>
				  <tr>
                    <td>Formato Lista de Precios
					</div></td>     
                    <td>
						<div class="form-group">
							<select name="formatolp" class="form-control">
							<option value="listaprecio" <?php if($empresa->formatolp=="listaprecio"){ echo "Selected";} ?>>formato 1</option>
							<option value="listaprecio2" <?php if($empresa->formatolp=="listaprecio2"){ echo "Selected";} ?>>formato 2</option>							
							</select>
										
						</div>
                    </td>
				</tr>
				<tr>
                    <td>¿Permitir Facturacion fiscal de ventas a credito?</td>
                 
                    <td class="text-right py-0 align-middle">
					<div class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success">
                      <input type="checkbox" name="facfiscalcre" <?Php if($empresa->facfiscalcredito==1) echo "checked"; ?> class="custom-control-input" id="customSwitch7">
                      <label class="custom-control-label" for="customSwitch7"></label>
                    </div>
                    </td>
				</tr> 
				<tr>
                    <td>¿Imprimir Relacion de Pedido en venta?</td>
                 
                    <td class="text-right py-0 align-middle">
					<div class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success">
                      <input type="checkbox" name="relapedido" <?Php if($empresa->relapedido==1) echo "checked"; ?> class="custom-control-input" id="customSwitch8">
                      <label class="custom-control-label" for="customSwitch8"></label>
                    </div>
                    </td>
				</tr>
				<tr>
                    <td>¿Imprimir Bordes de Tabla en Factura Forma Libre?</td>
                 
                    <td class="text-right py-0 align-middle">
					<div class="custom-control custom-switch custom-switch-off-danger custom-switch-on-success">
                      <input type="checkbox" name="bordefac" <?Php if($empresa->bordefac==1) echo "checked"; ?> class="custom-control-input" id="customSwitch9">
                      <label class="custom-control-label" for="customSwitch9"></label>
                    </div>
                    </td>
				</tr>
                </tbody>
              </table>
            </div>
            <!-- /.card-body -->
          </div>
            </div>    
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">	
            <div class="form-group">
				<button class="btn btn-danger btn-sm" id="btncancelar" type="reset">Cancelar</button>
            @if ($rol->idrol ==1)	<button class="btn btn-primary btn-sm" id="btnguardar" type="submit">Actualizar</button>
				@endif
				<div style="display: none" id="loading">  <img src="{{asset('img/sistema/loading30.gif')}}"></div>
            </div>	
		</div>
		</form>  
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
		$('#btncancelar').click(function(){   
			window.location="{{route('home')}}";
		})
$('#customSwitch4').on('change', function() {
   var dato= $(this).is(':checked');
 if (dato==true){
	 $("#codweb").removeAttr("disabled"); 
 }else{
	 $("#codweb").attr("disabled","true");	
 }
});
$('#customSwitch3').on('change', function() {
   var dato= $(this).is(':checked');
 if (dato==true){
	 $("#tespecial").val($("#tpeso").val());
	 $("#tespecial").removeAttr("disabled"); 
 }else{ 
 $("#tespecial").val("");
	 $("#tespecial").attr("disabled","true");	
 }
});
$('#customSwitch1a').on('change', function() {
   var dato= $(this).is(':checked');
 if (dato==true){
	 $("#tasadif").val(1);
	 $("#tasadif").removeAttr("disabled"); 
 }else{ 
 $("#tasadif").val(0);
	 $("#tasadif").attr("disabled","true");	
 }
});
$('#customSwitch6').on('change', function() {
   var dato= $(this).is(':checked');
 if (dato==true){
	 $("#usaserie").removeAttr("disabled"); 
 }else{
	 $("#usaserie").attr("disabled","true");	
 }
});

	   
	   });
	    function conMayusculas(field) {
            field.value = field.value.toUpperCase()
}
</script>
@endpush