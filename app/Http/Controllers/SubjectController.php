<?php

namespace App\Http\Controllers;

use App\Models\Subject;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class SubjectController extends Controller
{
    public function index()
    {
        $subjects = Subject::all();

        echo "所有科目：";
        echo "<br />";
        foreach ($subjects AS $subject) {
            echo $subject->name;
            echo "<br />";
        }
        return view('subject.index');
    }

}
