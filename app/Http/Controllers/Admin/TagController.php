<?php
/**
 * --------------------------------------
 * 标签管理C层
 * User: Jiafang.Wang
 * Date: 2016/7/23
 * Time: 23:28
 * -------------------------------------
 */

namespace App\Http\Controllers\Admin;

use Breadcrumbs;
use App\Models\Tag;
use Request;

class TagController extends BaseController
{
    public function __construct()
    {
        Breadcrumbs::setView('admin._partials.breadcrumbs');

        Breadcrumbs::register('admin-tag', function ($breadcrumbs) {
            $breadcrumbs->parent('dashboard');
            $breadcrumbs->push('标签管理', route('admin.tag.index'));
        });

        parent::__construct();
    }

    /**
     * 首页
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        Breadcrumbs::register('admin-tag-index', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-tag');
            $breadcrumbs->push('标签列表', route('admin.tag.index'));
        });
        $tags = Tag::all();
        return view('admin.tag.index', ['tags' => $tags]);
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
