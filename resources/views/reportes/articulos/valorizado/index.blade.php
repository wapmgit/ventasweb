@extends ('layouts.master')
<?php $mostrar=0; ?>
@section ('contenido')
<?php $mostrar=1; ?>
<style>
@media print{@page{margin:15mm 25mm;size:auto}body,.page__content{background-color:#fff !important;box-shadow:none !important}p{orphans:2;widows:3}h1,h2,h3,h4,h5,h6{-webkit-column-break-after:avoid;-moz-column-break-after:avoid;break-after:avoid;page-break-after:avoid;page-break-inside:avoid}acronym[title]::after,abbr[title]::after{content:" (" attr(title) ")"}audio,.visually-hidden,#pDebug{display:none !important}a[href^=http]{color:#44444c;page-break-inside:avoid}a[href^=http]::after{border-bottom:1px solid rgba(0,0,0,0);color:#44444c;content:" [" attr(href) "]";font-size:.8em;word-break:break-all}a[href^="#"]::after,.header__publisher a::after,.zplus-badge a::after{content:""}#ads,#adunit,#comments,#iqadtileOOP,#iqd_mainAd,#iqdLastNode,#iqdSitebarWrapper,#iqdInfoBox,.ad,.ads,.iqdcontainer,#outbrain,iframe[id^=google_ads],a[href^="https://adclick.g.doubleclick.net"]{display:none !important}#main{margin:0;padding:0}.footer{display:none !important}.header{background-color:rgba(0,0,0,0)}.article-header a::after,.article__item--packshot a::after{content:""}.article-header>*{justify-content:left}.header__brand{border-bottom:1pt solid #44444c;margin-bottom:.8125rem;padding-bottom:.8125rem;padding-left:0}.header__brand--shaddow{box-shadow:none !important}.header__brand .header__teaser,.header__brand .header__menu-link{display:none}.header__logo{fill:#252525}#navigation{display:none !important}.article-footer,.article-pagination{display:none !important}.article-page[data-page-number="1"]+.article-pagination{display:block !important}.article-actions,.article-link-header,.bookmark-icon,.video-player,.video-player+.figure__caption,.ard-container,#bp-container,.article-page .raw,.article-pagination__link[data-ct-label=Startseite],.article-player,.embed-wrapper[data-vendors=youtube],.newsletter-teaser-box,.article-toc{display:none !important}.paragraph--faded::before{content:none}.topicbox{margin:14pt 0 !important;max-width:none !important;padding-bottom:0;page-break-inside:avoid;width:100%}.topicbox__heading{margin-top:.5em;transform:none}.topicbox__supertitle,.topicbox__title,.topicbox-item__kicker,.topicbox-item__title{font-family:inherit;text-transform:none}.topicbox-item{padding:.5em 0}.topicbox-item__media{display:none}.topicbox-item__heading,.topicbox-item__kicker,.topicbox-item__title{font-size:11.368421055pt;margin:0}.topicbox-item::before,.topicbox__link::before{display:none !important}.gallery{background-color:rgba(0,0,0,0);margin:0;padding:0}.gallery::after{clear:both;content:"";display:block}.gallery__container{margin:0;max-width:none}.gallery__slide{margin-bottom:2.25rem;page-break-inside:avoid}.gallery__pager{display:none !important}.gallery__viewport{max-height:none !important}.article-flexible-toc__list--wrapped{max-height:none}.article-flexible-toc__showall{display:none}.zplus-logo,.zplus-logo--register{background-color:#fff;color:#000}#data-protection-overlay,.paywall-footer{display:none !important}.no-print{display:none !important}}@media print{.column-heading__author,.comment-section,.breaking-news-banner,.instant-feedback,.newsletter-teaser-box{display:none !important}.article-heading{margin:6mm 0 0}.article-heading__kicker{color:#44444c;font-size:8.842105265pt;line-height:11.368421055pt;margin-bottom:1.263157895pt;padding:0}.article-heading__title{font-size:22.73684211pt;line-height:26.526315795pt;margin-bottom:17.68421053pt}.summary,.byline{font-size:13.2631578975pt;line-height:18.947368425pt;margin-bottom:8.842105265pt}.metadata{color:#44444c;font-size:8.842105265pt;line-height:11.368421055pt;margin-bottom:17.68421053pt}.article__media{margin:14pt 0;max-width:100mm}.article__media-item[src*=kreuzwortgitter]{width:15cm}.article__item--marginalia{clear:left;float:left;margin:0 25.2631579pt 17.68421053pt 0;max-width:40mm;page-break-inside:avoid}.article__item--marginalia a{font-size:8.842105265pt}.article__item--marginalia .article__media-container a::after{display:none}.figure__caption{font-size:8.842105265pt;margin-left:0;padding-left:0 !important}.article__subheading{font-size:13.894736845pt;line-height:17.68421053pt;margin-bottom:8.842105265pt;margin-top:17.68421053pt;page-break-after:avoid;page-break-inside:avoid}.paragraph,.raw{font-size:12.0000000025pt;line-height:17.68421053pt;margin-bottom:8.842105265pt}.column-heading *{background-color:#fff !important;color:#44444c !important}.column-heading,.column-heading__information,.column-heading__lower{padding-bottom:0}.column-heading__title{max-width:none}.lb-sharing{display:none}.liveblog-heading__media{max-width:230px}.tickaroo-liveblog .tik3-ticker{font-size:12.0000000025pt;line-height:17.68421053pt}.tickaroo-liveblog .tickaroo-web-embed-toggle,.tickaroo-liveblog .liveblog-heading__media,.tickaroo-liveblog .tik3-event-item .tik3-event-item-content::before,.tickaroo-liveblog .tik3-event-item-content-web-embed-item>*{display:none !important}.tickaroo-liveblog .tik3-event-item-content-web-embed-item::after{content:"[" attr(data-tickaroo-web-embed-url) "]"}.tickaroo-liveblog .tik3-event-item{background-color:rgba(0,0,0,0);padding-bottom:0}.tickaroo-liveblog .tik3-ticker .tik3-media-item-credit{color:currentColor;position:static;text-shadow:none}.tickaroo-liveblog .tik3-event-item .tik3-event-item-meta{margin-bottom:0}}</style>
<div class="row">
		@include('reportes.articulos.valorizado.search')
</div>

<?php $acum=0;$efe=0;$deb=0;$che=0;$tra=0;
$cefe=0;?>

<div class="row">
	<div class="col-md-12">
		<div class="box">
			<div class="box-body" style="background-color: #fff">
	  <?php $mes="";
	  if($searchText=="01"){$mes="Enero";} if($searchText=="02"){$mes="Febrero";} if($searchText=="03"){$mes="Marzo";} 
	  if($searchText=="04"){$mes="Abril";} if($searchText=="05"){$mes="Mayo";} if($searchText=="06"){$mes="Junio";} 
	  if($searchText=="07"){$mes="Julio";} if($searchText=="08"){$mes="Agosto";} if($searchText=="09"){$mes="Septiembre";} 
	  if($searchText=="10"){$mes="Octubre";} if($searchText=="11"){$mes="Noviembre";} if($searchText=="12"){$mes="Diciembre";} 
	  
	  ?> @include('reportes.articulos.valorizado.empresa')		
		 <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<table style="line-height:65%" border="0" width="98%" >
				<thead>
					<tr><td></td><td></td><td></td><td colspan="6" align="center" style="background-color: #E6E6E6" ><small>Unidades Mes</small></td><td colspan="6" align="center" style="background-color: #E6E6E6"><small>Bolivares Mes</samll></td></tr>
					<th><small>N°</small></th>
					<th><small>Codigo</small></th>
				  <th><small>Descripcion</small></th>
				  <th><small>Exis. Ant.</small></th>
				  <th><small><small>Entradas</small></small></th>
				  <th><small><small>Salidas</small></small></th>
				  <th><small><small>Retiros</small></small></th>
				  <th><small><small>Auto</br>Consumo</small></small></th>
				  <th><small>Exist.</small></th>
				  <th><small>Valor ant</small></th>
				  <th><small><small>Entradas</small></small></th>
				  <th><small><small>Salidas</small></small></th>
				  <th><small><small>Retiros</small></small></th>
				  <th><small><small>Auto</br>Consumo</small></small></th>
				  <th><small>Exist.</small></th>		  
				</thead>
				<?php $ctra=$vcr=0; $num=0; $costo=0; $aux=0; $reg=0; $invalor=0;$contado=0;$outvalor=0; $acumctra=$counta=0; $acum_eant=0; $acum_vante=0;$acum_in=0; $acum_out=0;?>
				@foreach ($articulo as $a)
				<?php $num++;  $aux=0; $egresocosto=$ingresoscosto=$contingreso=$contegreso=$in_ant=$out=0;$promcemes=$promcmes=0; $ctant=$cost=0; $aux2=$aux=0; $ctin=$ctout=0;$counta++; ?>     
				@foreach ($anteriorin as $in) <?php  if($a->idarticulo==$in->idarticulo){ $ctin=$in->costop;$in_ant=$in->cantidad;} ?> 
				@endforeach
				@foreach ($anteriorout as $ou) <?php if($a->idarticulo==$ou->idarticulo){$ctout=$ou->costop; $out=$ou->cantidad;} ?> 
				@endforeach			
					<tr height="10px">
				  <td><?php echo "<font size='1'>".$num."</font>";?></font></td>
				  <td><font size="1">{{$a->codigo}}</font></td>
				  <td width="30%"><font size="1"><small>{{$a->nombre}}</small></font></td>
				  <td><font size="1"><?php if($ctin>0){$ctant=$ctin;}else{$ctant=$ctout;} echo number_format(($in_ant-$out), 2,',','.'); $acum_eant=$acum_eant+($in_ant-$out); ?></font></td>
				 <td>@foreach ($entrada as $m)  
				 <?php  if(($a->idarticulo==$m->idarticulo)) { $contingreso++; $ingresoscosto=$ingresoscosto+$m->costop; $aux=$m->cantidad;  }  ?>
					@endforeach 
				 <?php  if($contingreso>0){$promcmes=$ingresoscosto/$contingreso;}else{$promcmes=$ctant;} echo "<font size='1'>".number_format($aux, 2,',','.')."</font>"; $acum_in=$acum_in+$aux; ?></td>
				 <td>@foreach ($salida as $s)  
				 <?php if(($a->idarticulo==$s->idarticulo)) {$contegreso++;  $egresocosto=$egresocosto+$s->costop; $aux2=$aux2+$s->cantidad;}
				if($contegreso>0){ $promcemes=$egresocosto/$contegreso;}else{$promcemes=$ctant;}   ?>
				 @endforeach <?php   echo "<font size='1'>".number_format(($aux2), 2,',','.')."</font>"; $acum_out=$acum_out+$aux2; ?></td>
				 <td><?php echo "<font size='1'>0.00</font>"; ?></td>
				  <td><?php echo "<font size='1'>0.00</font>"; ?></td>
				 <td><?php $ctra=($aux-$aux2)+($in_ant-$out); echo "<font size='1'>".number_format(($ctra), 2,',','.')."</font>";  $acumctra=$acumctra+$ctra; ?></td>
				 <td><?php echo "<font size='1'>".number_format(((($in_ant-$out)*$ctant)*$tasa), 2,',','.')."</font>";  $acum_vante=($acum_vante+(($in_ant-$out)*$ctant)); ?></td>
				<td><?php if($promcmes>0){$cost=$promcmes;}else{$cost=$promcemes;} $contado=$contado+($ctra*$cost); 
				$invalor=$invalor+(($ctra*$cost)-(($in_ant-$out)*$ctant));
				 echo "<font size='1'>".number_format((($aux*$cost)*$tasa), 2,',','.')."</font>";  ?> </td>
				 <td><?php  echo "<font size='1'>".number_format((($aux2*$cost)*$tasa), 2,',','.')."</font>"; $outvalor=($outvalor+($aux2*$cost)); ?></td>
				  <td><?php echo "<font size='1'>0.00</font>"; ?></td>
				  <td><?php echo "<font size='1'>0.00</font>"; ?></td>
				 <td><?php  
				 echo "<font size='1'>".number_format((($ctra*$cost)*$tasa), 2,',','.')."</font>";  ?></td>
				</tr>    
			@endforeach
			<tr><td><?php echo "<ssmal>".$counta."</small>"; ?></td><td></td><td></td>
			<td><?php echo "<font size='1'><b>".number_format(($acum_eant), 2,',','.')."</b></font>"; ?></td>
			<td><?php echo "<font size='1'><b>".number_format(($acum_in), 2,',','.')."</b></font>"; ?></td>
			<td><?php echo "<font size='1'><b>".number_format(($acum_out), 2,',','.')."</b></font>"; ?></td>
			<td><?php echo "<font size='1'><b>0.00</b></font>"; ?></td>
			<td><?php echo "<font size='1'><b>0.00</b></font>"; ?></td>
			<td><?php echo "<font size='1'><b>".number_format(($acumctra*$tasa), 2,',','.')."</b></font>"; ?></td>
			<td><?php echo "<font size='1'><b>".number_format(($acum_vante*$tasa), 2,',','.')."</b></font>"; ?></td>
			<td><?php echo "<font size='1'><b>".number_format(($invalor*$tasa), 2,',','.')."</b></font>"; ?></td>
			<td><?php echo "<font size='1'><b>".number_format(($outvalor*$tasa), 2,',','.')."</b></font>"; ?></td>
			<td><?php echo "<font size='1'><b>0.00</b></font>"; ?></td>
			<td><?php echo "<font size='1'><b>0.00</b></font>"; ?></td>
			<td><?php echo "<font size='1'><b>".number_format(($contado*$tasa), 2,',','.')."</b></font>"; ?></td>
			</tr>
			<tr><td colspan="14"></br><small>Nota: Este resumen debe presentarse mensualmente. Los costos finales deben presentarse a valores promediados por el método de los costos promedios.</small></td></tr>
		</table>
	  </div>
  </div>
  </div>                
</div>
</div><!-- /.row -->
		<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center"></br>
                     <button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button>
                    </div>
		</div>

             

@push ('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
  //  alert ('si');
  document.getElementById('imprimir').style.display="none";
  window.print(); 
  window.location="{{route('valorizado')}}";
    });

});

</script>

@endpush
@endsection