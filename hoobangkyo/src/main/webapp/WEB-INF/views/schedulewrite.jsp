<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<style>
.subjectlist {
	font-family: 'Jeju Gothic', sans-serif;
	padding: 20px;
	background-color: rgba(0, 0, 0, 0.3);
}

.maindiv {
	padding-left: 17%;
	padding-right: 17%;
}

#scheduletable {
	text-align: center;
	color: white;
}

.thead-dark {
	font-size: 25px;
}

.thh {
	background-color: #969696;
	padding: 5%;
}

.badge {
	font-size: 17px;
}

h3 {
	color: white;
}

.times {
	font-size: 30px;
}
#showsubjects{
 font-size: 40px;
 background-color: rgba(0, 0, 0, 0.5);
}
</style>


<section class="masthead">
	<div align="center" class="maindiv">

		<div>
			<h3>Schedule</h3>
			<!-- <button onclick="tableclear()">테이블 클리어</button> -->
		</div>
		<div class="subjectlist">
			<div align="right">
			<input type="button" id="btnmain"
					value="메인으로" class="btn btn-light" />
				<input type="button" id="btnsend" value="저장하기"
					class="btn btn-success" /> 
				<input type="button" id="btnclear" value="강의 비우기"
					class="btn btn-danger" /> 
					
			</div>
			<br/>
			<table border="1px" class='table' id="scheduletable">
				<thead class="thead-dark">
					<tr>
						<th width="10%"></th>
						<th width="18%">Mon</th>
						<th width="18%">Tue</th>
						<th width="18%">Wed</th>
						<th width="18%">Thu</th>
						<th width="18%">Fri</th>
					</tr>
				</thead>
				<tbody>

					<tr>
						<td><span class="badge badge-secondary times">9</span></td>
						<td><span class="badge badge-secondary" id="1019"></span></td>
						<td><span class="badge badge-secondary" id="1029"></span></td>
						<td><span class="badge badge-secondary" id="1039"></span></td>
						<td><span class="badge badge-secondary" id="1049"></span></td>
						<td><span class="badge badge-secondary" id="1059"></span></td>
					</tr>
					<tr>
						<td><span class="badge badge-secondary times">10</span></td>
						<td><span class="badge badge-secondary" id="10110"></span></td>
						<td><span class="badge badge-secondary" id="10210"></span></td>
						<td><span class="badge badge-secondary" id="10310"></span></td>
						<td><span class="badge badge-secondary" id="10410"></span></td>
						<td><span class="badge badge-secondary" id="10510"></span></td>
					</tr>
					<tr>
						<td><span class="badge badge-secondary times">11</span></td>
						<td><span class="badge badge-secondary" id="10111"></span></td>
						<td><span class="badge badge-secondary" id="10211"></span></td>
						<td><span class="badge badge-secondary" id="10311"></span></td>
						<td><span class="badge badge-secondary" id="10411"></span></td>
						<td><span class="badge badge-secondary" id="10511"></span></td>
					</tr>
					<tr>
						<td><span class="badge badge-secondary times">12</span></td>
						<td><span class="badge badge-secondary" id="10112"></span></td>
						<td><span class="badge badge-secondary" id="10212"></span></td>
						<td><span class="badge badge-secondary" id="10312"></span></td>
						<td><span class="badge badge-secondary" id="10412"></span></td>
						<td><span class="badge badge-secondary" id="10512"></span></td>
					</tr>
					<tr>
						<td><span class="badge badge-secondary times">13</span></td>
						<td><span class="badge badge-secondary" id="10113"></span></td>
						<td><span class="badge badge-secondary" id="10213"></span></td>
						<td><span class="badge badge-secondary" id="10313"></span></td>
						<td><span class="badge badge-secondary" id="10413"></span></td>
						<td><span class="badge badge-secondary" id="10513"></span></td>
					</tr>
					<tr>
						<td><span class="badge badge-secondary times">14</span></td>
						<td><span class="badge badge-secondary" id="10114"></span></td>
						<td><span class="badge badge-secondary" id="10214"></span></td>
						<td><span class="badge badge-secondary" id="10314"></span></td>
						<td><span class="badge badge-secondary" id="10414"></span></td>
						<td><span class="badge badge-secondary" id="10514"></span></td>
					</tr>
					<tr>
						<td><span class="badge badge-secondary times">15</span></td>
						<td><span class="badge badge-secondary" id="10115"></span></td>
						<td><span class="badge badge-secondary" id="10215"></span></td>
						<td><span class="badge badge-secondary" id="10315"></span></td>
						<td><span class="badge badge-secondary" id="10415"></span></td>
						<td><span class="badge badge-secondary" id="10515"></span></td>
					</tr>
					<tr>
						<td><span class="badge badge-secondary times">16</span></td>
						<td><span class="badge badge-secondary" id="10116"></span></td>
						<td><span class="badge badge-secondary" id="10216"></span></td>
						<td><span class="badge badge-secondary" id="10316"></span></td>
						<td><span class="badge badge-secondary" id="10416"></span></td>
						<td><span class="badge badge-secondary" id="10516"></span></td>
					</tr>
					<tr>
						<td><span class="badge badge-secondary times">17</span></td>
						<td><span class="badge badge-secondary" id="10117"></span></td>
						<td><span class="badge badge-secondary" id="10217"></span></td>
						<td><span class="badge badge-secondary" id="10317"></span></td>
						<td><span class="badge badge-secondary" id="10417"></span></td>
						<td><span class="badge badge-secondary" id="10517"></span></td>
					</tr>
					<tr>
						<td><span class="badge badge-secondary times">18</span></td>
						<td><span class="badge badge-secondary" id="10118"></span></td>
						<td><span class="badge badge-secondary" id="10218"></span></td>
						<td><span class="badge badge-secondary" id="10318"></span></td>
						<td><span class="badge badge-secondary" id="10418"></span></td>
						<td><span class="badge badge-secondary" id="10518"></span></td>
					</tr>
				</tbody>
			</table>

		</div>
		<div>
			<div class="subjectlist">
				<span id="showsubjects" class="badge badge-secondary">강의 목록</span><br/>
				<div id="sercheresultdiv" align='center'></div>

			</div>
			<br /> <br /> <br /> <br />
		</div>
	</div>
</section>
<script src="/resources/scripts/schedulewrite.js"></script>
<%@ include file="include/footer.jsp"%>
