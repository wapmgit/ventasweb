<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PedidoShein extends Model
{
   use HasFactory;

	protected $table='pedidoshein';

    protected $primaryKey='idpedido';

    public $timestamps=false;

    protected $fillable =[
    	'idcliente',
    	'codlote',
		'idvendedor',
    	'fechapedido',
		'monto',
		'saldo',
		'estatus',
    	'anulado',
    	'user'
    ];

    protected $guarded =[

    ];
}
