<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<style>
#hello {
	color: white;
	font-size: 40px;
}

#loginmaindiv {
	font-family: 'Jeju Gothic', sans-serif;
	padding: 10%;
}

.loginlabel {
	color: white;
	font-size: 30px;
}

#logindiv {
	padding-left: 20%;
	padding-right: 20%;
}

section {
	height: 1000px;
	display: block;
	background-size: 100% 100%;
}

#msg{
font-family: 'Jeju Gothic', sans-serif;
font-size : 40px;

background-color:rgba(255,255,255,0.3);

opacity: 0.7; 

	-webkit-animation:blink 0.5s ease-in-out infinite alternate;
    -moz-animation:blink 0.5s ease-in-out infinite alternate;
    animation:blink 0.5s ease-in-out infinite alternate;
}
@-webkit-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@-moz-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}


</style>


<section class="masthead">
	<div id="loginmaindiv">
		<div align='center'>


			<div>
				<p id="hello">Hello,&nbsp;&nbsp;${user.username}</p>
				<br /> <br /> <br />
			</div>
				<span class="badge badge-secondary" id="msg"></span>
			<div id="logindiv">
				<c:if test="${user == null}">
					<div>
						<label class="loginlabel">Hello, What`s your ID?</label> <input
							type="text" id="username" name="username" class="form-control"
							placeholder="Enter your ID">
					</div>
					<div>
						<label class="loginlabel">Enter your Password</label> <input
							type="password" id="password" class="form-control"
							placeholder="Enter your Password">
					</div>
					<br />
					<br />
					
					<button class="btn btn-success" type="button" id="btnlogin" ><span class="buttonP">Sign In</span></button>
					&nbsp;
					<button class="btn btn-light" type="button" id="joinbtn" ><span class="buttonP">Sign Up</span></button>
					&nbsp;
				</c:if>

				<c:if test="${user != null}">
					<button class="btn btn-danger" type="button" id="btnlogout" ><span class="buttonP">Sign Out</span></button>&nbsp;
				</c:if>
				<button class="btn btn-light" type="button" id="writebtn" ><span class="buttonP">Schedule</span></button>
			</div>

		</div>
	</div>
</section>
<%@ include file="include/footer.jsp"%>

<script src="/resources/scripts/login.js"></script>
