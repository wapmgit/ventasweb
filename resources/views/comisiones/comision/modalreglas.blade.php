<div class="modal fade modal-slide-in-right" aria-hidden="true" role="dialog" tabindex="-1" id="modalreglas">
    <form action="{{ route('ajustaregla') }}" method="GET" enctype="multipart/form-data">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h4 class="modal-title"><i class="fa fa-percent mr-1"></i> Reglas para Comisiones por Días de Retraso</h4>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                
                <div class="modal-body">
                    <!-- Mensaje explicativo con diseño de alerta informativa limpia -->
                    <div class="alert alert-info text-sm mb-3">
                        <i class="fa fa-info-circle mr-1"></i> 
                        Establece el intervalo de días posteriores a los días de crédito del cliente. Esto afectará la comisión aplicando el porcentaje indicado.
                    </div>

                    <!-- Sección para agregar regla -->
                    <div class="p-3 bg-light rounded mb-4 border">
                        <div class="row align-items-end">
                            <div class="col-md-3 form-group mb-md-0">
                                <label class="form-label small font-weight-bold">Desde (Días)</label>
                                <input type="number" name="desde_nuevo" id="input_desde" class="form-control form-control-sm" placeholder="Ej. 1">
                            </div>
                            <div class="col-md-3 form-group mb-md-0">
                                <label class="form-label small font-weight-bold">Hasta (Días)</label>
                                <input type="number" name="hasta_nuevo" id="input_hasta" class="form-control form-control-sm" placeholder="Ej. 5">
                            </div>
                            <div class="col-md-3 form-group mb-md-0">
                                <label class="form-label small font-weight-bold">Porcentaje (%)</label>
                                <input type="number" step="0.01" name="porcentaje_nuevo" id="input_porcentaje" class="form-control form-control-sm" placeholder="Ej. 10">
                            </div>
                            <div class="col-md-3 form-group mb-md-0">
                                <button type="button" id="bt_add" class="btn btn-success btn-sm btn-block">
                                    <i class="fa fa-plus mr-1"></i> Agregar Regla
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Tabla con Resultados -->
                    <div class="table-responsive">
                        <table id="detalles" class="table table-sm table-hover table-bordered align-middle mb-0 text-center">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Desde (Días)</th>
                                    <th>Hasta (Días)</th>
                                    <th style="width: 120px;">Porcentaje (%)</th>
                                    <th style="width: 60px;">Acción</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($regla as $key => $p)
                                <tr class="selected" id="fila{{ $key }}">
                                    <td>
                                        <input type="hidden" name="idregla[]" value="{{ $p->idregla }}">
                                        <input type="hidden" name="desde[]" value="{{ $p->desde }}">
                                        {{ $p->desde }}
                                    </td>
                                    <td>
                                        <input type="hidden" name="hasta[]" value="{{ $p->hasta }}">
                                        {{ $p->hasta }}
                                    </td>
                                    <td>
                                        <input type="hidden" name="porcentaje[]" value="{{ $p->porcentaje }}">
                                        {{ $p->porcentaje }} %
                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-outline-danger btn-xs" onclick="eliminar({{ $key }});">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary"><i class="fa fa-save mr-1"></i> Confirmar</button>
                </div>
            </div>
        </div>
    </form>
</div>