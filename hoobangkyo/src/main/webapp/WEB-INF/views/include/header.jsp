<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>후방교 프로젝트</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<body>
	<div align='center'>
		<h2>TeamProject Header</h2>
		<c:if test="${user != null}">
		${user.username } 님 로그인 중.
		<input id = "userid"type="text" value ="${user.userid }" style="display:none;"/>
		</c:if>
	</div>
	

</body>
</html>