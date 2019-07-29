<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="./includes/header.jsp"%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>

<%--<head>--%>

<%--<meta charset="utf-8">--%>
<%--<meta http-equiv="X-UA-Compatible" content="IE=edge">--%>
<%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
<%--<meta name="description" content="">--%>
<%--<meta name="author" content="">--%>

<%--<title>SB Admin 2 - Bootstrap Admin Theme</title>--%>

<%--<!-- Bootstrap Core CSS -->--%>
<%--<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">--%>

<%--<!-- MetisMenu CSS -->--%>
<%--<link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">--%>

<%--<!-- Custom CSS -->--%>
<%--<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">--%>

<%--<!-- Custom Fonts -->--%>
<%--<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"--%>
<%--	rel="stylesheet" type="text/css">--%>

<%--<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->--%>
<%--<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->--%>
<%--<!--[if lt IE 9]>--%>
<%--        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>--%>
<%--        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>--%>
<%--    <![endif]-->--%>

<%--</head>--%>

<%--<body>--%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Please Sign In</h3>
					</div>
					<div class="panel-body">
						<form role="form" method='post' action="/login">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="userid"
										name="username" type="text" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password"
										name="password" type="password" value="">
								</div>
								<div class="checkbox">
									<label> <input name="remember-me" type="checkbox">Remember
										Me
									</label>

									<a href="/user/register" style="padding-left: 3%"><span>Sign Up</span></a>
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<a href="index.html" class="btn btn-lg btn-success btn-block">Login</a>
							</fieldset>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



<!-- Modal  추가 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	 aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default"
						data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save
					changes</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->




	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/dist/js/sb-admin-2.js"></script>

<script type="text/javascript">
	$(document).ready(function(){

		var result = '<c:out value="${result}" />';

		checkModal(result);

		function checkModal(result){
			if (result === ''){
				return ;
			}

			if (result){
				$(".modal-body").html(result +"님에 대한 회원가입이 완료되었습니다.");
			}
			$("#myModal").modal("show");
		}

	});

</script>

  <script>

  $(".btn-success").on("click", function(e){

    e.preventDefault();
    $("form").submit();

  });

  </script>

<c:if test="${param.logout != null}">
      <script>
      $(document).ready(function(){
      	alert("로그아웃하였습니다.");
      });
      </script>
</c:if>

</body>

</html>
