const baseUrl = "http://ec2-13-125-154-125.ap-northeast-2.compute.amazonaws.com:8080/scheduler/" ;
	
	
	let loginbtn = document.getElementById("loginbtn");

	loginbtn.addEventListener("click", function(e) {
	location.href = "/hoobangkyo/";
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

let idcheckflag = false;
username.addEventListener("focusout", function(e) {
	// 아이디 중복 검사.
	url = baseUrl + "/api/user/check";

	if (username.value.trim().length < 1) {
		msg.innerHTML = "ID cannot be empty";
		msg.style.color = "red";
		username.focus();
		return;
	}

	var user = {
			"username" : username.value
	}
	
	let object = JSON.stringify(user);
	
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

	url = baseUrl + "/api/user";

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

	var user = {
			"username" : username.value,
			"userpw" : password.value
	}	
	
	let object = JSON.stringify(user);

	$.ajax({
		contentType : 'application/json; charset=UTF-8',
		url : url,
		datatype : 'json',
		type : 'POST',
		data : object,
		success : function(data) {
			if (data.result == 1) {
				alert("회원가입 성공");
				location.href = "/hoobangkyo/";
			}

		},
		error : function() {
			alert("통신오류" + error);
		}
	})

});