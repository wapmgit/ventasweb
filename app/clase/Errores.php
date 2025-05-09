<?php 
namespace App\clase;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Errores extends Model
    {
		use HasFactory;
        public function logs($error,$u){
		$user=$u;
		$square_file = fopen("dist/errors.txt", "a+");
		//write the squares from 1 to 10 
			$i = date("Y-m-d");
			$square = $error;
			$line = "Error el $i Usuario $user Sobre: $square.\n";
			fwrite($square_file, $line);

		//read the first line of the file and echo 
		fseek($square_file, 0);
		fgets($square_file);
		//close the file 
		fclose($square_file);
		 $msg="ERROR AL INGRESAR DATOS, Contacte Tecnico de Soporte";
		return $msg." Error ".$error; 
		}
		  protected $guarded =[

    ];
	
    }
	
	?>