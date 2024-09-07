<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Redirect;
use App\Models\Monedas;
use DB;
use Auth;

class MonedasController extends Controller
{
	  public function __construct()
	{
		$this->middleware('auth');
	}
	public function index(Request $request){	
		if ($request){
			$rol=DB::table('roles')-> select('newmoneda','editmoneda')->where('iduser','=',$request->user()->id)->first();	
            $query=trim($request->get('searchText'));
            $monedas=DB::table('monedas')->where('nombre','LIKE','%'.$query.'%')
            ->orderBy('idmoneda','asc')
            ->paginate(20);
            return view('sistema.monedas.index',["rol"=>$rol,"monedas"=>$monedas,"searchText"=>$query]);
		}
		
	}
		public function create(){
		return view('sistema.monedas.create');
	}
	    public function store (Request $request)
    {
		     $this->validate($request,[
            'nombre' => 'required',
            'simbolo' => 'required',
            'valor' => 'required'
        ]);
        $mone=new Monedas;
        $mone->nombre=$request->get('nombre');
        $mone->simbolo=$request->get('simbolo');
        $mone->tipo=$request->get('tipo');
        $mone->valor=$request->get('valor');
        $mone->idbanco=0;
        $mone->save();
       return Redirect::to('monedas');

    }
	    public function edit($id)
    {
		$mone=Monedas::find($id);
			return view('sistema.monedas.edit')
			->with('mone',$mone);

    }
		public function update(Request $request)
    {
		     $this->validate($request,[
            'nombre' => 'required',
            'simbolo' => 'required',
            'valor' => 'required'
        ]);
        $data=Monedas::findOrFail($request->id);
        $data->nombre=$request->get('nombre');
        $data->simbolo=$request->get('simbolo');
        $data->tipo=$request->get('tipo');
        $data->valor=$request->get('valor');	
        $data->update();
       return Redirect::to('monedas');
    }
}
