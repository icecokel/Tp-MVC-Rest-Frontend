<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<style>
h3 {
	color: white;
}

section {
	height: 1000px;
	display: block;
	background-size: 100% 100%;
}

#joinmaindiv {
	font-family: 'Jeju Gothic', sans-serif;
	padding: 10%;
}

#joindiv {
	padding-left: 20%;
	padding-right: 20%;
}

.joinlabel {
	color: white;
	font-size: 30px;
	display: inline-block;
}

#msg {
	font-family: 'Jeju Gothic', sans-serif;
	font-size: 40px;
	background-color: rgba(255, 255, 255, 0.3);
	opacity: 0.7;
	-webkit-animation: blink 0.5s ease-in-out infinite alternate;
	-moz-animation: blink 0.5s ease-in-out infinite alternate;
	animation: blink 0.5s ease-in-out infinite alternate;
}

@
-webkit-keyframes blink { 0% {
	opacity: 0;
}

100%
{
opacity


:


1;
}
}
@
-moz-keyframes blink { 0% {
	opacity: 0;
}

100%
{
opacity


:


1;
}
}
@
keyframes blink { 0% {
	opacity: 0;
}
100%
{
opacity


:


1;
}
}
</style>

<section class="masthead">
	<div id="joinmaindiv">
		<div align=center id="joindiv">

			<div>
				<h3>Create your account</h3>
			</div>
			<span class="badge badge-secondary" id="msg"></span>
			<div>
				<label class="joinlabel">ID</label> <input class="form-control"
					type="text" id="username" aria-describedby="emailHelp"
					placeholder="Enter your ID">
			</div>

			<div>
				<label class="joinlabel">Password</label> <input
					class="form-control" type="password" id="password"
					placeholder="Enter your Password">
			</div>
			<br />
			<button class="btn btn-success" type="button" id="btnjoin">
				<span class="buttonP">Sign Up</span>
			</button>
			&nbsp;
			<button class="btn btn-light" type="button" id="joinbtn">
				<span class="buttonP">Sign In</span>
			</button>

		</div>
	</div>
</section>
<%@ include file="include/footer.jsp"%>

<script src="/resources/scripts/join.js"></script>