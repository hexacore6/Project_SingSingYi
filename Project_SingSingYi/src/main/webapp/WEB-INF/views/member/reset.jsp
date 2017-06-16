<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- Website Font style -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Passion+One'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen'
	rel='stylesheet' type='text/css'>

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
		
		$(".start").hide();
		setTimeout(function() {
			$(".start").show();
		}, 500);
		
		/* 
	    $('#id').keyup(function(){
	        if ( $('#id').val().length >= 6 && $('#id').val().length <= 12) {
	            var id = $(this).val();
	            // ajax 실행
	            $.ajax({
	                type : 'POST',
	                url : "/member/iddup",
	                data:
	                {
	                    id: id
	                },
	                success : function(result) {
	                    if (result === "false") {
	                        $("#idcheck").html("<font color=green> 사용가능한 아이디 입니다.</font>");
	                    } else {
	                        $("#idcheck").html("<font color=red> 이미 사용중인 아이디 입니다.</font>");
	                    }
	                }
	            }); // end ajax
	        }else{
	        	$("#idcheck").html("");    		  
	  	  	}
	    });  // end keyup
			
		
		$('#repassword').keyup(function() {
			if ($('#password').val() != $('#repassword').val()) {
				$("#pwdcheck").html("<font color=red> 비밀번호 불일치</font>");
			} else {
				$("#pwdcheck").html("<font color=green> 비밀번호 일치</font>");
			}
		}); // end keyup 
		*/
	});
</script>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
body {
	font-family: 'Jeju Gothic', Arial;
}
/* Style for our header texts
		* --------------------------------------- */
h1 {
	/* font-family: arial, helvetica; */
	color: #fff;
	margin: 0;
	margin-bottom: 10px;
	padding: 0;
}

#section0 {
	background-image: url(/resources/img/regist.jpg);
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
	height: 38px;
	width: 280px;
	padding: 0 10px;
	font-size: 20px;
	border-radius: 3px;
}

@keyframes fadeIn {
	from { 
		opacity:0;
	}
	to {
		opacity:0.8;
	}
}

.start {
	animation-name: fadeIn;
	animation-duration: 0.5s;
	opacity: 0.9;
}

.form-group {
	margin-bottom: 15px;
}

label {
	font-weight: bold;
}

input, input::-webkit-input-placeholder {
	margin-top: 10px;
	font-size: 15px;
	padding-top: 3px;
}

.main-login {
	background-color: whitesmoke;
	/* shadows and rounded borders */
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.main-center {
	margin-top: 30px;
	margin: 0 auto;
	max-width: 330px;
	padding: 40px 40px;
}

.login-button {
	margin-top: 5px;
}

.login-register {
	font-size: 11px;
	text-align: center;
}

span {
	font-size: 18px;
}

select {
	border: none;
	height: 38px;
	font-size: 15px;
}

select.birth {
	margin-top: 10px;
	padding-top: 3px;
	width: 80px;
}

select#question {
	margin-top: 10px;
	padding-top: 3px;
	width: 300px;
}
</style>
</head>
<body>
	<div id="fullpage" >
		<div class="section" id="section0">
			<div class="start">
				<div class="panel-heading">
					<div class="panel-title text-center">
						<h1 class="title">씽씽이</h1>
					</div>
				</div>
				<div class="main-login main-center">
					<form class="form-horizontal" method="post" action="/member/reset">
						<div class="form-group">
							<label class="cols-sm-2 control-label">${id }</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input type="password" class="form-control" name="password" id="password"
										placeholder="새 비밀번호를 입력해 주세요" required />
									<input type="hidden" name="id" value="${id }">
								</div>
							</div>
						</div>

						<div class="form-group ">
							<button type="submit"
								class="btn btn-primary btn-lg btn-block login-button">변경</button>
						</div>
						<div class="login-register">
							<a style="font-size: 15px" href="/">처음으로</a>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- section -->
	</div>
</body>
</html>
