<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/css/main.css">
    <!-- Bootstrap 3.3.4 -->
    
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="<%=application.getContextPath() %>/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="<%=application.getContextPath() %>/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    
    <!-- jQuery 2.1.4 -->

    <meta charset=utf-8" />
    <title>종현이 게임</title>
    <script src="/resources/js/jquery-3.2.0.min.js"></script>
    
</head>
<body>

    
     <jsp:include page="../include/header.jsp"></jsp:include>
     <section id="content">
     <embed name="midi" src=".././resources/music/onelove.mp3" autostart="true" loop="true" hidden="true" width="300" height="200" style="margin: 50px;"> 
     </embed>
     
     </section>
     
    <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>