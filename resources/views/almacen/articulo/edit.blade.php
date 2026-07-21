@extends ('layouts.master')
@section ('contenido')

	<div class="row">
    <div class="col-lg-9 col-md-8 col-sm-12">
        <h3>Editar artículo: {{ $articulo->nombre }} <span class="badge badge-info">Stock: {{ $articulo->stock }}</span></h3>
        
        @if (count($errors) > 0)
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <ul class="mb-0">
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
    </div>
    
    <div class="col-lg-3 col-md-4 col-sm-12 text-md-right mb-3">
        @if (($articulo->imagen) != "")
            <img src="{{ asset('img/articulos/'.$articulo->imagen) }}" class="img-thumbnail" width="100" height="80" alt="Imagen artículo">
        @endif
    </div>
</div>

<form action="{{ route('updatearticulo') }}" id="formulario" method="POST" enctype="multipart/form-data">       
    {{ csrf_field() }}

    <div class="card card-outline card-primary mb-4">
        <div class="card-header">
            <h3 class="card-title"><i class="fas fa-box mr-1"></i> Información General</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-sm-12">
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" name="nombre" id="nombre" onchange="conMayusculas(this)" required value="{{ $articulo->nombre }}" class="form-control" placeholder="Nombre...">
                        <input type="hidden" name="id" value="{{ $articulo->idarticulo }}">
                        <input type="hidden" id="relap" value="{{ $empresa->relaprecios }}">
                        <input type="hidden" id="difpre" value="{{ $empresa->difpre }}">
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <div class="form-group">
                        <label for="idcategoria">Categoría</label>
                        <select name="idcategoria" id="idcategoria" class="form-control selectpicker" data-live-search="true">
                            @foreach ($categorias as $cat)
                                <option value="{{ $cat->idcategoria }}_{{$cat->licor}}" {{ $cat->idcategoria == $articulo->idcategoria ? 'selected' : '' }}>
                                    {{ $cat->nombre }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">          
                    <div class="form-group">
                        <label for="codigo">Código</label>
                        <input type="text" name="codigo" required value="{{ $articulo->codigo }}" class="form-control">
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6"> 
                    <div class="form-group">
                        <label for="codweb">Cod. Web</label>          
                        <input type="text" name="codweb" id="cod2" value="{{ $articulo->codweb }}" placeholder="Barcode" class="form-control">                  
                    </div>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="form-group">
                        <label for="descripcion">Descripción</label>
                        <input type="text" name="descripcion" required value="{{ $articulo->descripcion }}" class="form-control" placeholder="Descripción corta..">
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="form-group">
                        <label for="imagen">Cambiar Imagen</label>
                        <input type="file" name="imagen" class="form-control">
                    </div>
                </div>
            </div>
        </div>
    </div>

 <div class="card card-outline card-secondary mb-4">
    <div class="card-header">
        <h3 class="card-title"><i class="fas fa-truck mr-1"></i> Logística y Empaque</h3>
    </div>
    <div class="card-body">
        <div class="row align-items-end mb-3">
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="form-group mb-lg-0">
                    <label for="fraccion">Fracción</label>
                    <input type="number" name="fraccion" min="0.1" step="0.1" required value="{{ $articulo->fraccion }}" class="form-control">
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="form-group mb-lg-0">
                    <label for="unidad">Unidad</label>                     
                    <select name="unidad" class="form-control">                                                 
                        <option value="UND" {{ $articulo->unidad == 'UND' ? 'selected' : '' }}>Unidad</option>
                        <option value="BTO" {{ $articulo->unidad == 'BTO' ? 'selected' : '' }}>Bulto</option>
                        <option value="SCO" {{ $articulo->unidad == 'SCO' ? 'selected' : '' }}>Saco</option>
                        <option value="CJA" {{ $articulo->unidad == 'CJA' ? 'selected' : '' }}>Caja</option>
                        <option value="KIT" {{ $articulo->unidad == 'KIT' ? 'selected' : '' }}>Kit</option>
                        <option value="KG"  {{ $articulo->unidad == 'kG'  ? 'selected' : '' }}>Kg</option>
                        <option value="DISP"{{ $articulo->unidad == 'DISP'? 'selected' : '' }}>Display</option>
                        <option value="PR"  {{ $articulo->unidad == 'PR'  ? 'selected' : '' }}>Par</option>
                        <option value="LTR" {{ $articulo->unidad == 'LTR' ? 'selected' : '' }}>Litros</option>      
                        <option value="MNG" {{ $articulo->unidad == 'MNG' ? 'selected' : '' }}>Manga</option>      
                        <option value="FDO" {{ $articulo->unidad == 'FDO' ? 'selected' : '' }}>Fardo</option>      
                    </select>               
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="form-group mb-lg-0">
                    <label for="cntxund">Cant x Und</label>
                    <input type="number" name="cntxund" min="1" value="{{ $articulo->cntxund }}" class="form-control">
                    <input type="hidden" name="stock" value="{{ $articulo->stock }}">
                    <input type="hidden" name="mutil" id="mutil" value="{{ $empresa->calc_util }}">
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="form-group mb-lg-0">
                    <label for="volumen">Volumen</label>
                    <input type="text" name="volumen" id="volumen" value="{{ $articulo->volumen }}" {{ $articulo->volumen == 0 ? 'disabled' : '' }} class="form-control" placeholder="Volumen...">
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6" style="display:none">
                <div class="form-group mb-lg-0">
                    <label for="grados">Grados</label>          
                    <input type="text" name="grados" value="{{ $articulo->grados }}" id="grados" {{ $articulo->grados == 0 ? 'disabled' : '' }} class="form-control" placeholder="Grados...">                  
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="form-group mb-lg-0">
                    <label for="peso">Peso Unidad (Kg)</label>          
                    <input type="number" name="peso" id="peso" required value="{{ $articulo->peso }}" min="0.01" step="0.01" class="form-control">                  
                </div>
            </div>
            <div class="col-lg-2 col-md-4 col-sm-6">
                <div class="form-group mb-lg-0">
                    <label for="cntgrupoold">Cnt. Grupo</label>          
                    <input type="number" name="cntgrupoold" id="cntgrupoold" required value="{{ $articulo->cntgrupo }}" min="1" class="form-control">                  
                </div>
            </div>
        </div>

        <hr class="my-3">

        <div class="row align-items-center">
            <div class="col-lg-2 col-md-4 col-sm-12">
                <div class="form-group mb-lg-0">
                    <label for="min" class="text-danger font-weight-bold"><i class="fas fa-exclamation-triangle"></i> Stock Mínimo Alerta</label>
                    <input type="number" name="min" min="0.1" step="0.1" required value="{{ $articulo->minimo }}" class="form-control border-danger">
                </div>
            </div>
              <div class="col-lg-2 col-md-4 col-sm-12">
                  <div class="form-group mb-lg-0">
                        <label for="vencimineto">
                            Vence <input type="checkbox" name="vencec" id="cbxv" {{ $articulo->vence != NULL ? 'checked value=1' : 'value=0' }}>
                        </label>
                        <input type="date" min="0.01" step="0.01" {{ $articulo->vence != NULL ? 'value='.$articulo->vence : 'value=0 disabled' }} id="vence" name="vence" class="form-control" placeholder="%">
                    </div>
            </div>
            <div class="col-lg-8 col-md-8 col-sm-12">
                <label class="d-block text-muted small uppercase font-weight-bold mb-2">Opciones de Control</label>
                <div class="card bg-light p-3 mb-0">
                    <div class="row">
                        <div class="col-xl-3 col-sm-6">
                            <div class="custom-control custom-switch switch-sm custom-switch-on-success custom-switch-off-danger my-1">
                                <input type="checkbox" name="serial" {{ $articulo->serial == 1 ? 'checked' : '' }} class="custom-control-input" id="customSwitch3">
                                <label class="custom-control-label small" for="customSwitch3">¿Usa Seriales?</label>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6">
                            <div class="custom-control custom-switch switch-sm custom-switch-on-success custom-switch-off-danger my-1">
                                <input type="checkbox" name="showlista" {{ $articulo->showlista == 1 ? 'checked' : '' }} class="custom-control-input" id="customSwitch4">
                                <label class="custom-control-label small" for="customSwitch4">¿Lista de Precios?</label>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6">
                            <div class="custom-control custom-switch switch-sm custom-switch-on-success custom-switch-off-danger my-1">
                                <input type="checkbox" name="showgroup" {{ $articulo->usagrupo == 1 ? 'checked' : '' }} class="custom-control-input" id="customSwitch5">
                                <label class="custom-control-label small" for="customSwitch5">¿Agrupado?</label>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6">
                            <div class="custom-control custom-switch switch-sm custom-switch-on-success custom-switch-off-danger my-1">
                                <input type="checkbox" name="oferta" {{ $articulo->oferta == 1 ? 'checked' : '' }} class="custom-control-input" id="customSwitch6">
                                <label class="custom-control-label small" for="customSwitch6">¿En Oferta?</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
    <div class="card card-outline card-success mb-4">
        <div class="card-header">
            <h3 class="card-title"><i class="fas fa-dollar-sign mr-1"></i> Costos, Utilidades y Precios</h3>
        </div>
        <div class="card-body">
            <div class="row align-items-end">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="form-group">
                        <label for="costo">Costo</label>
                        <input type="number" name="costo" step="0.01" class="form-control" id="costo" value="{{ $articulo->costo }}" placeholder="Costo">
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="form-group">
                        <label for="impuesto">Impuesto (IVA)</label>
                        <input type="text" value="{{ $articulo->iva }}" placeholder="Impuesto" name="impuesto" id="impuesto" class="form-control">
                    </div>
                </div>
                <div class="col-lg-6 col-md-4 col-sm-12">
                    <div class="form-group">
                        <label for="porcentaje">
                            Comisión % <input type="checkbox" name="comi" id="cbx1" {{ $articulo->comi == 1 ? 'checked value=1' : 'value=0' }}>
                        </label>
                        <input type="number" min="0.01" step="0.01" {{ $articulo->comi == 1 ? 'value='.$articulo->pcomision : 'value=0 disabled' }} id="porcentaje" name="porcentaje" class="form-control" placeholder="%">
                    </div>
                </div>
            </div>

            <hr>

            <div class="row text-center bg-light p-2 rounded">
                <div class="col-md-3 col-sm-6 border-right">
                    <div class="form-group">
                        <label class="text-primary font-weight-bold" for="utilidad">Utilidad 1</label>
                        <input type="number" name="utilidad" id="utilidad" class="form-control form-control-sm text-center" step="0.1" value="{{ $articulo->utilidad }}">
                    </div>
                    <div class="form-group">
                        <label class="text-primary font-weight-bold" for="precio1">Precio 1</label>
                        <input type="number" name="precio1" id="precio1" step="0.01" class="form-control form-control-sm text-center font-weight-bold" value="{{ $articulo->precio1 }}">
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 border-right">
                    <div class="form-group">
                        <label class="text-success font-weight-bold" for="util2">Utilidad 2</label>
                        <input type="number" value="{{ $articulo->util2 }}" name="util2" id="util2" step="0.01" class="form-control form-control-sm text-center">
                    </div>
                    <div class="form-group">
                        <label class="text-success font-weight-bold" for="precio2">Precio 2</label>
                        <input type="text" value="{{ $articulo->precio2 }}" name="precio2" step="0.01" id="precio2" class="form-control form-control-sm text-center font-weight-bold">
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 border-right">
                    <div class="form-group">
                        <label class="text-warning font-weight-bold" for="util3">Utilidad 3</label>
                        <input type="number" value="{{ $articulo->util3 }}" name="util3" id="util3" step="0.01" class="form-control form-control-sm text-center">
                    </div>
                    <div class="form-group">
                        <label class="text-warning font-weight-bold" for="precio3">Precio 3</label>
                        <input type="text" value="{{ $articulo->precio3 }}" name="precio3" step="0.01" id="precio3" class="form-control form-control-sm text-center font-weight-bold">
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="form-group">
                        <label class="text-purple font-weight-bold" style="color: #6f42c1" for="utilvip">Util. VIP</label>
                        <input type="number" value="{{ $articulo->utilvip }}" name="utilvip" id="utilvip" step="0.01" class="form-control form-control-sm text-center">
                    </div>
                    <div class="form-group">
                        <label class="text-purple font-weight-bold" style="color: #6f42c1" for="pvip">Pre. VIP</label>
                        <input type="text" value="{{ $articulo->pvip }}" name="pvip" step="0.01" id="pvip" class="form-control form-control-sm text-center font-weight-bold">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card card-outline card-warning mb-4" id="tagrupado" {{ $articulo->usagrupo == 0 ? "style=display:none" : "" }}>
        <div class="card-header">
            <h3 class="card-title"><i class="fas fa-layer-group mr-1"></i> Detalles del Grupo</h3>
        </div>
        <div class="card-body p-0">
            <table id="detalles" class="table table-striped table-bordered table-valign-middle mb-0">
                <thead style="background-color: #f4f6f9">
                    <tr>
                        <th>Nombre Grupo</th>
                        <th>Cant Unid.</th>
                        <th>Util 1</th>         
                        <th>Precio 1</th>
                        <th>Util 2</th>         
                        <th>Precio 2</th>                               
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="text" name="pngrupo" id="pngrupo" class="form-control form-control-sm" value="{{ $articulo->usagrupo == 1 ? $agrupado->descripcion : '' }}"></td>
                        <td><input type="number" name="pcntgrupo" id="pcntgrupo" class="form-control form-control-sm" value="{{ $articulo->usagrupo == 1 ? $agrupado->cantidad : '' }}"></td>
                        <td><input type="number" name="utilgrupo" id="utilgrupo" class="form-control form-control-sm" value="{{ $articulo->usagrupo == 1 ? $agrupado->utilidad : '' }}"></td>          
                        <td><input type="number" name="ppreciogrupo" id="ppreciogrupo" class="form-control form-control-sm" value="{{ $articulo->usagrupo == 1 ? $agrupado->precio1 : '' }}"></td>
                        <td><input type="number" name="util2grupo" id="util2grupo" class="form-control form-control-sm" value="{{ $articulo->usagrupo == 1 ? $agrupado->util2 : '' }}"></td>         
                        <td><input type="number" name="pprecio2grupo" id="pprecio2grupo" class="form-control form-control-sm" value="{{ $articulo->usagrupo == 1 ? $agrupado->precio2 : '' }}"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>  

    <div class="form-group text-center my-4">
        <button class="btn btn-primary px-4 mr-2" type="button" id="btnguardar">
            <i class="fas fa-save mr-1"></i> Guardar Cambios
        </button>
        <button class="btn btn-secondary px-4" type="reset" id="btncancelar">
            Cancelar
        </button>
        <div style="display: none" id="loading" class="mt-2">  
            <img src="{{ asset('img/sistema/loading30.gif') }}" alt="Cargando...">
        </div>
    </div>
</form>
       @push('scripts')
      <script>
$(document).ready(function(){
	var nuevo=$("#nombre").val();
	var pin2=nuevo.replace('-','/');
	$("#nombre").val(pin2);
	  
$("#costo").change(calculo); 
$("#costo").change(calculo2); 
$("#costo").change(calculo3); 
$("#costo").change(calculovip); 
$("#utilidad").change(calculo); 
$("#impuesto").change(calculo); 
$("#util2").change(calculo2); 
$("#util3").change(calculo3); 
$("#utilvip").change(calculovip); 
$("#precio1").change(reverso); 
$("#precio2").change(reverso2); 
$("#precio3").change(reverso3); 
$("#pvip").change(reversovip); 
//delgrupo
$("#utilgrupo").change(calculogrp);
$("#ppreciogrupo").change(reversogrp); 
$("#util2grupo").change(calculo2grp);
$("#pprecio2grupo").change(reverso2grp);

		 $('#btnguardar').click(function(){   
		document.getElementById('loading').style.display=""; 
		document.getElementById('btnguardar').style.display="none"; 
		document.getElementById('btncancelar').style.display="none"; 
		document.getElementById('formulario').submit(); 
		});
		$("#idcategoria").on("change",function(){	
	var dato=document.getElementById('idcategoria').value.split('_');	//alert(dato[1]);
	if(dato[1]==1){
		$("#volumen").removeAttr("disabled");  
		$("#grados").removeAttr("disabled"); 
	} else{
			$("#volumen").val(0);
			$("#grados").val(0);
		$("#volumen").attr("disabled","true");	
		$("#grados").attr("disabled","true");  
	}		
	});
		$("#cbx1").click(function() {
       if ($(this).is(":checked")){
        $("#cbx1").val(1);
		$("#porcentaje").attr("disabled",false);
		$("#porcentaje").focus();
       } else {
         $("#cbx1").val(0);
		$("#porcentaje").val(0);
		 $("#porcentaje").attr("disabled",true);
		 $("#cntgrupo").focus();
       }

   });	
   		$("#cbxv").click(function() {
       if ($(this).is(":checked")){
        $("#cbxv").val(1);
		$("#vence").attr("disabled",false);
		$("#vence").focus();
       } else {
         $("#cbxv").val(0);
		$("#vence").val(0);
		 $("#vence").attr("disabled",true);
       }

   });	
   $("#customSwitch5").click(function() {
       if ($(this).is(":checked")){
		document.getElementById('tagrupado').style.display=""; 
       } else {
		 	document.getElementById('tagrupado').style.display="none";
       }
   });
})
	 $('#btncancelar').click(function(){  
	   window.location="{{route('articulos')}}";
	 })

function trunc (x, posiciones = 0) {
  var s = x.toString()
  var l = s.length
  var decimalLength = s.indexOf('.') + 1
  var numStr = s.substr(0, decimalLength + posiciones)
  return Number(numStr)
}

      function calculo(){
       $("#precio1").val("");
      var mutil= $("#mutil").val();
      var  p1 =0;
      var costo= $("#costo").val();
      var impuesto= $("#impuesto").val();
      var utilidad= $("#utilidad").val();
        p1=parseFloat((utilidad/100));
		if(mutil==1){
        p2=parseFloat(costo) + parseFloat(p1*costo);
		}else{
			 if(utilidad==100){ alert('Metodo de Utilidad no Permite 100%');
			$("#utilidad").val(0);	$("#precio1").val(0);	$("#utilidad").focus();		 }else{
			 p2=(costo/((100-utilidad)/100));}
		}
        iva=p2*(impuesto/100);
        pt=(parseFloat(p2)+parseFloat(iva));
		pt=trunc(pt,2);
      $("#precio1").val(pt);
		 if ($("#customSwitch5").is(":checked")){
			 calculogrp();
			 calculo2grp();
		}
      }
      function calculo2(){
      $("#precio2").val("");
	   var mutil= $("#mutil").val();
      var  p1 =0;
      var costo= $("#costo").val();
      var impuesto= $("#impuesto").val();
      var utilidad= $("#util2").val();
        p1=parseFloat((utilidad/100));
       	if(mutil==1){
        p2=parseFloat(costo) + parseFloat(p1*costo);
		}else{  if(utilidad==100){ alert('Metodo de Utilidad no Permite 100%');
			$("#util2").val(0);		$("#precio2").val(0);$("#util2").focus();		 }else{
			p2=(costo/((100-utilidad)/100)); }
		}
        iva=p2*(impuesto/100);
        pt=(parseFloat(p2)+parseFloat(iva));
		pt=trunc(pt,2);
      $("#precio2").val(pt);
	   if ($("#customSwitch5").is(":checked")){
			 calculogrp();
			 calculo2grp();
		}
      } 
	function calculo3(){
      $("#precio3").val("");
	  var mutil= $("#mutil").val();
      var  p1 =0;
      var costo= $("#costo").val();
      var impuesto= $("#impuesto").val();
      var utilidad= $("#util3").val();
        p1=parseFloat((utilidad/100));
		if(mutil==1){
        p2=parseFloat(costo) + parseFloat(p1*costo);
		}else{
		p2=(costo/((100-utilidad)/100));
		}
        iva=p2*(impuesto/100);
        pt=(parseFloat(p2)+parseFloat(iva));
		pt=trunc(pt,2);
      $("#precio3").val(pt);
      } 
	  	function calculovip(){
      $("#pvip").val("");
	  var mutil= $("#mutil").val();
      var  p1 =0;
      var costo= $("#costo").val();
      var impuesto= $("#impuesto").val();
      var utilidad= $("#utilvip").val();
	  if(utilidad>0){
        p1=parseFloat((utilidad/100));
		if(mutil==1){
        p2=parseFloat(costo) + parseFloat(p1*costo);
		}else{
		p2=(costo/((100-utilidad)/100));
		}
        iva=p2*(impuesto/100);
        pt=(parseFloat(p2)+parseFloat(iva));
		pt=trunc(pt,2);
      $("#pvip").val(pt);
	  }else{
		   $("#utilvip").val(0); 
		   $("#pvip").val(0); 
	   }
      } 
          function reverso(){
        var  p30 =0;  
		p30= $("#precio1").val();
		var mutil= $("#mutil").val();
		var costo= $("#costo").val();
		var utilidad= $("#impuesto").val();       
		var    p31=parseFloat((utilidad/100));  
		if(mutil==1){
		var    p32=parseFloat(costo) + parseFloat(p31*costo);     
        iva=(p30/p32);
        var util=((iva-1)*100);
        pt=(parseFloat(util));
		}else{
		var  p32=parseFloat(costo) + parseFloat(p31*costo);    
		util=(100-((p32*100)/p30));
		 pt=(parseFloat(util));
		}
        var nv=(new Intl.NumberFormat("de-DE", {style:  "decimal", decimal: "2"}).format(pt));
		nv=trunc(pt,2);
      $("#utilidad").val(parseFloat(nv));
	  //
	  var rela= $("#relap").val();
	    if(rela==1){
		var difpre= $("#difpre").val();
			pre1= $("#precio1").val();
		var    pre2=parseFloat((pre1*((difpre/100)+1))); 
		pt=trunc(pre2,2);
		$("#precio2").val(pt);
		nutil2 =trunc((((pt-p32)/pt)*100),2)
		  $("#util2").val(nutil2);
		}
      }
        function reverso2(){
        var  p302 =0;  
       p302= $("#precio2").val();
	   var mutil= $("#mutil").val();
      var costo= $("#costo").val();
      var utilidad= $("#impuesto").val();       
    var    p312=parseFloat((utilidad/100)); 
	if(mutil==1){		
    var    p322=parseFloat(costo) + parseFloat(p312*costo);     
        iva=(p302/p322);
        var util2=((iva-1)*100);
        pt2=(parseFloat(util2));
		}else{
		var  p322=parseFloat(costo) + parseFloat(p312*costo);    
		util2=(100-((p322*100)/p302));
		 pt2=(parseFloat(util2));
		}
        var nv=(new Intl.NumberFormat("de-DE", {style:  "decimal", decimal: "2"}).format(pt2));
  //      alert(nv2);
  nv2=trunc(nv,2)
      $("#util2").val(parseFloat(nv2));
      }
	function reverso3(){
        var  p302 =0;  
       p302= $("#precio3").val();
	    var mutil= $("#mutil").val();
      var costo= $("#costo").val();
      var utilidad= $("#impuesto").val();       
    var    p312=parseFloat((utilidad/100));  
	if(mutil==1){	
    var    p322=parseFloat(costo) + parseFloat(p312*costo);     
        iva=(p302/p322);
        var util2=((iva-1)*100);
		  pt2=(parseFloat(util2));
		  	}else{
		var  p32=parseFloat(costo) + parseFloat(p312*costo);    
		util=(100-((p32*100)/p302));
		 pt2=(parseFloat(util));
		}
        var nv2=(new Intl.NumberFormat("de-DE", {style:  "decimal", decimal: "2"}).format(pt2));      
      $("#util3").val(parseFloat(nv2));
      }
	  	function reversovip(){
        var  p302 =0;  
       p302= $("#pvip").val();
	   if(p302>0){
	    var mutil= $("#mutil").val();
      var costo= $("#costo").val();
      var utilidad= $("#impuesto").val();       
    var    p312=parseFloat((utilidad/100));  
	if(mutil==1){	
    var    p322=parseFloat(costo) + parseFloat(p312*costo);     
        iva=(p302/p322);
        var util2=((iva-1)*100);
		  pt2=(parseFloat(util2));
		  	}else{
		var  p32=parseFloat(costo) + parseFloat(p312*costo);    
		util=(100-((p32*100)/p302));
		 pt2=(parseFloat(util));
		}
        var nv2=(new Intl.NumberFormat("de-DE", {style:  "decimal", decimal: "2"}).format(pt2));      
      $("#utilvip").val(parseFloat(nv2));	
	   }else{
		   $("#utilvip").val(0); 
		   $("#pvip").val(0); 
	   }	  
      }
	function conMayusculas(field) {
            field.value = field.value.toUpperCase()
	}
	//de el agrupado
		function calculogrp(){
      $("#ppreciogrupo").val("");
	  var mutil= $("#mutil").val();
    	var  p1 =0;
		var ctound=$("#costo").val();
		var cntgrp=$("#pcntgrupo").val();
    	var costo= ctound*cntgrp;
    	var impuesto= $("#impuesto").val();
    	var utilidad= $("#utilgrupo").val();
        p1=parseFloat((utilidad/100));
       if(mutil==1){
        p2=parseFloat(costo) + parseFloat(p1*costo);
		}else{
		p2=(costo/((100-utilidad)/100));
		}
        iva=p2*(impuesto/100);
        pt=(parseFloat(p2)+parseFloat(iva));
    	$("#ppreciogrupo").val(pt.toFixed(2));
	}
		function reversogrp(){
				
        var  p30 =0;  
		var mutil= $("#mutil").val();
        p30= $("#ppreciogrupo").val();
		var ctound=$("#costo").val();
		var cntgrp=$("#pcntgrupo").val();
    	var costo= ctound*cntgrp;
		var utilidad= $("#impuesto").val();       
		var    p31=parseFloat((utilidad/100));  
		if(mutil==1){
		var    p32=parseFloat(costo) + parseFloat(p31*costo);     
        iva=(p30/p32);
        var util=((iva-1)*100);
        pt=(parseFloat(util));
		}else{
		var  p32=parseFloat(costo) + parseFloat(p31*costo);    
		util=(100-((p32*100)/p30));
		 pt=(parseFloat(util));
		}
        var nv=(new Intl.NumberFormat("de-DE", {style:  "decimal", decimal: "2"}).format(pt));
      $("#utilgrupo").val(parseFloat(nv));
	}
		function calculo2grp(){
      $("#pprecio2grupo").val("");
	   var mutil= $("#mutil").val();
      var  p1 =0;
     var ctound=$("#costo").val();
		var cntgrp=$("#pcntgrupo").val();
    	var costo= ctound*cntgrp;
      var impuesto= $("#impuesto").val();
      var utilidad= $("#util2grupo").val();
        p1=parseFloat((utilidad/100));
         	if(mutil==1){
        p2=parseFloat(costo) + parseFloat(p1*costo);
		}else{
		p2=(costo/((100-utilidad)/100));
		}
        iva=p2*(impuesto/100);
        pt=(parseFloat(p2)+parseFloat(iva));
      $("#pprecio2grupo").val(pt.toFixed(2));
	}
	function reverso2grp(){
        var  p30 =0;  
		var mutil= $("#mutil").val();
       p30= $("#pprecio2grupo").val();
		 var ctound=$("#costo").val();
		var cntgrp=$("#pcntgrupo").val();
    	var costo= ctound*cntgrp;
		var utilidad= $("#impuesto").val();       
		var    p31=parseFloat((utilidad/100));  
		if(mutil==1){
		var    p32=parseFloat(costo) + parseFloat(p31*costo);     
        iva=(p30/p32);
        var util=((iva-1)*100);
        pt=(parseFloat(util));
		}else{
		var  p32=parseFloat(costo) + parseFloat(p31*costo);    
		util=(100-((p32*100)/p30));
		 pt=(parseFloat(util));
		}
        var nv=(new Intl.NumberFormat("de-DE", {style:  "decimal", decimal: "2"}).format(pt));
  //      alert(nv);
      $("#util2grupo").val(parseFloat(nv));
	}
    </script>
      @endpush
@endsection