<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 버튼 안먹히기 기능 하기 -->
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
#mp3Drop{
	width: 100%;
	height: 140px;
	background-color: #d6d6c2;;
	
}
#imageDrop{
	width: 100%;
	height: 25px;
	background-color: #d6d6c2;
	
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

</script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>씽씽이 SNS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />
<jsp:useBean id="now" class="java.util.Date" scope="request" />

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
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link href="../resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<script src="../../resources/js/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../resources/css/sweetalert.css">
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

	$("#uploadMp3").on("click", function() {
		if($("#imageFile").val() != ""){
			//이미지파일이 있는 경우
			swal("No!", "하나의 공유글에는 녹음파일 혹은 이미지파일 중 하나의 파일만 첨부하실 수 있습니다.", "warning")
		}
		else{
			//이미지파일이 없는 경우
			$("#mp3Drop").show("slow");	
		}
	});

	$("#uploadImage").on("click", function() {
		if($("#selected").val() != ""){
			//녹음파일이 있는 경우
			swal("No!", "하나의 공유글에는 녹음파일 혹은 이미지파일 중 하나의 파일만 첨부하실 수 있습니다.", "warning")
		}
		else{
			//녹음파일이 없는 경우
			$("#imageDrop").show("slow");	
		}
	});

});
</script>

	<%@include file="../include/header.jsp"%>



	<div id="fh5co-main" style="background-color: #f5f5f0;">
		<div class="container">
			<div class="row">
				<div class="row">
				<form role="form" method="post" action="searchInput">
					<div class="col-xs-2">
						<select class="form-control" name="searchType">
								<option value="user">유저이름</option>
								<option value="title">노래이름</option>
								<option value="content">내용</option>
						</select>
					</div>
					<!-- #d9534f -->
					<div class="col-xs-3">
						<input type="text" class="form-control" name="keywordInput"
							placeholder="SEARCH" style="margin: 4px;" >
					</div>
					<div class="col-xs-2">
						<button type="submit" class="btn btn-block btn-lg" id="searchBtn" style="background-color: #d9534f; color: white;" >
							<i class="fa fa-search" style="color: white;"></i>Search
						</button>
					</div>
					<!-- ddd2222222222222 -->
					<div class="col-xs-3">
						<!-- write button - open to write modal -->
						<button type="button" class="btn btn-block btn-lg" style="background-color: #d9534f; color: white;"
							data-toggle="modal" data-target="#myModal" data-backdrop="static">
							<i class="fa fa-pencil" style="color: white;"></i>Sing Sing
						</button>
					</div>
					</form>
					
				</div>

				<div id="fh5co-board" data-columns>
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
										<input type="hidden" name="id" value="${login.id}"><!--  <input
											type="hidden" name="rrid" value=1> -->
									</div>
									<div class="modal-body">
										<label for="message-text" class="control-label"></label>
										<textarea class="form-control" name="shcontent"
											placeholder="내용을 써주세요..." autofocus="autofocus" rows="5"
											cols="50" style="resize: none;"></textarea>
									</div>
									<div class="modal-footer">
										<div class="pull-left">
											<i class="fa fa-microphone" id="uploadMp3" onclick="getRecord('${login.id}')"></i> 
											<i class="fa fa-camera" id="uploadImage"></i>
										</div>

										<button type="submit" id="textAddbtn" class="btn" style="background-color: #d6d6c2;" onclick="writeAlert()">
											<i class="fa fa-pencil"> </i>Sing Sing
										</button>
										<!-- MP3 업로드 공간 -->
										<div id="mp3Drop" hidden>
											<input type="text" name="recordfilename" id="selected" hidden>
											<table class="table table-striped">
												<tbody id="appendRecord">
													<tr>
														<th style="text-align: center;">곡명</th>
														<th style="text-align: center;">녹음된 날짜</th>
														<th style="width: 10px; text-align: center;">선택</th>
													</tr>
												</tbody>
											</table>
											
											
										</div>
										<!-- 이미지 업로드 공간 -->
										<div id="imageDrop" hidden>
											<input type="file" name="file" id="imageFile">
										</div>
									</div>
								</form>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>

					<!-- /.modal -->
					
					<!-- 상세조회 -->
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
										
											<img id="readImage" src=""  alt="" style="margin-left: auto; margin-right: auto; display: block; width: 100%">
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
												<button class="btn" type="button" style="background-color: #d9534f;">
													<h4><i class="fa fa-heart"><span style="font-weight: bold" id="readLikecnt">${sharing.likecnt}</span></i></h4>
												</button>
												<button class="btn" type="button" style="background-color: #d9534f;">
													<h4><i class="fa fa-comment"><span style="font-weight: bold" id="readCommentcnt">${sharing.commentcnt}</span></i></h4>
												</button>
												<!-- <button class="btn" type="button" style="background-color: #d9534f;">
													<i class="fa fa-share"></i>
												</button> -->
											</h3>
										</div>
									</div>
									<textarea class="form-control" id="readShcontent"
										disabled="disabled" autofocus="autofocus" rows="5" cols="50" style="resize: none;"></textarea>

								</div>

								<div class="modal-footer">
									<div class="box-header with-border"
										style="background-color: #f5f5f0; margin: 2px;">
										<div class="row">
												<div class="pull-left">
													<input class="form-control input-lg" type="text"
														id="readReplyId" name="ccontent" style="background-color: white; width: 100%">
													<input type="hidden" id="readShid" name="shid">
													<input type="hidden" id="commentId" name="id" value="${login.id}">
												</div>
												<div class="row">
												<button type="button" id="commentAddbtn"
													class="btn" onclick="addComment()" style="background-color: #d9534f;">
													<h3>
													<i style="color: black;" class="fa fa-pencil"> </i><strong><span style="color: black;">댓글입력</span></strong>
													</h3>
												</button>
											</div>
										</div>
									</div>
									<div id="comments" style="background-color: #f5f5f0; margin: 2px;">
									
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
												<i class="fa fa-user"></i> <span id="updateId" style="font-weight: bold"></span>
											</h3>
										</div>
										<textarea class="form-control" name="shcontent" id="updateShcontent"
											autofocus="autofocus" rows="5" cols="50" style="resize: none;">
									</textarea>

									</div>

									<div class="modal-footer">
										<div class="btn-group">
											<button type="submit" id="updateBtn" class="btn" style="background-color: #d9534f; color: black;">
												<i class="fa fa-pencil" style="color: black;"> </i><span style="font-weight: bold">UPDATE</span>
											</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal" aria-label="Close"><span style="font-weight: bold">CANCEL</span>
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
										<div class="btn-group">
											<button type="submit" id="deleteBtn" class="btn btn-primary" style="background-color: #d9534f;">
												<i class="fa fa-trash"> </i>DELETE
											</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal" aria-label="Close">CANCEL
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
					
					
					<!-- 리스트 -->
					<c:forEach items="${list}" var="sharing" varStatus="stat">
						<div class="item" style="border: 1px solid #ebebe0; border-radius: 10px;">
							<fmt:parseNumber value="${now.time/(1000)-(sharing.shregdate).time/(1000) }" integerOnly="true" var="secTime"></fmt:parseNumber>
             				<fmt:parseNumber value="${now.time/(1000*60)-(sharing.shregdate).time/(1000*60) }" integerOnly="true" var="minTime"></fmt:parseNumber>
							
							<div class="animate-box" style="border-radius: 10px;">
							<c:set var="eximgfilename" value="${sharing.eximgfilename}"/>
							<c:if test="${eximgfilename ne null}">
								<img
									src="displayFile?fileName=/${sharing.eximgfilename}"
									alt=""
									onclick="showReadModal('${sharing.shid}')" style="margin-left: auto; margin-right: auto; display: block;">
							</c:if>
							</div>
							<c:set var="recordfilename" value="${sharing.recordfilename}"/>
							<c:if test="${recordfilename ne null}">
								<div style="margin: 10px;"><h3><strong><span style="color : #d9534f">${sharing.recordfilename}</span></strong></h3></div>
							</c:if>
							<div style="margin: 10px;">
								<span class="time" style="float: right;"><i
									class="fa fa-clock-o"></i> <c:choose>
										<c:when test="${secTime<60 }">${secTime}초 전</c:when>
										<c:when test="${secTime<3600 }">${minTime}분 전</c:when>
										<c:otherwise>
											<fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${sharing.shregdate}" />
										</c:otherwise>
									</c:choose> </span>
							</div>
							<div class="row" style="margin: 10px;">
							<span> </span>
							</div>
							<div style="margin: 10px;">
								<h3>
									<i class="fa fa-user"></i><strong><span id="sharingId">${sharing.id}</span></strong>
									<c:set var="target" value="${sharing.id}" />
									<c:set var="id" value="${login.id}" />
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
							<div class="row" style="margin: 10px;" onclick="showReadModal('${sharing.shid}')">
								<span>${sharing.shcontent}</span>
							</div>
							<div class="row" style="margin: 10px;">
							
							<div class="btn-group">
							<h3>
								<button class="btn" style="background-color: #d9534f;" type="button" onclick="upLike('${sharing.shid}', '${sharing.likecnt}', '${login.id}', '${stat.index}')"><h4><strong><i class="fa fa-heart" id="likeIcon"><span style="font-weight: bold" id="likeCnt${stat.index}">${sharing.likecnt}</span></i></strong></h4></button>
								<button class="btn" style="background-color: #d9534f;" type="button" onclick="showReadModal('${sharing.shid}')"><h4></strong><i class="fa fa-comment"><span style="font-weight: bold">${sharing.commentcnt}</span></i></strong></h4></button>
								<!-- <button class="btn" style="background-color: #d9534f;" type="button"><i class="fa fa-share"></i></button> -->
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
	function writeAlert() {
		swal("Good job!", "You clicked the button!", "success")
	};
	
	function selectRecord(recordfilename) {
		console.log(recordfilename);
		swal({
			  title: "해당 녹음파일을 첨부하시겠습니까?",
			  text: "녹음파일은 오직 하나만 첨부하실 수 있습니다.",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "YES!",
			  closeOnConfirm: false
			},
			function(){
			  	swal("녹음파일 첨부완료!", "선택하신 녹음파일이 첨부되었습니다.", "success");
			  	$("#selected").attr("value", recordfilename);
			  	$("#mp3Drop").hide("slow");
			});
	}

	function getRecord(id) {
		console.log(id);
		$.ajax({
			type : 'post',
			url : '/sharing/record',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				id : id,
			}),
			success : function(result) {
				var str = "";
				var array = JSON.parse(result);
				$(array).each(function() {
									str += "<tr>"
										+ "<td style=\"text-align: center;\">" + this.recordfilename + "</td>"
										+ "<td style=\"text-align: center;\">" 
										+ this.recordregdate
										+ "</td>"
										+ "<td style=\"text-align: center;\">"
										+ "<button type=\"button\" onclick=\"selectRecord('"+ this.recordfilename +"')\">선택</button>"
										+ "</td>"
										+ "</tr>";
								});
				
				$("#appendRecord").html(str); 
			}
		});
	}


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
				var sharing = JSON.parse(result);
				var likeCnt = "#likeCnt" + index;
				$(likeCnt).text((parseInt(sharing.likecnt)));
				if(sharing.likecnt > likecnt){
					iframeDocument.postMessage('2000:' + id, '*');
            	}
				else{
                return;
                
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
						str += "<div class=\"box-header with-border\" style=\"margin : 10px;\">"
								+ "<div class=\"pull-left\">"
								+ "<i class=\"fa fa-user\">"
								+ "<span style=\"font-weight: bold\">"
								+ comment.id
								+ "</span>"
								+ "</i>"
								+ "</div>"
								+ "<div class=\"box-body\">"
								+ "<h3>"
								+ "<p style=\"text-align : left;\">"
								+ comment.ccontent
								+ "</p>"
								+ "</h3>"
								+ "</div>" + "</div>";
						$("#comments").append(str);
						$("#readReplyId").val("");
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
				if(array.eximgfilename == null){
					$("#readImage").attr("hidden", "hidden");	
				}
				else{
					$("#readImage").attr("src", "displayFile?fileName=/" + array.eximgfilename);	
				}
				$("#readId").append(array.id);
				$("#readShid").attr("value", array.shid);
				$("#readReplyId").attr("placeholder", "댓글을 입력하세요!");
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
						$(array).each(function() {
											str += "<div class=\"box-header with-border\" style=\"margin : 10px;\">"
													+ "<div class=\"pull-left\">"
													+ "<i class=\"fa fa-user\">"
													+ "<span style=\"font-weight: bold\">"
													+ this.id
													+ "<span>"
													+ "</i>"
													+ "</div>"
													+ "<div style=\"float: right;\">"
													+ "<span style=\"font-weight: bold\">"
													+ this.cregdate
													+ "<span>"
													+ "</div>"
													+ "<div class=\"box-body\">"
													+ "<h3>"
													+ "<p style=\"text-align : left;\">"
													+ this.ccontent
													+ "</p>"
													+ "</h3>"
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
				if(array.eximgfilename == null){
					$("#updateImage").attr("hidden", "hidden");
				}
				else{
					$("#updateImage").attr("src",
							"displayFile?fileName=/" + array.eximgfilename);	
				}
				
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
