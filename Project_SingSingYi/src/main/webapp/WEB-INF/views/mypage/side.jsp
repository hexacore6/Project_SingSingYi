<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
      <div class="col-lg-3">
        <!--탭-->
        <div class="box box-solid">
          <div class="box-header with-border">
            <h3 class="box-title">마이페이지</h3>
          </div>
          <div class="box-body no-padding">
            <ul class="nav nav-pills nav-stacked">


              <c:choose>
                <c:when test="${login.id==id }">
                  <li><a href="sharing">나의글</a></li>
                </c:when>
                <c:otherwise>
                  <li><a href="sharing">${id }님의 글</a></li>
                </c:otherwise>
              </c:choose>



              <c:if test="${login.id==id }">

                <li><a href="coin">코인관리</a></li>
                <li><a href="rank">내 랭킹</a></li>
                <li><a href="favorite">애창곡 </a></li>
                <li><a href="record">녹음저장소</a></li>
                <li><a href="modify">회원정보수정</a></li>
              </c:if>

            </ul>
          </div>
          <!-- /.box-body -->
        </div>
      </div>