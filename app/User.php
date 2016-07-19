<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];


    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];


    /**
     * user-member 1:1
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function member()
    {
        return $this->hasOne('App\Models\Member');
    }


    /**
     * user-personal 1:1
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function personal()
    {
        return $this->hasOne('App\Models\Personal');
    }


    /**
     * user-organization 1:1
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function organization()
    {
        return $this->hasOne('App\Models\Organization');
    }


    /**
     * users-categorys m:n
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function manyCategory()
    {
        return $this->belongsToMany('App\Models\Category', 'category_user', 'user_id', 'category_id');
    }
}
