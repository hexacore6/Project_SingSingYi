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
          <div class="col-lg-3">
            <a href="#"></a>
          </div>
          <div class="col-lg-3"></div>
        </div>
      </div>
    </div>
    <!--해어디이미지-->
    <section id='header' class='container'> <!--해더스타트-->
    <div class='headerbar'>
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
      <div class="col-lg-9" style="margin-top: 50px;">
        <!--content-->
        <div class="row">
          <div class="col-lg-1"></div>
          <div class="col-lg-10">
            <div class="box">
              <div class="box-header">
                <h3 class="box-title">녹음 저장소</h3>
              </div>
              <!-- /.box-header -->
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
                      <tr>
                        <td style="text-align: center">${((pageMaker.cri.page-1)*10)+(stat.index)}</td>
                        <td style="width: 20px; text-align: center;">${record.recordfilename }</td>
                        <td style="width: 5px; text-align: center;"><span class="badge bg-black"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${record.recordregdate}" /></span></td>
                        <td style="width: 5px; text-align: center;">
                          <button class="btn badge bg-blue">재생</button>
                        </td>
                        <td style="width: 5px; text-align: center;">
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
  </div>
  <!--푸터끝-->
</body>

</html>