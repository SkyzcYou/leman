<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
    <title>新增剧集</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/libs/bootstrap-4.3.1-dist/css/bootstrap.min.css"></head>
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
</head>
<body>
<div class="">
    <div class="container-fluid main">
        <div class="login-main row justify-content-center">
            <div class="login-box col-md-4">
                <h3 class="text-center">新增剧集</h3>
                <form action="${pageContext.request.contextPath}/addAnime" method="post" enctype="multipart/form-data">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">剧集名称：</span>
                        </div>
                        <input type="text" name="name" class="form-control" placeholder="剧集名称">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">剧集说明：</span>
                        </div>
                        <input type="text" name="tip" class="form-control" placeholder="剧集说明">
                    </div>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">剧集封面：</span>
                        </div>
                        <input type="file" name="file" class="form-control" placeholder="点击上传剧集封面">
                    </div>
                    <button type="submit" class="btn btn-primary">新增</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>