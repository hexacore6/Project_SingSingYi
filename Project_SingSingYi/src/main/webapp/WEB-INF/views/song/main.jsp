<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>
    <title>씽씽이</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/css/main.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body style="background-color: #f5f5f0;">
	<!-- header -->
	<%@ include file="../include/header.jsp" %>
	
	<section id="content" class="container">
        <!--내용시작-->
        <div class="row">
            <div class="col-lg-9"></div>
            <!--/검색부분-->
            <!--차트 순위-->
            <div class="box">
                <div class="box box-header"><h2 class="btn btn-danger" style="font-size: 40px;">BEST 3</h2></div>
            <c:forEach items="${bests }" var="best">
            <div class="col-lg-4">
                <div class="thumbnail"> <img src="${pageContext.servletContext.contextPath }/resources/img/${best.simgfilename}" alt="..." style="width:1000px;">
                    <div class="caption">
                        <h3>${best.stitle }</h3>
                        <p>${best.singer }</p>
                        <p>부른 횟수 : ${best.playcnt }회</p>
                        <!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>-->
                    </div>
                </div>
            </div>
            </c:forEach>
            <%-- <div class="col-lg-4">
                <div class="thumbnail"> <img src="${pageContext.servletContext.contextPath }/resources/img/1.jpg" alt="...">
                    <div class="caption">
                        <h3>맞지?</h3>
                        <p>키이이이이썸~</p>
                        <p>부른 횟수 : 10회</p>
                        <!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>-->
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="thumbnail"> <img src="${pageContext.servletContext.contextPath }/resources/img/1.jpg" alt="...">
                    <div class="caption">
                        <h3>맞지?</h3>
                        <p>키이이이이썸~</p>
                        <!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>-->
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="thumbnail"> <img src="${pageContext.servletContext.contextPath }/resources/img/1.jpg" alt="...">
                    <div class="caption">
                        <h3>맞지?</h3>
                        <p>키이이이이썸~</p>
                        <!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>-->
                    </div>
                </div>
            </div> --%>
        </div>
            <!--차트순위끝-->
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title btn btn-danger" style="font-size: 40px;">전체 노래 리스트</h3> </div>
                    <!-- /.box-header -->
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th style="width: 100px;text-align: center; font-size: 18px;">번호</th>
                                    <th style="width: 100px;text-align: center; font-size: 18px;">곡명</th>
                                    <th style="width: 100px;text-align: center; font-size: 18px;">가수</th>
                                    <th style="width: 100px;text-align: center; font-size: 18px;">부른 횟수</th>
                                    <th style="width: 100px;text-align: center; font-size: 18px;">담기/즉시부르기</th>
                                </tr>
                                <c:forEach items="${songs }" var="song">
                                <tr>
                                    <td style="width: 100px;text-align: center; font-size: 15px;">${song.sid }</td>
                                    <td style="width: 100px;text-align: center; font-size: 15px;">${song.stitle }</td>
                                    <td style="width: 100px;text-align: center; font-size: 15px;">${song.singer }</td>
                                    <td style="width: 100px;text-align: center; font-size: 15px;">${song.playcnt }</td>
                                    <td style="width: 100px;text-align: center; font-size: 15px;">
                                        <button class="btn btn-primary" id="">담기</button>
                                        <button class="btn btn-primary" id="" onclick="location.href='/song/sing?sid=${song.sid}'">즉시부르기</button>
                                    </td>
                                </tr>
                                </c:forEach>
                                <!-- <tr>
                                    <td style="width: 100px;text-align: center; font-size: 15px;">183</td>
                                    <td style="width: 100px;text-align: center; font-size: 15px;">맞지?</td>
                                    <td style="width: 100px;text-align: center; font-size: 15px;">씨쓰타</td>
                                    <td style="width: 100px;text-align: center; font-size: 15px;">123</td>
                                    <td style="width: 100px;text-align: center; font-size: 15px;">
                                        <button class="btn btn-primary" id="">담기</button>
                                        <button class="btn btn-primary" id="">즉시부르기</button>
                                    </td>
                                </tr> -->
                                <!--뿌릴쏘스 예제-->
                                <!-- <tr>
                                    <td>219</td>
                                    <td>Alexander Pierce</td>
                                    <td>11-7-2014</td>
                                    <td><span class="label label-warning">Pending</span></td>
                                    <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                                    <td>
                                        <button class="btn btn-primary" id="">담기</button>
                                        <button class="btn btn-primary" id="">즉시부르기</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>657</td>
                                    <td>Bob Doe</td>
                                    <td>11-7-2014</td>
                                    <td><span class="label label-primary">Approved</span></td>
                                    <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                                    <td>
                                        <button class="btn btn-primary" id="">담기</button>
                                        <button class="btn btn-primary" id="">즉시부르기</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>175</td>
                                    <td>Mike Doe</td>
                                    <td>11-7-2014</td>
                                    <td><span class="label label-danger">Denied</span></td>
                                    <td>Bacon ipsum dolor sit amet salami venison chicken flank fatback doner.</td>
                                    <td>
                                        <button class="btn btn-primary" id="">담기</button>
                                        <button class="btn btn-primary" id="">즉시부르기</button>
                                    </td>
                                </tr> -->
                            </tbody>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
    </section>
    <!--내용끝-->
    
    <!-- footer -->
    <%@include file="../include/footer.jsp"%>
</body>
</html>