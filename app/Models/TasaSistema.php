<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TasaSistema extends Model
{
	    use HasFactory;
	protected $table='tasassistema';

    protected $primaryKey='id';

    public $timestamps=false;

    protected $fillable =[
    	'fecha',
    	'tasadolar',
    	'tasapromedio',
		'variacion'
    ];

    protected $guarded =[

    ];
}
