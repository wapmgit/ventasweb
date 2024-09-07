<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Banco extends Model
{
    use HasFactory;	
	protected $table='bancos';

    protected $primaryKey='idbanco';

    public $timestamps=false;

    protected $fillable =[
		'codigo',
    	'nombre',
    	'cuentaban',
    	'tipocta',
    	'titular',
    	'mail'
    ];

    protected $guarded =[

    ];
}
