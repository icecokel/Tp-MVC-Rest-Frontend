<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<style>
</style>
<section>
	<div>
		<div align=center>
			<div id="msg"></div>
			<div>
				<h3>회원가입 페이지.</h3>
			</div>
			<div class="form-group">
				<label>id</label> <input type="text" id="username"
					aria-describedby="emailHelp" placeholder="id을 입력하세요">
			</div>

			<div class="form-group">
				<label>비밀번호</label> <input type="password" id="password"
					placeholder="비밀번호를 입력하세요">
			</div>

			<button type="button" id="btnjoin">회원가입</button>
			<br /> <input type="button" id="joinbtn" value="로그인 하러가기" />

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

	var usernameval = "";
	var passwordval = "";

	let msg = document.getElementById("msg");
	let idcheckflag = false;
	username.addEventListener("focusout", function(e) {
		// 아이디 중복 검사.
		url = "http://192.168.0.119:10001/api/user/check";
		
		let usernameval = '"' + username.value + '"';
		console.log(usernameval);
		let user = '{ "username": ' + usernameval + ' }';

		let object = JSON.parse(JSON.stringify(user));

		console.log(object);
		$.ajax({
			contentType : 'application/json; charset=UTF-8',
			data : object,
			type : 'POST',
			datatype : 'json',
			url : url,
			success : function(data) {
				if (data.result == 1) {
					msg.innerHTML = "사용 가능한 아이디 입니다.";
					msg.style.color = "green";
					idcheckflag = true;
				} else {
					msg.innerHTML = "이미 사용중인 아이디 입니다.";
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