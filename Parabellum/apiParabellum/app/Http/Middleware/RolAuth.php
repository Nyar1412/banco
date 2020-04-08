<?php

namespace App\Http\Middleware;

use Closure;
use JWTAuth;
class RolAuth
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
        $resp = JWTAuth::getPayload()->get('rol');
        if( $resp == 'admin'){
            return $next($request);
        }else{
            return response()->json(['mensaje' => 'rol no autorizado'], 401);
        }
    }
}
