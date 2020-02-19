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
	
	<div> <h3> 스케줄러 페이지.</h3></div>
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
				<tr>
					<td class="tg-0lax"><div>18</div></td>
					<td class="tg-0lax"><div id="10118"></div></td>
					<td class="tg-0lax"><div id="10218"></div></td>
					<td class="tg-0lax"><div id="10318"></div></td>
					<td class="tg-0lax"><div id="10418"></div></td>
					<td class="tg-0lax"><div id="10518"></div></td>
				</tr>
			</table>

		</div>
		<div>
			<div id="subjectlist">
				검색 결과 나열.

				<div id="sercheresultdiv"></div>

				<div>
					<input type="button" id="btnsend" value="저장하기" />
					<input type="button" id="btnmain" value="메인으로" />
				</div>
			</div>
			<br /> <br /> <br /> <br />
		</div>
	</div>
</section>
<script src="/resources/scripts/schedulewrite.js"></script>
<%@ include file="include/footer.jsp"%>
