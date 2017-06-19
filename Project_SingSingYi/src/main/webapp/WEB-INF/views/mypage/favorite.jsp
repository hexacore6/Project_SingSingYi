<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>\
<style type="text/css">
table.type10 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin: 20px 10px;
}

table.type10 thead th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #fff;
  background: #e7708d;
  margin: 20px 10px;
}

table.type10 tbody th {
  width: 150px;
  padding: 10px;
}

table.type10 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
}

table.type10 .even {
  background: #fdf3f5;
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
    <script src="..`/../resources/js/jquery.min.js?ver=1"></script>
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
        <div class="col-lg-12">
          <div class="box">
            <div class="box-header">
              <h1 class="box-title" style="text-align: left;">
                <img width="50px;" height="50px;" src="/resources/img/favorite.png"><strong style="color: #e7708d;"> 애창곡</strong>
              </h1>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table table-striped type10">
                <thead>
                  <tr>
                    <th style="width: 20%; text-align: center; font-size: 20px;">곡명</th>
                    <th style="width: 10%; text-align: center; font-size: 20px; ">아티스트</th>
                    <th style="width: 5%; font-size: 20px;">삭제</th>
                  </tr>
                  </thead>
                  <%-- <c:forEach items="myFavorite" var="favorite"> --%>
                  <c:forEach items="${list}" var="favorite" varStatus="stat">
                  <tr  class="even" id="trFavorite${favorite.fid}">
                      <%-- <td>${((pageMaker.cri.page-1)*10)+(stat.count)}</td> --%>
                      <td style="width: 20px; font-size: 20px; text-align: center;"><b>${favorite.stitle}</b></td>
                      <td style="font-size: 20px; text-align: center;"><b>${favorite.singer}</b></td>
                      <td style="width: 5px;">
                        <a onclick="removeFavorite(${favorite.fid})"><img alt="remove" src="/resources/img/delete.png" style="width: 40px; height: 40px;"></a>
                      </td>
                    </tr>
                  </c:forEach>
              </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix text-center">
              <ul class="pagination  pagination-sm no-margin   ">
                <c:if test="${pageMaker.prev }">
                  <li><a href="myFavorite${pageMaker.makeQuery(pageMaker.startPage-1 )}">&laquo;</a></li>
                </c:if>

                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                  
                  <c:choose>
                    <c:when test="${pageMaker.cri.page==idx}">
                      <li class="active" ><a style="background-color:#e7708d; border-color:#e7708d; " href="coin${pageMaker.makeQuery(idx)}">${idx }</a></li>
                    </c:when>
                  <c:otherwise>
                      <li><a href="coin${pageMaker.makeQuery(idx)}">${idx }</a></li>
                  </c:otherwise>
                  </c:choose>
                 
                </c:forEach>


                <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
                  <li><a href="myFavorite${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a>
                </c:if>
              </ul>
            </div>
          </div>
        </div>
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