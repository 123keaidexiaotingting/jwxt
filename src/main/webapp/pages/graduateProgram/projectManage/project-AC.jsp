<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>课题添加及审核</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>

    <%-- qlq引入的公共的JSP --%>
    <%@include file="/tag.jsp"%>
    <%@ include file="/cssJs.jsp"%>

    <script src="${baseurl}/js/graduateProgram/projectManage/project-AC.js"></script>
</head>

<body>
<%-- qlq引入的公共的JSP --%>
<%@include file="/tag.jsp"%>
<!--面包屑-->
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="../../../welcome.jsp">首页</a>
        <a href="javascript:void(0)">毕业设计管理</a>
        <a href="javascript:void(0)">课题管理</a>
        <a>
          <cite>课题添加及审核</cite>
        </a>
      </span>
    <a class="layui-btn layui-btn-small" style="margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="iconfont" style="line-height:30px">&#xe6aa;</i>
    </a>
    <a class="layui-btn layui-btn-warm layui-btn-small" style="margin-top:3px;float:right;margin-right:3px;"
       onclick="closeOther()" title="关闭其他">
        <i class="iconfont" style="line-height:30px">&#xe6b7;</i>
    </a>
</div>
<!--主体-->
<div class="x-body">
    <!--查询-->
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" id="y_form">
            <input type="text" name="teacherName" placeholder="教师名称" autocomplete="off" class="layui-input">
            <input type="text" name="titlename" placeholder="课题名称" autocomplete="off" class="layui-input">
            <div class="layui-input-inline">
                <select name="checkStatus">
                    <option>选择审核状态</option>
                    <option>待教研室审核</option>
                    <option>待学院审核</option>
                    <option>审核通过</option>
                    <option>审核不通过</option>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="projectType">
                    <option>选择课题类型</option>
                    <option>纵向科研课题</option>
                    <option>横向科研课题</option>
                    <option>教师预研课题</option>
                    <option>自选课题</option>
                </select>
            </div>
            <button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <!--end查询-->

    <!--操作区域-->
    <xblock>
        <button class="layui-btn" onclick="x_admin_show('填写课题申请表','./project-AC-Apply.jsp')">填写课题申请表 </button>
        <button class="layui-btn" onclick="x_admin_show('教研室审核','./project-AC-checkFirst.jsp')">教研室审核 </button>
        <button class="layui-btn" onclick="x_admin_show('院长审核','./project-AC-checkSecond.jsp')">院长审核 </button>
        <button class="layui-btn layui-btn-normal" onclick="">导出数据 </button>
    </xblock>
    <!--end 操作区域-->

    <!--表格内容-->
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">
                    &#xe605;</i></div>
            </th>
            <th>教师名称</th>
            <th>课题名称</th>
            <th>课题来源</th>
            <th>课题类型</th>
            <th>学生专业</th>
            <th>需要人数</th>
            <th>学期</th>
            <th>审核状态</th><!--通过教研室，通过院长-->
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>

        </tr>
        </tbody>
    </table>
    <!--end 表格内容-->

    <!--分页-->
    <div id="y_page"></div>
    <!--end 分页-->
</div>
</body>

</html>