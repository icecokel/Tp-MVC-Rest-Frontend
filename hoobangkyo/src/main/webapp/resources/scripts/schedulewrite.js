document.getElementById("btnmain").addEventListener("click", function(e) {
	location.href = "/";
});

var useridgetter = document.getElementById("userid");
var userid = Number.parseInt(useridgetter.value);
// var userid = useridgetter.value;

var savejson = new Array();
var subjectlist = new Array();

var writejson = function(subjectid, tst, tet, wday) {

	let result;

	let subjectname = subjectnamecheck(subjectid);

	console.log(savejson.length);

	if (savejson.length >= 1) {

		for (let j = 0; j < savejson.length; j++) {

			// 저장된 subjectid 로 starttime 이랑 endtime을 가져오는 작업 후
			// 해당 값을 비교함.
			if (wday == savejson[j].wday) {
				let sst = savejson[j].starttime;
				let set = savejson[j].endtime;

				console.log("sst" + sst)
				console.log("set" + set)
				console.log("tst" + tst)
				console.log("tet" + tet)

				if ((sst <= tst && tst <= set) == false
						&& (sst <= tet && tet <= set) == false) {
					result = true;
				} else if ((tst < sst) && (tet > set)) {
					result = true;
				} else {
					result = false;
					let conresult = confirm("시간이 겹칩니다. 수정하시겠습니까?");
					if (conresult) {
						console.log(savejson[j].subjectid);
						savejson.splice(j, 1);
						console.log(savejson);
						var strr = {
								"userid" : userid,
								"subjectid" : subjectid,
								"starttime" : tst,
								"endtime" : tet,
								"wday" : wday,
								"subjectname" : subjectname
							};
						savejson.push(strr);
						
						tableclear();
						scheduling();
						break;
					}
					

				}
			} else {
				result = true;
			}
		}
	} else {
		result = true;
	}
	// 유효성 검사에서 통과 하면 진행함.
	if (result == true) {
		var str = {
			"userid" : userid,
			"subjectid" : subjectid,
			"starttime" : tst,
			"endtime" : tet,
			"wday" : wday,
			"subjectname" : subjectname
		};
		savejson.push(str);
		scheduling();
		// console.log(savejson);
	}
}
var drawing = function(wday, starttime, endtime, subjectid) {
	
	let name = subjectnamecheck(subjectid);
	let i = starttime;
	for (i; i <= endtime; i++) {
		document.getElementById(wday + "" + i).innerHTML = name;
	}

}

var tableclear = function(){
	let wd = 101;
	let time = 9;
	
	for(wd ; wd <= 105 ; wd++){
		for(time ; time <= 18 ; time++){
			document.getElementById(wd + "" + time).innerHTML = "";
		}
	}
}

var scheduling = function() {
	let len = savejson.length;

	for (let i = 0; i < len; i++) {

		let wday = savejson[i].wday;
		let starttime = savejson[i].starttime;
		let endtime = savejson[i].endtime;
		let subjectid = savejson[i].subjectid;

		drawing(wday, starttime, endtime, subjectid);

	}
}

var subjectnamecheck = function(subjectid) {
	let len = subjectlist.length;

	for (let a = 0; a < len; a++) {
		if (subjectlist[a].subjectid == subjectid)
			return subjectlist[a].subjectname;
	}
}

var subjects = function() {
	var sercheresultdiv = document.getElementById("sercheresultdiv");

	let url = "http://192.168.0.119:10001/api/subject"; // 과목요청 value
	var htmls = "";

	$.ajax({
		/* crossOrigin:true, */
		url : url,
		success : function(data) {
			/* console.log(data); */

			for ( var temp in data) {
				htmls += "강의 이름 : " + "[" + data[temp].wday + "]  "
						+ data[temp].subjectname;
				htmls += "강의 시간 : " + data[temp].starttime + "~"
						+ data[temp].endtime;
				htmls += "<input type='button' value='선택' onclick='writejson("
						+ data[temp].subjectid + "," + data[temp].starttime

						+ "," + data[temp].endtime + "," + data[temp].wday
						+ ")'/>";
				htmls += "<br/>";

				subjectlist.push(data[temp])
				console.log(subjectlist[temp]);
			}
			sercheresultdiv.innerHTML = htmls;
		}
	})

}
var sendjson = new Array();

let btnsend = document.getElementById("btnsend");
btnsend.addEventListener("click", function(e) {
	let len = savejson.length;

	var object = new Object();

	for (let i = 0; i < len; i++) {
		let subjectid = savejson[i].subjectid;

		object = new Object();
		object.userid = userid;
		object.subjectid = subjectid;

		sendjson.push(object);
	}
	jQuery.ajaxSettings.traditional = true;

	console.log(sendjson);

	let url = "http://192.168.0.119:10001/api/schedule";

	$.ajax({
		contentType : 'application/json; charset=UTF-8',
		url : url,
		datatype : 'json',
		type : 'POST',
		data : JSON.stringify(sendjson),
		success : function(data) {
			if (data.result == '1') {
				alert("시간표 등록이 끝났습니다.");
			}
		}
	});
});
var schedulelist = function() {
	let id = userid;
	url = "http://192.168.0.119:10001/api/schedule/" + id;
	$.ajax({
		url : url,
		success : function(data) {
			console.log(data);
			for ( var temp in data) {
				savejson.push(data[temp]);
			}
			scheduling();
		}
	})
}
$(document).ready(function() {
	subjects();
	schedulelist();
});