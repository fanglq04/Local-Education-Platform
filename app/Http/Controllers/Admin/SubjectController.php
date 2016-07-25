<?php
/**
 * --------------------------------------
 * 科目类控制器
 * User: Jiafang.Wang
 * Date: 2016-07-22
 * Time: 11:02
 * File: SubjectController.php
 * --------------------------------------
 */

namespace App\Http\Controllers\Admin;

use Breadcrumbs;
use App\Models\Subject;

class SubjectController extends BaseController
{

    public function __construct()
    {
        Breadcrumbs::setView('admin._partials.breadcrumbs');

        Breadcrumbs::register('admin-subject', function ($breadcrumbs) {
            $breadcrumbs->parent('dashboard');
            $breadcrumbs->push('科目管理', route('admin.subject.index'));
        });

        parent::__construct();
    }


    /**
     * 首页、默认页
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        Breadcrumbs::register('admin-subject-index', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-subject');
            $breadcrumbs->push('科目列表', route('admin.subject.index'));
        });
        $subjects = Subject::all();
        return view('admin.subject.index', ['subjects' => $subjects]);
    }



}
