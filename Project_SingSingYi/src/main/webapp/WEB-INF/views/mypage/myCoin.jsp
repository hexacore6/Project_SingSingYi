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
	function showCoinModal() {
		$("#coinAddModal").modal('show');

	}
	
	function addCoin(){
		document.myForm.action="/myShop/notice/List.jsp"; 
		document.myForm.method="post"; 
		document.myForm.submit();

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
        <div class="row">
          <div class="col-lg-3"></div>
          <div class="col-lg-3 pull-left">
            <a href="#"></a>
          </div>
          <div class="col-lg-3"></div>
        </div>
      </div>
      <!--해어디이미지-->
      <section id='header'> <!--해더스타트-->
      <div class='headerbar' class='container'>
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
      <section id="content" class='container'>
      <div class="row">
        <%@include file="side.jsp"%>
        <div class="col-lg-9">
          <!--content-->
          <div class="row">
            <div class="col-lg-12">
              <div class="box box-info" style="border: none">
                <div class="box-header with-border">
                  <h3 class="box-title">${myCoin.id }님이보유하신코인의개수는: ${myCoin.coincnt }개입니다.</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th style="width: 50px; text-align: center;">번호</th>
                        <th style="text-align: center;">종류</th>
                        <th style="text-align: center;">지급 및 소모 내용</th>
                        <th style="width: 50px; text-align: center;">날짜</th>
                      </tr>
                    </thead>
                    <c:forEach items="${list}" var="historyCoin" varStatus="stat">
                      <tbody>
                        <tr>
                          <th style="width: 10px; text-align: center;">${((pageMaker.cri.page-1)*10)+(stat.index)}</th>
                          <th style="text-align: center;">${historyCoin.chtype }</th>
                          <th style="text-align: center;">${historyCoin.chcontent }</th>
                          <th style="width: 400px; text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${historyCoin.chdate }" /></th>
                        </tr>
                      </tbody>
                    </c:forEach>
                  </table>
                </div>
                <!-- /.box-body -->

                <div class="box-footer clearfix text-center">
                  <ul class="pagination  pagination-sm no-margin   ">
                    <c:if test="${pageMaker.prev }">
                      <li><a href="myCoin${pageMaker.makeQuery(pageMaker.startPage-1 )}">&laquo;</a></li>
                    </c:if>

                    <c:set value="woong1" var="id"></c:set>
                    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                      <li <c:out value="${pageMaker.cri.page == idx?'class=active':'' }"/>><a href="myCoin${pageMaker.makeQuery(idx,id)}">${idx }</a></li>
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
      <button class="btn btn-primary pull-right" id='modal' onclick="showCoinModal()">코인충전</button>
    </div>

  </div>
  </section>
  <!--내용끝-->
  <!-- coinAdd modal -->
  
  <div class="modal" id="coinAddModal">
    <div class="modal-dialog">
      <div class="modal-content">

        <div class="modal-header" style="border: none;">

          <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="closeButton">
            <span aria-hidden="true">&times;</span>
          </button>
          <h3 style="text-align: center;">코인충전</h3>
        </div>
        
        <form class="form-horizontal"  action="addCoin" method="post">
        <input type="hidden" id="id" name="id" value="${login.id }">
        <div class="modal-body" style="border: none;">
          <div class="row" style="float: left; text-align: center;">
            <ul style="list-style: none;">
              <li><label style="margin-bottom: 10px;"><input type='radio' id='10Add' name='coincnt' value="10"/>&nbsp;&nbsp;1000원 - 10코인</label></li>
              <li><label style="margin-bottom: 10px;"><input type='radio' id='30Add' name='coincnt' value="30"/>&nbsp;&nbsp;3000원 - 30코인</label></li>
              <li><label style="margin-bottom: 10px;"><input type='radio' id='50Add' name='coincnt' value="50"/>&nbsp;&nbsp;5000원 - 50코인</label></li>
              <li><label style="margin-bottom: 10px;"><input type='radio' id='100Add' name='coincnt' value="100"/>&nbsp;&nbsp;10000원 - 100코인</label></li>
            </ul>
          </div>
        </div>




        <div class="modal-footer" style="border: none;">

          <center>
            <button type="submit" class="btn btn-primary;">충전</button>
          </center>
        </div>
        </form>
      </div>

      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
  <!-- /.read modal -->
  <section id="footer"> <!--푸터시작--> <!--한글폰트-->
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
  <!--푸터끝-->
</body>

</html>