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
    <link rel="stylesheet" type="text/css" href="../../resources/css/sweetalert.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="../../resources/js/sweetalert.min.js"></script>
    <script src="../../resources/js/jquery.min.js?ver=1"></script>
  <style type="text/css">
    #content{
      height: 1500px;
    }   
    
    /* add default color for animation start  */
    /* toggle this class */
    
    .color-bg-start {
      background-color: salmon;
    }
    
    
    /* toggle class bg-animate-color */
    
    .bg-animate-color {
      animation: random-bg .5s linear infinite;
    }
    
    
    /* add animation to bg color  */
    
    @keyframes random-bg {
      from {
        filter: hue-rotate(0);
      }
      to {
        filter: hue-rotate(360deg);
      }
    }
    
    .fun-btn {
      /* change bg color to get different hues    */
      background-color: salmon;
      color: white;
      padding: 0.3em 0.5em;
      border: none;
      transition: all .3s ease;
      border-radius: 5px;
      letter-spacing: 2px;
      text-transform: uppercase;
      outline: none;
      align-self: center;
      cursor: pointer;
      font-weight: bold;
    }
    
    .fun-btn:hover {
      animation: random-bg .5s linear infinite, grow 1300ms ease infinite;
    }
    
    .start-fun {
      background-color: #fff !important;
      /* change color of button text when fun is started   */
      color: salmon !important;
    }
    
    /* pulsating effect on button */
    @keyframes grow {
      0% {
        transform: scale(1);
      }
      14% {
        transform: scale(1.3);
      }
      28% {
        transform: scale(1);
      }
      42% {
        transform: scale(1.3);
      }
      70% {
        transform: scale(1);
      }
    }
    
    .boxs:hover{
      border:3px solid #ffc0cb;
    }
    
    .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th{
      vertical-align: middle;
    }

  </style>
</head>

<body>
	<!-- header -->
	<%@ include file="../include/header.jsp" %>
	<div></div>
	<section id="content" class="container">
        <!--내용시작-->
        <div class="row">
            <div class="col-lg-9"></div>
            <!--/검색부분-->
            <!--차트 순위-->
            <div class="box">
                <div class="box box-header"><h2 class="btn btn-danger" style="font-size: 40px;">BEST 3</h2></div>
            <c:forEach items="${bests }" var="best" varStatus="stat">
            <div class="col-lg-4">
                <div class="thumbnail boxs">
                <a href="/song/sing?sid=${best.sid }">
                <img src="${pageContext.servletContext.contextPath }/resources/img/${best.simgfilename}" alt="..." style="height:340px">
                </a>
                
                
                
                    <div class="caption">
                        <c:if test="${stat.index + 1 == 1}">
                        <img src="${pageContext.servletContext.contextPath }/resources/img/gold.png" alt="..." style="height:100px; width: 100px;">
                        </c:if>
                        <c:if test="${stat.index + 1 == 2}">
                        <img src="${pageContext.servletContext.contextPath }/resources/img/silver.png" alt="..." style="height:100px; width: 100px;">
                        </c:if>
                        <c:if test="${stat.index + 1 == 3}">
                        <img src="${pageContext.servletContext.contextPath }/resources/img/bronze.png" alt="..." style="height:100px; width: 100px;">
                        </c:if>
                        
                        <h3><b>${best.stitle }</b></h3>
                        <p>${best.singer }</p>
                        <p>부른 횟수 : ${best.playcnt }회</p>
                        <!--<p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>-->
                    </div>
                </div>
            </div>
            </c:forEach>
           
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
                                    <th style="width: 100px;text-align: center; font-size: 18px;">순위</th>
                                    <th style="width: 100px;text-align: center; font-size: 18px;"></th>
                                    <th style="width: 100px;text-align: center; font-size: 18px;">곡명</th>
                                    <th style="width: 100px;text-align: center; font-size: 18px;">가수</th>
                                    <th style="width: 100px;text-align: center; font-size: 18px;">부른 횟수</th>
                                    <th style="width: 100px;text-align: center; font-size: 18px;">즉시부르기</th>
                                    <th style="width: 100px;text-align: center; font-size: 18px;">애창곡담기</th>
                                </tr>
                                <c:forEach items="${songs }" var="song" varStatus="stat">
                                <tr>
                                    <td style="width: 100px;text-align: center; font-size: 15px;">${stat.index + 1}</td>
                                    <td style="width: 100px;text-align: center; font-size: 15px;">
                                    <img src="${pageContext.servletContext.contextPath }/resources/img/${song.simgfilename}" 
                                    style="height: 50px; width: 50px; margin-right: 5px;"></td>
                                    <td style="width: 100px;text-align: center; font-size: 15px;"><b style="margin-top: 10px;">${song.stitle }</b></td>
                                    <td style="width: 100px;text-align: center; font-size: 15px;">${song.singer }</td>
                                    <td style="width: 100px;text-align: center; font-size: 15px;">${song.playcnt }</td>
                                    <td style="width: 100px;text-align: center; font-size: 15px;">
                                    <form role="form" method="post" action="/song/sing">
                                        <input type="hidden" name="sid" value="${song.sid}">
                                        <button class="fun-btn">즉시부르기</button>
                                    </form>
                                    </td>
                                    <td style="width: 100px;text-align: center; font-size: 15px;">
                                        <button class="btn fun-btn" onclick="addFavorite(${song.sid})" >담기</button>
                                    </td>
                                </tr>
                                </c:forEach>
                                
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
    
  <!-- 애창곡 담기 ajax 처리 -->
  <script type="text/javascript">
    function addFavorite(sid){
    	$.ajax({
    		type : 'post',
    		url : '/song/addFavorite',
    		headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				sid : sid
			}), 
    	success : function(result){
    		if (result === 'true') {
    			swal("애창곡 담기 완료!", "", "success");
    		} else {
    			swal("이미 담은 곡입니다!", "", "error");
    		}
    	}
    });
    }
    
    $('.fun-btn').on('click', function(event) {
    	  $(this).toggleClass('start-fun');
    	  var $page = $('.page');
    	  $page.toggleClass('color-bg-start')
    	    .toggleClass('bg-animate-color');
    	});
  </script>    
    
      <!-- jQuery -->
  
  <script src="../resources/js/jquery.easing.1.3.js"></script>
  <script src="../resources/js/bootstrap.min.js"></script>
  <script src="../resources/js/jquery.waypoints.min.js"></script>
  <script src="../resources/js/salvattore.min.js"></script>
  <!-- Main JS -->
  <script src="../resources/js/jquery.magnific-popup.min.js"></script>
  <script src="../resources/js/main.js"></script>
  <script src="../resources/dist/js/app.min.js" type="text/javascript"></script>
  <script src="../resources/dist/js/demo.js" type="text/javascript"></script>
    
    <!-- footer -->
    <%@include file="../include/footer.jsp"%>
  
</body>
</html>