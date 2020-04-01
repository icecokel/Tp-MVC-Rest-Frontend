<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<style>
@import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');
</style>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
input[type="password"] {
	font-family: sans-serif !important;
}

	section{
	background-image: url('/hoobangkyo/resources/images/university.jpg');
	/* background-size: 100% 100%; */
}

.buttonP{
 font-size : 27px;
}

</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>4.5P</title>
<link href="/hoobangkyo/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<body>
	<div align='center'>
		<a href="/hoobangkyo/"><img src="/hoobangkyo/resources/images/logo.png" width="6%" height="6%"/><br/></a>
		<c:if test="${user != null}">
		${user.username } 님 로그인 중.
		<input id="userid" type="text" value="${user.userid }"
				style="display: none;" />
		</c:if>
	</div>


</body>
</html>

