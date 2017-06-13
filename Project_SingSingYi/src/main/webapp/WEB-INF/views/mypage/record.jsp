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
</head>
<body>
    <jsp:include page="../include/header.jsp"></jsp:include>
    <section id="content" class='container'>
    <div class="row">
      <%@include file="side.jsp"%>
      <div class="col-lg-9" style="margin-top: 50px;">
        <!--content-->
        <div class="row">
          <div class="col-lg-1"></div>
          <div class="col-lg-10">
            <div class="box">
              <div class="box-header">
                <h3 class="box-title">녹음 저장소</h3>
                
                <!-- <script>
          		cmp.writePlayer();
          		</script>  -->
              
              </div>
              <!-- /.box-header C:/record/upload/123.mp3-->
              
              

              
              <div class="box-body no-padding">
                <table class="table table-striped">
                  <tbody>
                    <tr>
                      <th style="width: 5px; text-align: center;">번호</th>
                      <th style="width: 50px; text-align: center;">곡명</th>
                      <th style="width: 10px; text-align: center;">녹음된 날짜</th>
                      <th style="width: 5px; text-align: center;">재생</th>
                      <th style="width: 5px; text-align: center;">삭제</th>
                    </tr>
                      <c:forEach items="${list}" var="record" varStatus="stat">  
                      <tr id="trRecord${record.rrid}">
                        <td style="text-align: center">${((pageMaker.cri.page-1)*10)+(stat.index)}</td>
                        <td style="width: 20px; text-align: center;">${record.recordfilename}</td>
                        <td style="width: 5px; text-align: center;"><span class="badge bg-black"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${record.recordregdate}" /></span></td>
                        <td style="width: 200px; text-align: center;">
                          <audio controls name="media">
                            <source src="displayRecord?fileName=/${record.recordfilename }" type="audio/mpeg">
                            <!-- <source src="/resources/mp3/123.mp3" type="audio/mpeg"> -->
                          </audio>
                        </td>
                        <td style="width: 5px; text-align: center;">
                          <button class="btn badge bg-red" onclick="removeRecord(${record.rrid})">삭제</button>
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
                    <li><a href="myRecord${pageMaker.makeQuery(pageMaker.startPage-1 )}">&laquo;</a></li>
                  </c:if>

                  <c:set value="woong1" var="id"></c:set>
                  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                    <li <c:out value="${pageMaker.cri.page == idx?'class=active':'' }"/>><a href="myRecord${pageMaker.makeQuery(idx,id)}">${idx }</a></li>
                  </c:forEach>


                  <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
                    <li><a href="myRecord${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a>
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
    
  <!-- 녹음저장소 삭제 ajax 처리 -->
  <script type="text/javascript">
  function removeRecord(rrid){
    swal({
      title: "녹음파일을 삭제하시겠습니까?",
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
            url : '/mypage/removeRecord',
            headers : {
              "Content-type" : "application/json",
              "X-HTTP-method-Override" : "POST"
            },
            dataType : 'text',
            data : JSON.stringify({
              rrid : rrid
            }),
            success : function(result){
              $("#trRecord"+rrid).remove();
              swal("녹음파일 삭제 완료!", "", "success");
            }   
      });
  });
  }
  </script>
    <jsp:include page="../include/footer.jsp"></jsp:include>
</body>

</html>