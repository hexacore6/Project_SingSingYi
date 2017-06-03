<%@ page language="java" contentType ="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org./TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="utf-8">
<title>register</title>
<script src="/resources/js/jquery-3.2.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/css/main.css">
    <!-- Bootstrap 3.3.4 -->
    <link href="<%=application.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="<%=application.getContextPath() %>/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="<%=application.getContextPath() %>/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    
    <!-- jQuery 2.1.4 -->
    <script src="<%=application.getContextPath() %>/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>

</head>
<body>
  <jsp:include page="../include/header.jsp"></jsp:include>
  <form role="form" id="registerForm" method="post">
    <input type="hidden" name="page" value="${cri.page }">
    <input type="hidden" name="perPageNum" value="${cri.perPageNum }">
    <input type="hidden" name="searchType" value="${cri.searchType }">
    <input type="hidden" name="keyword" value="${cri.keyword }">
    <!-- 게시글 작성시  제목, 내용, 작성자  -->

    <div class="box-body">
    <div class="form-group" style="margin: 5px;">
      <label for="exampleInputEamil1">Title</label>
      <input type="text" name="atitle" class="form-control" placeholder="Enter Title">
    </div>
      
    <div class="form-group" style="margin: 5px;">
      <label for="exampleInputPassword1">Content</label>
      <textarea class="form-control" name="acontent" rows="3" placeholder="Enter..."></textarea>
    </div>
    
    <div class="form-group" style="margin: 5px;">
      <label for="exampleInputEamil1">Writer</label>
      <input type="text" name="id" class="form-control" value="${login.id}" readonly>
    </div>
    </div>
 
    <!-- /.box-body -->
    
    <div class="box-footer">
      <div>
        <hr>
      </div>
      
      <button type="submit" class="btn btn-primary">확인</button>
      <button type="button" class="btn btn-warning">취소</button>
    </div>
  </form>
  
    <script>
$(document).ready(function(){
  
  var formObj= $("form[role='form']");
  console.log(formObj);
  
  $("#registerForm").submit(function(event){
	    event.preventDefault();
	    
	    var that = $(this);
	    
	    that.get(0).submit();
	  }); // registerForm END
  
	  
  //취소
  $(".btn-warning").on("click", function(){
	  self.location = "/sboard/list"
  });
});

</script>
  
    <!-- Bootstrap 3.3.2 JS -->
    <script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='/resources/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="/resources/dist/js/demo.js" type="text/javascript"></script>
    
   <jsp:include page="../include/footer.jsp"></jsp:include>
   

</body>
</html>