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
var datauserid = "";
if (btnlogin != null) {
	btnlogin.addEventListener("click", function(e) {

		let usernameval = '"' + username.value + '"';
		let passwordval = '"' + password.value + '"';

		let user = '{ "username": ' + usernameval + ' ,"userpw": '
				+ passwordval + ' }';

		let object = JSON.parse(JSON.stringify(user));

		let url = "http://192.168.0.119:10001/api/user/login";

		$.ajax({
			contentType : 'application/json; charset=UTF-8',
			url : url,
			datatype : 'json',
			type : 'POST',
			data : object,
			success : function(data) {
				datauserid = data.user.userid;

				if (data.result == 1) {
					postlogin();
					location.href = "schedulewrite"
				}

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
			alert("성공");
		}

	})

}

let btnlogout = document.getElementById("btnlogout");
if (btnlogout != null) {
	btnlogout.addEventListener("click", function(e) {

		location.href = "logout";

	})
}