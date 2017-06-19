<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<style type="text/css">


.textbox {position: relative; width: 200px; margin: 15px}

.textbox label {
  position: absolute;
  top: 1px;  /* input 요소의 border-top 설정값 만큼 */
  left: 1px;  /* input 요소의 border-left 설정값 만큼 */
  padding: .8em .5em;  /* input 요소의 padding 값 만큼 */
  color: #999;
  cursor: text;
}

.textbox input[type="text"],
.textbox input[type="password"] {
  width: 100%;  /* 원하는 너비 설정 */ 
  height: auto;  /* 높이값 초기화 */
  line-height : normal;  /* line-height 초기화 */
  padding: .8em .5em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */
  border: 1px solid #999;
  border-radius: 0;  /* iSO 둥근모서리 제거 */
  outline-style: none;  /* 포커스시 발생하는 효과 제거를 원한다면 */
  -webkit-appearance: none;  /* 브라우저별 기본 스타일링 제거 */
  -moz-appearance: none;
  appearance: none;
}
</style>
<title>노래방</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../../../resources/css/main.css?ver=1">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../../../resources/css/bootstrap3-wysihtml5.min.css?ver=2">
<link rel="stylesheet" type="text/css" href="../../resources/css/sweetalert.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../../../resources/js/bootstrap3-wysihtml5.all.min.js?ver=2"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="../../../resources/js/bootstrap3-wysihtml5.all.min.js?ver=2"></script>
<script src="../../resources/js/sweetalert.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	  
	
	  var placeholderTarget = $('.textbox input[type="text"], .textbox input[type="password"]');
	  
	  //포커스시
	  placeholderTarget.on('focus', function(){
		  jQuery(this).siblings('label').fadeOut('fast');
	  });

	  //포커스아웃시
	  placeholderTarget.on('focusout', function(){
	    if(jQuery(this).val() == ''){
	    	jQuery(this).siblings('label').fadeIn('fast');
	    }
	  }); 	
	
      $("#btnModify").on("click", function() {
    	var password = $("#password").val();
        modify(password);
      }); 
      
      function modify(password) {
      $.ajax({
        type : 'post',
        url : '/mypage/modify',
        headers : {
          "Content-Type" : "application/json",
          "X-HTTP-Method-Override" : "POST"
        },
        dataType : 'text',
        data : JSON.stringify({
          password : password
        }), 
        success : function(result) {
        	if (result === 'true') {
        		swal("비밀번호 변경완료!", "", "success");
            }else{
            	swal("현재 비밀번호와 같습니다!", "", "error");
            }
          }
    });
  }
 	  
});

	  
  </script>
</head>

<body>
  <jsp:include page="../include/header.jsp"></jsp:include>
    <section id="content " class='container'>
    <div class="row" >
      <%@include file="side.jsp"%>
      <div class="col-lg-9" style="margin-top: 50px;" ">
        <!--content-->
        <div class="box box-info" style="border: none" >
          <div class="box-header with-border" style="padding-left: 200px;">
            <h1 class="box-title" style="text-align: left;">
                <img width="50px;" height="50px;" src="/resources/img/modify.png"><strong style="color: #e7708d;"> 비밀번호 변경</strong>
              </h1>
          </div>
          <!-- /.box-header -->
          <!-- form start -->
            <div class="textbox" style="padding-left: 200px;">
              <div class="form-group" style="margin-top: 50px; margin-left: 8px;">
                <input type="text" placeholder="${login.id }"  id="id" name="id" class="form-control" readonly="readonly" style="width: 300px; font-size: 20px;">
              </div>
              <div class="textbox" style="margin-top: 50px; margin-left: 8px;">
                <input type="password" placeholder="변경할 비밀번호" id="password" name="password" class="form-control" style="width: 300px; font-size: 20px;">
              </div>
              <!--  <div class="form-group" style="margin-top:50px;margin-left:8px;">
                                    <label>비밀번호 확인</label>
                                    <input type="text" id="cPassword" name="cPassword" class="form-control" placeholder="Enter ..." style="width:300px;"> </div> -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer" style="margin-right: 180px; border: none; text-align: left; margin-left: 55px; padding-left: 200px;">
              <button id="btnModify" class="btn btn-info"  style="margin-left: 200px; margin-top: 30px; margin-bottom: 30px;"><b style="font-size: 20px;">변경</b></button>
            </div>
            <!-- /.box-footer -->
          </form>
        </div>
      </div>
    </div>
    </section>
    <!--내용끝-->
    
  <!-- jQuery -->
  
  <script src="/resources/js/jquery.easing.1.3.js"></script>
  <script src="/resources/js/bootstrap.min.js"></script>
  <script src="/resources/js/jquery.waypoints.min.js"></script>
  <script src="/resources/js/salvattore.min.js"></script>
  <!-- Main JS -->
  <script src="/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/js/main.js"></script>
  <script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
  <script src="/resources/dist/js/demo.js" type="text/javascript"></script>

    <jsp:include page="../include/footer.jsp"></jsp:include>
    

</body>

</html>