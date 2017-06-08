<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>노래방</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../../../resources/css/main.css?ver=1">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../../../resources/css/bootstrap3-wysihtml5.min.css?ver=2">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../../../resources/js/bootstrap3-wysihtml5.all.min.js?ver=2"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="../../../resources/js/bootstrap3-wysihtml5.all.min.js?ver=2"></script>
</head>
<script type="text/javascript">
function modify_click() {
	var pw = document.getelementbyid("password").value;
	if(pw=login.password){
	alert("비밀번호가 같습니다.");
	}
	else{
		alert("비밀번호 변경 완료");
	}
}
</script>
<body>
  <div class="row">
    <div class="col-lg-12">
      <div class='headerimg'>
        <!--좌표값수정-->
        <div class="row">
          <div class="col-lg-3"></div>
          <div class="col-lg-3"></div>
          <div class="col-lg-3">
            <iframe></iframe>
          </div>
        </div>
        <div class='container'>
        <div class="row">
          <div class="col-lg-3"></div>
          <div class="col-lg-3">
            <a href="#"></a>
          </div>
          <div class="col-lg-3"></div>
        </div>
      </div>
     </div>
    </div>
    <!--해어디이미지-->
    <section id='header' class='container'> <!--해더스타트-->
    <div class='headerbar'>
      <div class="row">
        <!--해더 메뉴바-->
        <!--한글폰트-->
        <div class="col-lg-3">
          <a href='#' class="menuitem">
            <p class="text-center">노래하기</p>
          </a>
        </div>
        <div class="col-lg-3">
          <a href='#' class="menuitem">
            <p class="text-center">sns</p>
          </a>
        </div>
        <div class="col-lg-3">
          <a href='#' class="menuitem">
            <p class="text-center">공지사항</p>
          </a>
        </div>
        <div class="col-lg-3">
          <a href='#' class="menuitem">
            <p class="text-center">고객센터</p>
          </a>
        </div>
      </div>
    </div>
    </section>
    <!--해더END-->
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
          <form class="form-horizontal"  action="myModify" method="post">
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
            <div class="box-footer" style="margin-top: 50px; border: none; width: 1000px;">
              <button type="reset" class="btn btn-default"style="margin-left: 270px;">취소</button>
              <button type="submit" class="btn btn-info"  onclick="modify_click();" style="margin-left: 200px;">변경</button>
            </div>
            <!-- /.box-footer -->
          </form>
        </div>
      </div>
    </div>
    </section>
    <!--내용끝-->
    <section id="footer" class='container'> <!--푸터시작--> <!--한글폰트-->
    <div class='footervar'>
      <div class="row">
        <!--푸터 메뉴바-->
        <div class="col-lg-3">
          <a href='www.naevr.com' class="menuitem">
            <p class="text-center">노래하기</p>
          </a>
        </div>
        <div class="col-lg-3">
          <a href='#' class="menuitem">
            <p class="text-center">sns</p>
          </a>
        </div>
        <div class="col-lg-3">
          <a href='#' class="menuitem">
            <p class="text-center">공지사항</p>
          </a>
        </div>
        <div class="col-lg-3">
          <a href='#' class="menuitem">
            <p class="text-center">고객센터</p>
          </a>
        </div>
      </div>
    </div>
    </section>
  </div>
  <!--푸터끝-->
</body>

</html>