<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Agrupados extends Model
{
    use HasFactory;
	
	protected $table='agrupados';

    protected $primaryKey='id';

    public $timestamps=false;

    protected $fillable =[
    	'idarticulo',
    	'descripcion',
    	'cantidad',
    	'preciov'
    ];

    protected $guarded =[

    ];
}
