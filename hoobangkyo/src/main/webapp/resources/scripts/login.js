const baseUrl = "http://ec2-13-125-154-125.ap-northeast-2.compute.amazonaws.com:8080/scheduler/" ;

let joinbtn = document.getElementById("joinbtn");
if (joinbtn != null) {
	joinbtn.addEventListener("click", function(e) {
		location.href = "join";
	});
}

let writebtn = document.getElementById("writebtn");
if(writebtn!=null){
writebtn.addEventListener("click", function(e) {
	location.href = "schedulewrite";
});}

let btnlogin = document.getElementById("btnlogin");
let username = document.getElementById("username");
let password = document.getElementById("password");
var datauserid = "";
if (btnlogin != null) {
	btnlogin.addEventListener("click", function(e) {

		if(username.value.trim().length < 1){
			document.getElementById("msg").innerHTML = "Check your ID or Password";
			document.getElementById("msg").style.color= "red";
			
			username.focus();
			return;
		}
		
		var user = {
				"username" : username.value,
				"userpw" : password.value
		};
		
		var object = JSON.stringify(user)
		
		

		let url = baseUrl+"api/user/login";

		$.ajax({
			contentType : 'application/json; charset=UTF-8',
			url : url,
			datatype : 'json',
			type : 'POST',
			data : object,
			success : function(data) {
				let idcheck = data.result;
				console.log(idcheck);
				
				if (idcheck == 1) {
					datauserid = data.user.userid;
					postlogin();
					location.href = "schedulewrite"
				}else{
					document.getElementById("msg").innerHTML = "Check your ID or Password";
					document.getElementById("msg").style.color= "red";
					
					username.value= "";
					password.value= "";
					
					username.focus();
				}

			},
			error : function() {
				document.getElementById("msg").innerHTML = "Check your ID or Password";
				document.getElementById("msg").style.color= "red";
				
				username.value= "";
				password.value= "";
				
				username.focus();
			}
		})
	})
}

var postlogin = function() {
	let usernameval = username.value;
	let userid = datauserid;
	$.ajax({
		url : 'login',
		datatype : 'json',
		type : 'POST',
		data : {
			"username" : usernameval,
			"userid" : userid
		},
		success : function() {
			console.log("로그인 성공.");
		}

	})

}

let btnlogout = document.getElementById("btnlogout");
if (btnlogout != null) {
	btnlogout.addEventListener("click", function(e) {

		location.href = "logout";

	})
}