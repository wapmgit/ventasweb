<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Detalle_PedidoShein extends Model
{
      use HasFactory;
	protected $table='detalle_pedidoshein';

    protected $primaryKey='iddetalle';

    public $timestamps=false;

    protected $fillable =[
    	'idpedido',
    	'codigo',
    	'descripcion',
    	'cantidad',
    	'costo',
    	'envio',
		'subtotal',
		'fecha'
    ];

    protected $guarded =[

    ];
}
