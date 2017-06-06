<!-- 수정 form submit 와 update 컨트롤러 하기 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
#imageDrop{
	width: 100%;
	height: 25px;
	background-color: #00ffbf;
	
}

#updateImageDrop{
	width: 100%;
	height: 25px;
	background-color: #00ffbf;
	
}
.uploadedList{
	width: 100%;
	height: 100px;
	background-color: gray;
}
</style>

<script type="text/javascript">
	
	

	/* $(document).scroll(function() {
		var maxHeight = $(document).height();
		var currentScroll = $(window).scrollTop() + $(window).height();

		if (maxHeight <= currentScroll + 100) {
			
		}
	}) */

	//<![CDATA[
	/* var pageLoaded = 1; //현재 페이지

	$(window)
			.scroll(
					function() {
						if ($(window).scrollTop() == $(document).height()
								- $(window).height()) { */

	/* <div class="item">
	<div class="animate-box">
		<a href="../resources../resources/images/img_2.jpg"
				class="image-popup fh5co-board-img"><img
				src="../resources/images/img_2.jpg"
				alt="Free HTML5 Bootstrap template"></a>
		<div class="fh5co-desc">Veniam voluptatum voluptas tempora
			debitis harum totam vitae hic quos.</div>
	</div>
	</div> */

	/* $('#fh5co-board')
			.append(
					"<div id=\"fh5co-main\"><div class=\"container\"><div class=\"row\"><div class=\"item\">"
							+ "<div class=\"animate-box\">"
							+ "<a href=\"/resources/images/img_2.jpg\" class=\"image-popup fh5co-board-img\">"
							+ "<img src=\"../resources/images/img_2.jpg\" alt=\"Free HTML5 Bootstrap template\"></a>"
							+ "<div class=\"fh5co-desc\">Veniam voluptatum voluptas tempora debitis harum totam vitae hic quos.</div>"
							+ "</div></div></div></div></div>");
	}
	}); */
	//]]>
</script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Hydrogen &mdash; A free HTML5 Template by FREEHTML5.CO</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />


<!-- Google Webfonts -->
<!-- <link
	href='http://fonts.googleapis.com/css?family=Roboto:400,300,100,500'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'> -->

<!-- Animate.css -->
<link rel="stylesheet" href="../resources/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="../resources/css/icomoon.css">
<!-- Magnific Popup -->
<link rel="stylesheet" href="../resources/css/magnific-popup.css">
<!-- Salvattore -->
<link rel="stylesheet" href="../resources/css/salvattore.css">
<!-- Theme Style -->
<link rel="stylesheet" href="../resources/css/style.css">
<!-- Modernizr JS -->
<script src="../resources/js/modernizr-2.6.2.min.js"></script>
<!-- Theme style -->
    <link href="../resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="../resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
	


</head>

<body>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#closeButton").on("click", function() {
		$("#readId").empty();
		$("#readShcontent").empty();
		$("#readLikecnt").empty();
		$("#readCommentcnt").empty();
	});
	
	$("#updateCloseButton").on("click", function() {
		$("#updateId").empty();
		$("#updateShcontent").empty();
		$("#updateLikecnt").empty();
		$("#updateCommentcnt").empty();
	});
	
	/* var image = "<img src=\"displayFile?fileName=/${sharing.eximgfilename}\">"
	$("#albumImage").append(image); */
	/* $("#textAddbtn").on("click", function() {
		
		var shcontent = $("#newContentText").val();
		var eximgfilename = $("#imageName").val();
		$("#imageForm").submit();
		console.log(shcontent);
		console.log(eximgfilename);
		$.ajax({
			type : 'post',
			url : '/sharing/register/',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				id : "kosta111",
				rrid : 1,
				shcontent : shcontent,
				eximgfilename : eximgfilename
			}),
			success : function(result) {
				if(result == 'SUCCESS'){
					$('#myModal').modal('hide');
					alert("등록되었습니다.");
					
				}
			}
		});
	}); */
	
	
	
	
	
	/* $("#albumImage").on("click", function() {
		var sharingId = $("#sharingId").text();
		var sharingVal = $("#sharingVal").val();
		console.log(sharingId);
		console.log(sharingVal);
	});	 */
	
	$("#uploadImage").on("click", function() {
		$("#imageDrop").show("slow");
});  
	$("#updateUploadImage").on("click", function() {
		$("#updateImageDrop").show("slow");
});  
	
	/*
	 $("#imageDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});
	$("#imageDrop").on("drop", function(event) {
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		console.log(files.length);
		var file = files[0];
		console.log(file);
		
		
		var formData = new FormData();
		formData.append("file", file);
		
		$.ajax({
			url: '/sharing/uploadImage',
			data: formData,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function(data) {
				var str = "";
				var imageStr = "";
				var array = [];
				array = data.split("/");
				console.log(array[4]);
				console.log(checkImageType(data));
				
				if(checkImageType(data)){
					
					str = "<div><a href = 'displayFile?fileName=" + getImageLink(data) + "'>" 
							+ "<img src='displayFile?fileName=" + data + "'/>" 
							+ "</a><small data-src=" + data + ">X</small></div>";
					imageStr = "<span>" + data +"</span>";
					$(".uploadedList").show("slow");
					
				} else{
					alert("이미지파일이 아닙니다.");
				}
				if(files.length == 1){
					$(".uploadedList").append(str);
					$("#imageName").append(imageStr);
					console.log($("#imageName").text());
				}
				else{
					alert("이미지파일은 하나만 첨부할 수 있습니다.");
				}
				
				
			}
		});
	});
	
	$(".uploadedList").on("click", "small", function(event) {
		var that = $(this);
		
		$.ajax({
			url: "deleteFile",
			type: "post",
			data: {fileName:$(this).attr("data-src")},
			dataType: "text",
			success: function(result) {
				if(result == 'deleted'){
					that.parent("div").remove();
				}
				
			}
		})
		
	}) */
	
	/* function checkImageType(fileName) {
		var pattern = /jpg|gif|png|jpeg/i;
		return fileName.match(pattern);
	}
	function getOriginalName(fileName) {
		if(checkImageType(fileName)){
			return;
		}
		
		var idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);
		
	}
	
	function getImageLink(fileName) {
		if(!checkImageType(fileName)){
			return;
		}
		
		var front = fileName.substr(0,12);
		var end = fileName.substr(14);
		
		return front + end;
	} */
	
});
</script>

	<%@include file="../include/header.jsp"%>



	<div id="fh5co-main">
		<div class="container">
			<div class="row">
				<div id="fh5co-board" data-columns>
					<!-- write button - open to write modal -->
					<button type="button" class="btn btn-block btn-danger btn-lg"
						data-toggle="modal" data-target="#myModal">
						<i class="fa fa-pencil"></i>Sing Sing
					</button>

					<!-- write modal -->
					<div class="modal" id="myModal">
						<div class="modal-dialog">
							<div class="modal-content">
								<form role="form" action="register" method="post"
									enctype="multipart/form-data">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">새 글 작성</h4>
										<input type="hidden" name="id" value="kosta111"> <input
											type="hidden" name="rrid" value=1>
									</div>
									<div class="modal-body">
										<label for="message-text" class="control-label"></label>
										<textarea class="form-control" name="shcontent"
											placeholder="내용을 써주세요..." autofocus="autofocus" rows="5"
											cols="50"></textarea>
									</div>
									<div class="modal-footer">
										<div class="pull-left">
											<i class="fa fa-microphone"> </i> <i class="fa fa-camera"
												id="uploadImage"></i>
										</div>

										<button type="submit" id="textAddbtn" class="btn btn-primary">
											<i class="fa fa-pencil"> </i>Sing Sing
										</button>
										<!-- 이미지 업로드 공간 -->
										<div id="imageDrop" hidden>
											<input type="file" name="file">
										</div>
									</div>
								</form>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>

					<!-- /.modal -->

					<!-- read modal -->
					<div class="modal" id="readModal">
						<div class="modal-dialog">
							<div class="modal-content">

								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
											aria-label="Close" id="closeButton">
											<span aria-hidden="true">&times;</span>
										</button>
								</div>

								<div class="modal-body">
										<div class="animate-box">
											<img id="readImage" src="" style="margin-left: auto; margin-right: auto; display: block;">
											<!-- <img alt="그림이 없습니다." align="center" style="width: 100%;"
											src="../resources/images/twice-4th-mini-album-signal.jpg"> -->
										</div>
									<div class="row">
										<h3>
											<i class="fa fa-user"></i> <span id="readId"></span>
										</h3>
									</div>
									<div class="row">
										<span class="bg-red"><i class="fa fa-heart"> <span
												id="readLikecnt"> </span></i> <i class="fa fa-comment"> <span
												id="readCommentcnt"> </span></i> <i class="fa fa-share"></i></span> <label
											for="message-text" class="control-label"></label>
									</div>
									<textarea class="form-control" id="readShcontent"
										disabled="disabled" autofocus="autofocus" rows="5" cols="50"></textarea>

								</div>

								<div class="modal-footer"></div>
							</div>
							
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.read modal -->

		
					<!-- 수정하기 모달 -->
					<div class="modal" id="updateModal">
						<div class="modal-dialog">
							<div class="modal-content">
								<form role="form" action="update" method="post"
									enctype="multipart/form-data">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close" id="updateCloseButton">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">글 수정</h4>
									</div>

									<div class="modal-body">
										<div class="animate-box">
											<img id="updateImage" src=""
												style="margin-left: auto; margin-right: auto; display: block;">
										</div>
										<div class="row">
											<h3>
												<i class="fa fa-user"></i> <span id="updateId"></span>
											</h3>
										</div>
										<div class="row">
											<span class="bg-red"><i class="fa fa-heart"> <span
													id="updateLikecnt"> </span></i> <i class="fa fa-comment"> <span
													id="updateCommentcnt"> </span></i> <i class="fa fa-share"></i></span>
											<label for="message-text" class="control-label"></label>
										</div>
										<textarea class="form-control" id="updateShcontent"
											autofocus="autofocus" rows="5" cols="50">
									</textarea>

									</div>

									<div class="modal-footer">
										<div class="pull-left">
											<i class="fa fa-microphone"> </i> <i class="fa fa-camera"
												id="updateUploadImage"></i>
										</div>
										<div class="row">
											<button type="button" id="updateBtn" class="btn btn-primary">
												<i class="fa fa-pencil"> </i>UPDATE
											</button>
											<button type="button" class="btn btn-primary"
												data-dismiss="modal" aria-label="Close">
												<i class="fa fa-pencil"> </i>CANCEL
											</button>
										</div>
										<div id="updateImageDrop" hidden>
											<input type="file" name="file">
										</div>
									</div>
								</form>
							</div>

							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.update modal -->


					<c:forEach items="${list}" var="sharing">
						<div class="item">
							
							<div class="animate-box">
							
								<img
									src="displayFile?fileName=/${sharing.eximgfilename}"
									alt="${pageContext.servletContext.contextPath }/resources/img/LOGOsingsing7.png"
									onclick="showReadModal('${sharing.shid}')" style="margin-left: auto; margin-right: auto; display: block;">
								<!-- data-toggle="modal"
									data-target="#myModal2" -->
							</div>
							<div style="margin: 10px;">#트와이스#Knock Knock</div>
							<div style="margin: 10px;">
								<h3>

									<i class="fa fa-user"></i><span id="sharingId">${sharing.id}</span>
									<c:set var="target" value="${sharing.id}"/>
									<c:set var="id" value="kosta111"/>
									<c:if test="${target eq id}">
										<div style="text-align: right;">
											<i class="fa fa-pencil"
												onclick="showUpdateModal('${sharing.shid}')"></i><span
												id="sharingId"> </span> <i class="fa fa-trash-o"></i><span
												id="sharingId"> </span>
										</div>
									</c:if>

								</h3>

							</div>
							<!-- <div class="row" style="margin: 10px;"><i class="fa fa-pencil-square-o">
							<i class="fa fa-trash-o"></div> -->
							<div class="row" style="margin: 10px;">
								<span>${sharing.shcontent}</span>
							</div>
							<div class="row" style="margin: 10px;">
							<h3>
								<span class="bg-red"><i class="fa fa-heart"><span>
											${sharing.likecnt} </span></i> <i class="fa fa-comment"><span>
											${sharing.commentcnt} </span></i> <i class="fa fa-share"></i></span>
							</h3>
							</div>
						</div>
					</c:forEach>

				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript">
		function showReadModal(shid) {
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
					$("#readImage").attr("src", "displayFile?fileName=/" + array.eximgfilename);
					$("#readId").append(array.id);
					$("#readShcontent").append(array.shcontent);
					$("#readLikecnt").append(array.likecnt);
					$("#readCommentcnt").append(array.commentcnt);
					

				}
			});
			

		}
		
		function showUpdateModal(shid) {
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
					$("#updateModal").modal('show');
					var array = JSON.parse(result);
					$("#updateImage").attr("src", "displayFile?fileName=/" + array.eximgfilename);
					$("#updateId").append(array.id);
					$("#updateShcontent").append(array.shcontent);
					$("#updateLikecnt").append(array.likecnt);
					$("#updateCommentcnt").append(array.commentcnt);
				}
			});

		}
		
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
    
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="../resources/css/main.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->



	<%@include file="../include/footer.jsp"%>
</body>
</html>
