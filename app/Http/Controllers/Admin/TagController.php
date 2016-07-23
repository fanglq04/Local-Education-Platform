<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2016/7/23
 * Time: 23:28
 */

namespace App\Http\Controllers\Admin;


class TagController extends BaseController
{
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * 首页
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        return view('admin.tag.index');
    }

    /**
     * 编辑
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function edit()
    {
        return view('admin.tag.edit');
    }


    /**
     * 更新
     */
    public function update()
    {

    }


    /**
     * 删除
     */
    public function delete()
    {

    }


}