<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use Exception;
use App\Models\Empresa;
use App\Models\Articulos;
use DB;
use Carbon\Carbon;

class SendtoMercarapi extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'sendtomercarapi';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'enviar articulos a mercarapi';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
			$emp=Empresa::findOrFail(1);
			$empresa=$emp->uuid;
		/*	  $products=DB::table('articulos as art')
				->select('art.codweb as barcode','art.nombre as name','art.stock','art.iva','art.precio1 as price','art.unidad as unit','art.cntxund','art.cntgrupo','art.fraccion','art.peso as weight','art.codigo as codesv','art.imagen as img')
				->where('art.stock','>=','0')
				->whereNotNull('art.codweb')
				->get()->toArray(); */
		$products = Articulo::selectRaw("
        codweb as barcode,
        SUBSTRING_INDEX(nombre, '*', 1) as name,
        ROUND(stock, 2) as stock,
        iva,
        IF(cntxund > 1, ROUND((precio1 / cntxund), 2), ROUND(precio1, 2)) as price,
        unidad as unit,
        ROUND(cntxund, 0) as cntxund,
        ROUND(cntgrupo, 0) as cntgrupo,
        ROUND(fraccion, 2) as fraccion,
        peso as weight,
        codigo as codesv,
        imagen as img
    ")
    ->where('stock', '>', 0)
    ->whereNotNull('codweb')
    ->orderBy('name', 'asc')
    ->get()->toArray();
          $response = Http::post('http://mercarapid.nks-sistemas.net/api/recibir-inventario', [
                'store' => $empresa,
                'productos' => ["data" => $products]
            ]);
			
		//act last actualizacion en empresa
		$emp=Empresa::findOrFail(1);
        $mytime=Carbon::now('America/Caracas');
		$emp->lastact=$mytime->toDateTimeString();
		$emp->update();
    }
}
