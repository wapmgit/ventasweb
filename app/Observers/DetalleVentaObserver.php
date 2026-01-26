<?php

namespace App\Observers;

use App\Models\DetalleVentas;
use App\Models\Articulos;
use App\Models\Kardex;
use Auth;
use Carbon\Carbon;

class DetalleVentaObserver
{	
	protected static $procesados = [];

    public function created(DetalleVentas $detalle)
    {
	
    //dd("El observer está funcionando para el artículo: " . $detalle->idarticulo);

	if (in_array($detalle->id, self::$procesados)) {
            return;
        }
		
        // 1. ACTUALIZAR STOCK
        $articulo = Articulos::find($detalle->idarticulo);
        if ($articulo) {
            $articulo->decrement('stock', $detalle->cantidad);
        }

        // 2. REGISTRAR KARDEX
        $kar = new Kardex;
        $kar->fecha = Carbon::now('America/Caracas');
        $kar->documento = "VENT-" . $detalle->idventa;
        $kar->idarticulo = $detalle->idarticulo;
        $kar->cantidad = $detalle->cantidad;
        $kar->costo = $detalle->costoarticulo;
        $kar->tipo = 2; // Salida
        $kar->user = Auth::user()->name ?? 'Sistema';
        $kar->save();
		// Marcamos este detalle como "ya listo"
        self::$procesados[] = $detalle->id;
    }
}