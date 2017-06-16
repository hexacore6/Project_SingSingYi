<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>씽씽이</title>
<link rel="stylesheet" type="text/css" href="/resources/css/sweetalert.css">
<script src="/resources/js/sweetalert.min.js"></script>
</head>
<body>
  <script type="text/javascript">
  	var msg = '${msg}'
  	if (msg == "fail") {
  		console.log('로그인실패');
  		//swal("로그인 정보가 일치하지 않습니다!", '다시 로그인해주세염',"error");
  		alert('로그인 실패');
  		self.location = "/member/login";
  		
  	} else {
  		self.location = "/";
  	}
  </script>
</body>
</html>