<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
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
					self.location = "qnaRegister"
				})
			})
</script>

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
  <section class="content">
    <div class="row">
      <div class="col-md-12">
        <div class="box">
          <div class="box-header with-border">
            <table class="table table-bordered">
              <tr>
                <th style="width: 100px">글번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th style="width: 100px">작성날짜</th>
                <th>조회수</th>
              </tr>

              <c:forEach items="${list}" var="article">
                <tr>
                  <td>${article.aid }</td>
                  <td>
                    <a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)
                 }&aid=${article.aid}'> ${article.atitle }
                    </a>
                  </td>

                  <td>${article.id }</td>
                  <td>${article.aregdate }</td>
                  <td>
                    <span class="badge bg-red">${article.viewcnt }</span>
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

  <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>