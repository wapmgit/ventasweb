<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use App\Models\Articulo;
use DB;

class SendArticle extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'enviarArticulos';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

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
		$empresa=DB::table('empresa')->first();
		$article = Articulo::selectRaw("
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
    ->get();
			$articlejs=json_encode($article);

            $response = Http::post('http://creciven.com/api/recibir-articulos', [
                'empresa' => $empresa->codigo,
                'articulos' => $articlejs,
            ]);
    }
}
