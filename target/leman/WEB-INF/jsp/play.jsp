<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>播放</title>
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
        .nav-top .sign-up{
            margin: 0 20px;
        }
        .main{
            padding: 60px 50px 0 50px;
            margin-top: 10px;
        }
        .user-info-box{
            height: 500px;
            padding: 0 50px;
            margin-top: 10px;
        }
        .play-box{
            border-radius: 5px;
            background-color: white;
            margin: 0 auto;
            padding-bottom: 50px;
        }
        .play-box .iframe-box{
            margin: 10px 0;
            height: 710px;
        }
        .iframe-box iframe{
            width: 100%;
            height: 100%;
        }
        .play-box .catalog-box{
            height: 500px;
        }
        .catalog-box ul>li{
            list-style: none;
            text-align: center;
        }
        .catalog-box ul>li a{
            color: #494f54;
        }

        .comment-box{
            background-color: white;
            border-radius: 5px;
            margin-top: 15px;
            height: 500px;
        }
        .comment-box .input-box{
            margin: 0;
            padding: 10px 10px;
        }
        .input-box h4{
            margin: 5px 0 0 5px
        }
        .input-box input{
            margin: 5px ;
            height: 40px;
        }
        .input-box button{
            width: 100px;
        }
    /*    */
        .comment_list_box{

        }
        .comment_list{
            list-style: none;
        }
        .comment_list>li{
            margin: 10px 30px;
            border-bottom: #e5e2dd 1px solid;
        }
        .comment_list .text_area{

        }
    </style>
</head>
<body>
<nav class="nav-top navbar navbar-expand-sm bg-light navbar-light fixed-top">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/index">LeMan乐漫社区</a>
    <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/index">首页 <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">视频库</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="有啥想看的">
            <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">搜索</button>
        </form>
        <c:choose>
            <c:when test="${sessionScope.USER_SESSION  == null }">
                <a href="#" data-toggle="modal" data-target="#signupModal"><span class="navbar-text sign-up"><i class="fa fa-user" aria-hidden="true"></i>注册</span></a>
                <a href="#" data-toggle="modal" data-target="#signinModal"><span class="navbar-text sign-in"><i class="fa fa-sign-in" aria-hidden="true"></i>登录</span></a>
            </c:when>
            <c:otherwise>
                <!-- Dropdown -->
                <ul class="navbar-nav">
                    <li class="nav-item dropdown" style="margin-left: 20px">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                                ${sessionScope.USER_SESSION.username}
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/userInfo">个人中心</a>
                            <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/user/logout">注销</a>
                        </div>
                    </li>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>
</nav>
<div class="container-fluid main">
    <div class="play-box row">
        <div class="iframe-box col-md-8">
            <h3 class="title">${episode.father_name} 第 ${episode.indexx} 集</h3>
            ${episode.url}
        </div>
        <div class="catalog-box col-md-4">
<%--            <img src="${pageContext.request.contextPath}/static/images/cata.png" alt="">--%>
            <h4 class="text-center" style="margin-top: 15px">${episode.father_name}</h4>
            <ul>
                <c:forEach var="episodeItem" items="${episodeList}">

                    <c:choose>
                        <c:when test="${episode.indexx  == episodeItem.indexx }">
                            <li><a style="color: #d14c2e" href="${pageContext.request.contextPath}/play/${episodeItem.id}">第 ${episodeItem.indexx} 集</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="${pageContext.request.contextPath}/play/${episodeItem.id}">第 ${episodeItem.indexx} 集</a></li>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="comment-box">
        <div class="input-box row">
            <h4>留言：</h4>
            <input id="comment" name="comment" type="text" class="col-md-5" property="说说你的看法吧~">
            <button class="btn btn-warning text-white" onclick="onComment()">发送</button>
        </div>
        <div class="comment_list_box">
            <ul class="comment_list">
                <c:forEach var="comment" items="${commentList}" varStatus="status">
                    <li>
                        <div class="text_area">
                            <h3 class="username" style="display: inline">${userList[status.index].username} : </h3>
                            <span style="color:#c1e2b3">${comment.create_date}
<%--                            <fmt:formatDate value="${comment.create_date}" pattern="yyyy-MM-dd     HH:mm:ss"/>--%>
                            </span>
                            <p style="margin-left: 10px">${comment.content}</p>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>

<!-- 注册 -->
<div class="modal fade" id="signupModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">成为LeManer</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <input type="email" class="form-control" id="signup-email" name="email" placeholder="账号/邮箱">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="signup-pwd" name="password" placeholder="密码">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="signup-repwd" placeholder="重复密码">
                    </div>
                    <button type="button" class="btn btn-primary " id="sign-up-btn">注册LeMan</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- 登录 -->
<div class="modal fade" id="signinModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">登录LeMan</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- 模态框主体 -->
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <input type="email" class="form-control" id="email" placeholder="账号/邮箱">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="pwd" placeholder="密码">
                    </div>
                    <button type="button" class="btn btn-primary" id="sign-in-btn">登录</button>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/static/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<script>
    // 注册
    $("#sign-up-btn").click(function () {
        if ($("#signup-pwd").val() == $("#signup-repwd").val() ){
            if ($("#signup-email").val()!== "" && $("#signup-pwd").val()!=="" ){
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/sign_up",
                    type:"POST",
                    data:{email:$("#signup-email").val(),password:$("#signup-pwd").val()},
                    success:function (result) {
                        window.location.reload();
                        alert("注册成功")
                    },
                    error:function (e) {
                        alert("注册失败")
                        console.log(e);
                        console.log(e.responseText);
                    }
                });
            }else{
                alert("账号或密码格式有误！")
            }
        }else {
            alert("两次密码必须相同！")
        }
    });
    // 登录
    $("#sign-in-btn").click(function () {
        if ($("#email").val()!== "" && $("#pwd").val()!==""){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/login",
                type:"POST",
                data:{email:$("#email").val(),password:$("#pwd").val()},
                success:function (result) {
                    if (result === "success"){
                        window.location.reload()
                        alert("登录成功")
                    }else {
                        alert("登录失败")
                    }
                },
                error:function (e) {
                    alert("登录失败")
                    console.log(e);
                    console.log(e.responseText);
                }
            });
        }else{
            alert("账号或密码格式有误！")
        }
    });

    function onComment() {
        var user_id = "${sessionScope.USER_SESSION.id}";
        var episode_id = "${episode_id}";
        var content = $("#comment").val();
        var data = {user_id:user_id,episode_id:episode_id,content:content};
        if (content !== ""){
            if (user_id === ""){
                // 需要登录才能留言
                alert("请登录后再畅所欲言吧~~");
            }else {
                // AJAX 提交留言
                $.ajax({
                    url:"${pageContext.request.contextPath}/addComment",
                    type:"POST",
                    data: data,
                    success:function (result) {
                        if (result === "success"){
                            window.location.reload()
                            alert("评论成功");
                        }else {
                            alert("评论出错")
                        }
                    },
                    error:function (e) {
                        alert("评论失败")
                    }
                })
            }
        }
    }
</script>
</body>
</html>
