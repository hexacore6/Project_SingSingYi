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
    <script src="../../resources/js/jquery.min.js?ver=1"></script>
</head>

<body>
  <jsp:include page="../include/header.jsp"></jsp:include>
  <!--해더END-->
  <section id="content" class='container'>
  <div class="row">
    <%@include file="side.jsp"%>
    <div class="col-lg-9">
      <!--content-->
      <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">애창곡</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table table-striped">
                <tbody>
                  <tr>
                    <th style="width: 5px">번호</th>
                    <th style="width: 20px">곡명</th>
                    <th style="width: 50px">Artist</th>
                    <th style="width: 5px"><a>삭제</a></th>
                  </tr>
                  <%-- <c:forEach items="myFavorite" var="favorite"> --%>
                  <c:forEach items="${list}" var="favorite" varStatus="stat">
                    <tr id="trFavorite${favorite.fid}">
                      <td>${((pageMaker.cri.page-1)*10)+(stat.count)}</td>
                      <td style="width: 20px">${favorite.stitle}</td>
                      <td>${favorite.singer}</td>
                      <td style="width: 5px">
                        <button class="btn badge bg-red" 
                        onclick="removeFavorite(${favorite.fid})">삭제</button>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix text-center">
              <ul class="pagination  pagination-sm no-margin   ">
                <c:if test="${pageMaker.prev }">
                  <li><a href="myFavorite${pageMaker.makeQuery(pageMaker.startPage-1 )}">&laquo;</a></li>
                </c:if>

                <c:set value="woong" var="id"></c:set>
                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                  <li <c:out value="${pageMaker.cri.page == idx?'class=active':'' }"/>><a href="myFavorite${pageMaker.makeQuery(idx,id)}">${idx }</a></li>
                </c:forEach>


                <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
                  <li><a href="myFavorite${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a>
                </c:if>
              </ul>
            </div>
          </div>
        </div>
        <div class="col-lg-1"></div>
      </div>
    </div>
  </div>
  </section>
  <!--내용끝-->
  
  <!-- 애창곡 삭제 ajax 처리 -->
  <script type="text/javascript">
  function removeFavorite(fid){
	  swal({
		  title: "애창곡을 삭제하시겠습니까?",
		  text: "",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "삭제",
		  cancelButtonText: "취소",
		  closeOnConfirm: false
		},
		function(){	
          $.ajax({
            type : 'post',
            url : '/song/removeFavorite',
            headers : {
              "Content-type" : "application/json",
              "X-HTTP-method-Override" : "POST"
            },
            dataType : 'text',
            data : JSON.stringify({
              fid : fid
            }),
            success : function(result){
          	  $("#trFavorite"+fid).remove();
          	  swal("애창곡 삭제 완료!", "", "success");
            }   
    	});
	});
  }
  </script>
  
  <!-- jQuery -->
  <script src="../resources/js/jquery.easing.1.3.js"></script>
  <script src="../resources/js/bootstrap.min.js"></script>
  <script src="../resources/js/jquery.waypoints.min.js"></script>
  <script src="../resources/js/salvattore.min.js"></script>
  <!-- Main JS -->
  <script src="../resources/js/jquery.magnific-popup.min.js"></script>
  <script src="../resources/js/main.js"></script>
  <script src="../resources/dist/js/app.min.js" type="text/javascript"></script>
  <script src="../resources/dist/js/demo.js" type="text/javascript"></script>
  
  <!-- footer -->
  <jsp:include page="../include/footer.jsp"></jsp:include>
</body>

</html>