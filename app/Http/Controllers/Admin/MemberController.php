<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2016-07-22
 * Time: 09:41
 */

namespace App\Http\Controllers\Admin;


use App\User;
use Breadcrumbs;

class MemberController extends BaseController
{

    public function __construct()
    {
        Breadcrumbs::setView('admin._partials.breadcrumbs');

        Breadcrumbs::register('admin-member', function ($breadcrumbs) {
            $breadcrumbs->parent('dashboard');
            $breadcrumbs->push('用户管理', route('admin.member.index'));
        });
        parent::__construct();
    }


    //首页、列表
    public function index()
    {
        Breadcrumbs::register('admin-member-index', function ($breadcrumbs) {
            $breadcrumbs->parent('admin-member');
            $breadcrumbs->push('用户列表', route('admin.member.index'));
        });
        $users = User::all();
        
        return view('admin.member.index', ['users' => $users]);
    }


    //编辑
    public function edit($uid)
    {
        $uer = User::findOrNew($uid);
        print_r($uer);
        $userModel = new User();
        $info = $userModel->autoReturnUserInfo($uer);
        print_r($info);

        return view('admin.member.edit');
    }


    //禁用
    public function forbidden()
    {
        return response()->json(array('msg' => '12332'), 200);
    }


    //启用
    public function open()
    {
        return response()->json(array('msg' => '12332'), 200);
    }


    //详细
    public function detail()
    {
        return view('admin.member.detail');
    }


}