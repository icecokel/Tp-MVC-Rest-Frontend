<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<style>
h3 {
	color: white;
}

section {
	height: 1000px;
	display: block;
	background-size: 100% 100%;
}

#joinmaindiv {
	font-family: 'Jeju Gothic', sans-serif;
	padding: 10%;
}

#joindiv {
	padding-left: 20%;
	padding-right: 20%;
}

.joinlabel {
	color: white;
	font-size: 30px;
	display: inline-block;
}

#msg {
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 40px;
	background-color: rgba(255, 255, 255, 0.3);
	opacity: 0.7;
	-webkit-animation: blink 0.5s ease-in-out infinite alternate;
	-moz-animation: blink 0.5s ease-in-out infinite alternate;
	animation: blink 0.5s ease-in-out infinite alternate;
}

@
-webkit-keyframes blink { 0% {
	opacity: 0;
}

100%
{
opacity


:


1;
}
}
@
-moz-keyframes blink { 0% {
	opacity: 0;
}

100%
{
opacity


:


1;
}
}
@
keyframes blink { 0% {
	opacity: 0;
}
100%
{
opacity


:


1;
}
}
</style>

<section class="masthead">
	<div id="joinmaindiv">
		<div align=center id="joindiv">

			<div>
				<h3>Create your account</h3>
			</div>
			<span class="badge badge-secondary" id="msg"></span>
			<div>
				<label class="joinlabel">ID</label> <input class="form-control"
					type="text" id="username" aria-describedby="emailHelp"
					placeholder="Enter your ID">
			</div>

			<div>
				<label class="joinlabel">Password</label> <input
					class="form-control" type="password" id="password"
					placeholder="Enter your Password">
			</div>
			<br />
			<button class="btn btn-success" type="button" id="btnjoin">
				<span class="buttonP">Sign Up</span>
			</button>
			&nbsp;
			<button class="btn btn-light" type="button" id="joinbtn">
				<span class="buttonP">Sign In</span>
			</button>

		</div>
	</div>
</section>
<%@ include file="include/footer.jsp"%>
<script>
	let joinbtn = document.getElementById("joinbtn");

	joinbtn.addEventListener("click", function(e) {
		location.href = "/";
	})
	
	
	
	
	let btnjoin = document.getElementById("btnjoin");

	var username = document.getElementById("username");
	var password = document.getElementById("password");
	
	let msg = document.getElementById("msg");
	
	password.addEventListener("keyup",function(e) {
		
				let pw = password;
				let pwVlaue = pw.value.trim();

				let passRule = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

				if (passRule.test(pwVlaue)) {
					msg.innerHTML = '&nbsp;&nbsp; This password is very safe.';
					msg.style.color = 'green';
				
				} else {
					msg.innerHTML = '&nbsp;&nbsp; This password is not safe!<br/>Password must include English, number, and special symbol!';
					msg.style.color = 'red';
				}

			});
	var usernameval = "";
	var passwordval = "";

	
	let idcheckflag = false;
	username.addEventListener("focusout", function(e) {
		// 아이디 중복 검사.
		url = "http://192.168.0.119:10001/api/user/check";

		if (username.value.trim().length < 1) {
			msg.innerHTML = "ID cannot be empty";
			msg.style.color = "red";
			username.focus();
			return;
		}

		let usernameval = '"' + username.value + '"';
		let user = '{ "username": ' + usernameval + ' }';

		let object = JSON.parse(JSON.stringify(user));

		$.ajax({
			contentType : 'application/json; charset=UTF-8',
			data : object,
			type : 'POST',
			datatype : 'json',
			url : url,
			success : function(data) {
				if (data.result == 1) {
					msg.innerHTML = "This ID is available.";
					msg.style.color = "green";
					idcheckflag = true;
				} else {
					msg.innerHTML = "This ID is not available.";
					msg.style.color = "red";
					idcheckflag = false;
				}

			}

		})

	})

	btnjoin.addEventListener("click", function(e) {

		url = "http://192.168.0.119:10001/api/user";

		if (username.value.trim().length < 1
				|| password.value.trim().length < 1) {
			msg.innerHTML = "ID and Password cannot be empty";
			msg.style.color = "red";
			username.focus();
			return;
		}

		if (idcheckflag == false) {
			msg.innerHTML = "아이디 확인이 필요합니다.";
			msg.style.color = "red";
			return;
		}

		usernameval = '"' + username.value + '"';
		passwordval = '"' + password.value + '"';

		console.log(usernameval);
		console.log(passwordval);

		let user = '{ "username": ' + usernameval + ' ,"userpw": '
				+ passwordval + ' }';
		let object = JSON.parse(JSON.stringify(user));
		console.log(object);

		$.ajax({
			contentType : 'application/json; charset=UTF-8',
			url : url,
			datatype : 'json',
			/* crossDomain: true, */
			type : 'POST',
			data : object,
			success : function(data) {
				if (data.result == 1) {
					alert("회원가입 성공");
					location.href = "/";
				}

			},
			error : function() {
				alert("통신오류" + error);
			}
		})

	});
</script>