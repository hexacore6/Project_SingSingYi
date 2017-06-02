<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>노래방</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../../resources/css/main.css?ver=2">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../../resources/css/bootstrap3-wysihtml5.min.css?ver=2">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="../../../resources/js/bootstrap3-wysihtml5.all.min.js?ver=2"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="../../../resources/js/bootstrap3-wysihtml5.all.min.js?ver=2"></script>
</head>
<jsp:useBean id="now" class="java.util.Date" scope="request" />
<body>

    <div class="row">
        <div class="col-lg-12">
            <div class='headerimg'>
                <!--좌표값수정-->
                <div class="row">
                    <div class="col-lg-3">
                    </div>
                    <div class="col-lg-3"></div>
                    <div class="col-lg-3">
                        <iframe></iframe>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3">
                        
                    </div>
                    <div class="col-lg-3"><a href="#"></a></div>
                    <div class="col-lg-3">
                    </div>
                </div>

        </div>
    </div>
    <!--해어디이미지-->
    <section id='header'>
        <!--해더스타트-->
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
    <section id="content">
        <div class="row">
            <div class="col-lg-3">
                <!--탭-->
                <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">마이페이지</h3>
            </div>
            <div class="box-body no-padding">
              <ul class="nav nav-pills nav-stacked">
                <li><a href="mySharing">나의글
                  <span class="label label-primary pull-right">12</span></a></li>
                <li><a href="myCoin">코인관리</a></li>
                <li><a href="#">내 랭킹</a></li>
                <li><a href="#">애창곡 <span class="label label-warning pull-right">65</span></a>
                </li>
                <li><a href="#">녹음저장소</a></li>
                <li><a href="#">회원정보수정</a></li>
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
            </div>
            <div class="col-lg-9">
                <!--content-->
                <section class="content-header">
                    <h1>나의 글</h1> </section>
                <div class="row">
                    <div class="col-md-12">
                        <!-- The time line -->
                        <ul class="timeline">
                            <!-- timeline time label -->

                            <!-- /.timeline-label -->
                            <!-- timeline item -->  
                            <c:forEach items="${list}" var="sharing">
                            
                            <fmt:parseNumber value="${now.time/(1000)-(sharing.shregdate).time/(1000) }" integerOnly="true" var="secTime"></fmt:parseNumber>
                            <fmt:parseNumber value="${now.time/(1000*60)-(sharing.shregdate).time/(1000*60) }" integerOnly="true" var="minTime"></fmt:parseNumber>
                            <li> <i class="fa fa-envelope bg-blue"></i>
                            <div class="timeline-item" id="time">
                            <c:choose>
                            <c:when test="${secTime<60 }">
                             <span class="time"><i class="fa fa-clock-o"></i> ${secTime}초 전</span>
                            </c:when>
                            <c:when test="${secTime<3600 }">
                             <span class="time"><i class="fa fa-clock-o"></i> ${minTime}분 전</span>
                            </c:when>
                            <c:otherwise>
                             <span class="time"><i class="fa fa-clock-o"></i> <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${sharing.shregdate}" /></span>
                            </c:otherwise>
                            </c:choose>
                                    <h3 class="timeline-header"><a href="#">댓글 수 : </a> ${sharing.commentcnt }</h3>
                                    <div class="timeline-body"> ${sharing.shcontent } </div>
                                    <div class="timeline-footer"> <a class="btn btn-primary btn-xs">Read more</a> <a class="btn btn-danger btn-xs" href="/mypage/removeSharing?shid=${sharing.shid }">Delete</a> </div>
                                </div>
                            </li>
                            
                            </c:forEach>
                            <!-- END timeline item -->
                            <!-- timeline item -->
                            <li> <i class="fa fa-user bg-aqua"></i>
                                <div class="timeline-item"> <span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>
                                    <h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request</h3> </div>
                            </li>
                            <!-- END timeline item -->
                            <!-- timeline item -->
                            <li> <i class="fa fa-comments bg-yellow"></i>
                                <div class="timeline-item"> <span class="time"><i class="fa fa-clock-o"></i> 27 mins ago</span>
                                    <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>
                                    <div class="timeline-body"> Take me to your leader! Switzerland is small and neutral! We are more like Germany, ambitious and misunderstood! </div>
                                    <div class="timeline-footer"> <a class="btn btn-warning btn-flat btn-xs">View comment</a> </div>
                                </div>
                            </li>
                            <!-- END timeline item -->
                            <!-- timeline time label -->
                            <li class="time-label"> <span class="bg-green">
                    3 Jan. 2014
                  </span> </li>
                            <!-- /.timeline-label -->
                            <!-- timeline item -->
                            <li> <i class="fa fa-camera bg-purple"></i>
                                <div class="timeline-item"> <span class="time"><i class="fa fa-clock-o"></i> 2 days ago</span>
                                    <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>
                                    <div class="timeline-body"> <img src="http://placehold.it/150x100" alt="..." class="margin"> <img src="http://placehold.it/150x100" alt="..." class="margin"> <img src="http://placehold.it/150x100" alt="..." class="margin"> <img src="http://placehold.it/150x100" alt="..." class="margin"> </div>
                                </div>
                            </li>
                            <!-- END timeline item -->
                            <!-- timeline item -->
                            <li> <i class="fa fa-video-camera bg-maroon"></i>
                                <div class="timeline-item"> <span class="time"><i class="fa fa-clock-o"></i> 5 days ago</span>
                                    <h3 class="timeline-header"><a href="#">Mr. Doe</a> shared a video</h3>
                                    <div class="timeline-body">
                                        <div class="embed-responsive embed-responsive-16by9">
                                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/tMWkeBIohBs" frameborder="0" allowfullscreen=""></iframe>
                                        </div>
                                    </div>
                                    <div class="timeline-footer"> <a href="#" class="btn btn-xs bg-maroon">See comments</a> </div>
                                </div>
                            </li>
                            <!-- END timeline item -->
                            <li> <i class="fa fa-clock-o bg-gray"></i> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--내용끝-->
    <section id="footer">
        <!--푸터시작-->
        <!--한글폰트-->
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
    

</html>