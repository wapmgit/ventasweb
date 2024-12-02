<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetalleApartado extends Model
{
    use HasFactory;
	protected $table='detalle_apartado';

    protected $primaryKey='iddetalle_venta';

    public $timestamps=false;

    protected $fillable =[
    	'idventa',
    	'idarticulo',
    	'costoarticulo',
    	'cantidad',
    	'precio_venta',
    	'descuento',
		'fecha_emi',
		'fecha'
    ];

    protected $guarded =[

    ];
}
