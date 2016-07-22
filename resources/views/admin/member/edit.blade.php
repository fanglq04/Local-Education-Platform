@extends('layouts.admin-app')

@section('content')

    <div class="pageheader">
        <h2><i class="fa fa-home"></i> Dashboard </h2>
        
    </div>

    <div class="contentpanel panel-email">

        <div class="row">

<div class="col-sm-9 col-lg-10">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-btns">
                            <a href="" class="panel-close">×</a>
                            <a href="" class="minimize">−</a>
                        </div>
                        <h4 class="panel-title">编辑用户A</h4>
                    </div>

                    <form class="form-horizontal form-bordered" action="{{ route('admin.member.update',['id'=>$user->id]) }}" method="POST">

                        <div class="panel-body panel-body-nopadding">
                            
                            <div class="form-group">
                                <label class="col-sm-3 control-label">用户名</label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control tooltips" disabled="" name="username" value="{{$user->name}}"> 
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">类型 <span class="asterisk">*</span></label>
                                <div class="col-sm-2">
                                    <select class="form-control input-sm" name="type" disabled="disabled">
                                        <option value="1" {{ $user->type == 1 ? 'selected':'' }}>学生家长</option>
                                        <option value="2" {{ $user->type == 2 ? 'selected':'' }}>培训机构</option>
                                        <option value="3" {{ $user->type == 3 ? 'selected':'' }}>个人培训班</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">邮箱 <span class="asterisk">*</span></label>
                                <div class="col-sm-6">
                                    <input type="text"  data-toggle="tooltip" name="email"
                                           data-trigger="hover" class="form-control tooltips"
                                           value="{{$user->email}}">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">性别 <span class="asterisk">*</span></label>
                                <div class="col-sm-2">
                                    <select class="form-control input-sm" name="gender">
                                        <option value="1" {{ $user->gender == 1 ? 'selected':'' }}>男</option>
                                        <option value="2" {{ $user->gender == 2 ? 'selected':'' }}>女</option>
                                    </select>
                                </div>
                            </div>
                   
                            <div class="form-group">
                                <label class="col-sm-3 control-label">认证 <span class="asterisk">*</span></label>
                                <div class="col-sm-2">
                                    <select class="form-control input-sm" name="authable">
                                        <option value="1" {{ $user->authable == 1 ? 'selected':'' }}>已认证</option>
                                        <option value="0" {{ $user->authable == 0 ? 'selected':'' }}>未认证</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label">状态 <span class="asterisk">*</span></label>
                                <div class="col-sm-2">
                                    <select class="form-control input-sm" name="status">
                                        <option value="1" {{ $user->status == 1 ? 'selected':'' }}>正常</option>
                                        <option value="0" {{ $user->status == 0 ? 'selected':'' }}>禁用</option>
                                    </select>
                                </div>
                            </div>

                            <input type="hidden" name="_method" value="PUT">
                            {{ csrf_field() }}

                        </div><!-- panel-body -->

                        <div class="panel-footer">
                            <div class="row">
                                <div class="col-sm-6 col-sm-offset-3">
                                    <button class="btn btn-primary">保存</button>
                                    &nbsp;
                                    <button class="btn btn-default">取消</button>
                                </div>
                            </div>
                        </div><!-- panel-footer -->
                    </form>
                </div>

            </div><!-- col-sm-9 -->            
        </div><!-- row -->
    </div>
@endsection

