@extends ('layouts.master')
<?php $mostrar=0; ?>
@section ('contenido')
<?php $mostrar=1; ?>
<div class="row">
	@include('reportes.compras.libroc.search')
</div>
<?php $acum=0;$efe=0;$deb=0;$che=0;$tra=0;

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
$cefe=0;?>
<style>
@media print{@page{margin:15mm 25mm;size:auto}body,.page__content{background-color:#fff !important;box-shadow:none !important}p{orphans:2;widows:3}h1,h2,h3,h4,h5,h6{-webkit-column-break-after:avoid;-moz-column-break-after:avoid;break-after:avoid;page-break-after:avoid;page-break-inside:avoid}acronym[title]::after,abbr[title]::after{content:" (" attr(title) ")"}audio,.visually-hidden,#pDebug{display:none !important}a[href^=http]{color:#44444c;page-break-inside:avoid}a[href^=http]::after{border-bottom:1px solid rgba(0,0,0,0);color:#44444c;content:" [" attr(href) "]";font-size:.8em;word-break:break-all}a[href^="#"]::after,.header__publisher a::after,.zplus-badge a::after{content:""}#ads,#adunit,#comments,#iqadtileOOP,#iqd_mainAd,#iqdLastNode,#iqdSitebarWrapper,#iqdInfoBox,.ad,.ads,.iqdcontainer,#outbrain,iframe[id^=google_ads],a[href^="https://adclick.g.doubleclick.net"]{display:none !important}#main{margin:0;padding:0}.footer{display:none !important}.header{background-color:rgba(0,0,0,0)}.article-header a::after,.article__item--packshot a::after{content:""}.article-header>*{justify-content:left}.header__brand{border-bottom:1pt solid #44444c;margin-bottom:.8125rem;padding-bottom:.8125rem;padding-left:0}.header__brand--shaddow{box-shadow:none !important}.header__brand .header__teaser,.header__brand .header__menu-link{display:none}.header__logo{fill:#252525}#navigation{display:none !important}.article-footer,.article-pagination{display:none !important}.article-page[data-page-number="1"]+.article-pagination{display:block !important}.article-actions,.article-link-header,.bookmark-icon,.video-player,.video-player+.figure__caption,.ard-container,#bp-container,.article-page .raw,.article-pagination__link[data-ct-label=Startseite],.article-player,.embed-wrapper[data-vendors=youtube],.newsletter-teaser-box,.article-toc{display:none !important}.paragraph--faded::before{content:none}.topicbox{margin:14pt 0 !important;max-width:none !important;padding-bottom:0;page-break-inside:avoid;width:100%}.topicbox__heading{margin-top:.5em;transform:none}.topicbox__supertitle,.topicbox__title,.topicbox-item__kicker,.topicbox-item__title{font-family:inherit;text-transform:none}.topicbox-item{padding:.5em 0}.topicbox-item__media{display:none}.topicbox-item__heading,.topicbox-item__kicker,.topicbox-item__title{font-size:11.368421055pt;margin:0}.topicbox-item::before,.topicbox__link::before{display:none !important}.gallery{background-color:rgba(0,0,0,0);margin:0;padding:0}.gallery::after{clear:both;content:"";display:block}.gallery__container{margin:0;max-width:none}.gallery__slide{margin-bottom:2.25rem;page-break-inside:avoid}.gallery__pager{display:none !important}.gallery__viewport{max-height:none !important}.article-flexible-toc__list--wrapped{max-height:none}.article-flexible-toc__showall{display:none}.zplus-logo,.zplus-logo--register{background-color:#fff;color:#000}#data-protection-overlay,.paywall-footer{display:none !important}.no-print{display:none !important}}@media print{.column-heading__author,.comment-section,.breaking-news-banner,.instant-feedback,.newsletter-teaser-box{display:none !important}.article-heading{margin:6mm 0 0}.article-heading__kicker{color:#44444c;font-size:8.842105265pt;line-height:11.368421055pt;margin-bottom:1.263157895pt;padding:0}.article-heading__title{font-size:22.73684211pt;line-height:26.526315795pt;margin-bottom:17.68421053pt}.summary,.byline{font-size:13.2631578975pt;line-height:18.947368425pt;margin-bottom:8.842105265pt}.metadata{color:#44444c;font-size:8.842105265pt;line-height:11.368421055pt;margin-bottom:17.68421053pt}.article__media{margin:14pt 0;max-width:100mm}.article__media-item[src*=kreuzwortgitter]{width:15cm}.article__item--marginalia{clear:left;float:left;margin:0 25.2631579pt 17.68421053pt 0;max-width:40mm;page-break-inside:avoid}.article__item--marginalia a{font-size:8.842105265pt}.article__item--marginalia .article__media-container a::after{display:none}.figure__caption{font-size:8.842105265pt;margin-left:0;padding-left:0 !important}.article__subheading{font-size:13.894736845pt;line-height:17.68421053pt;margin-bottom:8.842105265pt;margin-top:17.68421053pt;page-break-after:avoid;page-break-inside:avoid}.paragraph,.raw{font-size:12.0000000025pt;line-height:17.68421053pt;margin-bottom:8.842105265pt}.column-heading *{background-color:#fff !important;color:#44444c !important}.column-heading,.column-heading__information,.column-heading__lower{padding-bottom:0}.column-heading__title{max-width:none}.lb-sharing{display:none}.liveblog-heading__media{max-width:230px}.tickaroo-liveblog .tik3-ticker{font-size:12.0000000025pt;line-height:17.68421053pt}.tickaroo-liveblog .tickaroo-web-embed-toggle,.tickaroo-liveblog .liveblog-heading__media,.tickaroo-liveblog .tik3-event-item .tik3-event-item-content::before,.tickaroo-liveblog .tik3-event-item-content-web-embed-item>*{display:none !important}.tickaroo-liveblog .tik3-event-item-content-web-embed-item::after{content:"[" attr(data-tickaroo-web-embed-url) "]"}.tickaroo-liveblog .tik3-event-item{background-color:rgba(0,0,0,0);padding-bottom:0}.tickaroo-liveblog .tik3-ticker .tik3-media-item-credit{color:currentColor;position:static;text-shadow:none}.tickaroo-liveblog .tik3-event-item .tik3-event-item-meta{margin-bottom:0}}
</style>
  <!-- Main content -->
            <div class="invoice p-3 mb-3">
              <!-- title row -->
              <div class="row">
                <div class="col-12">
  <h4 align="center">Libro de Compras</h4>
                </div>
                <!-- /.col -->
              </div>
              <!-- info row -->
              <div class="row invoice-info">
			@include('reportes.compras.libroc.empresa')
              </div>
              <!-- /.row -->

              <!-- Table row -->
              <div class="row">
                <div class="col-12 table-responsive">
					<table width="100%">
					<thead style="background-color: #E6E6E6">
					<th><font size="1"><small>Oper. Nro.</small></font> </th>
					<th><font size="1"><small>Fecha del Documento </small></font></th>
					<th><font size="1"><small>Fecha Recepcion</small></font> </th>
					<th><font size="1"><small>Tipo de Documento</small></font> </th>
					<th><font size="1"><small>Rif</small></font></th>
					<th><font size="1"><small>Nombre o razon Social</small></font></th>
					<th><font size="1"><small>Tipo de Proveedor</small></font></th>
					<th><font size="1"><small>Tipo de Doc. y Numero</small></font></th>
					<th><font size="1"><small>Numero de Control</small></font></th>
					<th><font size="1"><small>Numero de Nota de Debito</small></font></th>
					<th><font size="1"><small>Numero de Nota de Credito</small></font></th>
					<th><font size="1"><small>Numero de Fact. Afect.</small></font></th>
					<th><font size="1"><small>Tipo de Transaccion</small></font></th>
					<th><font size="1"><small>Total Compras incluyendo IVA</small></font></th>
					<th><font size="1"><small>Compras Internas no Gravadas</small></font></th>
					<th><font size="1"><small>Base Imponible</small></font></th>
					<th><font size="1"><small>% Alicuota</small></font></th>
					<th><font size="1"><small>Impuesto I.V.A.</small></font></th>
					<th><font size="1"><small>Nro. Comprobante de Retencion</small></font></th>
					<th><font size="1"><small>Fecha Retencion</small></font></th>
					<th><font size="1"><small>% Retencion</small></font></th>
					<th><font size="1"><small>IVA Retenido(al Vendedor)</small></font></th>
					</thead>
						<?php $ctra= 0; $acumiva=0; $acumret=0; $acumbase=0; $credito=0; $contado=$acumex=0; $count=0;?>
					@foreach ($datos as $q)
						<?php $count++;?> 
							<tr <?php if($mostrar==0){?> style="display:none" <?php } ?> >
							  <td><font size="1"><small><?php echo $count; ?></small></font></td>
							   <td width="5%"><font size="1"><small><?php echo date("d-m-Y",strtotime($q->fecha)); ?></small></font></td>
							   <td width="5%"><font size="1"><small><?php echo date("d-m-Y",strtotime($q->recepcion)); ?></small></font></td>
							   <td><font size="1"><small>{{ $q->tipo}}</small></font></td>
							   <td><font size="1"><small>{{ $q->rif}}</small></font></td>
							  <td width="10%"><font size="1"><small>{{ $q->nombre}}</small></font></td>       
							  <td><font size="1"><small>NAC</small></font></td>       
							  <td><font size="1"><small>{{$q->factura}}</small></font></td> 
							  <td><font size="1"><small>{{$q->control}}</small></font></td> 
							  <td><font size="1"><small></small></font></td> 
							  <td><font size="1"><small></small></font></td> 
							  <td><font size="1"><small></small></font></td> 
							    <td><font size="1"><small>01-Reg</small></font></td>
								<td><font size="1"><small><?php $acum=$acum+ ($q->total*$q->tasa); echo number_format(($q->total*$q->tasa), 2,',','.'); ?></small></font></td>								
								<td><font size="1"><small><?php $acumex=$acumex+ ($q->exento*$q->tasa); echo number_format(($q->exento*$q->tasa), 2,',','.'); ?></small></font></td>
								<td><font size="1"><small><?php $acumbase=$acumbase+($q->base*$q->tasa); echo number_format(($q->base*$q->tasa), 2,',','.'); ?></small></font></td>								
									  <td><font size="1"><small>16 %</small></font></td> 
								<td><font size="1"><small><?php $acumiva=$acumiva+($q->iva*$q->tasa); echo number_format(($q->iva*$q->tasa), 2,',','.'); ?></small></font></td>														  
							  <td colspan="4"><table width="100%" border="0"> @foreach($retenc as $ret)
							  <?php if($q->idcompra == $ret->idcompra){ $acumret=$acumret+$ret->mret; $idret=explode("-",$ret->fecha); ?>
							  <tr>
							  <td><font size="1"><small><?php if($ret->afiva==1) { echo $idret[0].$idret[1].add_ceros($ret->correlativo,$ceros); }else { echo add_ceros($ret->correlativo,$ceros); }; ?></small></font></td>
							  <td><font size="1"><small><?php echo date("d-m-Y",strtotime($ret->fecha)); ?></small></font></td>
							  <td><font size="1"><small>{{$ret->ret}}%</small></font></td>
							  <td><font size="1"><small>{{$ret->mret}}</small></font></td>
						
							  <?php } ?>
							  @endforeach</table></td>							  						
							</tr>    
					@endforeach
							<tr>
								<td colspan="13"> <font size="1"><small><strong>TOTAL TRANSACCIONES: <?php echo $count; ?></strong></small></font></td>
								<td><font size="1"><small><strong><?php echo number_format($acum, 2,',','.')." Bs"; ?></strong></small></font></td>
								<td><font size="1"><small><strong><?php echo number_format($acumex, 2,',','.')." Bs"; ?></strong></small></font></td>
								<td><font size="1"><small><strong><?php echo number_format($acumbase, 2,',','.')." Bs"; ?></strong></small></font></td>
								<td></td>
								<td><font size="1"><small><strong><?php echo number_format($acumiva, 2,',','.')." Bs"; ?></strong></small></font></td>
								<td></td>	<td></td>	<td></td>
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
                  <p align="center" ><font size="1"><small><b>RESUMEN DEL LIBRO DE COMPRAS</b></small></font></p>

                  <div>
                    <table border="1" width="100%">
                      <tr>
					    <th></th>
                        <th style="width:10%"><font size="1"><small><b>Base Imponible</b></small></font></th>
                        <th style="width:10%"><font size="1"><small><b>Credito Fiscal</b></small></font></th>
                        <th style="width:10%"><font size="1"><small><b>Iva Retenido</b></small></font></th>
                      </tr>
                      <tr>
                        <th><font size="1"><small>Compras exentas y/o sin derecho a crédito fiscal:</small></font></th>
                        <td><font size="1"><small><?php echo number_format($acumex, 2,',','.')." Bs"; ?></small></font></td>
                        <td></td>
                        <td></td>
                      </tr>
						<tr>
                        <th><font size="1"><small>Compras importación afectas solo Alicuota General. 16%:</small></font></th>						 
                        <td></td>
                        <td></td>
                        <td></td>
						</tr>
                      <tr>
                        <th><font size="1"><small>Compras importación afectas en Alicuota General + Adicional. 31%</small></font></th>
                        <td></td>
                        <td></td>
                        <td></td>                       
                      </tr>
					        <tr>
                        <th><font size="1"><small>Compras importación afectas en Alicuota Reducida. 8%</small></font></th>
						<td></td>
                        <td></td>
                        <td></td>
                      </tr>
					        <tr>
                        <th><font size="1"><small>Compras Internas afectas solo Alicuota General. 16% </small></font></th>
                        <td><font size="1"><small><?php echo number_format($acumbase, 2,',','.')." Bs"; ?></small></font></td>
                        <td><font size="1"><small><?php echo number_format($acumiva, 2,',','.')." Bs"; ?></small></font></td>
                        <td><font size="1"><small><?php echo number_format("0", 2,',','.')." Bs"; ?></small></font></td>
                      </tr>
						<tr>
                        <th><font size="1"><small>Compras Internas en Alicuota General + Adicional. 31% </small></font></th>
						<td></td>
                        <td></td>
                        <td></td>
                      </tr>
						<tr>
                        <th><font size="1"><small>Compras Internas en Alicuota Reducida. 8% </small></font></th>
						<td></td>
                        <td></td>
                        <td></td>
                      </tr>					  
					        <tr>
                        <th><font size="1"><small><b>TOTALES</b></th>
                        <td><font size="1"><small><?php echo number_format(($acumbase+$acumex), 2,',','.')." Bs"; ?></small></font></td>
                        <td><font size="1"><small><?php echo number_format($acumiva, 2,',','.')." Bs"; ?></small></font></td>
                        <td><font size="1"><small><?php echo number_format("0", 2,',','.')." Bs"; ?></small></font></td>
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
  window.location="{{route('librocompras')}}";
    });

});

</script>

@endpush
@endsection