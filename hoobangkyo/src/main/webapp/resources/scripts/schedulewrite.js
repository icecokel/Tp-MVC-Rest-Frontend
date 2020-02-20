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

	let color;
	for (let k = 0; k < subjectlist.length; k++) {
		if (subjectlist[k].subjectid == subjectid)
			color = subjectlist[k].color;
	}
	console.log(savejson.length);

	if (savejson.length >= 1) {

		for (let j = 0; j < savejson.length; j++) {
			// 저장된 subjectid 로 starttime 이랑 endtime을 가져오는 작업 후
			// 해당 값을 비교함.
			if (wday == savejson[j].wday) {
				let sst = savejson[j].starttime;
				let set = savejson[j].endtime;

				if ((sst > tst) && (set < tet)) {
					result = false;
					let conresult = confirm("시간이 겹칩니다. 수정하시겠습니까?");
					if (conresult) {
						scheduleupdate(j, userid, subjectid, tst, tet, wday,
								subjectname, color);
						tableclear();
						scheduling();
						$("#scheduletable").attr("tabindex", -1).focus();
						break;
					}
				}

				if ((sst <= tst && tst <= set) == false
						&& (sst <= tet && tet <= set) == false) {
					result = true;
				} else {
					result = false;
					let conresult = confirm("시간이 겹칩니다. 수정하시겠습니까?");
					if (conresult) {
						scheduleupdate(j, userid, subjectid, tst, tet, wday,
								subjectname, color);
						tableclear();
						scheduling();
						$("#scheduletable").attr("tabindex", -1).focus();
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
			"subjectname" : subjectname,
			"color" : color
		};
		savejson.push(str);
		scheduling();
		$("#scheduletable").attr("tabindex", -1).focus();
		// console.log(savejson);
	}

}

var scheduleupdate = function(index, userid, subjectid, tst, tet, wday,
		subjectname, color) {
	savejson.splice(index, 1);

	// console.log(subjectid);
	// console.log(subjectname);
	// console.log(color);

	var strr = {
		"userid" : userid,
		"subjectid" : subjectid,
		"starttime" : tst,
		"endtime" : tet,
		"wday" : wday,
		"subjectname" : subjectname,
		"color" : color
	};

	savejson.push(strr);
	// console.log(savejson);
}
var drawing = function(wday, starttime, endtime, subjectid, color, name) {

	let i = starttime;
	for (i; i <= endtime; i++) {
		document.getElementById(wday + "" + i).innerHTML = name;
		document.getElementById(wday + "" + i).style.backgroundColor = color;

	}

}

var tableclear = function() {
	for (let wd = 101; wd <= 105; wd++) {
		for (let time = 9; time <= 18; time++) {
			let divcc = document.getElementById(wd + "" + time)
			divcc.innerHTML = "";
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
		let color = savejson[i].color;
		let name = savejson[i].subjectname;

		console.log(subjectid);
		console.log(name);
		console.log(color);

		drawing(wday, starttime, endtime, subjectid, color, name);

	}
}

var subjectnamecheck = function(subjectid) {
	let len = subjectlist.length;

	for (let a = 0; a < len; a++) {
		if (subjectlist[a].subjectid == subjectid)
			return subjectlist[a].subjectname;
	}
}
var subjectcolorcheck = function(subjectid) {
	let len = subjectlist.length;

	for (let a = 0; a < len; a++) {
		if (subjectlist[a].subjectid == subjectid)
			return subjectlist[a].color;
	}
}

var subjects = function() {
	var sercheresultdiv = document.getElementById("sercheresultdiv");

	let url = "http://192.168.0.119:10001/api/subject"; // 과목요청 value
	var htmls = "";

	$
			.ajax({
				/* crossOrigin:true, */
				url : url,
				success : function(data) {
					/* console.log(data); */

					htmls = "<table class='table' id='scheduletable'>";
					htmls += "<tr><td >강의이름</td><td >요일</td><td >강의시간</td><td>선택</td></tr></thead'><tbody>"
					for ( var temp in data) {
						subjectlist.push(data[temp]);
						let day = "";
						switch (data[temp].wday) {
						case 101: {
							day = "월";
							break;
						}
						case 102: {
							day = "화";
							break;
						}
						case 103: {
							day = "수";
							break;
						}
						case 104: {
							day = "목";
							break;
						}
						case 105: {
							day = "금";
							break;
						}
						}
						let nbsp = "&nbsp;~&nbsp;";
						htmls += "<tr><td >" + data[temp].subjectname
								+ "</td><td >" + day + "</td><td >"
								+ data[temp].starttime + nbsp
								+ +data[temp].endtime + "</td>";

						htmls += "<td><input type='button' class='btn btn-secondary' value='선택' onclick='writejson("
								+ data[temp].subjectid
								+ ","
								+ data[temp].starttime

								+ ","
								+ data[temp].endtime
								+ ","
								+ data[temp].wday + ")'/></td>";

						htmls += "</tr>";

					}
					htmls += "</tbody></table>";
					// console.log(htmls);
					sercheresultdiv.innerHTML = htmls;

				}
			})

}
var sendjson = new Array();
let btnclear = document.getElementById("btnclear");

btnclear.addEventListener("click", function(e) {
	let lastindex = savejson.length;
	savejson.splice(0, lastindex);

	tableclear();
	scheduling();
	$("#scheduletable").attr("tabindex", -1).focus();

})
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
	if (sendjson.length >0) {
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
				if (data.result == 1) {
					alert("강의 시간표가 저장되었습니다.");
				}
			}

		});
	}else{
		alert("최소 하나의 강의는 신청해야 합니다.");
	}
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