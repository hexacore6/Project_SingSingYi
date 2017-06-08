
<!-- checklike 구현, 검색페이지 구현, 팔로우, 음악파일 첨부 -->
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
		self.location.href='/sharing/list';
	});
	
	$("#updateCloseButton").on("click", function() {
		$("#updateId").empty();
		$("#updateShcontent").empty();
		$("#updateLikecnt").empty();
		$("#updateCommentcnt").empty();
		self.location.href='/sharing/list';
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
	$("#uploadReplyImage").on("click", function() {
		$("#replyImageDrop").show("slow");
}); 
	
	
	
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
			<div class="form-group" style="width: 30%;">
					<select class="form-control">
						<option >유저이름</option>
						<option >노래이름</option>
						<option >가수이름</option>
					</select>
				<input type="text" class="form-control input-lg" placeholder="SEARCH">
			</div>
			
				<div id="fh5co-board" data-columns>
					<!-- write button - open to write modal -->
					<button type="button" class="btn btn-block btn-danger btn-lg"
						data-toggle="modal" data-target="#myModal" data-backdrop="static">
						<i class="fa fa-pencil"></i>Sing Sing
					</button>
					
					
					
					
					<!-- 글 작성하기 모달 -->
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
					<div class="modal" id="readModal" data-backdrop="static">
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
											<img id="readImage" src="" style="margin-left: auto; margin-right: auto; display: block; width: 100%">
											<!-- <img alt="그림이 없습니다." align="center" style="width: 100%;"
											src="../resources/images/twice-4th-mini-album-signal.jpg"> -->
										</div>
									<div class="row">
										<h3>
											<i class="fa fa-user"></i> <span id="readId"></span>
										</h3>
									</div>
									<div class="row">
										<div class="btn-group">
											<h3>
												<button class="btn btn-danger" type="button">
													<i class="fa fa-heart"><span id="readLikecnt">${sharing.likecnt}</span></i>
												</button>
												<button class="btn btn-danger" type="button">
													<i class="fa fa-comment"><span id="readCommentcnt">${sharing.commentcnt}</span></i>
												</button>
												<button class="btn btn-danger" type="button">
													<i class="fa fa-share"></i>
												</button>
											</h3>
										</div>
									</div>
									<textarea class="form-control" id="readShcontent"
										disabled="disabled" autofocus="autofocus" rows="5" cols="50"></textarea>

								</div>

								<div class="modal-footer">
									<div class="box-header with-border"
										style="background-color: red;">
										<div class="row">
												<div class="pull-left">
													<input class="form-control input-lg" type="text"
														id="readReplyId" name="ccontent" style="background-color: white;">
													<input type="hidden" id="readShid" name="shid">
													<input type="hidden" id="commentId" name="id" value="kosta111">
												</div>
												<div class="row">
												<button type="button" id="commentAddbtn"
															class="btn btn-primary" onclick="addComment()">
															<i class="fa fa-pencil"> </i>댓글입력
														</button>
											</div>
										</div>
									</div>
									<div class="box-body" id="comments">
									
										<!-- <div class="box-header with-border">
											<div class="row">
												<h3>
													<i class="fa fa-user"></i>
												</h3>
											</div>
										</div> -->
										
									</div>
								</div>
							</div>
							
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.read modal -->

		
					<!-- 글 수정하기 모달 -->
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
										<input type="hidden" id="updateShid" name="shid">
									</div>

									<div class="modal-body">
										<div class="animate-box">
											<img id="updateImage" src=""
												style="margin-left: auto; margin-right: auto; display: block; width: 100%;">
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
										<textarea class="form-control" name="shcontent" id="updateShcontent"
											autofocus="autofocus" rows="5" cols="50">
									</textarea>

									</div>

									<div class="modal-footer">
										<div class="row">
											<button type="submit" id="updateBtn" class="btn btn-primary">
												<i class="fa fa-pencil"> </i>UPDATE
											</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal" aria-label="Close">
												<i class="fa fa-pencil"> </i>CANCEL
											</button>
										</div>
									</div>
								</form>
							</div>

							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.update modal -->
					
					<!-- 글 삭제하기 모달 -->
					<div class="modal" id="deleteModal">
						<div class="modal-dialog">
							<div class="modal-content">
								<form role="form" action="delete" method="post"
									enctype="multipart/form-data">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close" id="updateCloseButton">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">글 삭제</h4>
										<input type="hidden" id="deleteShid" name="shid">
									</div>
									<div class="modal-body">
										<p>해당 글을 삭제하시겠습니까?</p>

									</div>

									<div class="modal-footer">
											<button type="submit" id="deleteBtn" class="btn btn-primary">
												<i class="fa fa-pencil"> </i>DELETE
											</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal" aria-label="Close">
												<i class="fa fa-trash"> </i>CANCEL
											</button>
									</div>
								</form>
							</div>

							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.update modal -->
					
					
					


					<c:forEach items="${list}" var="sharing" varStatus="stat">
						<div class="item" style="border-color: gray;">
							
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
									<c:set var="target" value="${sharing.id}" />
									<c:set var="id" value="kosta111" />
									<c:if test="${target eq id}">
										<div style="text-align: right;">
											<i class="fa fa-pencil"
												onclick="showUpdateModal('${sharing.shid}')"></i><span
												id="sharingId"> </span> <i class="fa fa-trash-o"
												onclick="showDeleteModal('${sharing.shid}')"></i><span
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
							
							<div class="btn-group">
							<h3>
								<button class="btn btn-danger" type="button" onclick="upLike('${sharing.shid}', '${sharing.likecnt}', '${sharing.id}', '${stat.index}')"><i class="fa fa-heart"><span id="likeCnt${stat.index}">${sharing.likecnt}</span></i></button>
								<button class="btn btn-danger" type="button" onclick="showReadModal('${sharing.shid}')"><i class="fa fa-comment"><span>${sharing.commentcnt}</span></i></button>
								<button class="btn btn-danger" type="button"><i class="fa fa-share"></i></button>
								<input type="hidden" id="buttonNum" value="${stat.index}">
							</h3>
							</div>				 
							
							</div>
						</div>
					</c:forEach>

				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript">
		function upLike(shid, likecnt, id, index) {
			var likecnt = likecnt;
			var one = 1;
			$.ajax({
				type : 'post',
				url : '/sharing/like',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					shid : shid,
					id : id
				}), 
				success : function(result) {
					var like = JSON.parse(result);
					console.log(like);
					if(like == false){
						//DB상에 좋아요 기록이 있을 경우
						var likeCnt = "#likeCnt" + index;
						console.log(likeCnt);
						var x =  document.getElementById("likeCnt" + index);
						$(likeCnt).empty();
						$(likeCnt).text(parseInt(likecnt));
					}
					else{
						//DB상에 좋아요 기록이 없을 경우
						console.log(likeCnt);
						var likeCnt = "#likeCnt" + index;
						var x =  document.getElementById("likeCnt" + index);
						$(likeCnt).empty();
						$(likeCnt).text(parseInt(likecnt) + parseInt(one));
					}
				}
			});
		}
	
		function addComment() {
			var shid = $("#readShid").val();
			var id = $("#commentId").val();
			var ccontent = $("#readReplyId").val();
			
			$.ajax({
				type : 'post',
				url : '/sharing/addComment',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					shid : shid,
					id : id,
					ccontent : ccontent
				}), 
				success : function(result) {
					var str = "";
					var comment = JSON.parse(result);
					str += "<div class=\"box-header with-border\">"
						+ "<div class=\"pull-left\">"
						+ "<i class=\"fa fa-user\">" + comment.id +"</i>"
						+ "</div>"
						+ "<div class=\"box-header with-border\">"
						+ "<div class=\"box-body\">"
						+ "<dl class=\"dl-horizontal\">"
						+ "<h3>"
						+ "<dt>" + comment.ccontent +"</dt>"
						+ "</h3>"
						+ "</dl>"
						+ "</div>"
						+ "</div>"
						+ "</div>";
					$("#comments").append(str);
				}
			});
		}
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
					$("#readShid").attr("value", array.shid);
					$("#readReplyId").attr("placeholder", array.id + "님에게 댓글을 달아주세요.");
					$("#readShcontent").append(array.shcontent);
					$("#readLikecnt").append(array.likecnt);
					$("#readCommentcnt").append(array.commentcnt);
					

				}
			});
			
			$.ajax({
				type : 'post',
				url : '/sharing/comment/list',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					shid : shid,
				}), 
				success : function(result) {
					var str = "";
					var array = JSON.parse(result);
					$(array).each(
						function() {
							console.log(this.id + "댓글 아이디");
							str += "<div class=\"box-header with-border\">"
								+ "<div class=\"pull-left\">"
								+ "<i class=\"fa fa-user\">" + this.id +"</i>"
								+ "</div>"
								+ "<div class=\"box-header with-border\">"
								+ "<div class=\"box-body\">"
								+ "<dl class=\"dl-horizontal\">"
								+ "<h3>"
								+ "<dt>" + this.ccontent +"</dt>"
								+ "</h3>"
								+ "</dl>"
								+ "</div>"
								+ "</div>"
								+ "</div>";
						});
					$("#comments").html(str);
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
					$("#updateShid").attr("value", array.shid);
					$("#updateImage").attr("src", "displayFile?fileName=/" + array.eximgfilename);
					$("#updateId").append(array.id);
					$("#updateShcontent").val(array.shcontent);
					$("#updateLikecnt").append(array.likecnt);
					$("#updateCommentcnt").append(array.commentcnt);
				}
			});
		}
		
		function showDeleteModal(shid) {
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
					$("#deleteModal").modal('show');
					var array = JSON.parse(result);
					$("#deleteShid").attr("value", array.shid);
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
