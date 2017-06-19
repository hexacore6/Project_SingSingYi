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
		
		
		
	    $('#id').keyup(function(){
	        if ( $('#id').val().length >= 4 && $('#id').val().length <= 12) {
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
	                    if (result == 'SUCCESS') {
	                    	$("#idcheck").html("<font color=red> 이미 사용중인 아이디 입니다.</font>");
	                    } else {
	                        $("#idcheck").html("<font color=green> 사용가능한 아이디 입니다.</font>");
	                    }
	                }
	            }); // end ajax
	        }else{
	        	$("#idcheck").html("");    		  
	  	  	}
	    });  // end keyup
			
		
	    /*
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

select#pwquestion {
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
					<form class="form-horizontal" method="post" action="/member/regist">
						<div class="form-group">
							<label class="cols-sm-2 control-label ">아이디</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input type="text" class="form-control" name="id" id="id"
										placeholder="아이디를 입력해 주세요" required />
								</div>
                                  <div>
                                  <span id="idcheck"></span>
                                  </div>
							</div>
						</div>

						<div class="form-group">
							<label class="cols-sm-2 control-label">비밀번호</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<input type="password" class="form-control" name="password"
										id="password" placeholder="비밀번호를 입력해 주세요" required />
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="cols-sm-10">
								<div class="input-group">
									<select name=birth_year class="input birth" required>
										<option value=55>1955</option>
										<option value=56>1956</option>
										<option value=57>1957</option>
										<option value=58>1958</option>
										<option value=59>1959</option>
										<option value=60>1960</option>
										<option value=61>1961</option>
										<option value=62>1962</option>
										<option value=63>1963</option>
										<option value=64>1964</option>
										<option value=65>1965</option>
										<option value=66>1966</option>
										<option value=67>1967</option>
										<option value=68>1968</option>
										<option value=69>1969</option>
										<option value=70>1970</option>
										<option value=71>1971</option>
										<option value=72>1972</option>
										<option value=73>1973</option>
										<option value=74>1974</option>
										<option value=75>1975</option>
										<option value=76>1976</option>
										<option value=77>1977</option>
										<option value=78>1978</option>
										<option value=79>1979</option>
										<option value=80>1980</option>
										<option value=81>1981</option>
										<option value=82>1982</option>
										<option value=83>1983</option>
										<option value=84>1984</option>
										<option value=85>1985</option>
										<option value=86>1986</option>
										<option value=87>1987</option>
										<option value=88>1988</option>
										<option value=89>1989</option>
										<option value=90>1990</option>
										<option value=91>1991</option>
										<option value=92>1992</option>
										<option value=93>1993</option>
										<option value=94>1994</option>
										<option value=95>1995</option>
										<option value=96>1996</option>
										<option value=97>1997</option>
										<option value=98>1998</option>
										<option value=99>1999</option>
										<option value=100>2000</option>
										<option value=101>2001</option>
										<option value=102>2002</option>
										<option value=103>2003</option>
										<option value=104>2004</option>
										<option value=105>2005</option>
										<option value=106>2006</option>
										<option value=107>2007</option>
										<option value=108>2008</option>
										<option value=109>2009</option>
										<option value=110>2010</option>
										<option value=111>2011</option>
										<option value=112>2012</option>
										<option value=113>2013</option>
										<option value=114>2014</option>
										<option value=115>2015</option>
										<option value=116>2016</option>
										<option value=117>2017</option>
									</select><span>년</span> <select name=birth_month class="input birth"
										required>
										<option value=1>1</option>
										<option value=2>2</option>
										<option value=3>3</option>
										<option value=4>4</option>
										<option value=5>5</option>
										<option value=6>6</option>
										<option value=7>7</option>
										<option value=8>8</option>
										<option value=9>9</option>
										<option value=10>10</option>
										<option value=11>11</option>
										<option value=12>12</option>
									</select><span>월</span> <select name=birth_day class="input birth"
										required>
										<option value=1>1</option>
										<option value=2>2</option>
										<option value=3>3</option>
										<option value=4>4</option>
										<option value=5>5</option>
										<option value=6>6</option>
										<option value=7>7</option>
										<option value=8>8</option>
										<option value=9>9</option>
										<option value=10>10</option>
										<option value=11>11</option>
										<option value=12>12</option>
										<option value=13>13</option>
										<option value=14>14</option>
										<option value=15>15</option>
										<option value=16>16</option>
										<option value=17>17</option>
										<option value=18>18</option>
										<option value=19>19</option>
										<option value=20>20</option>
										<option value=21>21</option>
										<option value=22>22</option>
										<option value=23>23</option>
										<option value=24>24</option>
										<option value=25>25</option>
										<option value=26>26</option>
										<option value=27>27</option>
										<option value=28>28</option>
										<option value=29>29</option>
										<option value=30>30</option>
										<option value=31>31</option>
									</select><span>일</span>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label class="cols-sm-2 control-label">비밀번호찾기
								질문/답변</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<select name="pwquestion" id="pwquestion">
										<option value='가장 좋아하는 노래는?'>가장 좋아하는 노래는?</option>
										<option value='보물1호는?'>보물1호는?</option>
										<option value='가장 기억에 남는 장소는?'>가장 기억에 남는 장소는?</option>
									</select> <input type="text" class="form-control" name="pwanswer"
										id="pwanwser" placeholder="답변을 입력해 주세요" required />
								</div>
							</div>
						</div>

						<div class="form-group ">
							<button type="submit"
								class="btn btn-primary btn-lg btn-block login-button">회원가입</button>
						</div>
						<div class="login-register">
							<a style="font-size: 15px" href="/member/login">로그인</a>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- section -->
	</div>
</body>
</html>
