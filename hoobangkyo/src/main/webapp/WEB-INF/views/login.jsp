<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<section>
	<div>
		<div align='center'>
			<div>
				<h3>로그인 페이지.</h3>
			</div>
			<div class="form-group">
				<label>id</label> <input type="text"
					id="username" aria-describedby="emailHelp"
					placeholder="id을 입력하세요">
			</div>
			<div class="form-group">
				<label >비밀번호</label> <input
					type="password" id="password" placeholder="비밀번호를 입력하세요">
			</div>

			<button type="button" id="btnlogin">로그인</button>
			<br /> <input type="button" id="joinbtn" value="회원가입" />

			<div>
				<input type="button" id="writebtn" value="스케쥴" />
			</div>

		</div>
	</div>
</section>
<%@ include file="include/footer.jsp"%>
<script>
	let joinbtn = document.getElementById("joinbtn");

	joinbtn.addEventListener("click", function(e) {
		location.href = "join";
	});

	let writebtn = document.getElementById("writebtn");

	writebtn.addEventListener("click", function(e) {
		location.href = "schedulewrite";
	});
	
	let btnlogin = document.getElementById("btnlogin");
	let username = document.getElementById("username");
	let password = document.getElementById("password");
	btnlogin.addEventListener("click", function(e){
		url = "http://192.168.0.119:10001/api/user/login";
		
		let usernameval = '"' + username.value + '"';
		let passwordval = '"' + password.value + '"';
		
		let user = '{ "username": ' + usernameval + ' ,"userpw": '
		+ passwordval + ' }';
		
		let object = JSON.parse(JSON.stringify(user));
		
		$.ajax({
			contentType :  'application/json; charset=UTF-8' ,	
			url : url,
			datatype : 'json',
			type : 'POST',
			data : object,
			success : function(data) {
				if (data.result == 1) {
					alert("로그인 성공");
					location.href = "schedulewrite";
				}

			},
			
		})
	})
</script>