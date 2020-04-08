<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Tymon\JWTAuth\Contracts\JWTSubject;

/**
 * @property int $id
 * @property int $fk_personaje
 * @property string $nick
 * @property string $password
 * @property string $rol
 * @property boolean $habilitado
 * @property string $email
 * @property Personaje $personaje
 * @property Usuario[] $usuarios
 */
class Usuario extends Authenticatable implements JWTSubject
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'Usuario';

    /**
     * @var array
     */
    protected $fillable = ['fk_personaje', 'nick', 'password', 'rol', 'habilitado', 'email'];

    /**
     * Indicates if the model should be timestamped.
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function personaje()
    {
        return $this->belongsTo('App\Personaje', 'fk_personaje');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function usuarios()
    {
        return $this->belongsToMany('App\Usuario', 'Aliado', 'fk_id_usuario1', 'fk_id_usuario2');
    }
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }
    public function getJWTCustomClaims()
    {
        return [
            'rol'=>$this->rol,
            'id'=>$this->id,
        ];
    }
}
