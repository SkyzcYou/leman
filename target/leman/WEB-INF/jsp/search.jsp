<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>搜索</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/libs/bootstrap-4.3.1-dist/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/libs/font-awesome-4.7.0/css/font-awesome.min.css">
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
            padding-left: 50px;
            background-color: white;
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
<nav class="nav-top navbar navbar-expand-sm bg-light navbar-light fixed-top">
    <a class="navbar-brand" href="#">LeMan乐漫社区</a>
    <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/index">首页 <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">乐漫视频库</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container-fluid main">
    <div class="inner-main row justify-content-center">
        <div class="item_box col-md-10">
            <h2 style="margin-top: 20px">搜索结果：</h2>
            <c:forEach var="item" items="${searchList}">
            <div class="item">
                <a href="${pageContext.request.contextPath}/play/${item.id}"><h3># ${item.father_name}</h3></a>
            </div>
        </c:forEach>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/static/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
</body>
</html>
