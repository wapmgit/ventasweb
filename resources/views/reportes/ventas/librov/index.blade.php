@extends ('layouts.master')
<?php $mostrar=0; ?>
@section ('contenido')
<?php $mostrar=1; ?>
<div class="row">
	@include('reportes.ventas.librov.search')
</div>
<?php $acum=0;$efe=0;$deb=0;$che=0;$tra=$acumret=0;

$ceros=5;
function add_ceros($numero,$ceros) {
  $numero=$numero;
$digitos=strlen($numero);
  $recibo=" ";
  for ($i=0;$i<8-$digitos;$i++){
    $recibo=$recibo."0";
  }
return $insertar_ceros = $recibo.$numero;
};
function add_nctrl($numero,$ceros) {
  $numero=$numero;
$digitos=strlen($numero);
  $recibo="-";
  for ($i=0;$i<6-$digitos;$i++){
    $recibo=$recibo."0";
  }
return $insertar_ceros = $recibo.$numero;
};
$cefe=0;?>
<style>
@media print{@page{margin:15mm 25mm;size:auto}body,.page__content{background-color:#fff !important;box-shadow:none !important}p{orphans:2;widows:3}h1,h2,h3,h4,h5,h6{-webkit-column-break-after:avoid;-moz-column-break-after:avoid;break-after:avoid;page-break-after:avoid;page-break-inside:avoid}acronym[title]::after,abbr[title]::after{content:" (" attr(title) ")"}audio,.visually-hidden,#pDebug{display:none !important}a[href^=http]{color:#44444c;page-break-inside:avoid}a[href^=http]::after{border-bottom:1px solid rgba(0,0,0,0);color:#44444c;content:" [" attr(href) "]";font-size:.8em;word-break:break-all}a[href^="#"]::after,.header__publisher a::after,.zplus-badge a::after{content:""}#ads,#adunit,#comments,#iqadtileOOP,#iqd_mainAd,#iqdLastNode,#iqdSitebarWrapper,#iqdInfoBox,.ad,.ads,.iqdcontainer,#outbrain,iframe[id^=google_ads],a[href^="https://adclick.g.doubleclick.net"]{display:none !important}#main{margin:0;padding:0}.footer{display:none !important}.header{background-color:rgba(0,0,0,0)}.article-header a::after,.article__item--packshot a::after{content:""}.article-header>*{justify-content:left}.header__brand{border-bottom:1pt solid #44444c;margin-bottom:.8125rem;padding-bottom:.8125rem;padding-left:0}.header__brand--shaddow{box-shadow:none !important}.header__brand .header__teaser,.header__brand .header__menu-link{display:none}.header__logo{fill:#252525}#navigation{display:none !important}.article-footer,.article-pagination{display:none !important}.article-page[data-page-number="1"]+.article-pagination{display:block !important}.article-actions,.article-link-header,.bookmark-icon,.video-player,.video-player+.figure__caption,.ard-container,#bp-container,.article-page .raw,.article-pagination__link[data-ct-label=Startseite],.article-player,.embed-wrapper[data-vendors=youtube],.newsletter-teaser-box,.article-toc{display:none !important}.paragraph--faded::before{content:none}.topicbox{margin:14pt 0 !important;max-width:none !important;padding-bottom:0;page-break-inside:avoid;width:100%}.topicbox__heading{margin-top:.5em;transform:none}.topicbox__supertitle,.topicbox__title,.topicbox-item__kicker,.topicbox-item__title{font-family:inherit;text-transform:none}.topicbox-item{padding:.5em 0}.topicbox-item__media{display:none}.topicbox-item__heading,.topicbox-item__kicker,.topicbox-item__title{font-size:11.368421055pt;margin:0}.topicbox-item::before,.topicbox__link::before{display:none !important}.gallery{background-color:rgba(0,0,0,0);margin:0;padding:0}.gallery::after{clear:both;content:"";display:block}.gallery__container{margin:0;max-width:none}.gallery__slide{margin-bottom:2.25rem;page-break-inside:avoid}.gallery__pager{display:none !important}.gallery__viewport{max-height:none !important}.article-flexible-toc__list--wrapped{max-height:none}.article-flexible-toc__showall{display:none}.zplus-logo,.zplus-logo--register{background-color:#fff;color:#000}#data-protection-overlay,.paywall-footer{display:none !important}.no-print{display:none !important}}@media print{.column-heading__author,.comment-section,.breaking-news-banner,.instant-feedback,.newsletter-teaser-box{display:none !important}.article-heading{margin:6mm 0 0}.article-heading__kicker{color:#44444c;font-size:8.842105265pt;line-height:11.368421055pt;margin-bottom:1.263157895pt;padding:0}.article-heading__title{font-size:22.73684211pt;line-height:26.526315795pt;margin-bottom:17.68421053pt}.summary,.byline{font-size:13.2631578975pt;line-height:18.947368425pt;margin-bottom:8.842105265pt}.metadata{color:#44444c;font-size:8.842105265pt;line-height:11.368421055pt;margin-bottom:17.68421053pt}.article__media{margin:14pt 0;max-width:100mm}.article__media-item[src*=kreuzwortgitter]{width:15cm}.article__item--marginalia{clear:left;float:left;margin:0 25.2631579pt 17.68421053pt 0;max-width:40mm;page-break-inside:avoid}.article__item--marginalia a{font-size:8.842105265pt}.article__item--marginalia .article__media-container a::after{display:none}.figure__caption{font-size:8.842105265pt;margin-left:0;padding-left:0 !important}.article__subheading{font-size:13.894736845pt;line-height:17.68421053pt;margin-bottom:8.842105265pt;margin-top:17.68421053pt;page-break-after:avoid;page-break-inside:avoid}.paragraph,.raw{font-size:12.0000000025pt;line-height:17.68421053pt;margin-bottom:8.842105265pt}.column-heading *{background-color:#fff !important;color:#44444c !important}.column-heading,.column-heading__information,.column-heading__lower{padding-bottom:0}.column-heading__title{max-width:none}.lb-sharing{display:none}.liveblog-heading__media{max-width:230px}.tickaroo-liveblog .tik3-ticker{font-size:12.0000000025pt;line-height:17.68421053pt}.tickaroo-liveblog .tickaroo-web-embed-toggle,.tickaroo-liveblog .liveblog-heading__media,.tickaroo-liveblog .tik3-event-item .tik3-event-item-content::before,.tickaroo-liveblog .tik3-event-item-content-web-embed-item>*{display:none !important}.tickaroo-liveblog .tik3-event-item-content-web-embed-item::after{content:"[" attr(data-tickaroo-web-embed-url) "]"}.tickaroo-liveblog .tik3-event-item{background-color:rgba(0,0,0,0);padding-bottom:0}.tickaroo-liveblog .tik3-ticker .tik3-media-item-credit{color:currentColor;position:static;text-shadow:none}.tickaroo-liveblog .tik3-event-item .tik3-event-item-meta{margin-bottom:0}}
</style>
  <!-- Main content -->
            <div class="invoice p-3 mb-3">
              <!-- title row -->
              <div class="row">
                <div class="col-12">
  <h4 align="center">Libro de Ventas</h4>
                </div>
                <!-- /.col -->
              </div>
              <!-- info row -->
              <div class="row invoice-info">
			@include('reportes.ventas.librov.empresa')
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
                <div class="col-12 table-responsive">
					<table width="100%">
					<thead style="background-color: #E6E6E6">
					<th><font size="1"><small>Oper.Nro.</small></font> </th>
					<th><font size="1"><small>Fecha del Documento </small></font></th>
					<th><font size="1"><small>Tipo de Documento</small></font> </th>
					<th><font size="1"><small>Rif</small></font></th>
					<th><font size="1"><small>Nombre o razon Social del Cliente</small></font></th>
					<th><font size="1"><small>Serie</small></font></th>
					<th><font size="1"><small>Numero de Factura</small></font></th>
					<th><font size="1"><small>Numero de Control</small></font></th>
					<th><font size="1"><small>Numero de Nota Debito</small></font></th>
					<th><font size="1"><small>Numero de Nota Credito</small></font></th>
					<th><font size="1"><small>Tipo de Transaccion</small></font></th>
					<th><font size="1"><small>Numero de Factura Afectada</small></font></th>
					<th><font size="1"><small>Total Ventas Incluyendo el IVA</small></font></th>
					<th><font size="1"><small>Ventas Internas no Gravadas</small></font></th>
					<th><font size="1"><small>Base Imponible</small></font></th>
					<th><font size="1"><small>Impuesto IVA</small></font></th>
					<th><font size="1"><small>IVA Retenido</small></font></th>
					<th><font size="1"><small>Nro Comprobante Retencion</small></font></th>
					<th><font size="1"><small>Fecha de recepcion</small></font></th>
					</thead>
						<?php $ctra= 0; $acumiva=0; $acumbase=0; $acumexe=0; $credito=0; $contado=0; $count=0;?>
					@foreach ($datos as $q)
						<?php $count++; $tv=($q->texe+$q->total_iva+$q->base);?> 
							<tr <?php if($mostrar==0){?> style="display:none" <?php } ?> >
							  <td><font size="1"><small><?php echo $count; ?></small></font></td>
							   <td><font size="1"><small><font size="1"><small><?php echo date("d-m-Y",strtotime($q->fecha)); ?></small></font></td>
							   <td><font size="1"><small>{{ $q->tipo}}</small></font></td>
							  <td><font size="1"><small>{{ $q->rif}}</small></font></td>       
							  <td><font size="1"><small>{{$q->nombre}}</small></font></td> 
							  <td><font size="1"><small>{{$q->serie}}</small></font></td> 
							  <td><font size="1"><small><?php echo add_ceros($q->idforma,$ceros); ?></small></font></td> 
							  <td><font size="1"><small><?php echo "00".add_nctrl($q->nrocontrol,$ceros); ?></small></font></td>
							  <td></td>							  
							  <td></td>							  
							  <td><font size="1"><small><?php if($q->anulado==1){echo "03-Anu";}else{echo "01-Reg";}?></small></font></td>							  
							  <td></td>							  
							  <td><font size="1"><small><?php if($q->anulado==1){ echo "0,00";}else{ $acum=$acum+ ($tv); echo number_format(($tv), 2,',','.'); }?></small></font></td>
							  <td><font size="1"><small><?php if($q->anulado==1){ echo "0,00";}else{ $acumexe=($acumexe+($q->texe)); echo number_format(($q->texe), 2,',','.');} ?></small></font></td>
							  <td><font size="1"><small><?php if($q->anulado==1){ echo "0,00";}else{ $acumbase=($acumbase+($q->base)); echo number_format(($q->base), 2,',','.');} ?></small></font></td>
							  <td><font size="1"><small><?php if($q->anulado==1){ echo "0,00";}else{ $acumiva=$acumiva+($q->total_iva); echo number_format(($q->total_iva), 2,',','.');} ?></small></font></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>    
					@endforeach
						
		@foreach ($retenc as $r)
		<?php $count++; ?>
		<tr>
		  <td align="center"><font size="1"><small><?php echo $count; ?></small></font></td>
		   <td><font size="1"><small><?php echo date("d-m-Y",strtotime($r->fecharegistro)); ?></small></font></td>
		   <td size="1"><font size="1"><small>RET</small></font></td>
		  <td><font size="1"><small>{{ $r->cedula}}</small></font></td>       
		  <td ><font size="1"><small>{{$r->nombre}}</small></font></td> 
		  <td><font size="1"><small></small></font></td> 
		  <td><font size="1"><small></small></font></td> 
		  <td align="center"><font class="tama2"><small></small></font></td>
		  <td></td>							  
		  <td></td>							  
		  <td><font size="1"><small>01-Reg</small></font></td>							  
		  <td><font size="1"><small><?php echo add_ceros($r->idfactura,$ceros); ?></small></font></td>							  
		  <td><font class="tama2"><small></small></font></td>
		  <td><font class="tama2"><small></small></font></td>
		  <td><font class="tama2"><small></small></font></td>
		  <td><font class="tama2"><small></small></font></td>
	<td><font size="1"><small><?php $acumret=$acumret+$r->mretbs; echo number_format(($r->mretbs), 2,',','.'); ?></small></font></td>
		  <td><font size="1"><small>{{$r->comprobante}}</small></font></td>
		  <td><font size="1"><small><?php echo date("d-m-Y",strtotime($r->fecha)); ?></small></font></td>	
		</tr>    	
			
	@endforeach	
							<tr>
								<td colspan="12"> <font size="1"><small><strong>TOTAL:</strong></small></font></td>
								<td><font size="1"><small><strong><?php echo number_format($acum, 2,',','.')." Bs"; ?></strong></small></font></td>					
								<td><font size="1"><small><strong><?php echo number_format($acumexe, 2,',','.')." Bs"; ?></strong></small></font></td>					
								<td><font size="1"><small><strong><?php echo number_format($acumbase, 2,',','.')." Bs"; ?></strong></small></font></td>
								<td><font size="1"><small><strong><?php echo number_format($acumiva, 2,',','.')." Bs"; ?></strong></small></font></td>
								<td><font size="1"><small><strong><?php echo number_format($acumret, 2,',','.')." Bs"; ?></strong></small></font></td>
							
							</tr>
					</table>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <div class="row">
                <!-- accepted payments column -->
                <div class="col-4"></br></br></br></br>
				<table width="50%">
				<tr><td><font size="1"><small><b>LEYENDA</b></small></font></td></tr>
				<tr><td><font size="1"><small>01-Reg: REGISTRO</small></font></td></tr>
				<tr><td><font size="1"><small>02-comp: COMPLEMENTO</small></font></td></tr>
				<tr><td><font size="1"><small>03-Anu: ANULACION</small></font></td></tr>
				<tr><td><font size="1"><small>04-Aju: AJUSTE</small></font></td></tr>
				</table>
                </div>
                <!-- /.col -->
                <div class="col-8">
                  <p align="center" ><font size="1"><small><b>RESUMEN DEL LIBRO DE VENTAS</b></small></font></p>

                  <div>
                    <table width="100%" border="1">
                      <tr>
					    <th></th>
                        <th style="width:10%"><font size="1"><small><b>Base Imponible</b></small></font></th>
                        <th style="width:10%"><font size="1"><small><b>Debito Fiscal</b></small></font></th>
                      </tr>
                      <tr>
                        <th><font size="1"><small>VENTAS INTERNAS NO GRAVADAS:</small></font></th>
                        <td></td>
                        <td></td>
                      </tr>
						<tr>
                        <th><font size="1"><small>VENTAS INTERNAS GRAVADAS:</small></font></th>						 
                        <td></td>
                        <td></td>
						</tr>
                      <tr>
                        <th><font size="1"><small>Ventas Internas afectas solo Alicuota General. 16%</small></font></th>
                        <td><font size="1"><small><?php echo number_format($acum, 2,',','.')." Bs"; ?></small></font></td>
                        <td><font size="1"><small><?php echo number_format(($acumiva), 2,',','.')." Bs"; ?></small></font></td>
                      </tr>
					        <tr>
                        <th><font size="1"><small>Ventas Internas afectas solo Alicuota General. 31%</small></font></th>
                        <td><font size="1"><small><?php echo number_format($credito, 2,',','.')." Bs"; ?></small></font></td>
                        <td><font size="1"><small><?php echo number_format($credito, 2,',','.')." Bs"; ?></small></font></td>
                      </tr>
					        <tr>
                        <th><font size="1"><small>Ventas Internas afectas solo Alicuota General. 8%</small></font></th>
                        <td><font size="1"><small><?php echo number_format($credito, 2,',','.')." Bs"; ?></small></font></td>
                        <td><font size="1"><small><?php echo number_format($credito, 2,',','.')." Bs"; ?></small></font></td>
                      </tr>
					        <tr>
                        <th><font size="1"><small><b>TOTALES</b></th>
                        <td><font size="1"><small><?php echo number_format($acum, 2,',','.')." Bs"; ?></small></font></td>
                        <td><font size="1"><small><?php echo number_format($acumiva, 2,',','.')." Bs"; ?></small></font></td>
                      </tr>
                    </table>
                  </div>
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->

              <!-- this row will not appear when printing -->
              <div class="row no-print">
                <div class="col-12">
				<label></label>  
                </div>
              </div>
				<div class="col-lg-12 col-md-12 col-sm-6 col-xs-12">
                    <div class="form-group" align="center">
                     <button type="button" id="imprimir" class="btn btn-primary btn-sm" data-dismiss="modal">Imprimir</button>
                    </div>
                </div>
            </div>
            <!-- /.invoice -->
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
            
@push ('scripts')
<script>
$(document).ready(function(){
    $('#imprimir').click(function(){
  //  alert ('si');
  document.getElementById('imprimir').style.display="none";
  window.print(); 
  window.location="{{route('libroventas')}}";
    });

});

</script>

@endpush
@endsection