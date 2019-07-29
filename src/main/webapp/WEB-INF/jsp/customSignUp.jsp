<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="./includes/header.jsp"%>

<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>my-web-site</title>--%>
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">--%>

<style>
    .col-md-6 {
        position: absolute;
        left: 50%;
        transform: translate(-50%,10%);
    }
</style>

<%--</head>--%>
<%--<body>--%>


<div class="row">
    <div class="col-md-6">
        <h1> 회원가입 </h1>
        <form id="operForm">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <div class="form-group">
                <label for="name"> USER NAME </label>
                <input type="text" class="form-control" id="name" name="username" placeholder="이름을 입력하세요" />
            </div>
            <div class="form-group">
                <label for="name"> USER ID </label>
                <input type="text" class="form-control" id="userId" name="userid" placeholder="아이디를 입력하세요(4자리에서 12자리의 영문 대소문자 및 숫자로만 입력 가능.)">
            </div>

            <div class="form-group">
                <label for="name"> PASSWORD </label>
                <input type="password" class="form-control" id="tbPwd" name="userpw" placeholder="패스워드를 입력하세요(4자리에서 12자리의 영문 대소문자 및 숫자로만 입력 가능.)">
            </div>

            <div class="form-group">
                <label for="name"> CONFIRM PASSWORD </label>
                <input type="password" class="form-control" id="cpass" placeholder="패스워드를 다시 한번 입력하세요.">
            </div>

            <div class="form-group">
                <label for="phoneNumber"> Phone Number </label>
                <input type="text" class="form-control" id="phoneNumber" placeholder="휴대폰 번호를 입력하세요(-없이 입력해주세요.)">
            </div>
            <div class="form-group">
                <label for="email"> USER EMAIL </label>
                <input type="text" class="form-control" id="email" placeholder="이메일을 입력하세요">
            </div>
            <button type="button" class="btn btn-primary" id="btnSave">등록</button>
        </form>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function(){

        function checkz(){
            var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
            var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
            var getName= RegExp(/^[가-힣]+$/);
            var phoneCheck=/(01[0|1|6|9|7])(\d{3}|\d{4})(\d{4}$)/g;

            //이름 공백 확인.
            if($("#name").val() == ""){
                alert("이름을 입력해주세요.");
                $("#name").focus();
                return false;
            }

            //이름 유효성 검사.
            if(!getCheck.test($("#getName").val())) {
                alert("이름을 제대로 입력하세요.");
                $("#name").val("");
                $("#name").focus();
                return false;
            }

            //아이디 공백 확인
            if($("#userId").val() == ""){
                alert("아이디를 입력하세요.");
                $("#userId").focus();
                return false;
            }

            //아이디 유효성 검사.
            if(!getCheck.test($("#userId").val())){
                alert("형식에 맞게 입력해주세요");
                $("#userId").val("");
                $("#userId").focus();
                return false;
            }

            //패스워드 공백 확인
            if($("#tbPwd").val() == ""){
                alert("패스워드를 입력하세요.");
                $("#tbPwd").focus();
                return false;
            }

            //비밀번호 유효성 검사.
            if(!getCheck.test($("#tbPwd").val())) {
                alert("형식에 맞춰서 패스워드를 입력해주세요.");
                $("#tbPwd").val("");
                $("#tbPwd").focus();
                return false;
            }

            //확인 비밀번호 유효성 검사.
            if($("#cpass").val() == ""){
                alert("비밀번호를 한번 더 입력하세요.");
                $("#cpass").focus();
                return false;
            }

            //비밀번호 똑같은지
            if($("#tbPwd").val() != ($("#cpass").val())){
                alert("비밀번호가 같지 않습니다.");
                $("#cpass").focus();
                return false;
            }

            //휴대폰 공백 확인.
            if($("#phoneNumber").val() == ""){
                alert("휴대폰번호를 입력하세요.");
                $("#tbPwd").focus();
                return false;
            }

            //휴대폰 유효성 검사.
            if(!phoneCheck.test($("#phoneNumber").val())){
                alert("존재하지 않는 번호입니다.");
                $("#phoneNumber").focus();
                return false;
            }

            //이메일 공백 확인.
            if($("#email").val() == ""){
                alert("이메일을 입력하세요.");
                $("#tbPwd").focus();
                return false;
            }

            //이메일 유효성 검사
            if(!getMail.test($("#email").val())){
                alert("이메일형식에 맞게 입력해주세요")
                $("#mail").val("");
                $("#mail").focus();
                return false;
            }

            return true;
        }

        var formObj = $("#operForm");

        $("#btnSave").on("click", function(e){
            e.preventDefault();
            if (checkz()){
                // formObj.empty();

                formObj.attr("action", "/user").attr("method","post");

                // var userNameTag=$("input[name='username']").clone();
                // var userIdTag=$("input[name='userid']").clone();
                // var userPasswordTag=$("input[name='userpw']").clone();
                //
                // formObj.append(userNameTag);
                // formObj.append(userIdTag);
                // formObj.append(userPasswordTag);
                formObj.submit();
            };
        })
    })


</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.6/handlebars.min.js"></script>
</body>
</html>