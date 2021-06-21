<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>新增视频</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/libs/bootstrap-4.3.1-dist/css/bootstrap.min.css"/></head>
<style>
    * {
        margin: 0;
        padding: 0;
    }
    .aligncenter {
        clear: both;
        display: block;
        margin: auto;
    }
    body{
        background-color: #ececec;
    }
    .nav-top {
        height: 60px;
        padding: 0 50px;
    }
    .main{
        padding-top: 60px;
    }
    .inner-main{
        padding: 0 50px;
        margin-top: 100px;
    }
    .item_box{
        background-color: white;
        height: 400px;
        border-radius: 5px;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }
    .item_box h3{
        margin: 80px 0 20px 0;
    }
    .item_box form{
        padding: 0 100px;
    }
    .item_box form>button{
        width: 100%;
    }
</style>
<body>
<div class="">

    <div class="container-fluid main">
        <div class="login-main row justify-content-center">
            <div class="login-box col-md-4">
                <h3 class="text-center">新增视频</h3>
                <form action="${pageContext.request.contextPath}/addNewEpisode" method="post">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">视频所属剧集ID：</span>
                        </div>
                        <input type="text" name="father_id" class="form-control" placeholder="视频所属剧集编号">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">视频所属剧集名称：</span>
                        </div>
                        <input type="text" name="father_name" class="form-control" placeholder="视频所属剧集名称">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">视频在剧集中的集数：</span>
                        </div>
                        <input type="text" name="indexx" class="form-control" placeholder="视频在剧集中的集数">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">URL：</span>
                        </div>
                        <input type="text" name="url" class="form-control" placeholder="视频URL">
                    </div>

                    <button type="submit" class="btn btn-primary">新增</button>
                </form>
            </div>
        </div>
    </div>

<%--    --%>
<%--    <div class="row clearfix">--%>
<%--        <div class="col-md-12 column">--%>
<%--            <div class="page-header">--%>
<%--                <h1>--%>
<%--                    <small>新增视频</small>--%>
<%--                </h1>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <form action="${pageContext.request.contextPath}/addNewEpisode" method="post">--%>
<%--        视频所属剧集ID：<input type="text" name="father_id"><br><br><br>--%>
<%--        视频所属剧集名称：<input type="text" name="father_name"><br><br><br>--%>
<%--        URL：<input type="text" name="url"><br><br><br>--%>
<%--        <input type="submit" value="添加">--%>
<%--    </form>--%>

</div>