<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>종현이게임 스타트</title>

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <script src="<%=application.getContextPath()%>/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/css/main.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
</head>
<body>
     <!-- header -->
      <%@ include file="../include/header.jsp"%>
      <center>
      <h1 style="margin-top: 50px;">${login.id}님은 3개중 <font color="red">${correct }</font>개를  맞추었습니다.</h1><br>
      <c:if test="${correct == 3}">
      <h1>문제를 모두 맞추었으므로 보너스 코인 1개 충전!</h1><br>      
      </c:if>
      
     <div>
     <button class="btn btn-primary" id="start"
     style="width: 20%; height:100px; margin: 50px; font-size: 50px;">돌아가기</button>
     </div>  
      </center>
       
    <script>
    $(document).ready(function(){
        $("#start").on("click", function() {
         self.location = "start"
        	});
    });
  </script>
</body>
</html>