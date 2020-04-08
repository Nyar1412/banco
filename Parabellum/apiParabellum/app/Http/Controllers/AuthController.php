<?php

namespace App\Http\Controllers;


use App\Usuario;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Hash;
use JWTAuth;


class AuthController extends Controller
{
    public function register(Request $request)
    {
        $user = Usuario::create([
            'nick' => $request->input('nick'),
            'email' => $request->input('email'),
            'fk_personaje' => null,
            'rol' => 'usuario',
            'habilitado' => true,
            'password' => Hash::make($request->input('password')),
        ]);
        $token = auth('api')->login($user);
        return $this->respondWithToken($token);
    }
    public function login(Request $request)
    {
        $nom = $request->input('nick');
        $pass = $request->input('password');
        $user = Usuario::where('nick', $nom)
            ->first();
        if (isset($user) && Hash::check($pass, $user->password)) {
            $token = JWTAuth::fromUser($user);
            return $this->respondWithToken($token);
        } else {
            return response()
                ->json(['error' => 'Unauthorized ', $nom => $pass], 401);
        }
    }
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => 1440
        ]);
    }
}

