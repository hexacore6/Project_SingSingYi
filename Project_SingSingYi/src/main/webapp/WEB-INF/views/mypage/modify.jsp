<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
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
    <div class="row">
      <%@include file="side.jsp"%>
      <div class="col-lg-9" style="margin-top: 50px;">
        <!--content-->
        <div class="box box-info" style="border: none">
          <div class="box-header with-border">
            <h3 class="box-title">회원정보 수정</h3>
          </div>
          <!-- /.box-header -->
          <!-- form start -->
            <div class="box-body" style="border: none;text-align: center; content: center;">
              <div class="form-group" style="margin-top: 50px; margin-left: 8px;">
                <label>아이디</label> <center><input type="text" id="id" name="id" class="form-control" value="${login.id }"  readonly="readonly" style="width: 300px;"></center>
              </div>
              <div class="form-group" style="margin-top: 50px; margin-left: 8px;">
                <label>비밀번호</label> <center><input type="password" id="password" name="password" class="form-control" style="width: 300px;"></center>
              </div>
              <!--  <div class="form-group" style="margin-top:50px;margin-left:8px;">
                                    <label>비밀번호 확인</label>
                                    <input type="text" id="cPassword" name="cPassword" class="form-control" placeholder="Enter ..." style="width:300px;"> </div> -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer" style="margin-right: 180px; border: none; ">
              <button id="btnModify" class="btn btn-info"  style="margin-left: 200px; margin-top: 30px; margin-bottom: 30px;">변경</button>
            </div>
            <!-- /.box-footer -->
          </form>
        </div>
      </div>
    </div>
    </section>
    <!--내용끝-->
    <jsp:include page="../include/footer.jsp"></jsp:include>
    
    <script type="text/javascript">
    	
    </script>
</body>

</html>