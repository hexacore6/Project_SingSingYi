<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>종현이게임 스타트1</title>

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <script src="<%=application.getContextPath()%>/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/css/main.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
  $(document).ready(
      function() {
        $('#gameStart').on("click", function(evt) {
          self.location = "jhgame"
        });
         $('#ppgameStart').on("click", function(evt) {
          self.location = "ppgame"
        });
      })
</script>
    
</head>
<body>
     <!-- header -->
      <%@ include file="../include/header.jsp"%>
      
      <center>
      <p style="width: 30%; height:100px; margin: 70px; font-size: 50px;"></p>
      <button id='gameStart' class="btn btn-primary" style="width: 20%; height:100px; font-size: 30px; margin-bottom: 20px;"><b>종현이 게임 <br>START</b></button>
      <button id='ppgameStart' class="btn btn-danger" style="width: 20%; height:100px; font-size: 30px; margin-bottom: 20px;"><b>절대음감 게임 <br>START</b></button>
      </center>
</body>
</html>