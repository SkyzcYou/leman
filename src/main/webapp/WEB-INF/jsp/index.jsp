<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>首页</title>
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

        .nav-top {
            height: 60px;
            padding: 0 50px;
        }

        .nav-top .sign-up {
            margin: 0 20px;
        }

        .best-bg {
            background-color: #666;
            height: 480px;
            padding: 0 50px;
            margin-top: 15px;
        }

        .best-anime {
            height: 100%;
        }

        .best-item-box {
            margin: 0 25px;
            height: 360px;
            position: relative;
        }

        .best-item-box img {
            width: 100%;
            height: 100%;
            border-radius: 5%;
        }

        .mask {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            background: rgba(101, 101, 101, 0.6);
            color: #ffffff;
            opacity: 0;
        }

        .mask h3 {
            text-align: center;
        }

        .best-item-box a:hover .mask {
            opacity: 1;
        }

        .show-head {
            margin: 20px 50px;
        }

        .show-head-item {
            text-align: center;
        }

        .show-head .show-head-item img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
        }

        .show-head .show-head-item p {
            text-align: center;
        }

        /*    */
        .my-carousel {
            height: 415px;
            margin-top: 70px;
        }
    </style>
</head>
<body>
<nav class="nav-top navbar navbar-expand-sm bg-light navbar-light fixed-top">
    <a class="navbar-brand" href="#">LeMan乐漫社区</a>
    <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/index">首页 <span
                        class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/videoBase">视频库</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/search">
            <input class="form-control mr-sm-2" type="search" name="value" placeholder="有啥想看的">
            <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">搜索</button>
        </form>
        <c:choose>
            <c:when test="${sessionScope.USER_SESSION  == null }">
                <a href="#" data-toggle="modal" data-target="#signupModal"><span class="navbar-text sign-up"><i
                        class="fa fa-user" aria-hidden="true"></i>注册</span></a>
                <a href="#" data-toggle="modal" data-target="#signinModal"><span class="navbar-text sign-in"><i
                        class="fa fa-sign-in" aria-hidden="true"></i>登录</span></a>
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
<%-- 轮播图 --%>
<div class="my-carousel container">
    <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
            <li data-target="#carouselExampleCaptions" data-slide-to="4"></li>

        </ol>
        <%--    轮播图图片    --%>
        <div class="carousel-inner">

                <c:forEach items="${carMap}" var="car" varStatus="vs">
                    <c:if test="${vs.index==0}"><div class="carousel-item active"></c:if>
                    <c:if test="${vs.index!=0}"><div class="carousel-item"></c:if>
                        <a href="${pageContext.request.contextPath}/play/${car.value.id}">
                        <img src="${pageContext.request.contextPath}/static/upload/${car.key.pimage}" class="d-block w-100" alt="...">
                        <div class="carousel-caption d-none d-md-block">
                            <h5>${car.key.name}</h5>
                            <p>${car.key.tip}</p>
                        </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
    <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
</div>
<div class="best-bg container-fluid">
    <div class="best-anime row align-items-center">
        <div class="best-item-box col">
            <a href="${pageContext.request.contextPath}/play/${top01_id}">
                <img src="${pageContext.request.contextPath}/static/images/斗罗大陆.jpg" alt="">
                <div class="mask">
                    <h3 class="">斗罗大陆</h3>
                </div>
            </a>
        </div>
        <div class="best-item-box col">
            <a href="${pageContext.request.contextPath}/play/${top02_id}">
                <img src="${pageContext.request.contextPath}/static/images/斗破苍穹.jpg" alt="">
                <div class="mask">
                    <h3>斗破苍穹</h3>
                </div>
            </a>
        </div>
        <div class="best-item-box col">
            <a href="${pageContext.request.contextPath}/play/${top03_id}">
                <img src="${pageContext.request.contextPath}/static/images/星辰变.jpg" alt="">
                <div class="mask">
                    <h3>星辰变</h3>
                </div>
            </a>
        </div>
        <div class="best-item-box col">
            <a href="${pageContext.request.contextPath}/play/${top04_id}">
                <img src="${pageContext.request.contextPath}/static/images/猪屁登.jpg" alt="">
                <div class="mask">
                    <h3>猪屁登</h3>
                </div>
            </a>
        </div>
        <div class="best-item-box col">
            <a href="${pageContext.request.contextPath}/play/${top05_id}">
                <img src="${pageContext.request.contextPath}/static/images/西行记.jpg" alt="">
                <div class="mask">
                    <h3>西行记</h3>
                </div>
            </a>
        </div>

    </div>
</div>
<div class="show-head">
    <div class="show-head-one row">
        <div class="show-head-item col"><img src="${pageContext.request.contextPath}/static/images/show-head-img/0.jpg"
                                             alt="">
            <p>斗罗大陆</p></div>
        <div class="show-head-item col"><img src="${pageContext.request.contextPath}/static/images/show-head-img/01.jpg"
                                             alt="">
            <p>中国好故事</p></div>
        <div class="show-head-item col"><img src="${pageContext.request.contextPath}/static/images/show-head-img/02.jpg"
                                             alt="">
            <p>西行纪</p></div>
        <div class="show-head-item col"><img src="${pageContext.request.contextPath}/static/images/show-head-img/03.jpg"
                                             alt="">
            <p>魔道祖师</p></div>
        <div class="show-head-item col"><img src="${pageContext.request.contextPath}/static/images/show-head-img/04.jpg"
                                             alt="">
            <p>斗破苍穹</p></div>
        <div class="show-head-item col"><img src="${pageContext.request.contextPath}/static/images/show-head-img/05.jpg"
                                             alt="">
            <p>狐妖小红娘</p></div>
        <div class="show-head-item col"><img src="${pageContext.request.contextPath}/static/images/show-head-img/06.jpg"
                                             alt="">
            <p>妖精种植手册</p></div>
        <div class="show-head-item col"><img src="${pageContext.request.contextPath}/static/images/show-head-img/07.jpg"
                                             alt="">
            <p>一人之下</p></div>
        <div class="show-head-item col"><img src="${pageContext.request.contextPath}/static/images/show-head-img/08.jpg"
                                             alt="">
            <p>武庚纪</p></div>
        <div class="show-head-item col"><img src="${pageContext.request.contextPath}/static/images/show-head-img/09.jpg"
                                             alt="">
            <p>伍六七</p></div>
    </div>
    <div class="show-head-two row">
        <div class="show-head-item col"><img
                src="${pageContext.request.contextPath}/static/images/show-head-img/011.jpg" alt="">
            <p>雄兵连</p></div>
        <div class="show-head-item col"><img
                src="${pageContext.request.contextPath}/static/images/show-head-img/012.jpg" alt="">
            <p>雪鹰领主</p></div>
        <div class="show-head-item col"><img
                src="${pageContext.request.contextPath}/static/images/show-head-img/013.jpg" alt="">
            <p>我是大神仙</p></div>
        <div class="show-head-item col"><img
                src="${pageContext.request.contextPath}/static/images/show-head-img/014.jpg" alt="">
            <p>星辰变</p></div>
        <div class="show-head-item col"><img
                src="${pageContext.request.contextPath}/static/images/show-head-img/015.jpg" alt="">
            <p>武动乾坤</p></div>
        <div class="show-head-item col"><img
                src="${pageContext.request.contextPath}/static/images/show-head-img/016.jpg" alt="">
            <p>全职法师</p></div>
        <div class="show-head-item col"><img
                src="${pageContext.request.contextPath}/static/images/show-head-img/017.jpg" alt="">
            <p>全职高手</p></div>
        <div class="show-head-item col"><img
                src="${pageContext.request.contextPath}/static/images/show-head-img/018.jpg" alt="">
            <p>盛世妆娘</p></div>
        <div class="show-head-item col"><img
                src="${pageContext.request.contextPath}/static/images/show-head-img/019.jpg" alt="">
            <p>观海策</p></div>
        <div class="show-head-item col"><img
                src="${pageContext.request.contextPath}/static/images/show-head-img/020.jpg" alt="">
            <p>白夜玲珑</p></div>
    </div>
</div>


<!-- 注册 -->
<div class="modal fade" id="signupModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">成为LeManer</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
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
            <div class="modal-header">
                <h4 class="modal-title">登录LeMan</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
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
    $(".best-item-box").hover(function () {
        $(this).width($(this).width() + 20);
        $(this).height($(this).height() + 20);
    }, function () {
        $(this).width($(this).width() - 20);
        $(this).height($(this).height() - 20);
    });
    // 注册
    $("#sign-up-btn").click(function () {
        if ($("#signup-pwd").val() == $("#signup-repwd").val()) {
            if ($("#signup-email").val() !== "" && $("#signup-pwd").val() !== "") {
                $.ajax({
                    url: "${pageContext.request.contextPath}/user/sign_up",
                    type: "POST",
                    data: {email: $("#signup-email").val(), password: $("#signup-pwd").val()},
                    success: function (result) {
                        window.location.reload();
                        alert("注册成功")
                    },
                    error: function (e) {
                        alert("注册失败")
                        console.log(e);
                        console.log(e.responseText);
                    }
                });
            } else {
                alert("账号或密码格式有误！")
            }
        } else {
            alert("两次密码必须相同！")
        }
    });
    // 登录
    $("#sign-in-btn").click(function () {
        if ($("#email").val() !== "" && $("#pwd").val() !== "") {
            $.ajax({
                url: "${pageContext.request.contextPath}/user/login",
                type: "POST",
                data: {email: $("#email").val(), password: $("#pwd").val()},
                success: function (result) {
                    if (result === "success") {
                        window.location.reload()
                        alert("登录成功")
                    } else {
                        alert("登录失败")
                    }
                },
                error: function (e) {
                    alert("登录失败")
                    console.log(e);
                    console.log(e.responseText);
                }
            });
        } else {
            alert("账号或密码格式有误！")
        }
    })
</script>
</body>
</html>
