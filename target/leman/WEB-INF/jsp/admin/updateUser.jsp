<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改用户信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/libs/bootstrap-4.3.1-dist/css/bootstrap.min.css"/></head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改用户信息</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/user/updateUser" method="post">
        <input type="hidden" name="id" value="${user.getId()}"/>
        用户邮箱：<input type="text" name="email" value="${user.getEmail()}"/>
        用户密码：<input type="text" name="password" value="${user.getPassword()}"/>
        用户名称：<input type="text" name="username" value="${user.getUsername() }"/>
        用户性别：<input type="text" name="gender" value="${user.getGender() }"/>
        <input type="submit" value="提交"/>
    </form>

</div>