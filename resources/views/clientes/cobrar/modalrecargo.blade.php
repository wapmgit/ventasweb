@php
    $diasCredito = ($cat->diascre ?? 15) > 0 ? ($cat->diascre ?? 15) : 15;
    $periodosSugeridos = floor($dias / $diasCredito);
    $tienePeriodosSuficientes = $periodosSugeridos >= 1;
@endphp
<div class="modal fade" id="recargo{{ $cat->idventa }}" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
    <form action="{{ route('saverecargo') }}" method="POST" id="form-recargo-{{ $cat->idventa }}">
                @csrf
                <div class="modal-header bg-warning">
                    <h5 class="modal-title">
                        <i class="fa fa-line-chart"></i> Generar Nota de Débito por Mora
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                <div class="modal-body">
                    <input type="hidden" name="idventa" value="{{ $cat->idventa }}">
                    <input type="hidden" name="ndias" value="{{ $dias }}">
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Cliente:</label>
                                <input type="text" class="form-control" value="{{ $cliente->nombre}}" readonly>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Saldo Pendiente Base:</label>
                                <input type="text" class="form-control saldo-base" value="{{ number_format($cat->saldo, 2) }}" readonly data-saldo="{{ $cat->saldo }}">
                            </div>
                        </div>
                    </div>

                    <!-- Información de referencia -->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Días de Mora Totales:</label>
                                <input type="text" class="form-control text-danger font-weight-bold dias-mora-totales" value="{{ $dias }} días" readonly data-dias="{{ $dias }}">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Días de Crédito (Ciclo del Cliente):</label>
                                <input type="text" class="form-control dias-credito-cliente" value="{{ $cat->diascre ?? 15 }} días" readonly data-diascre="{{ $cat->diascre ?? 15 }}">
                            </div>
                        </div>
                    </div>

                    <hr>

                    <!-- SELECTOR DE MÉTODO DE CÁLCULO -->
                  <div class="form-group">
    <label class="text-primary font-weight-bold">Método de Cálculo del Recargo:</label>
    <div class="row">
        <div class="col-md-6">
            <div class="form-check">
                <input class="form-check-input metodo-calculo" type="radio" 
                       name="metodo_calculo_{{ $cat->idventa }}" 
                       id="metodo_periodos_{{ $cat->idventa }}" 
                       value="periodos" 
                       {{ $tienePeriodosSuficientes ? 'checked' : 'disabled' }}>
                
                <label class="form-check-label font-weight-bold {{ !$tienePeriodosSuficientes ? 'text-muted' : '' }}" for="metodo_periodos_{{ $cat->idventa }}">
                    Por Períodos de Crédito (Enteros)
                    @if(!$tienePeriodosSuficientes)
                        <br><small class="text-danger font-weight-normal">(No disponible: el cliente tiene {{ $dias }} días y su ciclo es de {{ $diasCredito }} días)</small>
                    @endif
                </label>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-check">
                <input class="form-check-input metodo-calculo" type="radio" 
                       name="metodo_calculo_{{ $cat->idventa }}" 
                       id="metodo_total_{{ $cat->idventa }}" 
                       value="total_dias" 
                       {{ !$tienePeriodosSuficientes ? 'checked' : '' }}>
                
                <label class="form-check-label font-weight-bold" for="metodo_total_{{ $cat->idventa }}">
                    Porcentaje Directo / Total de Días
                </label>
            </div>
        </div>
    </div>
</div>

                    <div class="row">
                        <!-- Bloque que se muestra si elige POR PERIODOS -->
                        <div class="col-md-6 contenedor-periodos">
                            <div class="form-group">
                                <label>Períodos a Cobrar (Enteros):</label>
                                @php
                                    $diasCredito = ($cat->diascre ?? 15) > 0 ? ($cat->diascre ?? 15) : 15;
                                    $periodosSugeridos = floor($dias / $diasCredito);
                                   
                                @endphp
                                <input type="number"  {{ $tienePeriodosSuficientes ? 'checked' : 'disabled' }} class="form-control input-periodos font-weight-bold" name="periodos_cobrados" value="{{ $periodosSugeridos }}" min="1" max="{{$periodosSugeridos}}" step="1">
                                <small class="text-muted">Basado en sus días de crédito.</small>
                            </div>
                        </div>

                        <!-- Porcentaje de Recargo (Aplica para ambos métodos) -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="porcentaje">Porcentaje de Recargo (%):</label>
                                <input type="number" step="0.01" class="form-control porcentaje-recargo" name="porcentaje" min="1" placeholder="Ej: 5.00" required>
                            </div>
                        </div>
                    </div>

                    <!-- MONTO CALCULADO EN TIEMPO REAL -->
                    <div class="form-group bg-light p-3 border rounded">
                        <label class="font-weight-bold">Monto Total de la Nota de Débito:</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">$</span>
                            </div>
                            <input type="text" class="form-control font-weight-bold text-success monto-calculado" name="monto_nota" value="0.00" readonly>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="observacion">Motivo / Observación:</label>
                        <textarea class="form-control" name="observacion" rows="2">N/D por recargo de mora - Factura N° {{ $cat->serie_comprobante }}-{{ $cat->num_comprobante }}</textarea>
                    </div>
                </div>

       <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        
        <!-- Botón con ID único y llamada directa a la función JavaScript pasando el idventa -->
        <button type="button" class="btn btn-primary" id="btn-submit-{{ $cat->idventa }}" onclick="enviarRecargo({{ $cat->idventa }})">
            Generar Nota de Débito
        </button>
    </div>
            </form>
        </div>
    </div>
</div>