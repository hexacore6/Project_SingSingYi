<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>listPage</title>

</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>
<section class="content">
  <div class="row">
    <div class="col-md-12">
      <div class="box">
        <div class="box-header with-border">
         <table class="table table-bordered">
            <tr>
              <th style="width: 100px"> 글번호 </th>
              <th>제목</th>
              <th>작성자</th>
              <th style="width: 100px">작성날짜</th>
              <th>조회수</th>
            </tr>
            
            <c:forEach items="${list}" var="article">
              <tr>
               <td>${article.aid }</td>
               <td>
                <a
                 href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)
                 }&aid=${article.aid}'>
                            ${article.atitle }</a>
               </td>
               
               <td>${article.id }</td>
               <td>${article.aregdate }</td>
               <td><span class="badge bg-red">${article.viewcnt }</span></td>  
              </tr>
            
            </c:forEach> 
     </table>
    </div>
   </div>
 </div>
</div>

     <div class="text-center">
     <ul class="pagination">
      
      <c:if test="${pageMaker.prev }">
        <li><a href="listPage?page=${pageMaker.startPage-1}">&laquo;</a></li>
      </c:if>
      
      <c:forEach begin = "${pageMaker.startPage }"
                   end = "${pageMaker.endPage }" 
                   var = "idx">
        <li
          <c:out value="${pageMaker.cri.page == idx?'class=active':'' }"/>>
          <a href ="listPage?page=${idx}">${idx }</a>
        </li>
      </c:forEach>
      
      <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
        <li><a href="listPage?page=${pageMaker.endPage +1}">&raquo;</a></li>
      </c:if>
      
    </ul>
    </div>
</section>
  
  <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>