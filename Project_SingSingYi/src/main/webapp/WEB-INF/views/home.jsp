<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>씽씽이</title>

<link rel="stylesheet" type="text/css"
	href="/resources/css/jquery.fullPage.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/examples.css" />

<!--[if IE]>
		<script type="text/javascript">
			 var console = { log: function() {} };
		</script>
	<![endif]-->

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript"
	src="/resources/vendors/scrolloverflow.js"></script>

<script type="text/javascript" src="/resources/js/jquery.fullPage.js"></script>
<script type="text/javascript" src="/resources/js/examples.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#fullpage').fullpage({
			navigation : true,
			navigationPosition : 'left'
		});

		$(".start").hide();
		setTimeout(function() {
			$(".start").show();
		}, 500);
	});
</script>
<script>
var msg = "${msg}";
if(msg == "fail") {
	alert('로그인 정보가 일치하지 않습니다!');
} else if (msg == "SUCCESS") {
	alert('회원가입이 완료되었습니다!');
} else if (msg == "emptyId") {
	alert('비밀번호를 다시 찾아주세요');
}
</script>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
body {
	font-family: 'Jeju Gothic', Arial;
}

/* Style for our header texts */
h1 {
	color: #fff;
	margin: 0;
	margin-bottom: 10px;
	padding: 0;
}

.section{
	background-size: cover;
}

#section0 {
	background-image: url(/resources/img/section0.jpg);
}
#section1 {
	background-image: url(/resources/img/section1.jpg);
}
#section2 {
	background-image: url(/resources/img/section2.jpg);
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
	opacity: 0.7;
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
				<div>
					<button onclick="location.href='/member/login'">로그인</button>
				</div>
				<div>
					<button onclick="location.href='/member/regist'">회원가입</button>
				</div>
			</div>
		</div>
		<div class="section" id="section1">
			<div class="intro">
				<h1>씽씽이는 그냥 노래방이 아닙니다</h1>
				<p>한 번 불러보세요</p>
			</div>
		</div>
		<div class="section" id="section2">
			<div class="intro">
				<h1>URL without /#</h1>
				<p>But back button won't work!</p>
			</div>
		</div>
	</div>
</body>
</html>