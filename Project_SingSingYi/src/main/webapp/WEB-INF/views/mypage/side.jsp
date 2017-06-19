<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

      <div class="col-lg-3">
        <!--탭-->
        <div class="box box-solid">
          <div class="box-header with-border">
            <h1 class="box-title"><b style="color: color: #e7708d;">마이페이지</b></h1>
          </div>
          <div class="box-body no-padding">
            <ul class="nav nav-pills nav-stacked">


              <c:choose>
                <c:when test="${login.id==id }"> 
                  <li><a href="/mypage/sharing/${id }"><b style="font-size: 20px; color: #20425E;" >나의 공유글</b></a></li>
                </c:when>
                <c:otherwise>
                  <li><a href="sharing"><b style="font-size: 20px; color: #20425E;">${id } 공유글</b></a></li>
                </c:otherwise>
                
              </c:choose>



              <c:if test="${login.id==id }">

                <li><a href="/mypage/coin"><b style="font-size: 20px; color: #20425E;">코인관리</b></a></li>
                <li><a href="/mypage/rank"><b style="font-size: 20px; color: #20425E;">랭킹관리</b></a></li>
                <li><a href="/mypage/favorite"><b style="font-size: 20px; color: #20425E;">애창곡</b> </a></li>
                <li><a href="/mypage/record"><b style="font-size: 20px; color: #20425E;">녹음저장소</b></a></li>
                <li><a href="/mypage/modify"><b style="font-size: 20px; color: #20425E;">비밀번호변경</b></a></li>
              </c:if>

            </ul>
          </div>
          <!-- /.box-body -->
        </div>
      </div>