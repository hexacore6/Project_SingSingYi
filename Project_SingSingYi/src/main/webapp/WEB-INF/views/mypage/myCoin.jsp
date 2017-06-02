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
                    <div class="col-lg-3"> </div>
                    <div class="col-lg-3"></div>
                    <div class="col-lg-3">
                        <iframe></iframe>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3"></div>
                    <div class="col-lg-3 pull-left">
                        <a href="#"></a>
                    </div>
                    <div class="col-lg-3"></div>
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
                                <h3 class="box-title">마이페이지</h3> </div>
                            <div class="box-body no-padding">
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="mySharing">나의글
                  <span class="label label-primary pull-right">12</span></a></li>
                                    <li><a href="myCoin">코인관리</a></li>
                                    <li><a href="#">내 랭킹</a></li>
                                    <li><a href="#">애창곡 <span class="label label-warning pull-right">65</span></a> </li>
                                    <li><a href="#">녹음저장소</a></li>
                                    <li><a href="#">회원정보수정</a></li>
                                </ul>
                            </div>
                            <!-- /.box-body -->
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <!--content-->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">${myCoin.id }님이 보유하신 코인의 개수는 : ${myCoin.coincnt }개입니다.</h3> </div>
                                    <!-- /.box-header -->
                                    <div class="box-body">
                                        <table class="table table-bordered">
                                            <tbody>
                                                <tr>
                                                    <th style="width: 10px; text-align:center;">번호</th>
                                                    <th style="text-align:center;">종류</th>
                                                    <th style="text-align:center;">지급 및 소모 내용</th>
                                                    <th style="width: 40px; text-align:center;">날짜</th>
                                                </tr>
                                                <tr>
                                                    <th style="width: 10px; text-align:center;">${myCoinHistory.chid }</th>
                                                    <th style="text-align:center;">${myCoinHistory.chtype }</th>
                                                    <th style="text-align:center;">${myCoinHistory.chcontent }</th>
                                                    <th style="width: 100px; text-align:center;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${myCoinHistory.chdate }" /></th>
                                                </tr>
                                                <tr>
                                                    <td>2.</td>
                                                    <td>Clean database</td>
                                                    <td>
                                                        <div class="progress progress-xs">
                                                            <div class="progress-bar progress-bar-yellow" style="width: 70%"></div>
                                                        </div>
                                                    </td>
                                                    <td><span class="badge bg-yellow">70%</span></td>
                                                </tr>
                                                <tr>
                                                    <td>3.</td>
                                                    <td>Cron job running</td>
                                                    <td>
                                                        <div class="progress progress-xs progress-striped active">
                                                            <div class="progress-bar progress-bar-primary" style="width: 30%"></div>
                                                        </div>
                                                    </td>
                                                    <td><span class="badge bg-light-blue">30%</span></td>
                                                </tr>
                                                <tr>
                                                    <td>4.</td>
                                                    <td>Fix and squish bugs</td>
                                                    <td>
                                                        <div class="progress progress-xs progress-striped active">
                                                            <div class="progress-bar progress-bar-success" style="width: 90%"></div>
                                                        </div>
                                                    </td>
                                                    <td><span class="badge bg-green">90%</span></td>
                                                </tr>
                                            </tbody>
                                            
                                        </table>
                                    </div>
                                    <!-- /.box-body -->
                                    <div class="box-footer clearfix text-center">
                                        <ul class="pagination  pagination-sm no-margin   ">
                                            <li><a href="#">«</a></li>
                                            <li><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">»</a></li>
                                        </ul>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="btn btn-primary pull-right">코인충전</a> 
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
</body>

</html>