<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

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
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../../../resources/css/bootstrap3-wysihtml5.min.css?ver=4">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../../../resources/js/bootstrap3-wysihtml5.all.min.js?ver=4"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js?ver=4"></script>
<script src="../../../resources/js/bootstrap3-wysihtml5.all.min.js"></script>
<link rel="stylesheet" href="../../../resources/css/main.css">
<!--700px-->
<style>
</style>
</head>

<body>
 <jsp:include page="../include/header.jsp"></jsp:include>
  <section class="container" id="content" class='container'>
  <div class="row">
    <%@include file="side.jsp"%>
    <div class="col-lg-9">
      <!--content-->
      <%-- <h2>${rank.id }님의 랭킹은 ${rank.rank}위입니다.</h2> --%>
      <div class="box-header with-border" style="margin-top: 30px;">
        <h1 class="box-title" style="text-align: left; "><img width="50px;" height="50px;" src="/resources/img/rank.png"><strong style="color: #e7708d;">  랭킹 관리</strong></h1>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="box">
            <div class="box-header with-border">
              <h2 class="box-title pull-left" style="text-align: center; font-size: 20px;"><img width="50px;" height="50px;" src="/resources/img/myrank.png"><strong>
                      내 랭킹</strong></h2>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-striped type10">
                <thead>
                  <tr>
                    <th style="width: 100px; text-align: center; font-size: 20px;">랭킹</th>
                    <th style="text-align: center; font-size: 20px;">아이디</th>
                    <th style="text-align: center; font-size: 20px;">좋아요 개수</th>
                  </tr>
                </thead>
                  <c:forEach items="${myRankArea}" var="RankArea">
                    <tr class="even">
                      <td style="text-align: center; font-size: 18px;"><b>${RankArea.rank }</b></td>
                      <td style="text-align: center; font-size: 18px;"><b>${RankArea.id }</b></td>
                      <td style="text-align: center; font-size: 18px;""><b>${RankArea.rankpoint }</b></td>
                    </tr>
                  </c:forEach>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="box">
            <div class="box-header with-border">
              <h2 class="box-title pull-left" style="text-align: center; font-size: 20px;"><img width="50px;" height="50px;" src="/resources/img/toprank.png" ><strong>
                            상위 랭킹</strong></h2>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-striped type10">
                <thead>
                  <tr>
                    <th style="width: 100px; text-align: center; font-size: 18px">랭킹</th>
                    <th style="text-align: center; font-size: 18px;">아이디</th>
                    <th style="text-align: center; font-size: 18px;">좋아요 개수</th>
                  </tr>
                 </thead>
                  <c:forEach items="${top5List}" var="top5">
                    <tr class="even">
                      <td style="text-align: center; font-size: 18px;""><b>${top5.rank }</b></td>
                      <td style="text-align: center; font-size: 18px;""><b>${top5.id }</b></td>
                      <td style="text-align: center; font-size: 18px;""><b>${top5.rankpoint }</b></td>
                    </tr>
                  </c:forEach>
              </table>
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix text-center">
              <!--                                        <ul class="pagination  pagination-sm no-margin   ">
                                            <li><a href="#">«</a></li>
                                            <li><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">»</a></li>
                                        </ul>-->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </section>
  <jsp:include page="../include/footer.jsp"></jsp:include>
</body>

</html>