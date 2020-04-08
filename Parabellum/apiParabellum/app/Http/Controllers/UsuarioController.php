<?php

namespace App\Http\Controllers;

use App\Usuario;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Hash;
use App\Http\Resources\UsuarioResource;
use JWTAuth;
class UsuarioController extends Controller
{

    public function __construct()
    {
        $this->middleware('rolAuth')->except(['index','show','put']);
    }

    public function index()
    {
        return UsuarioResource::collection(Usuario::all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        return json(['error'=>'method not aplicated'],500);
    }

    /**
     * Display the specified resource.
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Usuario  $Usuario
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //solucionar el fallo causado por no encontrar el usuario por el id
        return new UsuarioResource(Usuario::find($id));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Usuario  $Usuario
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Usuario $Usuario)
    {
        $id = JWTAuth::getPayload()->get('id');
        $UsuarioDB=Usuario::where('id',$id);
        if($UsuarioDB != null){
            $Usuario->nick = ($request->nick) ?? $Usuario->nick;
            $Usuario->email = ($request->email) ?? $Usuario->email;
            //$Usuario->password = ($request->password) ? Hash::make($request->input('password')): $Usuario->password;
            $Usuario->save();
            return new UsuarioResource($Usuario);
        }else{
            return json(["mensaje" => 'el usuario no existe'],404);
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Usuario  $Usuario
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $r)
    {
        $Usuario=Usuario::find($r->usuario);
        if (isset($Usuario)) {
            $Usuario->delete();
            return response()->json(null, 204);
        } else {
            return response()->json(null, 404);
        }
    }
}
