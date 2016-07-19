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
    public function index()
    {
//        return view('home');

// 以下是正确的
//        $user = User::find('2')->manyCategory;
//        foreach ($user AS $u) {
//            echo  $u->name;
//        }
// 以下是正确的
//        $users = Category::findOrNew('2')->users;
        $users = Category::all();
//        print_r($users);
//        exit();
        foreach ($users AS $user) {
//             print_r($user->users);
            foreach ($user->users AS $u) {
                print_r($u->organization);
                print_r($u->personal);
                print_r($u->member);
            }
        }
    }




}
