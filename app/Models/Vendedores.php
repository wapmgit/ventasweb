<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vendedores extends Model
{
    use HasFactory;
	protected $table='vendedores';

    protected $primaryKey='id_vendedor';

    public $timestamps=false;

    protected $fillable =[
    	'nombre',
    	'telefono',
    	'cedula',
		'comision',
		'direccion'
    ];

    protected $guarded =[

    ];
}
