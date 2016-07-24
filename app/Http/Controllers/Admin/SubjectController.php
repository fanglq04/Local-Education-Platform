<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016-07-22
 * Time: 11:02
 */

namespace App\Http\Controllers\Admin;


class SubjectController extends BaseController
{

    /**
     * 一个科目有多个机构或个人
     * @return mixed
     */
    public function users()
    {
        return $this->belongsToMany('App\User');
    }
}