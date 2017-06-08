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
                    <tr>
                      <td>${((pageMaker.cri.page-1)*10)+(stat.index)}</td>
                      <td style="width: 20px">${favorite.stitle}</td>
                      <td>${favorite.singer}</td>
                      <td style="width: 5px">
                        <button class="btn badge bg-red">삭제</button>
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
  <jsp:include page="../include/footer.jsp"></jsp:include>
</body>

</html>