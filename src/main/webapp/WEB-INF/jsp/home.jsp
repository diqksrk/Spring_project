<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE HTML>
<!--
Visualize by TEMPLATED
templated.co @templatedco
Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
    <title>my-web-site</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="/resources/assets/css/main.css" />


    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script> -->

<%--    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>--%>
<%--    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>--%>


<style type="text/css">
    @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800');
    body {
        font-family: 'Nanum Gothic',serif;
    }





    .navbar-brand span:hover {
        text-decoration: underline;
        color: orange;
    }

    td:hover {
        text-decoration: underline;
        cursor:pointer;
    }

    .tcontainer {
        background-color: white;
        height: 55%;
    }

    #main {
        margin-top:7%;
    }

    .tcontainer tbody tr td:first-child {
        text-align: left;
        padding-left: 2%;
        font-family: inherit;
        width: 60%;
    }

    .tcontainer tbody tr td:first-child:hover {
        text-decoration: underline;
        color: orange;
    }

    .tcontainer tbody tr td:nth-child(2n) {
        font-size: 13px;
    }

    .tcontainer tbody tr td:last-child {
        text-align: right;
        padding-right: 3%;
        font-family: inherit;
        font-size: 13px;
    }

    .tcontainer thead tr th {
        color:black;
        cursor:pointer;
    }

    .tcontainer thead tr th h4{
        font-weight: bold;
    }

    .tcontainer thead tr th h4:hover{
        text-decoration: underline;
        color:orange;
    }





    * {box-sizing: border-box;}
    body {font-family: Verdana, sans-serif;}
    .mySlides {display: none;}
    img {vertical-align: middle;}

    /* Slideshow container */
    .slideshow-container {
        max-width: 1000px;
        position: relative;
        margin: auto;
    }

    /* Caption text */
    .text {
        color: #000000;
        font-size: 15px;
        padding: 8px 12px;
        position: absolute;
        bottom: 8px;
        width: 100%;
        text-align: center;
    }

    /* Number text (1/3 etc) */
    .numbertext {
        color: #f2f2f2;
        font-size: 12px;
        padding: 8px 12px;
        position: absolute;
        top: 0;
    }

    /* The dots/bullets/indicators */
    .dot {
        height: 15px;
        width: 15px;
        margin: 0 2px;
        background-color: #bbb;
        border-radius: 50%;
        display: inline-block;
        transition: background-color 0.6s ease;
    }

    .active {
        background-color: #717171;
    }

    /* Fading animation */
    .fade {
        -webkit-animation-name: fade;
        -webkit-animation-duration: 1.5s;
        animation-name: fade;
        animation-duration: 1.5s;
    }

    @-webkit-keyframes fade {
        from {opacity: .4}
        to {opacity: 1}
    }

    @keyframes fade {
        from {opacity: .4}
        to {opacity: 1}
    }

    /* On smaller screens, decrease text size */
    @media only screen and (max-width: 300px) {
        .text {font-size: 11px}
    }





</style>

</head>
<body style="background-color: #F2F2F2;">

<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; background-color: #1C1C1C;">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/" style="color: white"><span>NANANANAU</span></a>
        <a class="navbar-brand" href="/board/notice" style="color: white"><span>공지사항</span></a>
        <a class="navbar-brand" href="/board/list" style="color: white"><span>자유게시판</span></a>
        <a class="navbar-brand" href="/board/humor" style="color: white"><span>유머게시판</span></a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
        <ul class="nav navbar-top-links navbar-right">
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-comment fa-fw"></i> New Comment
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                <span class="pull-right text-muted small">12 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-envelope fa-fw"></i> Message Sent
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-tasks fa-fw"></i> New Task
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                <span class="pull-right text-muted small">4 minutes ago</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>See All Alerts</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
                <!-- /.dropdown-alerts -->
            </li>
            <!-- /.dropdown -->


        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                </li>
                <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                </li>
                <li class="divider"></li>
                <sec:authorize access="isAuthenticated()">

                    <li><a href="/customLogout"><i class="fa fa-sign-out fa-fw"></i>
                        Logout</a></li>
                </sec:authorize>

                <sec:authorize access="isAnonymous()">

                    <li><a href="/customLogin"><i class="fa fa-sign-out fa-fw"></i>Login</a></li>
                </sec:authorize>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->


<%--            <li class="dropdown" style="width: 10%;">--%>
<%--                <div class="input-group custom-search-form">--%>
<%--                    <input type="text" class="form-control" placeholder="Search...">--%>
<%--                    <span class="input-group-btn">--%>
<%--                                <button class="btn btn-default" type="button">--%>
<%--                                    <i class="fa fa-search"></i>--%>
<%--                                </button>--%>
<%--                            </span>--%>
<%--                </div>--%>
<%--                <!-- /input-group -->--%>
<%--            </li>--%>


        </ul>
    <!-- /.navbar-top-links -->
    </ul>
</nav>


<!-- Wrapper -->
<div id="wrapper">


    <!-- Header -->
<%--    <header id="header">--%>
        <!-- <span class="avatar"><img src="images/avatar.jpg" alt="" /></span>
        <h1>This is <strong>Visualize</strong>, a responsive site template designed by <a href="http://templated.co">TEMPLATED</a><br />
        and released for free under the Creative Commons License.</h1>
        <ul class="icons">
            <li><a href="#" class="icon style2 fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="#" class="icon style2 fa-facebook"><span class="label">Facebook</span></a></li>
            <li><a href="#" class="icon style2 fa-instagram"><span class="label">Instagram</span></a></li>
            <li><a href="#" class="icon style2 fa-500px"><span class="label">500px</span></a></li>
            <li><a href="#" class="icon style2 fa-envelope-o"><span class="label">Email</span></a></li>
        </ul> -->
<%--    </header>--%>


    <!-- Navigation -->





    <!-- Main -->
    <section id="main">

        <!-- Thumbnails -->
        <section class="thumbnails" style="text-align: center">
            <div>
                <table class="tcontainer">
<%--                    <h4 style="font-weight:bold;">자유게시판</h4>--%>
                    <thead>
                    <tr>
                        <th onclick="location.href='/board/list'"><h4>자유게시판</h4></th>
                    </tr>
                    </thead>

                    <c:forEach items="${boardList}" var="board">
                        <tr>
                            <td onClick="location.href='/board/get?bno=<c:out value="${board.bno}"/>'">
                                <c:out value="${board.title}" /></td>
                            <td><c:out value="${board.writer}" /></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                value="${board.creationDate}" /></td>
                        </tr>
                    </c:forEach>
                </table>


                <table class="tcontainer">
                    <thead>
                    <tr>
                        <th onclick="location.href='/board/humor'"><h4>유머게시판</h4></th>
                    </tr>
                    </thead>

                    <c:forEach items="${humorList}" var="board">
                        <tr>
                            <td onClick="location.href='/board/get?bno=<c:out value="${board.bno}"/>'">
                                <c:out value="${board.title}" /></td>
                            <td><c:out value="${board.writer}" /></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                value="${board.creationDate}" /></td>
                        </tr>
                    </c:forEach>
                </table>

            </div>


            <div>
<%--                <div>--%>
<%--                <div class="image-container" style="max-height: 330px;">--%>
<%--                    <a href="https://openapi.sk.com/support/notice/detailView?ntiSeq=256&topYn=Y" style="height: 45%"  target="_blank">--%>
<%--                        <img src="/resources/images/foradvertise.jpg"/>--%>
<%--                    </a>--%>
<%--                </div>--%>

                <table class="tcontainer">
                    <thead>
                    <tr>
                        <th onclick="location.href='/board/notice'"><h4>공지사항</h4></th>
                    </tr>
                    </thead>

                    <c:forEach items="${noticeList}" var="board">
                        <tr>
                            <td onClick="location.href='/board/get?bno=<c:out value="${board.bno}"/>'">
                                <c:out value="${board.title}" /></td>
                            <td><c:out value="${board.writer}" /></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                value="${board.creationDate}" /></td>
                        </tr>
                    </c:forEach>
                </table>

<%--                <div class="image-container" style="max-height: 200px;">--%>
<%--                    <a href="https://openapi.sk.com/support/notice/detailView?ntiSeq=256&topYn=Y" style="height: fit-content%"  target="_blank">--%>
<%--                        <img src="/resources/images/foradvertise.jpg" style="height: 300px;"/>--%>

<%--                    </a>--%>

                <div class="slideshow-container">

                    <div class="mySlides fade">
                        <div class="numbertext"></div>
                            <a href="https://openapi.sk.com/support/notice/detailView?ntiSeq=256&topYn=Y" target="_blank"
                            style="margin-bottom: 0px;">
                                <img src="/resources/images/foradvertise123.jpg" style="width:100%">
                            </a>
                        <div class="text"></div>
                    </div>

                    <div class="mySlides fade">
                        <div class="numbertext"></div>
                        <img src="/resources/images/cancerCancel.jpg" style="width:100%">
                        <div class="text"></div>
                    </div>

                    <div class="mySlides fade">
                        <div class="numbertext"></div>
                        <img src="/resources/images/adverproduct.jpg" style="width:100%">
                        <div class="text"></div>
                    </div>

                </div>
                <br>

                <div style="text-align:center">
                    <span class="dot"></span>
                    <span class="dot"></span>
                    <span class="dot"></span>
                </div>

            </div>

        </section>

    </section>


    <!-- Footer -->
    <footer id="footer">

    </footer>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

<!-- DataTables JavaScript -->
<script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

<!-- Custom Theme JavaScript -->
<script src="/resources/dist/js/sb-admin-2.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        var slideIndex = 0;
        showSlides();

        function showSlides() {
            var i;
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            slideIndex++;
            if (slideIndex > slides.length) {slideIndex = 1}
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex-1].style.display = "block";
            dots[slideIndex-1].className += " active";
            setTimeout(showSlides, 2000); // Change image every 2 seconds
        }
    })

</script>



<!-- Scripts -->
<%--<script src="/resources/assets/js/jquery.min.js"></script>--%>
<%--<script src="/resources/assets/js/jquery.poptrox.min.js"></script>--%>
<%--<script src="/resources/assets/js/skel.min.js"></script>--%>
<%--<script src="/resources/assets/js/main.js"></script>--%>
</body>
</html>

