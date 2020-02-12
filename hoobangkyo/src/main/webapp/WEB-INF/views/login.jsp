<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<section>
	<div>
		<div class="logindiv">
			<form method="post">
				<div style='color: red'>${msg}</div>
				<div class="form-group">
					<label for="exampleInputEmail1">id</label> <input type="text"
						class="form-control" name="inputemail"
						aria-describedby="emailHelp" placeholder="id을 입력하세요">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">비밀번호</label> <input
						type="password" class="form-control" name="inputpassword"
						placeholder="비밀번호를 입력하세요">
				</div>

				<button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button><br/>
				<input type="button" class="btn btn-primary btn-lg btn-block" id="joinbtn" value="회원가입"/>
				
				<div>
					<input type="button" class="btn btn-primary btn-lg btn-block" id="writebtn" value="스케쥴"/>
				</div>
			</form>
		</div>
	</div>
</section>
<%@ include file="include/footer.jsp"%>
<script>
	let joinbtn = document.getElementById("joinbtn");
	
	joinbtn.addEventListener("click", function(e){
		location.href = "join";
	});
	
	let writebtn = document.getElementById("writebtn");
	
	writebtn.addEventListener("click", function(e){
		location.href = "schedulewrite";
	});

</script>