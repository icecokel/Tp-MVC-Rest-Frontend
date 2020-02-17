<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<style>
.tg-0lax {
	text-align: center;
}
</style>
<section>
	<div align="center">
		<div>
			<table border="1px" width="30%">
				<tr>
					<th class="tg-0lax" width="20%">시간</th>
					<th class="tg-0lax" width="16%">월</th>
					<th class="tg-0lax" width="16%">화</th>
					<th class="tg-0lax" width="16%">수</th>
					<th class="tg-0lax" width="16%">목</th>
					<th class="tg-0lax" width="16%">금</th>
				</tr>
				<tr>
					<td class="tg-0lax"><div>9</div></td>
					<td class="tg-0lax"><div id="1019"></div></td>
					<td class="tg-0lax"><div id="1029"></div></td>
					<td class="tg-0lax"><div id="1039"></div></td>
					<td class="tg-0lax"><div id="1049"></div></td>
					<td class="tg-0lax"><div id="1059"></div></td>
				</tr>
				<tr>
					<td class="tg-0lax"><div>10</div></td>
					<td class="tg-0lax"><div id="10110"></div></td>
					<td class="tg-0lax"><div id="10210"></div></td>
					<td class="tg-0lax"><div id="10310"></div></td>
					<td class="tg-0lax"><div id="10410"></div></td>
					<td class="tg-0lax"><div id="10510"></div></td>
				</tr>
				<tr>
					<td class="tg-0lax"><div>11</div></td>
					<td class="tg-0lax"><div id="10111"></div></td>
					<td class="tg-0lax"><div id="10211"></div></td>
					<td class="tg-0lax"><div id="10311"></div></td>
					<td class="tg-0lax"><div id="10411"></div></td>
					<td class="tg-0lax"><div id="10511"></div></td>
				</tr>
				<tr>
					<td class="tg-0lax"><div>12</div></td>
					<td class="tg-0lax"><div id="10112"></div></td>
					<td class="tg-0lax"><div id="10212"></div></td>
					<td class="tg-0lax"><div id="10312"></div></td>
					<td class="tg-0lax"><div id="10412"></div></td>
					<td class="tg-0lax"><div id="10512"></div></td>
				</tr>
				<tr>
					<td class="tg-0lax"><div>13</div></td>
					<td class="tg-0lax"><div id="10113"></div></td>
					<td class="tg-0lax"><div id="10213"></div></td>
					<td class="tg-0lax"><div id="10313"></div></td>
					<td class="tg-0lax"><div id="10413"></div></td>
					<td class="tg-0lax"><div id="10513"></div></td>
				</tr>
				<tr>
					<td class="tg-0lax"><div>14</div></td>
					<td class="tg-0lax"><div id="10114"></div></td>
					<td class="tg-0lax"><div id="10214"></div></td>
					<td class="tg-0lax"><div id="10314"></div></td>
					<td class="tg-0lax"><div id="10414"></div></td>
					<td class="tg-0lax"><div id="10514"></div></td>
				</tr>
				<tr>
					<td class="tg-0lax"><div>15</div></td>
					<td class="tg-0lax"><div id="10115"></div></td>
					<td class="tg-0lax"><div id="10215"></div></td>
					<td class="tg-0lax"><div id="10315"></div></td>
					<td class="tg-0lax"><div id="10415"></div></td>
					<td class="tg-0lax"><div id="10515"></div></td>
				</tr>
				<tr>
					<td class="tg-0lax"><div>16</div></td>
					<td class="tg-0lax"><div id="10116"></div></td>
					<td class="tg-0lax"><div id="10216"></div></td>
					<td class="tg-0lax"><div id="10316"></div></td>
					<td class="tg-0lax"><div id="10416"></div></td>
					<td class="tg-0lax"><div id="10516"></div></td>
				</tr>
				<tr>
					<td class="tg-0lax"><div>17</div></td>
					<td class="tg-0lax"><div id="10117"></div></td>
					<td class="tg-0lax"><div id="10217"></div></td>
					<td class="tg-0lax"><div id="10317"></div></td>
					<td class="tg-0lax"><div id="10417"></div></td>
					<td class="tg-0lax"><div id="10517"></div></td>
				</tr>
			</table>

		</div>
		<div>
			<div id="subjectlist">
				검색 결과 나열.

				<div id="sercheresultdiv"></div>

				<div>
					<input type="button" id="btnsend" value="저장하기" />
				</div>

			</div>
			<br /> <br /> <br /> <br />
		</div>
	</div>
</section>
<script>
	var sendjson = new Array();
	var subjectlist = new Array();
	var username = "킹갓훈";
	var i = 0;

	var writejson = function(subjectid, tst, tet, wday) {

		let result;

		let subjectname = subjectnamecheck(subjectid);

		console.log(sendjson.length);
		if (sendjson.length >= 1) {

			for (let j = 0; j < sendjson.length; j++) {

				// 저장된 subjectid 로 starttime 이랑 endtime을 가져오는 작업 후
				// 해당 값을 비교함.	
				if (wday == sendjson[j].wday){
					
					
					
				}
				let sst = sendjson[j].starttime;
				let set = sendjson[j].endtime;
				 
				console.log("sst" + sst)
				console.log("set" + set)
				console.log("tst" + tst)
				console.log("tet" + tet)

				
 				if ((sst <= tst && tst<= set) == false && (sst <= tet && tet <= set) == false) {
					result = true;
				} else if ((tst < sst) && (tet > set)) {
					result = true;
				} else {
					result = false;
					alert("과목 시간 겹침;;;;;");
					break;
				} 
				
				// 킹갓 질문 : json에 데이터를 오버해서 넣어도 가능한지?
			}

		} else {
			result = true;
		}

		// 유효성 검사에서 통과 하면 진행함.

		if (result == true) {
			var str = {
				"userid" : username,
				"subjectid" : subjectid,
				"starttime" : tst,
				"endtime" : tet,
				"wday" : wday,
				"subjectname" : subjectname
			};

			sendjson[i++] = str;
			console.log(sendjson);
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

		let url = "http://192.168.0.119:8080/api/subject"; // 과목요청 value	
		var htmls = "";

		$
				.ajax({
					/* crossOrigin:true, */
					url : url,
					success : function(data) {
						/* console.log(data); */

						for ( var temp in data) {
							htmls += "강의 이름 : " +"["+data[temp].wday+"]  " +data[temp].subjectname;
							htmls += "강의 시간 : " + data[temp].starttime + "~"
									+ data[temp].endtime;
							htmls += "<input type='button' value='선택' onclick='writejson("
									+ data[temp].subjectid
									+ ","
									+ data[temp].starttime

									+ ","
									+ data[temp].endtime
									+ ","
									+ data[temp].wday + ")'/>";
							htmls += "<br/>";

							subjectlist[temp] = {
								"subjectid" : data[temp].subjectid,
								"starttime" : data[temp].starttime,
								"endtime" : data[temp].endtime,
								"wday" : data[temp].wday,
								"subjectname" : data[temp].subjectname
							};
							console.log(subjectlist[temp]);

						}
						sercheresultdiv.innerHTML = htmls;

					}
				})

	}
	let btnsend = document.getElementById("btnsend");
	btnsend.addEventListener("click", function(e) {
		let url = "";

		$.ajax({
			type : 'POST',
			data : sendjson,
			url : url,
			success : function(data) {
				if (data.result === 'true') {
					alert("시간표 등록이 끝났습니다.");
					location.href = "login";
				}

			}

		});
	});
	$(document).ready(function() {
		subjects();
	});
</script>
<%@ include file="include/footer.jsp"%>
