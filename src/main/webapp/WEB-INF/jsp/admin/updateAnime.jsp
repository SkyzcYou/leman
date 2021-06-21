<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/libs/bootstrap-4.3.1-dist/css/bootstrap.min.css"/>
    <style>
        .images{
            width: 50px;
            height: 50px;
        }
    </style>
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>修改剧集信息</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/updateAnime" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${anime.getId()}"/>
        剧集名称：<input type="text" name="name" value="${anime.getName()}"/>
        剧集说明：<input type="text" name="tip" value="${anime.getTip()}"/> <br>
        原封面：  <img class="images" alt="" src="${pageContext.request.contextPath}/static/upload/${anime.pimage}"><br>
        新封面：<input type="file" name="file">
        <input type="submit" value="提交"/>
    </form>

</div>