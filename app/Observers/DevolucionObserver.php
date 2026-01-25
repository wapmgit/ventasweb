<?php

namespace App\Observers;

use App\Models\Detalledevolucion;
use App\Models\Articulos;
use App\Models\Kardex;
use Auth;
use Carbon\Carbon;

class DevolucionObserver
{
    public function created(Detalledevolucion $detalle)
    {
        // 1. REponer STOCK (Sumamos porque es una devolución)
        $articulo = Articulos::find($detalle->idarticulo);
        if ($articulo) {
            $articulo->increment('stock', $detalle->cantidad);
        }
		//Buscamos los seriales que estaban asignados a este artículo en esta venta
		\App\Models\Seriales::where('idarticulo', $detalle->idarticulo)
        ->where('iddetalleventa', $detalle->iddetalle_venta) // O por idventa si prefieres
        ->update([
            'estatus' => 0,
            'idventa' => 0,
            'iddetalleventa' => 0
        ]);

        // 2. REGISTRAR KARDEX (Entrada por devolución)
        $kar = new Kardex;
        $kar->fecha = Carbon::now('America/Caracas');
        $kar->documento = "DEV-ID:" . $detalle->iddevolucion;
        $kar->idarticulo = $detalle->idarticulo;
        $kar->cantidad = $detalle->cantidad;
        $kar->costo = $detalle->precio_venta; // Precio al que se devolvió
        $kar->tipo = 1; // Tipo 1 suele ser Entrada en tu sistema
        $kar->user = Auth::user()->name ?? 'Sistema';
        $kar->save();
    }
}