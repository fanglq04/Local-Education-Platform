<?php

/*
|--------------------------------------------------------------------------
| Routes File
|--------------------------------------------------------------------------
|
| Here is where you will register all of the routes in an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| This route group applies the "web" middleware group to every route
| it contains. The "web" middleware group is defined in your HTTP
| kernel and includes session state, CSRF protection, and more.
|
*/
//===========================================首页=========================================
Route::get('/', 'IndexController@index');


//===========================================标签=============================================
Route::get('/tags', 'TagsController@index');
Route::get('/tags/users/{tag_id}', 'TagsController@users');






//=============================================分类===========================================
Route::get('/category', 'CategoryController@index');
Route::get('/category/{category_id}/{type?}/{auth?}', 'CategoryController@lists');





//=============================================科目==========================================
Route::get('/subject', 'SubjectController@index');








//========================================个人主页=============================================
Route::group(['middleware' => 'web'], function () {
    Route::auth();
    Route::get('/home', 'HomeController@index');    //个人主页
    Route::get('/home/profile', 'HomeController@profile');  //个人信息
    Route::post('/home/profile/save', 'HomeController@profileSave');  //信息保存
});








//===========================================后台================================================
Route::group(['middleware' => ['web'], 'namespace' => 'Admin', 'prefix' => 'admin'], function () {
    Route::auth();

    Route::get('/home', ['as' => 'admin.home', 'uses' => 'HomeController@index']);
    Route::resource('admin_user', 'AdminUserController');
    Route::post('admin_user/destroyall',['as'=>'admin.admin_user.destroy.all','uses'=>'AdminUserController@destroyAll']);
    Route::resource('role', 'RoleController');
    Route::post('role/destroyall',['as'=>'admin.role.destroy.all','uses'=>'RoleController@destroyAll']);
    Route::get('role/{id}/permissions',['as'=>'admin.role.permissions','uses'=>'RoleController@permissions']);
    Route::post('role/{id}/permissions',['as'=>'admin.role.permissions','uses'=>'RoleController@storePermissions']);
    Route::resource('permission', 'PermissionController');
    Route::post('permission/destroyall',['as'=>'admin.permission.destroy.all','uses'=>'PermissionController@destroyAll']);
    Route::resource('blog', 'BlogController');
    Route::resource('member', 'MemberController');
    Route::get('member/{uid}/edit', ['as' => 'admin.member.edit', 'uses' => 'MemberController@edit']);
    Route::put('member/{uid}/update', ['as' => 'admin.member.update', 'uses' => 'MemberController@update']);
});


Route::get('/admin', function () {
    return view('admin.welcome');
});
