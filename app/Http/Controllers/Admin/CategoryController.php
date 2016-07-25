<?php
/**
 * ----------------------------------------------------
 * 分类管理C层
 * User: Jiafang.Wang
 * Date: 2016-07-25
 * Time: 09:41
 * File: CategoryController.php
 * ----------------------------------------------------
 */

namespace App\Http\Controllers\Admin;

use Breadcrumbs;
use App\Models\Category;

class CategoryController extends BaseController
{

    public function __construct()
    {
        Breadcrumbs::setView('admin._partials.breadcrumbs');

        Breadcrumbs::register('admin-category', function ($breadcrumbs) {
            $breadcrumbs->parent('dashboard');
            $breadcrumbs->push('分类管理', route('admin.category.index'));
        });

        parent::__construct();
    }


    public function index()
    {
        Breadcrumbs::register('admin-category-index', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-category');
            $breadcrumbs->push('分类列表', route('admin.category.index'));
        });
        $categories = Category::all();
        return view('admin.category.index', ['categories' => $categories]);
    }

    public function edit()
    {

    }

    public function update()
    {

    }

    public function delete()
    {

    }




}