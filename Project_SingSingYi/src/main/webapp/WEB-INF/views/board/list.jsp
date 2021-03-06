<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<title>QnA</title>
<script src="/resources/js/jquery-3.2.0.min.js"></script>
<script>
	var result = '${msg}';
	if (result == 'SUCCESS') {
		alert("처리가 완료되었습니다.");
	}
</script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "list"
									+ '${pageMaker.makeQuery(1)}'
									+ '&searchType='
									+ $("select option:selected").val()
									+ "&keyword="
									+ encodeURIComponent($('#keywordInput')
											.val())
						})
				$('#newBtn').on("click", function(evt) {
					self.location = "qnaregister"
				})
			})
</script>
<style type="text/css">
  #content{
    height: 1000px;
  }
</style>
</head>
<body>
  <jsp:include page="../include/header.jsp"></jsp:include>
  
  <div class="box-header with-border" style="margin-left: 20px;">
  <h2 class="box-title">QnA</h2> 
  </div>

  <!-- 검색 기능 START -->
  <div class='box-body' style="margin-left: 25px;">
    <select name="searchType" style="height: 30px;">
      <option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>제목+내용</option>
      
      <option value="t" <c:out value="${cri.searchType eq 't'?'selected':''}"/>>제목</option>

      <option value="c" <c:out value="${cri.searchType eq 'c'?'selected':''}"/>>내용</option>

      <option value="w" <c:out value="${cri.searchType eq 'w'?'selected':''}"/>>작성자</option>

      <option value="cw" <c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>작성자+내용</option>

      <option value="tcw" <c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>모두</option>

    </select>

    <input type="text" name="keyword" id="keywordInput" value='${cri.keyword }' style="height: 30px;">
    <button id='searchBtn' class="btn btn-default "><i class="fa fa-search"></i></button>
    <button id='newBtn' class="btn btn-default">새 글쓰기</button>


  </div>
  <!-- 검색 기능 END -->

  <!-- BOARD LIST START -->
  <section id="content" class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-header with-border">
            <table class="table table-bordered">
              <tr>
                <th style="width: 100px;text-align: center; font-size: 20px;">글번호</th>
                <th style="text-align: center; font-size: 20px;">제목</th> 
                <th style="text-align: center; font-size: 20px;">작성자</th>
                <th style="width: 100px;text-align: center; font-size: 20px;">작성날짜</th>
                <th style="width: 100px;text-align: center; font-size: 20px;">조회수</th>
              </tr>

              <c:forEach items="${list}" var="article">
                <tr>
                  <td style="font-size: 17px;">${article.aid }</td>
                  <td style="font-size: 17px;">
                    <a href='/board/readpage${pageMaker.makeSearch(pageMaker.cri.page)
                 }&aid=${article.aid}'> ${article.atitle }
                    </a>
                  </td>

                  <td style="font-size: 17px;">${article.id }</td>
                  <td style="font-size: 17px;">${article.aregdate }</td>
                  <td style="font-size: 17px;">
                    <span class="badge bg-red" style="font-size: 17px;">${article.viewcnt }</span>
                  </td>
                </tr>

              </c:forEach>
            </table>
          </div>
        </div>
      </div>
    </div>
    <!-- BOARD LIST END -->

    <!-- 페이지 네이션  -->
    <div class="text-center">
      <ul class="pagination">

        <c:if test="${pageMaker.prev }">
          <li><a href="list${pageMaker.makeSearch(pageMaker.startPage-1)}">&laquo;</a></li>
        </c:if>

        <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
          <li <c:out value="${pageMaker.cri.page == idx?'class=active':'' }"/>><a href="list${pageMaker.makeSearch(idx)}">${idx }</a></li>
        </c:forEach>

        <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
          <li><a href="list${pageMaker.makeSearch(pageMaker.endPage+1)}">&raquo;</a></li>
        </c:if>

      </ul>
    </div>
  </section>
  <!-- 페이지네이션 END -->
  
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