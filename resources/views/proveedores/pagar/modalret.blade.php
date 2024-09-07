	<div class="modal fade" id="modalret{{$cat->idingreso}}">
		<form action="{{route('retcompra')}}" method="get" id="formularioret" enctype="multipart/form-data" >    	
        <div class="modal-dialog">
          <div class="modal-content bg-secondary">
            <div class="modal-header">
              <h5 class="modal-title">Generar Retencion en Compras:  Doc -> {{$cat->num_comprobante}}</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
			<div class="row">
				<div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
					<p>		<label>Tipo de Retencion</label>	<select name="idretenc" id="idretenc{{$cat->idingreso}}" class="form-control">
						<option value="0">Seleccione...</option>
            				@foreach ($retenc as $re)<?php if($re->beneficiar==$proveedor->tpersona){?>
            				<option value="{{$re->codigo}}_{{$re->ret}}_{{$re->afiva}}">{{$re->descrip}}</option><?php } ?>
            				@endforeach							
						</select>
					</p>
				</div>
				<div class="col-lg-3 col-sm-3 col-md-3 col-xs-3">
            		 <div class="form-group">
            			<label for="nombre">M.Fac</label>
            			<input type="text" name="mfac" id="mfac{{$cat->idingreso}}" required value="{{$cat->total*$cat->tasa}}"  class="form-control">
            		</div>
            	</div>
				<div class="col-lg-3 col-sm-3 col-md-3 col-xs-3">
            		 <div class="form-group">
            			<label for="nombre">Base</label>
            			<input type="text" name="mbase" id="mbase{{$cat->idingreso}}" required value="{{$cat->base*$cat->tasa}}"  class="form-control">
            		</div>
            	</div>
				<div class="col-lg-3 col-sm-3 col-md-3 col-xs-3">
            		 <div class="form-group">
            			<label for="nombre">Iva</label>
            			<input type="text" name="miva" id="miva{{$cat->idingreso}}" required value="{{$cat->miva*$cat->tasa}}"  class="form-control">
            		</div>
            	</div>
				<div class="col-lg-3 col-sm-3 col-md-3 col-xs-3">
            		 <div class="form-group">
            			<label for="nombre">Exento</label>
            			<input type="text" name="mexen" id="mexen{{$cat->idingreso}}" required value="{{$cat->exento*$cat->tasa}}"  class="form-control">
            		</div>
            	</div>

					<div class="col-lg-6 col-sm-6 col-md-6 col-xs-6">
                 		 <div class="form-group">
            			<label>Monto retencion</label>
					<input type="number" id="mret{{$cat->idingreso}}" name="mret" step="0.0001" class="form-control"></input>
					<input type="hidden" id="tasafac{{$cat->idingreso}}" name="tasafac" value="{{$cat->tasa}}" class="form-control"></input>
					<input type="hidden" id="factura{{$cat->idingreso}}" name="factura" value="{{$cat->idingreso}}" class="form-control"></input>
					<input type="hidden" name="idp" value="{{$proveedor->idproveedor}}" class="form-control"></input>
					<input type="hidden" name="docu" value="{{ $cat->serie_comprobante}}" class="form-control"></input>
            		</div>
            	</div>			
				<div class="col-lg-6 col-sm-6 col-md-6 col-xs-6">
            		 <div class="form-group">
            			<label for="nombre">$ Retencion</label>
            			<input type="number" name="mretd" id="mretd{{$cat->idingreso}}" step="0.0001" value=""  class="form-control">
            		</div>
            	</div>

            	</div>
			</div>
            <div class="modal-footer justify-content-between">
              <button type="button"  id="closeret{{$cat->idingreso}}" class="btn btn-outline-light" data-dismiss="modal">Cerrar</button>
              <button type="submit" id="sendretf{{$cat->idingreso}}"  class="btn btn-outline-light">Confirmar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
	</div>
	</form>
@push ('scripts')

<script>
$(document).ready(function(){
		document.getElementById('sendretf<?php echo  $cat->idingreso; ?>').style.display="none"; 
		$('#idretenc<?php echo  $cat->idingreso; ?>').on("change",function(){			
		var iva=$("#miva<?php echo  $cat->idingreso; ?>").val();
		var base= $("#mbase<?php echo  $cat->idingreso; ?>").val();
		retencion= $("#idretenc<?php echo  $cat->idingreso; ?>").val();
		tm=retencion.split('_');
		  prete=tm[1];
		  apiva=tm[2];
		  if(apiva==1){ tret=(iva*(prete/100));
		 $("#mret<?php echo  $cat->idingreso; ?>").val(tret);
		 $("#mretd<?php echo  $cat->idingreso; ?>").val(tret/$("#tasafac<?php echo  $cat->idingreso; ?>").val());
		 }else{ 
			tret=(base*(prete/100));
			$("#mret<?php echo  $cat->idingreso; ?>").val(tret);
			$("#mretd<?php echo  $cat->idingreso; ?>").val(tret/$("#tasafac<?php echo  $cat->idingreso; ?>").val());
		 }
		 			document.getElementById('sendretf<?php echo  $cat->idingreso; ?>').style.display=""; 
			});
			$('#closeret<?php echo  $cat->idingreso; ?>').on("click",function(){
			$("#mret<?php echo  $cat->idingreso; ?>").val(0);
			$("#mretd<?php echo  $cat->idingreso; ?>").val(0);
			document.getElementById('sendretf<?php echo  $cat->idingreso; ?>').style.display="none"; 
			});
});
</script>
@endpush