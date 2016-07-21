<?php

namespace App\Http\Controllers;

use App\Models\Tag;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class TagsController extends Controller
{

    /**
     * 首页
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $tags = Tag::all();

        echo "所有标签：";
        echo "<br />";
        foreach ($tags AS $tag) {
            echo $tag->name;
            echo "<br />";
        }
        return view('tags.index');
    }

    /**
     * 标签下机构或者个人
     * @param $tag_id
     */
    public function users($tag_id)
    {
        $tags = Tag::find($tag_id)->users;
        foreach ($tags AS $tag) {
            echo  $tag->name;

        }
    }


}
