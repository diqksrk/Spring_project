<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>


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
    }
</style>

</head>
<body>


<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; background-color: #1C1C1C;">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="/home" style="color: white"><span>NANANANAU</span></a>
        <a class="navbar-brand" href="/board/list" style="color: white"><span>공지사항</span></a>
        <a class="navbar-brand" href="/board/list" style="color: white"><span>자유게시판</span></a>
        <a class="navbar-brand" href="/board/list" style="color: white"><span>유머게시판</span></a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
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
    </ul>
    <!-- /.navbar-top-links -->
</nav>


<!-- Wrapper -->
<div id="wrapper">


    <!-- Header -->
    <header id="header">
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
    </header>


    <!-- Navigation -->





    <!-- Main -->
    <section id="main">

        <!-- Thumbnails -->
        <section class="thumbnails" style="text-align: center">
            <div>
                <table class="tcontainer">
                    <thead>
                    <tr>
                        <th style="color:black;"><h4 style="font-weight:bold; margin-left: 15%; margin-top: 15%">자유게시판</h4></th>
                    </tr>
                    </thead>

                    <c:forEach items="${boardList}" var="board">
                        <tr>
                            <td onClick="location.href='/board/get?bno=<c:out value="${board.bno}"/>'">
                                <c:out value="${board.title}" /></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                value="${board.creationDate}" /></td>
                        </tr>
                    </c:forEach>
                </table>


                <table class="tcontainer">
                    <thead>
                    <tr>
                        <th style="color:black"><h4 style="font-weight:bold; margin-left: 15%; margin-top: 15%">유머게시판</h4></th>
                    </tr>
                    </thead>

                    <c:forEach items="${humorList}" var="board">
                        <tr>
                            <td onClick="location.href='/board/get?bno=<c:out value="${board.bno}"/>'">
                                <c:out value="${board.title}" /></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                value="${board.creationDate}" /></td>
                        </tr>
                    </c:forEach>
                </table>

            </div>


            <div>
                <a href="https://openapi.sk.com/support/notice/detailView?ntiSeq=256&topYn=Y" style="height: 45%"  target="_blank">
                    <img src="/resources/images/foradvertise.jpg"/>
                </a>
                <table class="tcontainer">
                    <thead>
                    <tr>
                        <th style="color:black"><h4 style="font-weight:bold; margin-left: 15%; margin-top: 15%">공지사항</h4></th>
                    </tr>
                    </thead>

                    <c:forEach items="${noticeList}" var="board">
                        <tr>
                            <td onClick="location.href='/board/get?bno=<c:out value="${board.bno}"/>'">
                                <c:out value="${board.title}" /></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd"
                                                value="${board.creationDate}" /></td>
                        </tr>
                    </c:forEach>
                </table>
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



<!-- Scripts -->
<%--<script src="/resources/assets/js/jquery.min.js"></script>--%>
<%--<script src="/resources/assets/js/jquery.poptrox.min.js"></script>--%>
<%--<script src="/resources/assets/js/skel.min.js"></script>--%>
<%--<script src="/resources/assets/js/main.js"></script>--%>
</body>
</html>

