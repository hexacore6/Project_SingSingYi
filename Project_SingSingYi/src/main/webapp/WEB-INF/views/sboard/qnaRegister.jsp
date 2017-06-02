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
      <input type="text" name="id" class="form-control">
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
   self.location = "list";
  });
});

</script>
  
  
   <jsp:include page="../include/footer.jsp"></jsp:include>
   

</body>
</html>