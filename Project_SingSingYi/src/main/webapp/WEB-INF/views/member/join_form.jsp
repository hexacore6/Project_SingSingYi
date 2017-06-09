<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title> BBmall </title>
<script type="text/javascript" src="../js/jquery-3.2.0.min.js"></script>

<style type="text/css">
.row {
	width: 100%;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
    $('#id').keyup(function(){
        if ( $('#id').val().length >= 6 && $('#id').val().length <= 12) {
            var id = $(this).val();
            // ajax 실행
            $.ajax({
                type : 'POST',
                url : "/users/idDup.swag",
                data:
                {
                    id: id
                },
                success : function(request) {
                    if (request === "false") {
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
});
	

$(document).ready(function() {
	$('#repassword').keyup(function() {
		if ($('#password').val() != $('#repassword').val()) {
			$("#pwdcheck").html("<font color=red> 비밀번호 불일치</font>");
		} else {
			$("#pwdcheck").html("<font color=green> 비밀번호 일치</font>");
		}
	}); // end keyup
});
</script>

</head>
<!--/head-->

<body>

  <%-- Include Header --%>
  <jsp:include page="../include/header.jsp"></jsp:include>
  <br>
  <br>

  <div id="contact-page" class="container">
    <div class="row">
      <div class="col-sm-2"></div>
      <div class="col-sm-8">
        <div class="contact-form">
          <h2 class="title text-center">회원가입</h2>
          <div class="status alert alert-success" style="display: none"></div>
          <form action="/users/join.swag" method="post">

            <div class="form-group col-md-12">
              <label class="control-label col-sm-3" for="id" style="font-size: 20px;">아이디:</label>
              <div class="col-sm-5">
                <input type="text" id="id" name="id" class="form-control" required="required" placeholder="(영문+숫자 6자~10자)">
               
              </div>
              <div class="col-sm-4">
               <span id="idcheck"></span>
              </div>
            </div>

            <div class="form-group col-md-12">
              <label class="control-label col-sm-3" for="id" id="id" style="font-size: 20px;">이름:</label>
              <div class="col-sm-9">
                <input type="text" id="name" name="name" class="form-control" required="required">
              </div>
            </div>


            <div class="form-group col-md-12">
              <label class="control-label col-sm-3" for="passwd" style="font-size: 20px;">비밀번호:</label>
              <div class="col-sm-5">
                <input type="password" id="password" name="password" class="form-control" required="required" placeholder="(영문+숫자 8자~10자)">
              </div>
              
              <div class="col-sm-4">
               <span></span>
              </div>
            </div>
            
            <div class="form-group col-md-12">
              <label class="control-label col-sm-3" for="passwd" style="font-size: 20px;">비밀번호확인:</label>
              <div class="col-sm-5">
                <input type="password" id="repassword" name="repassword" class="form-control" required="required" placeholder="(영문+숫자 8자~10자)">
              </div>
              <div class="col-sm-4">
               <span id="pwdcheck"></span>
              </div>
            </div>
            
            <div class="form-group col-md-12">
              <label class="control-label col-sm-3" for="email" style="font-size: 20px;">이메일:</label>
              <div class="col-sm-4">
                <input type="text" class="form-control" id="email" name="email" placeholder="Enter Email">
              </div>
              <label class="control-label col-sm-1">@</label>
              <div class="col-sm-4">
                <select class="form-control" id="server" name="server">
                  <option>naver.com</option>
                  <option>daum.net</option>
                  <option>korea.com</option>
                </select>
              </div>
            </div>
            <div class="form-group col-md-12">
              <label class="control-label col-sm-3" for="telephone" style="font-size: 20px;">전화번호:</label>
              <div class="col-sm-9">
                <input type="tel" class="form-control" id="telephone" name="telephone" placeholder="Enter Telephone">
              </div>
            </div>


            <div class="form-group col-md-12">
              <label class="control-label col-sm-3" for="message" style="font-size: 20px;">배송지 주소:</label>
              <div class="col-sm-9">
                <!-- 다음 배송지 주소 API START-->
                <input type="text" id="sample4_postcode" name="sample4_postcode" class="form-control" placeholder="우편번호"><br> 
                <input type="button" class="form-control" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br> 
                <input type="text" id="sample4_roadAddress" name="sample4_roadAddress" class="form-control" placeholder="도로명주소" size="20"><br>
                <!-- <input type="text" id="sample4_jibunAddress" class="form-control" placeholder="지번주소" size="20'"> -->
                <input type="text" id="sample4_remainAddress" name="sample4_remainAddress" class="form-control" placeholder="나머지 주소" size="20'"> <span id="guide" style="color: #999"></span>

                <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                <script>
					//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
					function sample4_execDaumPostcode() {
						new daum.Postcode(
								{
									oncomplete : function(
											data) {
										// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

										// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
										// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
										var extraRoadAddr = ''; // 도로명 조합형 주소 변수

										// 법정동명이 있을 경우 추가한다. (법정리는 제외)
										// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
										if (data.bname !== ''
												&& /[동|로|가]$/g
														.test(data.bname)) {
											extraRoadAddr += data.bname;
										}
										// 건물명이 있고, 공동주택일 경우 추가한다.
										if (data.buildingName !== ''
												&& data.apartment === 'Y') {
											extraRoadAddr += (extraRoadAddr !== '' ? ', '
													+ data.buildingName
													: data.buildingName);
										}
										// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
										if (extraRoadAddr !== '') {
											extraRoadAddr = ' ('
													+ extraRoadAddr
													+ ')';
										}
										// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
										if (fullRoadAddr !== '') {
											fullRoadAddr += extraRoadAddr;
										}

										// 우편번호와 주소 정보를 해당 필드에 넣는다.
										document
												.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
										document
												.getElementById('sample4_roadAddress').value = fullRoadAddr;
										document
												.getElementById('sample4_jibunAddress').value = data.jibunAddress;

										// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
										if (data.autoRoadAddress) {
											//예상되는 도로명 주소에 조합형 주소를 추가한다.
											var expRoadAddr = data.autoRoadAddress
													+ extraRoadAddr;
											document
													.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
													+ expRoadAddr
													+ ')';

										} else if (data.autoJibunAddress) {
											var expJibunAddr = data.autoJibunAddress;
											document
													.getElementById('guide').innerHTML = '(예상 지번 주소 : '
													+ expJibunAddr
													+ ')';

										} else {
											document
													.getElementById('guide').innerHTML = '';
										}
									}
								})
								.open();
					}
				</script>

              </div>
            </div>
            <!-- 다음 배송지 주소 API END-->

            <div class="form-group col-md-12">
              <label class="control-label col-sm-3" for="message" style="font-size: 20px;">배송시 남길말:</label>
              <div class="col-sm-9">
              
                <textarea rows="6" cols="10" id="message2" name="message2" placeholder="메시지를 입력해주세요."></textarea>
              </div>
            </div>

            <div style="margin-top: 45px; text-align: center;">
              <button type="submit" class="btn btn-default update" style="margin: 20px;">가입하기</button>
              <a href="login_form.swag"  class="btn btn-default update" style="margin: 20px;">로그인</a> 
              <a href="/index.swag" class="btn btn-default update"  style="margin: 20px;">홈으로</a>
            </div>

          </form>
        </div>
      </div>
    </div>

  </div>


  <%-- footer Header --%>
  <jsp:include page="../include/footer.jsp"></jsp:include>

  <script src="../js/bootstrap.min.js"></script>
  <script type="../text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>

  <script src="../js/price-range.js"></script>
</body>
</html>