<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comisionshein extends Model
{
   use HasFactory;
	  protected $table='comisioneshein';

    protected $primaryKey='idcomision';

    public $timestamps=false;

    protected $fillable =[
    	'idvendedor',
    	'montoventas',
    	'montocomision',
		'pendiente',
		'fecha',
		'usuario'
    ];

    protected $guarded =[

    ];
}
