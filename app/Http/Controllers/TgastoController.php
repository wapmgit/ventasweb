<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Tgasto;
use Illuminate\Support\Facades\Redirect;
use DB;
use Auth;

class TgastoController extends Controller
{
public function __construct()
	{
	$this->middleware('auth');
	}
	public function index(Request $request)
    {
		$query=trim($request->get('searchText'));
		$data=DB::table('tipo_gasto')->where('nombregasto','LIKE','%'.$query.'%')
        -> get();
            return view('gastos.tgasto.index',["data"=>$data,"searchText"=>$query]);
		
    }
	public function create()
    {
	
        return view("gastos.tgasto.create");
    }
	public function store (Request $request)
    {
        $ruta=new Tgasto;
        $ruta->nombregasto=$request->get('nombre');
        $ruta->idclasi=$request->get('clasi');
        $ruta->save();
           return Redirect::to('itgasto');

    }
		public function edit($id)
    {
		$data=Tgasto::find($id);
			return view('gastos.tgasto.edit')
			->with('data',$data);

    }
		public function update(Request $request)
    {

        $actruta=Tgasto::findOrFail($request->id);
        $actruta->nombregasto=$request->get('nombre');
        $actruta->idclasi=$request->get('clasi');
        $actruta->update();
       return Redirect::to('itgasto');
    }
}
