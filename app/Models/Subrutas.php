<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subrutas extends Model
{
     use HasFactory;
	protected $table='subrutas';

    protected $primaryKey='idsubruta';

    public $timestamps=false;

    protected $fillable =[
    	'idruta',
    	'nombre',
    	'descripcion'
    ];

    protected $guarded =[

    ];
}
