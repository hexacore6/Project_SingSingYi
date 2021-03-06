<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>씽씽이</title>

<link rel="stylesheet" type="text/css" href="/resources/css/jquery.fullPage.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/examples.css" />

<!--[if IE]>
		<script type="text/javascript">
			 var console = { log: function() {} };
		</script>
	<![endif]-->

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="/resources/vendors/scrolloverflow.js"></script>

<script type="text/javascript" src="/resources/js/jquery.fullPage.js"></script>
<script type="text/javascript" src="/resources/js/examples.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#fullpage').fullpage({
			sectionsColor : [ '#1bbc9b', '#4BBFC3', '#7BAABE' ],
		});
/* 
		// run the currently selected effect
		function runEffect() {
			// get effect type from
			var selectedEffect = "bounce";

			// Most effect types need no options passed by default
			var options = {};
			// some effects have required parameters

			// Run the effect
			$("#effect").show(selectedEffect, options, 500, callback);
		}
		;

		//callback function to bring a hidden box back
		function callback() {
			setTimeout(function() {
				$("#effect:visible").removeAttr("style").fadeOut();
			}, 1000);
		}
		;

		// Set effect from select menu value
		$("#button").on("click", function() {
			runEffect();
		});
		$("#effect").hide();
 */
		// 
		$(".start").hide();
		setTimeout(function() {
			$(".start").show();
		}, 500);
	});
</script>

<script>
var result = '${message}';
if (result == 'fail') {
	alert("로그인 실패");
}
</script>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
body {
	font-family: 'Jeju Gothic', Arial;
}
/* Style for our header texts
		* --------------------------------------- */
h1 {
	color: #fff;
	margin: 0;
	margin-bottom: 10px;
	padding: 0;
}

#section0 {
	background-image: url(/resources/img/login.jpg);
}

button {
	background: #ed484e;
	color: #fff;
	border: none;
	position: relative;
	height: 45px;
	width: 300px;
	font-size: 1.3em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
	margin-bottom: 10px;
	border-radius: 3px;
	font-family: 'Jeju Gothic', Arial;
}

button:hover {
	background: #fff;
	color: #ed484e;
}

button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #ed484e;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

form div {
	margin-bottom: 10px;
}

input {
	border: none;
	height: 40px;
	width: 280px;
	padding: 0 10px;
	font-size: 15px;
	border-radius: 3px;
}

.toggler {
	width: 500px;
	height: 100px;
	margin-left: auto;
	margin-right: auto;
	font-size: 10px;
}

.toggler a {
	font-size: 15px;
}

@keyframes fadeIn {
	from { 
		opacity:0;	
	}
	to {
		opacity: 1;
	}
}

.start {
	animation-name: fadeIn;
	animation-duration: 0.5s;
}
</style>

</head>
<body>
	<div id="fullpage">
		<div class="section" id="section0">
			<div class="start">
				<h1>씽씽이</h1>
				<form action="/member/loginPost" method="post">
					<div>
						<input type="text" name="id" id="id" placeholder="아이디"></input>
					</div>
					<div>
						<input type="password" name="password" id="password" placeholder="비밀번호"></input>
					</div>
					<button type="submit" id="button">로그인</button>
				</form>
				
				<div class="login-register">
					<a style="font-size: 15px" href="/member/search">비밀번호 찾기</a>
				</div>
				<!-- 
				<div class="toggler">
					<div id="effect">
						<p>아이디와 비밀번호가 일치하지 않습니다!</p>
						<a href="">비밀번호를 찾으시겠습니까?</a>
					</div>
				</div> 
				-->
			</div>
		</div>
		
	</div>
	
	<!-- <script>
		var id = $("#id").val();
		var password = $("#password").val();
	
		$.ajax({
			type : 'post',
			url : '/member/loginPost',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				id : id,
				password : password
			}),
			success : function(result) {
				$("#deleteModal").modal('show');
				var array = JSON.parse(result);
				$("#deleteShid").attr("value", array.shid);
			}
		});
	</script> -->
	
	
</body>
</html>
