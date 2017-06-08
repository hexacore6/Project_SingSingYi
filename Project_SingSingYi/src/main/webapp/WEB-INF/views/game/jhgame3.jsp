<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE>
<html>
<head>
<title>씽씽이</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<script src="<%=application.getContextPath()%>/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
#content {
	height: 100px;
}

#playlist, audio {
	width: 400px;
	padding: 0px;
}

.active a {
	color: #5DB0E6;
	text-decoration: none;
}

span a {
	color: #eeeedd;
	background: #333;
	padding: 5px;
	display: block;
	cursor: pointer
}

span a:hover {
	text-decoration: none;
}
</style>
<!-- <script type="text/javascript">
window.onload = function{
	$.ajax({
		
	})
}
	</script> -->
</head>

<body>
  <!-- header -->
  <%@ include file="../include/header.jsp"%>

  <section id="content container">
    <!--   <div class='embed-container'>
     <embed class='embed-container' name="midi" src=".././resources/music/onelove.mp3" autostart="true" loop="true" hidden="true" width="300" height="200" style="margin: 50px;"> 
     </embed>
     </div>
      -->

    <div class="embed-responsive embed-responsive-16by9 container" style="width: 400px; height: 300px;">

        <audio id="audio" preload="auto" tabindex="0" controls="" >
          <source type="audio/mp3" src=".././resources/music/onelove.mp3"">
        </audio> 
          <!-- <embed class='embed-container' name="midi" src=".././resources/music/onelove.mp3" autostart="false" loop="true" hidden="true" width="300" height="200" style="margin: 50px;">  -->


   
    <!-- <div id="playlist">
      <span class="active"><a href=".././resources/music/onelove.mp3">1번곡</a></span> <span class="active"><a href="C:\\ㅇㅂ노래\\onelove.mp3">2번곡</a></span>
    </div> -->
   </div>
  </section>
  <!--내용끝-->

  <!-- footer -->
  <%@include file="../include/footer.jsp"%>
</body>
</html>