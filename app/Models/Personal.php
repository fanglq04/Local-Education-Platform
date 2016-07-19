<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Personal extends Model
{


    /**
     * 个人与用户一对一关系
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo('App\User');
    }

}
