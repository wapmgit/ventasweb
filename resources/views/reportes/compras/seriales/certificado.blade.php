@extends ('layouts.master')
@section ('contenido')
<?php $acum=0; 
$ceros=5;
function add_ceros($numero,$ceros) {
  $numero=$numero;
$digitos=strlen($numero);
  $recibo="";
  for ($i=0;$i<8-$digitos;$i++){
    $recibo=$recibo."0";
  }
return $insertar_ceros = $recibo.$numero;
};
function espaciostab($cnt) {
	 $tab = "&emsp;";
  for ($i=0;$i<$cnt;$i++){
	echo $tab =$tab."&emsp;";
  }
return $tab;
};
function espacios($cnt) {
	 $esp = "&nbsp;";
  for ($i=0;$i<$cnt;$i++){
	echo $esp =$esp."&nbsp;";
  }
return $esp;
};
if($empresa->usaserie==1){$serie="SERIE".$empresa->serie;}else{$serie="";}
?>

<div class="row" > 
	<div id="areaimprimir"  class="col-lg-12 col-md-12 col-sm-12 col-xs-12" >
   <style>
.pru{
  vertical-align: bottom;
}
.fuentet{
	font-family: Arial;
	 font-size: 16px;
	font-weight: bold;
}
.fuente{
	font-family: Times New Roman;
	 font-size: 22px;
	font-weight: bold;
}

</style> 	
			 </br>   </br>
		</br>   </br>
		</br>   </br>
		</br>    </br> </br>   </br>
		</br>   </br>
		</br>   </br>
		</br>    </br>
		</br>   </br>
		</br>   </br>
		</br>   </br>
		</br>    </br> </br>   </br>
		</br>   </br>
		</br>   </br>
		</br>    </br>
		</br>   </br>
		</br>    </br>
		</br>   </br>
		</br>  
   <?php echo espaciostab(1).espacios(4)."&nbsp;"; ?><font  class="fuentet">{{ $cliente->rif}} </font>
   <?php echo espaciostab(4).espacios(3); echo "<font  class='fuentet'>".$serie." ".add_ceros($documento,$ceros)."</font>"; ?><?php echo espaciostab(2).espacios(1)."&nbsp;";  ?>
   <?php  echo "<sup><font  class='fuente'>".date("d-m-Y")."</font></sup>"; ?></br></br>
   <?php echo espaciostab(1).espacios(4)."&nbsp;"; ?><font  class="fuentet">{{ $cliente->nombre}} </font></br></br>
    <?php echo espaciostab(1).espacios(2)."&nbsp;"; ?><font  class="fuentet">{{ $cliente->casa}} </font>
    <?php echo espaciostab(5).espacios(1)."&nbsp;"; ?><font  class="fuentet">{{ $cliente->avenida}} </font></br></br>
	<?php echo espaciostab(1).espacios(2)."&nbsp;"; ?><font  class="fuentet">{{ $cliente->barrio}} </font>
    <?php echo espaciostab(6).espacios(1)."&nbsp;"; ?><font  class="fuentet">{{ $cliente->ciudad}} </font></br></br>
	<?php echo espaciostab(1).espacios(2)."&nbsp;"; ?><font  class="fuentet">{{ $cliente->municipio}} </font>
    <?php echo espaciostab(4).espacios(1)."&nbsp;"; ?><font  class="fuentet">{{ $cliente->entidad}} </font>
	<?php echo espaciostab(3).espacios(1)."&nbsp;"; ?><font  class="fuentet">{{ $cliente->codpostal}} </font></br></br>
	<?php echo espaciostab(3).espacios(6)."&nbsp;"; ?><font  class="fuentet">{{ $cliente->telefono}} </font></br>
   </br>		</br>   </br>
		</br>   </br>
		</br>    </br>
		<?php echo espaciostab(1).espacios(2)."&nbsp;"; ?><font  class="fuentet">{{ $cliente->nombre}} </font>
			</div> 
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"> 		       			
					<div class="form-group" align="center">
					<button type="button" id="imprimir" class="btn btn-primary btn-sm" onclick="printdiv('areaimprimir');" data-dismiss="modal">Imprimir</button> 
					</div>
				</div>
		
	</div> 
	@push ('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
  document.getElementById('imprimir').style.display="none";
  window.print(); 
  window.location="{{route('repseriales')}}";
    });

});

  function printdiv(divname){
		document.getElementById('imprimir').style.display="none";
	 	var printcontenido =document.getElementById(divname).innerHTML;
		var originalcontenido = document.body.innerHTML;
		document.body.innerHTML =printcontenido;
	  	window.print();
	  	window.location="{{route('repseriales')}}";
	  	document.body.innerHTML=originalcontenido;
  }
  </script>
@endpush
@endsection