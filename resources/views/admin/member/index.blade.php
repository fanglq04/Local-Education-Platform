@extends('layouts.admin-app')

@section('content')

    <div class="pageheader">
        <h2><i class="fa fa-home"></i> Dashboard </h2>
        {!! Breadcrumbs::render('admin-member-index') !!}
    </div>

    <div class="contentpanel panel-email">

        <div class="row">


            <div class="col-sm-9 col-lg-10">

                <div class="panel panel-default">
                    <div class="panel-body">

                        <div class="pull-right">
                            <div class="btn-group mr10">
                                <a href="{{ route('admin.admin_user.create') }}" class="btn btn-white tooltips"
                                   data-toggle="tooltip" data-original-title="新增"><i
                                            class="glyphicon glyphicon-plus"></i></a>
                                <a class="btn btn-white tooltips deleteall" data-toggle="tooltip"
                                   data-original-title="删除" data-href="{{ route('admin.admin_user.destroy.all') }}"><i
                                            class="glyphicon glyphicon-trash"></i></a>
                            </div>
                        </div><!-- pull-right -->

                        <h5 class="subtitle mb5">用户列表</h5>


                        <div class="table-responsive col-md-12">
                            <table class="table mb30">
                                <thead>
                                <tr>
                                    <th>
                                        <span class="ckbox ckbox-primary">
                                            <input type="checkbox" id="selectall"/>
                                            <label for="selectall"></label>
                                        </span>
                                    </th>
                                    <th>用户名</th>
                                    <th>性别</th>
                                    <th>邮箱</th>
                                    <th>手机号</th>
                                    <th>类型</th>
                                    <th>认证</th>
                                    <th>状态</th>
                                    <th>创建时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($users as $user)
                                    <tr>
                                        <td>
                                            <div class="ckbox ckbox-default">
                                                <input type="checkbox" name="id" id="id-{{ $user->id }}"
                                                       value="{{ $user->id }}" class="selectall-item"/>
                                                <label for="id-{{ $user->id }}"></label>
                                            </div>
                                        </td>
                                        <td>{{ $user->name }}</td>
                                        <td>
                                                <span class="label label-info">
                                                {{ $user->genderDisplay($user->gender) }}
                                                </span>
                                        </td>
                                        <td>{{ $user->email }}</td>
                                        <td>{{ $user->mobile }}</td>
                                        <td>
                                            {{ $user->groupDisplay($user->type) }}
                                        </td>
                                        <td>
                                            @if ($user->authable == 1)
                                                <span class="label label-success">
                                            @else
                                                <span class="label label-danger">
                                            @endif
                                                {{ $user->authDisplay($user->authable) }}
                                                </span>
                                        </td>
                                        <td>
                                            @if ($user->status == 1)
                                                <span class="label label-success">
                                            @else
                                                <span class="label label-danger">
                                            @endif
                                            {{ $user->statusDisplay($user->status) }}
                                        </td>
                                        <td>{{ $user->created_at }}</td>
                                        <td>
                                            <a href="{{ route('admin.admin_user.edit',['id'=>$user->id]) }}"
                                               class="btn btn-white btn-xs"><i class="fa fa-pencil"></i> 编辑</a>
                                        </td>
                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>


                    </div><!-- panel-body -->
                </div><!-- panel -->

            </div><!-- col-sm-9 -->

        </div><!-- row -->

    </div>
@endsection

