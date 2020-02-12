<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<section>
	<div align ="center">
		<div >
			<table border="1px" width = "30%">
				<tr>
					<th class="tg-0lax" width = "20%">시간</th>
					<th class="tg-0lax" width = "16%">월</th>
					<th class="tg-0lax" width = "16%">화</th>
					<th class="tg-0lax" width = "16%">수</th>
					<th class="tg-0lax" width = "16%">목</th>
					<th class="tg-0lax" width = "16%">금</th>
				</tr>
				<tr>
					<td class="tg-0lax">9</td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
				</tr>
				<tr>
					<td class="tg-0lax">10</td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
				</tr>
				<tr>
					<td class="tg-0lax">11</td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
				</tr>
				<tr>
					<td class="tg-0lax">12</td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
				</tr>
				<tr>
					<td class="tg-0lax">14</td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
				</tr>
				<tr>
					<td class="tg-0lax">15</td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
				</tr>
				<tr>
					<td class="tg-0lax">16</td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
				</tr>
				<tr>
					<td class="tg-0lax">17</td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
					<td class="tg-0lax"></td>
				</tr>
			</table>
			
		</div>
		<div>
		  <div id="subjectlist">
		  검색 결과 나열.
		  <button onclick="writejson(3)">Click me</button>
		  
		  <div id ="sercheresultdiv">
		  </div>
		  <div> <input type="button" id="btnsend"/> </div>
		  </div>
		  <br/><br/><br/><br/>
		</div>
	</div>
</section>
<script>

var i = 0;
var sendjson = new Array();
var username = "킹갓훈";

function writejson(subjectid){
	
	var str = {"userid": username , "subjectid":subjectid};
	var json = JSON.stringify(str) ;
	sendjson[i] = json;
	i++;
    console.log(sendjson);
}

function list(){
	let sercheresultdiv = document.getElementById("sercheresultdiv");
	
	let url =""; // 과목요청 value
	
	let htmls ="";
	
	let request = new XMLHttpRequest();
	
	request.open('GET', url);
	request.send('');
	
		
		if (request.readyState == 4) {
			if (request.status >= 200 && request.status < 300) {
				let obj = request.responseText;
				let json = JSON.parse(obj);
				
				json.forEach(function(data) {
					htmls += "강의 이름 : " + data.subjectname ;
					htmls += "강의 시간 : " + data.starttime +"~"+data.endtime;
					htmls += "<input type='button' value='선택' onclick='write("+data.subjectid+")'/>";
					htmls += "<br/>";
				
				});
				sercheresultdiv.innerHTML = htmls;
			}
			
		}
	
}

let btnsend = document.getElementById("btnsend");
btnsend.addEventListener("click" , function(e){
	let url=""; 
	
	$.ajax({
		type:'POST',
		data:sendjson,
		url:url,
		success :function(data){
			if(data.result ==='true'){
				alert("시간표 등록이 끝났습니다.");
				location.href="login";
			}
			
		}
		
	});
});
</script>
<%@ include file="include/footer.jsp"%>
