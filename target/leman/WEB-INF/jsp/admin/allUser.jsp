<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>乐漫管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/libs/layui/css/layui.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/libs/bootstrap-4.3.1-dist/css/bootstrap.min.css">
    <style>
        .layui-body{
            padding: 10px;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">LeMan</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    ${sessionScope.ADMIN_SESSION.name}
                </a>
                <dl class="layui-nav-child">
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/logout">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/allHomeCarousel">轮播图推荐管理</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/allHomeEpisode">首页精选视频管理</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/allAnime">剧集管理</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/allEpisode">视频管理</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/allComment">评论管理</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/user/allUser">用户管理</a></li>
                <li class="layui-nav-item"><a href="${pageContext.request.contextPath}/admin/allAdmin">管理员管理</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div class="row">
            <div class="col-md-4 column">
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/toAddUser">新增</a>
            </div>
        </div>
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th>用户编号</th>
                <th>用户邮箱</th>
                <th>用户密码</th>
                <th>用户名</th>`
                <th>性别</th>`
                <th>操作</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="user" items="${requestScope.get('list')}">
                <tr>
                    <td>${user.getId()}</td>
                    <td>${user.getEmail()}</td>
                    <td>${user.getPassword()}</td>
                    <td>${user.getUsername()}</td>
                    <td>${user.getGender()}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/user/toUpdateUser?id=${user.getId()}">更改</a> |
                        <a href="${pageContext.request.contextPath}/user/del/${user.getId()}">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/libs/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>