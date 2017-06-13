<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
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
      <h2>${rank.id }님의 랭킹은 ${rank.rank}위입니다.</h2>
      <div class="row">
        <div class="col-lg-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title pull-left" style="text-align: center; font-size: 20px;">${rank.id }님의 랭킹</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tbody>

                  <tr>
                    <th style="width: 100px; text-align: center; font-size: 20px;">랭킹</th>
                    <th style="text-align: center; font-size: 20px;">아이디</th>
                    <th style="text-align: center; font-size: 20px;">좋아요 개수</th>
                  </tr>
                  <c:forEach items="${myRankArea}" var="RankArea">
                    <tr>
                      <td style="text-align: center; font-size: 18px;">${RankArea.rank }</td>
                      <td style="text-align: center; font-size: 18px;">${RankArea.id }</td>
                      <td style="text-align: center; font-size: 18px;"">${RankArea.rankpoint }</td>
                    </tr>
                  </c:forEach>
                </tbody>
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
              <h3 class="box-title pull-left">상위랭킹</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table class="table table-bordered">
                <tbody>
                  <tr>
                    <th style="width: 100px; text-align: center; font-size: 18px;"">랭킹</th>
                    <th style="text-align: center; font-size: 18px;"">아이디</th>
                    <th style="text-align: center; font-size: 18px;"">좋아요 개수</th>
                  </tr>
                  <c:forEach items="${top5List}" var="top5">
                    <tr>
                      <td style="text-align: center; font-size: 18px;"">${top5.rank }</td>
                      <td style="text-align: center; font-size: 18px;"">${top5.id }</td>
                      <td style="text-align: center; font-size: 18px;"">${top5.rankpoint }</td>
                    </tr>
                  </c:forEach>
                </tbody>
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