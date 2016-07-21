<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use App\User;
use App\Models\Category;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
//        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

        if($request->user()) {
            redirect('login');
        }

// 以下是正确的
//        $user = User::find('2')->manyCategory;
//        foreach ($user AS $u) {
//            echo  $u->name;
//        }
// 以下是正确的
//        $users = Category::findOrNew('2')->users;
//        $users = Category::all();
//        print_r($users);
//        exit();
//        foreach ($users AS $user) {
//             print_r($user->users);
//            foreach ($user->users AS $u) {
//                print_r($u->organization);
//                print_r($u->personal);
//                print_r($u->member);
//            }
//        }
        //实例化模型
        $userModel = new User();
        //请求用户对象
        $user = $request->user();
        echo '当前登录用户名：'.$user->name;
        echo "<br />";

        //用户组类型
        echo '所属组类别：'.$userModel->statusDisplay($user->type);
        echo "<br />";

        $userInfo = $userModel->autoReturnUserInfo($user);


        echo '真实名称：'.$userInfo->name;
        echo "<br />";
        echo '描述：'.$userInfo->description;
        echo "<br />";
        echo '性别：'. $userModel->genderDisplay($userInfo->gender);
        echo "<br />";
        echo '认证状态：'.$userModel->authDisplay($userInfo->authable);
        echo "<br />";




        $tags = User::find($user->id)->tags;

        echo "标签是：<br />";
        foreach ($tags AS $tag) {
            echo $tag->name;
            echo "<br />";
        }
        return view('home');

    }




}
