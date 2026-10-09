<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Campana extends Model
{
    use HasFactory;
	
	protected $table='campana';

    protected $primaryKey='id';

    public $timestamps=false;

    protected $fillable =[
    	'codigo',
    	'creado',
		'cierre',
    	'costo',
		'utilidad',
		'saldo',
		'estatus',
    	'usuario'
    ];

    protected $guarded =[

    ];
}
