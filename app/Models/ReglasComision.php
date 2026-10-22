<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReglasComision extends Model
{
    use HasFactory;
	protected $table='reglacomision';

    protected $primaryKey='idregla';

    public $timestamps=false;

    protected $fillable =[
    	'desde',
    	'hasta',
    	'porcentaje'
    ];

    protected $guarded =[

    ];
}
