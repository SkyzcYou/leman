<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>用户中心</title>
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
            /*background-color: #f8f8f8;*/
            background-color: #ececec;
        }
        .nav-top {
            height: 60px;
            padding: 0 50px;
        }
        .main{
            padding-top: 60px;
        }
        .user-info-box{
            height: 500px;
            padding: 0 50px;
            margin-top: 10px;
        }
        .main-left{
            height: 100%;
            border-radius: 5px;
        }
        .main-left ul{
            list-style: none;
        }
        .main-left ul>li h5{
            text-align: center;
        }
        .main-left ul>li a{
            text-decoration: none;
            color: black;
        }
        .main-left .head-img{
            text-align: center;
            border-radius: 50%;
            width: 100px;
            height: 100px;
            margin-top: 30px;
        }
        .main-left .username{
            margin: 20px 0;
            text-align: center;
        }
        .main-right{
            height: 100%;
            border-radius: 5px;
        }
        /*.main-right .editInfo{*/
        /*    display: none;*/
        /*}*/
        .main-right .editPwd{
            display: none;
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
                <a class="nav-link" href="${pageContext.request.contextPath}/videoBase">视频库</a>
            </li>
        </ul>
        <ul class="navbar-nav">
            <li class="nav-item dropdown" style="margin-left: 20px">
                <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    ${sessionScope.USER_SESSION.username}
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">个人中心</a>
                    <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/user/logout">注销</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
<div class="container-fluid main">
    <div class="user-info-box row justify-content-around">
        <div class="main-left col-md-2 bg-white">
            <img src="${pageContext.request.contextPath}/static/images/show-head-img/032.jpg" class="head-img aligncenter" id="head-img" alt="">
            <h6 class="username">${sessionScope.USER_SESSION.username}</h6>
            <ul>
                <li id="editInfoli"><a href="javascript:void(0);" onclick="editInfo()"><h5>修改资料</h5></a></li>
                <li id="editPwdli"><a href="javascript:void(0);" onclick="editPwd()"><h5>修改密码</h5></a></li>
            </ul>
        </div>
        <div class="main-right col-md-9 bg-white">
            <div class="editInfo" id="editInfo">
                <h3>修改资料：</h3>
                <div class="edit-info-box">
                    <form action="${pageContext.request.contextPath}/user/updateInfo" method="post">
                        <div class="form-group">
                            <label for="user_id">Leman ID</label>
                            <input name="id" type="text" value="${sessionScope.USER_SESSION.id}" class="form-control" id="user_id" autocomplete="off" readonly >
                        </div>
                        <div class="form-group">
                            <label for="exampleInputEmail1">邮箱</label>
                            <input name="email" type="email" value="${sessionScope.USER_SESSION.email}" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" autocomplete="off" readonly >
                            <small id="emailHelp" class="form-text text-muted">邮箱暂不可更改.</small>
                        </div>
                        <div class="form-group">
                            <label for="username">用户名</label>
                            <input type="text" class="form-control" id="username" name="username" placeholder="用户名" value="${sessionScope.USER_SESSION.username}" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="gender">性别</label>
                            <input name="gender" type="text" class="form-control" id="gender" placeholder="性别" value="${sessionScope.USER_SESSION.gender}" autocomplete="off">
                        </div>
                        <button type="submit" class="btn btn-primary">确定修改</button> <span class="text-danger">${msg}</span>
                    </form>
                </div>
            </div>
            <div class="editPwd" id="editPwd">
                <h3>修改密码：</h3>
                <div class="edit-info-box">
                    <form id="editPwdFORM">
                        <div class="form-group">
                            <label for="old-pwd">原密码</label>
                            <input name="oldPwd" type="password" class="form-control" id="old-pwd" aria-describedby="old-pwdHelp" placeholder="输入原密码" autocomplete="off">
                            <small id="old-pwdHelp" class="form-text text-muted">输入原密码来更改密码</small>
                        </div>
                        <div class="form-group">
                            <label for="new-pwd">新密码</label>
                            <input type="text" class="form-control" id="new-pwd" name="Pwd" placeholder="新密码" value="" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label for="new-repwd">重复新密码</label>
                            <input type="password" class="form-control" id="new-repwd" name="rePwd" placeholder="重复新密码" value="" autocomplete="off">
                        </div>
                        <button id="editPwd-btn" type="button" class="btn btn-primary">确定修改</button> <span>${msg_pwd}</span>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="${pageContext.request.contextPath}/static/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/static/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/static/libs/bootstrap-4.3.1-dist/js/bootstrap.min.js"></script>
<script>
    function editInfo() {
        $("#editInfo").show();
        // $("editInfoli").attr("background-color","#E65762");
        $("#editPwd").hide()
    }
    function editPwd() {
        $("#editPwd").show();
        $("#editInfo").hide()
    }
    $("#editPwd-btn").click(function () {
        var realOldPwd = "${sessionScope.USER_SESSION.password}";
        var oldPwd = $("#old-pwd").val();
        var newPwd = $("#new-pwd").val();
        var reNewPwd = $("#new-repwd").val();
        if (oldPwd === "" || newPwd === "" || reNewPwd === "" || newPwd !== reNewPwd){
            alert("两次密码必须相同")
        }else if (realOldPwd !== oldPwd){
            alert("旧密码错误")
        }else {
            // var data = $("#editPwdFORM").serialize();
            // data = decodeURIComponent(data,true);
            $.ajax({
                url:"${pageContext.request.contextPath}/user/updatePwd",
                type: "POST",
                data: {password:newPwd},
                success:function (result) {
                    if (result === "success"){
                        alert("修改密码成功，请重新登陆");
                        window.location.reload();
                    }else {
                        alert("修改失败")
                    }

                },
                error:function (e) {
                    alert("修改失败")
                    console.log(e);
                    console.log(e.responseText);
                }
            })
        }
    });
</script>
</body>
</html>
