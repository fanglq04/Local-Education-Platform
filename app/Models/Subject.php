<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Subject extends Model
{
    /**
     * 一个科目隶属于一个分类
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function category()
    {
        return $this->belongsTo('App\Models\Category');
    }


    /**
     * 一个科目有多个机构或个人
     * @return mixed
     */
    public function users()
    {
        return $this->belongsToMany('App\User');
    }
}
