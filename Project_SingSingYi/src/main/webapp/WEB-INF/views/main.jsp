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
<body>
	<!-- header -->
	<%@ include file="include/header.jsp" %>
	
	<section id="content" class="container">
        <!--내용시작-->
        <div class="row">
            <form>
                <!--검색부분-->
                <div class="col-lg-2">
                    <select>
                        <option>통합검색</option>
                        <option>가수</option>
                        <option>곡명</option>
                    </select>
                </div>
                <div class="col-lg-3">
                    <div class="input-group input-group-sm" style="width: 150px;">
                        <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-default "><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                </div>
            </form>
            <div class="col-lg-9"></div>
            <!--/검색부분-->
            <!--차트 순위-->
            <div class="box">
                <div class="box box-header"><h2 class="btn btn-danger" style="font-size: 40px;">BEST 3</h2></div>
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
        </div>
            <!--차트순위끝-->
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">전체 노래 리스트</h3> </div>
                    <!-- /.box-header -->
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                    <th>번호</th>
                                    <th>곡명</th>
                                    <th>가수</th>
                                    <th>앨범명</th>
                                    <th>부른 횟수</th>
                                    <th>담기/즉시부르기</th>
                                </tr>
                                <tr>
                                    <td>183</td>
                                    <td>맞지?</td>
                                    <td>씨쓰타</td>
                                    <td>ㅁㄴㅇㅁㅇㅁ</td>
                                    <td>123</td>
                                    <td>
                                        <button class="btn btn-primary" id="">담기</button>
                                        <button class="btn btn-primary" id="">즉시부르기</button>
                                    </td>
                                </tr>
                                <tr>
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
                                </tr>
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
    <%@include file="include/footer.jsp"%>
</body>
</html>