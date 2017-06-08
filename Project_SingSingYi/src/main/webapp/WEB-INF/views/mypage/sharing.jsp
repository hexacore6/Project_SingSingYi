<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script src="../resources/js/jquery.min.js"></script>
<style>
.reverse {
	background: Black;
	color: White;
}
</style>

<style>
.example-modal .modal {
	position: relative;
	top: auto;
	bottom: auto;
	right: auto;
	left: auto;
	display: block;
	z-index: 1;
}

.example-modal .modal {
	background: transparent !important;
}
</style>

<style type="text/css">
#imageDrop {
	width: 100%;
	height: 25px;
	background-color: #00ffbf;
}

#updateImageDrop {
	width: 100%;
	height: 25px;
	background-color: #00ffbf;
}

.uploadedList {
	width: 100%;
	height: 100px;
	background-color: gray;
}
</style>
<title>노래방</title>


<!-- Theme style -->
<!--   <link href="../resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" /> -->
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="../resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
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
<script type="text/javascript">
	function showReadModal(shid)

	{
		$.ajax({
			type : 'post',
			url : '/sharing/read',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				shid : shid,
			}),
			success : function(result) {
				$("#readModal").modal('show');
				var array = JSON.parse(result);
				$("#readImage").attr("src",
						"displayFile?fileName=/" + array.eximgfilename);
				$("#readId").append(array.id);
				$("#readShcontent").append(array.shcontent);

			}
		});
	}
</script>
<jsp:useBean id="now" class="java.util.Date" scope="request" />
<body>

    <jsp:include page="../include/header.jsp"></jsp:include>
    <!--해더END-->
    <section id="content" class='container'>
    <div class="row">
      <%@include file="side.jsp"%>
      <div class="col-lg-6">
        <!--content-->
        <section class="content-header"> <c:choose>
          <c:when test="${login.id==id }">
            <h1 style="float: left;">나의 글</h1>
          </c:when>
          <c:otherwise>
            <h1>${id }님의글</h1>
          </c:otherwise>
        </c:choose> </section>
        <div id="fh5co-main">
          <div id="fh5co-board" data-columns>
            <div class="row" style="margin-top: 70px;">
              <div class="col-md-12">
                <!-- The time line -->
                <!-- timeline time label -->

                <!-- /.timeline-label -->
                <!-- timeline item -->
                <c:forEach items="${list}" var="sharing">

                  <fmt:parseNumber value="${now.time/(1000)-(sharing.shregdate).time/(1000) }" integerOnly="true" var="secTime"></fmt:parseNumber>
                  <fmt:parseNumber value="${now.time/(1000*60)-(sharing.shregdate).time/(1000*60) }" integerOnly="true" var="minTime"></fmt:parseNumber>

                  <div class="item" style="margin-left: 100px; margin-top: 100px; width: 500px; overflow: hidden;">

                    <div class="animate-box" style="width: 500px;">

                      <img src="displayFile?fileName=/${sharing.eximgfilename}" alt="${pageContext.servletContext.contextPath }/resources/img/LOGOsingsing7.png" onclick="showReadModal('${sharing.shid}')" style="width: 500px; height: auto; margin-left: auto; margin-right: auto; display: block;">
                      <!-- data-toggle="modal"
                  data-target="#myModal2" -->
                    </div>
                    <div style="margin: 10px;">
                      <span class="time" style="float: right;"><i class="fa fa-clock-o"></i> <c:choose>
                          <c:when test="${secTime<60 }">
                       ${secTime}초 전
                    </c:when>
                          <c:when test="${secTime<3600 }">
                      ${minTime}분 전
                    </c:when>
                          <c:otherwise>
                            <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${sharing.shregdate}" />
                          </c:otherwise>
                        </c:choose> </span>
                    </div>
                    <div style="margin: 30px;">
                      <h3>

                        <span id="sharingId" style="float: left;"><i class="fa fa-user" style="margin-right: 10px;"></i>${sharing.id}</span>
                        <c:set var="target" value="${sharing.id}" />
                        <c:set var="id" value="${login.id }" />
                        <c:if test="${target eq id}">
                          <div style="text-align: right; float: right;">
                            <i class="fa fa-pencil" onclick="showUpdateModal('${sharing.shid}')"> </i><span id="sharingId"> </span> <i class="fa fa-trash-o"> </i><span id="sharingId"> </span>
                          </div>
                        </c:if>
                      </h3>
                    </div>

                    <!-- <div class="row" style="margin: 10px;"><i class="fa fa-pencil-square-o">
              <i class="fa fa-trash-o"></div> -->
                  </div>
                  <div class="row" style="margin: 10px;">
                    <span style="float: left; margin-left: 120px;">${sharing.shcontent}</span>
                  </div>
                </c:forEach>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </section>

  <!-- read modal -->
  <div class="modal" id="readModal" data-backdrop="static">
    <div class="modal-dialog">
      <div class="modal-content">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="closeButton">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <div class="modal-body">
          <div class="animate-box">
            <img id="readImage" src="" style="margin-left: auto; margin-right: auto; display: block; width: 100%">
            <!-- <img alt="그림이 없습니다." align="center" style="width: 100%;"
                      src="../resources/images/twice-4th-mini-album-signal.jpg"> -->
          </div>
          <div class="row">
            <h3>
              <i class="fa fa-user"></i> <span id="readId"></span>
            </h3>
          </div>
          <textarea class="form-control" id="readShcontent" disabled="disabled" autofocus="autofocus" rows="5" cols="50"></textarea>

        </div>

        <div class="modal-footer"></div>
      </div>

      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
  <!-- /.read modal -->
  <!--내용끝-->
  <jsp:include page="../include/footer.jsp"></jsp:include>
</html>