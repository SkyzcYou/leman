<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/libs/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改信息</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/updateComment" method="post">
        <input type="hidden" name="id" value="${comment.getId()}"/>
        视频编号：<input type="text" name="episode_id" value="${comment.getEpisode_id()}"/>
        用户编号：<input type="text" name="user_id" value="${comment.getUser_id()}"/>
        内容：<input type="text" name="content" value="${comment.getContent()}"/>
        <input type="submit" value="提交"/>
    </form>

</div>