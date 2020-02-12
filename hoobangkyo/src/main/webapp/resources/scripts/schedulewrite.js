
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
	let lindex = sendjson.lastindexOf(",");
	
	senddata = "["+sendjson+"]";
	
});