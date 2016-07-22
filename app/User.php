<?php

namespace App;

use Illuminate\Http\Request;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];


    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];


    /**
     * 显示用户状态组名称
     * @param $status
     * @return mixed
     */
    public function groupDisplay ($type)
    {
        $show_name = [
            1 => '学生家长',
            2 => '培训机构',
            3 => '个人培训班'
        ];
        return $show_name[$type];
    }


    /**
     * 显示用户认证状态名称
     * @param $auth
     * @return mixed
     */
    public function authDisplay($auth)
    {
        $show_name = [
            '未认证',
            '已认证'
        ];
        return $show_name[$auth];
    }


    /**
     * 状态显示
     * @param $status
     * @return mixed
     */
    public function statusDisplay($status)
    {
        $show_name = [
            '已禁用',
            '正  常'
        ];
        return $show_name[$status];
    }

    /**
     * 性别状态名称
     * @param $gender
     * @return mixed
     */
    public function genderDisplay($gender)
    {
        $show_name = [
            1 => '男',
            2 => '女'
        ];
        return $show_name[$gender];
    }

    /**
     * 用户组类型映射
     * @param $type
     * @return mixed
     */
    public function userTypeMaps($type)
    {
        $maps = [
            1 => 'member',
            2 => 'organization',
            3 => 'personal'
        ];
        return $maps[$type];
    }

    /**
     * 自动返回该登录用户所属组方法名
     * @param Request $request
     * @return mixed
     */
    public function autoReturnUserInfo($user)
    {
        $userModel = $this->findOrNew($user->id);
        switch ($user->type) {
            case 1:
                return $userModel->member;
            break;
            case 2:
                return $userModel->organization;
            break;
            case 3:
                return $userModel->personal;
            break;
        }
    }



    /**
     * user-member 1:1
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function member()
    {
        return $this->hasOne('App\Models\Member');
    }


    /**
     * user-personal 1:1
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function personal()
    {
        return $this->hasOne('App\Models\Personal');
    }


    /**
     * user-organization 1:1
     * @return \Illuminate\Database\Eloquent\Relations\HasOne
     */
    public function organization()
    {
        return $this->hasOne('App\Models\Organization');
    }


    /**
     * users-categorys m:n
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function manyCategory()
    {
        return $this->belongsToMany('App\Models\Category', 'category_user', 'user_id', 'category_id');
    }


    /**
     * 1个机构或个人可辅导多个科目
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function subjects()
    {
        return $this->hasMany('App\Models\Subject');
    }


    /**
     * 一个用户有多个标签
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function tags()
    {
        return $this->belongsToMany('App\Models\Tag');
    }

}
