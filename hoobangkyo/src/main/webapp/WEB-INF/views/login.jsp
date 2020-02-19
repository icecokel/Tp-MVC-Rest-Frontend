<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<section>
	<div>
		<div align='center'>
			<div>
				<h3>로그인 페이지.</h3>
			</div>
			<c:if test="${user == null}">
				<div>
					<label>id</label> <input type="text" id="username" name="username"
						placeholder="id을 입력하세요">
				</div>
				<div>
					<label>비밀번호</label> <input type="password" id="password"
						placeholder="비밀번호를 입력하세요">
				</div>

				<input type="button" id="btnlogin" value="로그인" />
			</c:if>
			<c:if test="${user != null}">
				<input type="button" id="btnlogout" value="로그아웃" />
			</c:if>

			<br /> <input type="button" id="joinbtn" value="회원가입" />

			<div>
				<input type="button" id="writebtn" value="스케쥴" />
			</div>

		</div>
	</div>
</section>
<%@ include file="include/footer.jsp"%>

<script src="/resources/scripts/user.js"></script>

<script src="/resources/scripts/login.js"></script>
