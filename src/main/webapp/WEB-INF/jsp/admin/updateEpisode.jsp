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
                    <small>修改视频信息</small>
                </h1>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/updateEpisode" method="post">
        <input type="hidden" name="id" value="${episode.getId()}"/>
        所属视频合集编号：<input type="text" name="father_id" value="${episode.getFather_id()}"/>
        所属视频合集名称：<input type="text" name="father_name" value="${episode.getFather_name()}"/>
        视频所在集数(第?集)：<input type="text" name="indexx" value="${episode.getIndexx()}"/>
        url：<input id="url-input" type="text" name="url" value="${episode.getUrl()}"/>
        <input type="submit" value="提交"/>
    </form>
    <script>

    </script>

</div>