<?php

namespace App\Http\Middleware;

use Closure;
use JWTAuth;
class updateUserValidate
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $token = JWTAuth::parseToken();
        $rol = JWTAuth::getPayload()->get('rol');
        $id = JWTAuth::getPayload()->get('id');
        if( $rol == 'admin'){
            return $next($request);
        }else{
            return response()->json(['mensaje' => $rol], 401);
        }
    }
}
