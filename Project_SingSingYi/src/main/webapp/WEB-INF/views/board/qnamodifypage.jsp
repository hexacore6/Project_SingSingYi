<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
    
<meta charset="utf-8">
<title></title>

<script src="/resources/js/jquery-3.2.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

<jsp:include page="../include/header.jsp"></jsp:include>
  
   <form role ="form" id ="registerForm"  method="post">
    <input type="hidden" name="page" value="${cri.page }">
    <input type="hidden" name="perPageNum" value="${cri.perPageNum }">
    <input type="hidden" name="searchType" value="${cri.searchType }">
    <input type="hidden" name="keyword" value="${cri.keyword }">
  <div id='content' class="container">
  <div class="box-body container">
  
    <div class="form-group" style="text-align: left;">
      <label for="exampleInputEamil1" style="text-align: left">글번호</label>
      <input type="text" name="aid" class="form-control" value="${article.aid }" readonly="readonly">
    </div>
    
    <div class="form-group" style="text-align: left;">
      <label for="exampleInputEamil1" style="text-align: left;">글제목</label>
      <input type="text" name="atitle" class="form-control" value="${article.atitle }">
    </div>
    
    <div class="form-group" style="text-align: left;">
      <label for="exampleInputPassword1" style="text-align: left;">글내용</label>
      <textarea class="form-control" name="acontent" rows="3">${article.acontent }</textarea>
    </div>
    
    <div class="form-group" style="text-align: left;">
      <label for="exampleInputEamil1" style="text-align: left;">작성자</label>
      <input type="text" name="id" class="form-control" value="${article.id }" readonly="readonly">
    </div>
  </div>
  
  <!-- /.box-body -->
  
   <div class="box-footer container">
      <div>
        <hr>
      </div>
 
    <button type="submit" class="btn btn-primary">저장</button>
    <c:if test="${article.bid == 1 }">
     <button type="button" class="btn btn-warning" id="qnaListBtn">취소</button>
    </c:if>
    <c:if test="${article.bid == 2 }">
     <button type="button" class="btn btn-warning" id="noticeListBtn">취소</button>
    </c:if>
    
    </div>
   </div>
  </form>
  
  <script>
$(document).ready(function(){
  
  var formObj= $("form[role='form']");
  console.log(formObj);
  
  //저장
  $(".btn-primary").on("click", function(){
     formObj.submit();
  }); 
  
  //취소 시 QnA 리스트로
  $("#qnaListBtn").on("click", function(){
   self.location = "/board/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
    +"&searchType=${cri.searchType}&keyword=${cri.keyword}";
  });
  //취소 시 공지사항 리스트로
  $("#noticeListBtn").on("click", function(){
	   self.location = "/board/nlist?page=${cri.page}&perPageNum=${cri.perPageNum}"
	    +"&searchType=${cri.searchType}&keyword=${cri.keyword}";
  });

 var template = Handlebars.compile($("#template").html());

 $("#registerForm").submit(function(event){
	    event.preventDefault();
	    
	    var that = $(this);
	    
	    that.get(0).submit();
	  }); // registerForm END
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
  <script type="text/javascript" src="/resources/js/upload.js"></script>
</body>
</html>