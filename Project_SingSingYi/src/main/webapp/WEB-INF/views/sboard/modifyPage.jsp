<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
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
  
  <div class="box-body">
  
    <div class="form-group">
      <label for="exampleInputEamil1">글번호</label>
      <input type="text" name="aid" class="form-control" value="${article.aid }" readonly="readonly">
    </div>
    
    <div class="form-group">
      <label for="exampleInputEamil1">글제목</label>
      <input type="text" name="atitle" class="form-control" value="${article.atitle }">
    </div>
    
    <div class="form-group">
      <label for="exampleInputPassword1">글내용</label>
      <textarea class="form-control" name="acontent" rows="3">${article.acontent }</textarea>
    </div>
    
    <div class="form-group">
      <label for="exampleInputEamil1">작성자</label>
      <input type="text" name="id" class="form-control" value="${article.id }" readonly="readonly">
    </div>
  </div>
  
  <!-- /.box-body -->
  
   <div class="box-footer">
      <div>
        <hr>
      </div>
 
    <button type="submit" class="btn btn-primary">저장</button>
    <button type="button" class="btn btn-warning">취소</button>
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
  
  //취소
  $(".btn-warning").on("click", function(){
   self.location = "/sboard/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
    +"&searchType=${cri.searchType}&keyword=${cri.keyword}";
  });

 var template = Handlebars.compile($("#template").html());

  $("#registerForm").submit(function(event){
    event.preventDefault();
    
    var that = $(this);
    var str ="";
    
    $(".uploadedList .delbtn").each(function(index){
      str+= "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'>";
    });
    
    that.append(str);
    that.get(0).submit();
  }); // registerForm END
});

</script>
  <jsp:include page="../include/footer.jsp"></jsp:include>
  <script type="text/javascript" src="/resources/js/upload.js"></script>
</body>
</html>