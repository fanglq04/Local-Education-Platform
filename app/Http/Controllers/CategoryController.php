<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class CategoryController extends Controller
{
    //
    public function index()
    {
        $categories = Category::all();
        echo "所有分类：";
        echo "<br />";
        foreach ($categories AS $category) {
            echo $category->name;
            echo "<br />";
        }
        return view('category.index');
    }

    

}
