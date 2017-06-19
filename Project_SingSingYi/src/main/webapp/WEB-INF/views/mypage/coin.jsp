<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
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
<!-- Theme style -->
<!--  <link href="../resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" /> -->
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
	function showCoinModal() {
		$("#coinAddModal").modal('show');

	}
</script>


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
          <div class="box box-info" style="border: none">
            <div class="box-header with-border">
              <h1 class="box-title" style="text-align: left;">
                <img width="50px;" height="50px;" src="/resources/img/coin.png"><strong style="color: #e7708d;"> 코인 관리</strong>
              </h1>

            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <h4 style="text-align: right;">
                나의 보유 코인 <strong style="color: #e7708d;">${myCoin.coincnt }</strong> 개
                <button class="btn btn-primary pull-right" id='modal' onclick="showCoinModal()" style="background-color: #e7708d; margin-left: 30px; margin-bottom: 10px; border-color: #fdf3f5">코인충전</button>
              </h4>

              <table class="table table-striped type10">
                <thead>
                  <tr>
                    <th style="text-align: center; font-size: 20px;">종류</th>
                    <th style="text-align: center; font-size: 20px;">지급 및 소모 내용</th>
                    <th style="text-align: center; font-size: 20px;">지급 및 소모 날짜</th>
                  </tr>
                </thead>
                <c:forEach items="${list}" var="historyCoin" varStatus="stat">
                  <tr class="even">
                    <td class="event" style="text-align: center; font-size: 18px;"><b>${historyCoin.chtype }</b></td>
                    <td class="event" style="text-align: center; font-size: 18px;"><b>${historyCoin.chcontent }</b></td>
                    <td class="event" style="width: 400px; text-align: center; font-size: 18px;"><b><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${historyCoin.chdate }" /></b></td>
                  </tr>
                </c:forEach>
              </table>

            </div>
            <!-- /.box-body -->
            <!-- 페이징 번호 div -->
            <div class="box-footer clearfix text-center">
              <ul class="pagination  pagination-sm no-margin" style="background-color: #fdf3f5;">
                <c:if test="${pageMaker.prev }">
                  <li><a href="myCoin${pageMaker.makeQuery(pageMaker.startPage-1 )}">&laquo;</a></li>
                </c:if>

                <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                  
                  <c:choose>
                    <c:when test="${pageMaker.cri.page==idx}">
                      <li class="active"><a style="background-color:#e7708d;" href="coin${pageMaker.makeQuery(idx)}">${idx }</a></li>
                    </c:when>
                  <c:otherwise>
                      <li><a href="coin${pageMaker.makeQuery(idx)}">${idx }</a></li>
                  </c:otherwise>
                  </c:choose>
                 
                </c:forEach>


                <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
                  <li><a href="myCoin${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a>
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
  <!-- coinAdd modal -->

  <div class="modal" id="coinAddModal" >
    <div class="modal-dialog" style="background-color: #fdf3f5">
      <div class="modal-content" style="background: transparent;">
   



        <div class="modal-header" style="border: none;">

          <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="closeButton">
            <span aria-hidden="true">&times;</span>
          </button>
          <h3 style="text-align: center; color: #e7708d;"><b>코인충전</b></h3>
        </div>

        <form class="form-horizontal" action="addcoin" method="post">
          <input type="hidden" id="id" name="id" value="${login.id }">
          <div class="modal-body" style="border: none;">
            <div class="row" style="float: left; text-align: center;">
              <ul style="list-style: none;">
                <li><label style="margin-bottom: 10px;"><input type='radio' id='10Add' name='coincnt' value="10" /><b style="font-size: 20px;">&nbsp;&nbsp;1000원&nbsp; -&nbsp; 10 코인</b></label></li>
                <li><label style="margin-bottom: 10px;"><input type='radio' id='30Add' name='coincnt' value="30" /><b style="font-size: 20px;">&nbsp;&nbsp;3000원&nbsp; - &nbsp;30 코인</b></label></li>
                <li><label style="margin-bottom: 10px;"><input type='radio' id='50Add' name='coincnt' value="50" /><b style="font-size: 20px;">&nbsp;&nbsp;5000원&nbsp; - &nbsp;50 코인</b></label></li>
                <li><label style="margin-bottom: 10px;"><input type='radio' id='100Add' name='coincnt' value="100" /><b style="font-size: 20px;">&nbsp;&nbsp;10000원&nbsp; - &nbsp;100 코인</b></label></li>
              </ul>
            </div>
          </div>

          <div class="modal-footer" style="border: none;">

            <center>
              <h4><button type="submit" class="btn btn-primary;" id="pluscoin" style="background-color: #e7708d; color: white;" >충전</button></h4>
            </center>
          </div>
        </form>
      </div>

      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
  <!-- /.read modal -->
  <jsp:include page="../include/footer.jsp"></jsp:include>
</body>

</html>