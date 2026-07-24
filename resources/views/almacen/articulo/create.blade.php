@extends ('layouts.master')
@section ('contenido')
<?php
$ceros=5; $cntcat=0;
function add_ceros($numero,$ceros) {
	$numero=$numero+1;
	$digitos=strlen($numero);
	$recibo="";
		for ($i=0;$i<5-$digitos;$i++){
			$recibo=$recibo."0";
		}
return $insertar_ceros = $recibo.$numero;
};
$cntcat=count($categorias);
$idv=0;
?>  
	<div class="row mb-3">
    <div class="col-lg-12">
        <h3>Nuevo Artículo</h3>
        <input type="hidden" name="cnt" id="cnt" value="{{ $cnt <> NULL ? add_ceros($cnt->idarticulo, $ceros) : add_ceros(0, $ceros) }}">
    </div>
</div>

<form action="{{ route('guardararticulo') }}" method="POST" id="formulario" enctype="multipart/form-data">         
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
                        <input type="text" name="nombre" id="nombre" required value="{{ old('nombre') }}" onchange="conMayusculas(this)" class="form-control" placeholder="Nombre...">
                        @if($errors->has('nombre'))
                            <small class="text-danger font-weight-bold d-block mt-1">{{ $errors->first('nombre') }}</small>
                        @endif
                    </div>
                    <input type="hidden" name="mutil" id="mutil" required value="{{ $empresa->calc_util }}">
                </div>
                
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <div class="form-group">
                        <label>Categoría</label> 
                        @if(isset($cntcat) && $cntcat == 0)
                            <span class="d-block small"><a href="{{ route('newcategoria') }}" class="text-danger font-weight-bold"><i class="fas fa-exclamation-circle"></i> ¡Debe Registrar Categoría!</a></span>
                        @endif
                        <select name="idcategoria" id="idcategoria" class="form-control selectpicker" data-live-search="true">
                            @foreach ($categorias as $cat)
                                <option value="{{ $cat->idcategoria }}_{{ $cat->licor }}">{{ $cat->nombre }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="col-lg-2 col-md-4 col-sm-6">
                    <div class="form-group">
                        <label for="codigo">Código <i class="fa fa-fw fa-exchange text-primary" style="cursor:pointer;" title="Generar Código" id="generar"></i></label>
                        <input type="text" name="codigo" id="codigo" required value="{{ old('codigo') }}" class="form-control" placeholder="Código...">
                        @if($errors->has('codigo'))
                            <small class="text-danger font-weight-bold d-block mt-1">{{ $errors->first('codigo') }}</small>
                        @endif
                    </div>
                </div>

                <div class="col-lg-2 col-md-4 col-sm-6"> 
                    <div class="form-group">
                        <label for="codweb">Cod. Web</label>          
                        <input type="text" name="codweb" id="cod2" placeholder="Barcode" class="form-control">                  
                    </div>
                </div>

                <div class="col-lg-4 col-md-12">
                    <div class="form-group">
                        <label for="descripcion">Descripción</label>
                        <input type="text" name="descripcion" required value="{{ old('descripcion') }}" class="form-control" placeholder="Descripción corta o detallada del producto..">
                    </div>
                </div>
			<div class="col-lg-4 col-md-4 col-sm-6"> 
                    <div class="form-group">
                        <label for="codweb">Etiquetas</label>          
                        <input type="text" name="etiqueta"value="{{ old('etiqueta') }}" placeholder="Etiqueta para Catalogo" class="form-control">                  
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="form-group">
                        <label for="imagen">Imagen del Artículo</label>
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
                        <input type="number" name="fraccion" min="0.1" step="0.1" required value="{{ old('fraccion', '1') }}" class="form-control" placeholder="1, 0.25, 0.5">
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <div class="form-group mb-lg-0">
                        <label for="unidad">Unidad</label>  
                        <select name="unidad" class="form-control">                                             
                            <option value="UND">Unidad</option>
                            <option value="BTO">Bulto</option>
                            <option value="SCO">Saco</option>
                            <option value="CJA">Caja</option>
                            <option value="KIT">Kit</option>
                            <option value="kg">Kg</option>
                            <option value="DISP">Display</option>
                            <option value="PR">Par</option>
                            <option value="LTR">Litros</option>                                     
                            <option value="MNG">Manga</option>                                     
                            <option value="FDO">Fardo</option>                                     
                        </select>                               
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <div class="form-group mb-lg-0">
                        <label for="cntxund">Cant x Und</label>
                        <input type="number" name="cntxund" min="1" value="1" class="form-control">
                        <input type="hidden" name="stock" value="0">
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <div class="form-group mb-lg-0">
                        <label for="volumen">Volumen</label>
                        <input type="text" name="volumen" id="volumen" disabled value="0" class="form-control" placeholder="Volumen...">
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6" style="display:none">
                    <div class="form-group mb-lg-0">
                        <label for="grados">Grados</label>          
                        <input type="text" name="grados" value="{{ old('grados') }}" id="grados" disabled class="form-control" placeholder="Grados...">                  
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <div class="form-group mb-lg-0">
                        <label for="peso">Peso Unidad (Kg)</label>          
                        <input type="number" name="peso" id="peso" required value="0" min="0.01" step="0.01" class="form-control">                  
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 col-sm-6">
                    <div class="form-group mb-lg-0">
                        <label for="cntgrupoold">Cnt. Grupo</label>          
                        <input type="number" name="cntgrupoold" required value="1" min="1" class="form-control">                  
                    </div>
                </div>
            </div>

            <hr class="my-3">

            <div class="row align-items-center">
                <div class="col-lg-3 col-md-4 col-sm-12">
                    <div class="form-group mb-lg-0">
                        <label for="min" class="text-danger font-weight-bold"><i class="fas fa-exclamation-triangle"></i> Stock Mín. Alerta</label>
                        <input type="number" name="min" min="0.1" step="0.1" required value="0" class="form-control border-danger">
                    </div>
                </div>
                
                <div class="col-lg-9 col-md-8 col-sm-12">
                    <label class="d-block text-muted small uppercase font-weight-bold mb-2">Opciones de Control</label>
                    <div class="card bg-light p-3 mb-0">
                        <div class="row">
                            <div class="col-xl-3 col-sm-6">
                                <div class="custom-control custom-switch switch-sm custom-switch-on-success custom-switch-off-danger my-1">
                                    <input type="checkbox" name="serial" class="custom-control-input" id="customSwitch3">
                                    <label class="custom-control-label small" for="customSwitch3">¿Usa Seriales?</label>
                                </div>
                            </div>
                            <div class="col-xl-3 col-sm-6">
                                <div class="custom-control custom-switch switch-sm custom-switch-on-success custom-switch-off-danger my-1">
                                    <input type="checkbox" name="showlista" class="custom-control-input" id="customSwitch4">
                                    <label class="custom-control-label small" for="customSwitch4">¿Lista de Precios?</label>
                                </div>
                            </div>
                            <div class="col-xl-3 col-sm-6">
                                <div class="custom-control custom-switch switch-sm custom-switch-on-success custom-switch-off-danger my-1">
                                    <input type="checkbox" name="showgroup" class="custom-control-input" id="customSwitch5">
                                    <label class="custom-control-label small" for="customSwitch5">¿Agrupado?</label>
                                </div>
                            </div>
                            <div class="col-xl-3 col-sm-6">
                                <div class="custom-control custom-switch switch-sm custom-switch-on-success custom-switch-off-danger my-1">
                                    <input type="checkbox" name="oferta" class="custom-control-input" id="customSwitch6">
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
                        <input type="number" min="0.01" step="0.01" name="costo" value="{{ old('costo') }}" class="form-control" id="costo" placeholder="Costo">
                        @if($errors->has('costo'))
                            <small class="text-danger font-weight-bold d-block mt-1">{{ $errors->first('costo') }}</small>
                        @endif
                    </div>        
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="form-group">
                        <label for="impuesto">Impuesto</label>
                        <input type="text" value="{{ old('impuesto') }}" placeholder="Impuesto" name="impuesto" id="impuesto" class="form-control">
                        @if($errors->has('impuesto'))
                            <small class="text-danger font-weight-bold d-block mt-1">{{ $errors->first('impuesto') }}</small>
                        @endif
                    </div>       
                </div>
                <div class="col-lg-6 col-md-4 col-sm-12">
                    <div class="form-group">
                        <label for="porcentaje">Comisión <input type="checkbox" name="comi" id="cbx1" value="0"> %</label>
                        <input type="number" min="0.01" step="0.01" disabled value="0" id="porcentaje" name="porcentaje" class="form-control" placeholder="%">
                    </div>         
                </div>
            </div>

            <hr>

            <div class="row text-center bg-light p-2 rounded">
                <div class="col-md-3 col-sm-6 border-right">
                    <div class="form-group">
                        <label class="text-primary font-weight-bold" for="utilidad">Utilidad 1</label>
                        <input type="text" name="utilidad" id="utilidad" onchange="calculo();" class="form-control form-control-sm text-center" value="{{ old('utilidad') }}" placeholder="% Utilidad">
                        @if($errors->has('utilidad')) <small class="text-danger small d-block">{{ $errors->first('utilidad') }}</small> @endif
                    </div>
                    <div class="form-group">
                        <label class="text-primary font-weight-bold" for="precio1">Precio 1</label>
                        <input type="text" name="precio1" id="precio1" class="form-control form-control-sm text-center font-weight-bold" value="{{ old('precio1') }}" placeholder="Precio">
                        @if($errors->has('precio1')) <small class="text-danger small d-block">{{ $errors->first('precio1') }}</small> @endif
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 border-right">
                    <div class="form-group">
                        <label class="text-success font-weight-bold" for="util2">Utilidad 2</label>
                        <input type="text" name="util2" id="util2" placeholder="% Utilidad" class="form-control form-control-sm text-center">
                    </div>
                    <div class="form-group">
                        <label class="text-success font-weight-bold" for="precio2">Precio 2</label>
                        <input type="text" name="precio2" id="precio2" placeholder="Precio 2" class="form-control form-control-sm text-center font-weight-bold">
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 border-right">
                    <div class="form-group">
                        <label class="text-warning font-weight-bold" for="util3">Utilidad 3</label>
                        <input type="number" name="util3" id="util3" placeholder="% Utilidad" step="0.01" class="form-control form-control-sm text-center">
                    </div>
                    <div class="form-group">
                        <label class="text-warning font-weight-bold" for="precio3">Precio 3</label>
                        <input type="text" name="precio3" id="precio3" placeholder="Precio 3" step="0.01" class="form-control form-control-sm text-center font-weight-bold">
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="form-group">
                        <label class="text-purple font-weight-bold" style="color: #6f42c1" for="utilvip">Util. VIP</label>
                        <input type="number" name="utilvip" id="utilvip" step="0.01" placeholder="% VIP" class="form-control form-control-sm text-center">
                    </div>
                    <div class="form-group">
                        <label class="text-purple font-weight-bold" style="color: #6f42c1" for="pvip">Pre. VIP</label>
                        <input type="text" name="pvip" id="pvip" step="0.01" placeholder="Precio VIP" class="form-control form-control-sm text-center font-weight-bold">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card card-outline card-warning mb-4" id="tagrupado" style="display:none">
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
                        <td><input type="text" name="pngrupo" id="pngrupo" class="form-control form-control-sm" placeholder="Nombre grupo"></td>
                        <td><input type="number" name="pcntgrupo" id="pcntgrupo" class="form-control form-control-sm" placeholder="Cantidad"></td>
                        <td><input type="number" name="utilgrupo" id="utilgrupo" class="form-control form-control-sm" placeholder="Utilidad"></td>          
                        <td><input type="number" name="ppreciogrupo" id="ppreciogrupo" class="form-control form-control-sm" placeholder="Precio"></td>
                        <td><input type="number" name="util2grupo" id="util2grupo" class="form-control form-control-sm" placeholder="Utilidad"></td>         
                        <td><input type="number" name="pprecio2grupo" id="pprecio2grupo" class="form-control form-control-sm" placeholder="Precio"></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>  

    <div class="form-group text-center my-4" @if(isset($cntcat) && $cntcat == 0) style="display: none" @endif>
        <button class="btn btn-secondary px-4 mr-2" type="reset" id="btncancelar">Cancelar</button>
        <button class="btn btn-primary px-4" type="button" id="btnguardar"><i class="fas fa-save mr-1"></i> Guardar Artículo</button>
        <div style="display: none" id="loading" class="mt-2">  
            <img src="{{ asset('img/sistema/loading30.gif') }}" alt="Cargando...">
        </div>  
    </div>
    
</form>
            </form>	 	
            @push('scripts')
			<script>
$(document).ready(function(){
	const switchElement = document.getElementById('customSwitch4');
	switchElement.checked = !switchElement.checked;

      $("#codigo").on("change",function(){
		  	var nuevo=$("#codigo").val();
			var pin2=nuevo.replace('-','/');
			//alert(pin2);
			$("#codigo").val(pin2);
         var form2= $('#formulario');
        var url2 = '{{route("validart")}}';
        var data2 = form2.serialize();
    $.post(url2,data2,function(result2){  
      var resultado2=result2;
         console.log(resultado2); 
         rows=resultado2.length; 
      if (rows > 0){
            var nombre=resultado2[0].nombre;
          var codigo=resultado2[0].codigo; 
          var descripcion=resultado2[0].descripcion;   
          alert ('Codigo ya existe!!, Nombre: '+nombre+' Codigo: '+codigo+' descripcion: '+descripcion);   
           $("#codigo").val("");
}    
          });
     });
      	 $('#btnguardar').click(function(){   
		document.getElementById('loading').style.display=""; 
		document.getElementById('btnguardar').style.display="none"; 
		document.getElementById('btncancelar').style.display="none"; 
		document.getElementById('formulario').submit(); 
		})
	$("#generar").on("click",function(){
		  dato=document.getElementById('idcategoria').value.split('_');
		idc=dato[0];
		cat=$("#cnt").val();
		$("#codigo").val('00'+idc+'00'+cat);		
	});
		$("#idcategoria").on("change",function(){
		
	var dato=document.getElementById('idcategoria').value.split('_');	//alert(dato[1]);
	if(dato[1]==1){
		$("#volumen").removeAttr("disabled");  
		$("#grados").removeAttr("disabled"); 
	} else{
			$("#volumen").val(0);
			$("#grados").val(0);
		$("#volumen").attr("disabled","true"); ;  
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
   	$("#customSwitch5").click(function() {
       if ($(this).is(":checked")){
        $("#customSwitch5").val(1);
		document.getElementById('tagrupado').style.display=""; 
       } else {
         $("#customSwitch5").val(0);
		 	document.getElementById('tagrupado').style.display="none";
       }
   });
   $('#bt_add').click(function(){			
			agregar();	
	});
})
var cont=0;
var total=0;
 subtotal=[];

$("#utilidad").change(calculo);
$("#util2").change(calculo2);
$("#util3").change(calculo3);
$("#utilvip").change(calculovip); 
$("#precio1").change(reverso); 
$("#precio2").change(reverso2); 
$("#precio3").change(reverso3); 
$("#pvip").change(reversovip); 
$("#nombre").change(revisar); 
$("#costo").change(actprecio); 
$("#costo").change(calculo2); 
$("#costo").change(calculo3); 
$("#costo").change(calculovip); 
$("#impuesto").change(actprecio); 
//delgrupo
$("#utilgrupo").change(calculogrp);
$("#ppreciogrupo").change(reversogrp); 
$("#util2grupo").change(calculo2grp);
$("#pprecio2grupo").change(reverso2grp);
	function actprecio(){
		   	var  p1 = p2= 0;
		   	var  pt =0;
		  var mutil= $("#mutil").val();
			var costo= $("#costo").val();
			var impuesto= $("#impuesto").val();   
			var utilidad= $("#utilidad").val();   
			if (costo!="" && impuesto != "" && utilidad!=""){
				p1=parseFloat((utilidad/100));
			   if(mutil==1){
				p2=parseFloat(costo) + parseFloat(p1*costo);
				}else{
				p2=(costo/((100-utilidad)/100));
				}
				var iva=p2*(impuesto/100);
				pt=(parseFloat(p2)+parseFloat(iva));
				$("#precio1").val(pt.toFixed(2));
					}
	}
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
		p2=(costo/((100-utilidad)/100));
		}
        iva=p2*(impuesto/100);
        pt=(parseFloat(p2)+parseFloat(iva));
    	$("#precio1").val(pt.toFixed(2));
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
		}else{
		p2=(costo/((100-utilidad)/100));
		}
        iva=p2*(impuesto/100);
        pt=(parseFloat(p2)+parseFloat(iva));
      $("#precio2").val(pt.toFixed(2));
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
		
      $("#precio3").val(pt.toFixed(2));
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
		var mutil= $("#mutil").val();
       p30= $("#precio1").val();
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
  //      alert(nv);
      $("#utilidad").val(parseFloat(nv));
	}
		function reverso2(){
        var  p30 =0;  
		var mutil= $("#mutil").val();
       p30= $("#precio2").val();
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
  //      alert(nv);
      $("#util2").val(parseFloat(nv));
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
	function revisar(){
	var nuevo=$("#nombre").val();
	 var pin2=nuevo.replace('-','/');
	$("#nombre").val(pin2);
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
	//
</script>
	</script>
	@endpush  
@endsection