<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<script src="../../resources/js/jquery.min.js"></script>
<style>
button{
  border: none;
  background-color: #fff;
}

#buttonimg{
  width: 30px;
  height: 30px;
  background-color: transparent;
  border: none;
}

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
<script type="text/javascript">
  var oAudio = null;
  var oAudio2 = null;
  var currentFile = "";
  function playAudio(index) {
      if (window.HTMLAudioElement) {
          try {
               oAudio = document.getElementById('audio'+index);
               oAudio2 = document.getElementById('audio2'+index);
               oAudio.volume = 0.5
               oAudio2.volume = 0.5
              var btn = document.getElementById('play'+index); 
              /* var audioURL = document.getElementById('audiofile'); */ 

              //Skip loading if current file hasn't changed.
/*               if (audioURL.value !== currentFile) {
                   oAudio.src = audioURL.value; 
                   currentFile = audioURL.value;                        
              } */

              // Tests the paused attribute and set state. 
              if (oAudio.paused) {
                  oAudio.play();
                  oAudio2.play();
                  btn.textContent = "Pause";
              }
              else {
                  oAudio.pause();
                  oAudio2.pause();
                  btn.textContent = "Play";
              }
          }
          catch (e) {
              // Fail silently but show in F12 developer tools console
               if(window.console && console.error("Error:" + e));
          }
      }
  }
  function pvolume() {
      oAudio.volume = Math.min(oAudio.volume + 0.1, 1);
      oAudio2.volume = Math.min(oAudio2.volume + 0.1, 1);
} 
function mvolume() {
    if(oAudio.volume > 0.1){
      oAudio.volume = Math.min(oAudio.volume - 0.1, 1);
      oAudio2.volume = Math.min(oAudio2.volume - 0.1, 1);
    }else{ 
    return;
    }
} 

  </script>
<title>노래방</title>


<!-- Theme style -->
<!--   <link href="../resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" /> -->
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="../../resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../../../resources/css/main.css?ver=2">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="../../../resources/css/bootstrap3-wysihtml5.min.css?ver=2">
<link rel="stylesheet" type="text/css" href="../../resources/css/sweetalert.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../../../resources/js/bootstrap3-wysihtml5.all.min.js?ver=2"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="../../../resources/js/bootstrap3-wysihtml5.all.min.js?ver=2"></script>
<script src="../../resources/js/sweetalert.min.js"></script>

</head>
<script type="text/javascript">
	$(document).ready(function() {

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
	});
</script>


<jsp:useBean id="now" class="java.util.Date" scope="request" />
<body>

  <jsp:include page="../include/header.jsp"></jsp:include>
  <!--해더END-->
  
    <section id="content" class='container'>
      <div class="row">
        <%@include file="side.jsp"%>
        <div class="col-lg-9">
          <!--content-->
          <section class="content-header">
            <c:choose>
              <c:when test="${login.id==id }">
                <h1 class="box-title" style="text-align: left; margin-top: 70px;"><img width="50px;" height="50px;" src="/resources/img/mysharing.png"><strong style="color: #e7708d;">  나의 공유글</strong></h1>
              </c:when>
              <c:when test="${following=='following' }">
                <h1 class="box-title" style="text-align: left; margin-top: 70px;"><img width="50px;" height="50px;" src="/resources/img/mysharing.png"><strong style="color: #e7708d;">  나의 공유글</strong></h1>
                <button id="unfollow" class="btn badge bg-red" onclick="removeFollow('${login.id}', '${id }')" style="float: right; font-size: 30px; margin-top: 20px;">
                  <img id="remove" src="/resources/img/unfollow.png" width="50px" height="50px"> 언팔로우
                </button>
              </c:when>
              <c:otherwise>
                <h1 class="box-title" style="text-align: left; margin-top: 70px;"><img width="50px;" height="50px;" src="/resources/img/mysharing.png"><strong style="color: #e7708d;">  나의 공유글</strong></h1>
                <button id="follow" class="btn badge bg-blue" onclick="addFollow('${login.id}', '${id }')" style="float: right; font-size: 30px; margin-top: 20px;">
                  <img id="add" src="/resources/img/follow.png" width="50px" height="50px"> 팔로우
                </button>
              </c:otherwise>
            </c:choose>
        
          </section>
          
          <div class="row" style="margin-top: 70px; font-size: 20px; ">
            <div class="col-md-12">
            
              <c:forEach items="${list}" var="sharing">

                <fmt:parseNumber value="${now.time/(1000)-(sharing.shregdate).time/(1000) }" integerOnly="true" var="secTime"></fmt:parseNumber>
                <fmt:parseNumber value="${now.time/(1000*60)-(sharing.shregdate).time/(1000*60) }" integerOnly="true" var="minTime"></fmt:parseNumber>
                  
                <div class="item" style="margin-left: 100px; margin-top: 100px; overflow: hidden; background-color: #f5f5f0;">
                
                  <div class="animate-box">
                  <div class="row">
                    <img src="/resources/img/clip.png" width="100px;" height="100px;" style="margin-top: 30px;">
                    <div class="row"></div>
                    </div>
                    <!-- 녹음파일 출력 -->
                    <div class="row" style="margin: 10px; ">               
                      <h3 style="margin-bottom: 30px;">
                      
                        <strong style="text-align: center;"><span style="color: #e7708d; "><b>${sharing.recordfilename}</b></span></strong>
                      </h3>
                    </div>
                    <div style="margin-bottom: 30px; text-align: center;">
                        <a id="play${stat.index}" onclick="playAudio(${stat.index});"><img id="buttonimg"src="../../../resources/img/play.png"></a>
                        <a id="pvolume${stat.index}" onclick="pvolume(${stat.index});"><img id="buttonimg" src="../../../resources/img/plus.png" ></a>
                        <a id="mvolume${stat.index}" onclick="mvolume(${stat.index});"><img id="buttonimg" src="../../../resources/img/remove.png"></a>
                    </div>
                    <audio controls name="media" id="audio${stat.index}" hidden="hidden">
                      <source src="../../../resources/music/woong1_5_오래된 노래.mp3" type="audio/mpeg">
                    </audio>
                    <audio controls name="media2" id="audio2${stat.index}" hidden="hidden">
                      <source src="../../../resources/record/woong1_5_오래된 노래.mp3" type="audio/mpeg">
                    </audio>


                    <img src="displayFile?fileName=/${sharing.eximgfilename}" alt="${pageContext.servletContext.contextPath }/resources/img/LOGOsingsing7.png" 
                    onclick="showReadModal('${sharing.shid}')" style="width: 500px; height: auto; margin-left: auto; margin-right: auto; display: block;">
                    <!-- data-toggle="modal"
                  data-target="#myModal2" -->
                  </div>


                  <div class="row">
                  <span style="float: right; margin-right: 30px; margin-top: 30px;" >
                    <img src="/resources/img/clock.png" width="20px;" height="20px;" > <c:choose>
                        <c:when test="${secTime<60 }">
                       ${secTime}초 전
                    </c:when>
                        <c:when test="${secTime<3600 }">
                      ${minTime}분 전
                    </c:when>
                        <c:otherwise>
                          <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${sharing.shregdate}" />
                        </c:otherwise>
                      </c:choose> 
                      </span>
                  </div>
                  <div class="row" style="margin: 50px; text-align: left;">

                      <span id="sharingId" style="text-align: left; font-size: 40px;"><b><i class="fa fa-user" style="margin-right: 10px;"></i><a href="/mypage/sharing/${sharing.id}">${sharing.id}</a></b></span>
                      <c:set var="target" value="${sharing.id}" />
                      <c:set var="id" value="${login.id }" />
                      <c:if test="${target eq id}">
                          <span style="float: right; margin-right: 80px; font-size: 100px;"><a onclick="showUpdateModal('${sharing.shid}')">
                          <img src="/resources/img/pencil.png" width="30px;" height="30px;"></a><a onclick="showDeleteModal('${sharing.shid}')"><img src="/resources/img/trash.png" width="30px;" height="30px;" style="margin-left: 10px;"></a></span>
                        <div class="row">
                        <b style="float: left; margin-top:30px;  font-size: 25px;">${sharing.shcontent}</b>
                        </div>
                        
                      </c:if>
                      <div class="row" style="margin-top: 30px;">
                     <img src="/resources/img/like.png" width="50px;" height="50px;"><b style="margin-left: 10px; color: #e7708d; font-size: 30px;">${sharing.likecnt}</b>
                        <span style="float: right; margin-right: 90px;"><img src="/resources/img/reply.png" width="50px;" height="50px;"><b style="margin-left: 10px; color: #e7708d; font-size: 30px;">${sharing.commentcnt}</b></span>
                        </div>
                  </div>

                </div>
                  

                <!-- <div class="row" style="margin: 10px;"><i class="fa fa-pencil-square-o">
              <i class="fa fa-trash-o"></div> -->
                            
                    
              </c:forEach>
               
            </div>
          </div>
        </div>
        
      </div>
  </section>

  <!-- 상세조회 -->
  <!-- read modal -->
  <div class="modal" id="readModal" data-backdrop="static">
    <div class="modal-dialog">
      <div class="modal-content" style="background-color: black;">

        <div class="modal-header" style="background-color: white;">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="closeButton">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <div class="modal-body" style="background-color: white;">
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
            <%--             <div class="btn-group">
              <h3>
                <button class="btn" type="button" style="background-color: #d6d6c2;">
                  <i class="fa fa-heart"><span id="readLikecnt">${sharing.likecnt}</span></i>
                </button>
                <button class="btn" type="button" style="background-color: #d6d6c2;">
                  <i class="fa fa-comment"><span id="readCommentcnt">${sharing.commentcnt}</span></i>
                </button>
                <button class="btn" type="button" style="background-color: #d6d6c2;">
                  <i class="fa fa-share"></i>
                </button>
              </h3>
            </div> --%>
          </div>
          <textarea class="form-control" id="readShcontent" disabled="disabled" autofocus="autofocus" rows="5" cols="50" style="resize: none;"></textarea>

        </div>

        <div class="modal-footer" style="background-color: white;">
          <div class="box-header with-border" style="background-color: #d6d6c2; margin: 2px;">
            <div class="row">
              <div class="pull-left">
                <input class="form-control input-lg" type="text" id="readReplyId" name="ccontent" style="background-color: white; width: 100%"> <input type="hidden" id="readShid" name="shid"> <input type="hidden" id="commentId" name="id" value="${login.id}">
              </div>
              <div class="row">
                <button type="button" id="commentAddbtn" class="btn btn-primary" onclick="addComment()">
                  <i class="fa fa-pencil"> </i>댓글입력
                </button>
              </div>
            </div>
          </div>
          <div id="comments" style="background-color: #d6d6c2; margin: 2px;"></div>
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
        <form role="form" action="../../sharing/myUpdate" method="post" enctype="multipart/form-data">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="updateCloseButton">
              <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title">글 수정</h4>
            <input type="hidden" id="updateShid" name="shid">
          </div>

          <div class="modal-body">
            <div class="animate-box">
              <img id="updateImage" src="" style="margin-left: auto; margin-right: auto; display: block; width: 100%;">
            </div>
            <div class="row">
              <h3>
                <i class="fa fa-user"></i> <span id="updateId"></span>
              </h3>
            </div>
            <textarea class="form-control" name="shcontent" id="updateShcontent" autofocus="autofocus" rows="5" cols="50" style="resize: none;">
									</textarea>

          </div>

          <div class="modal-footer">
            <div class="btn-group">
              <button type="submit" id="updateBtn" class="btn" style="background-color: #d6d6c2; color: black;">
                <i class="fa fa-pencil" style="color: black;"> </i>UPDATE
              </button>
              <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">CANCEL</button>
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
        <form role="form" action="../../sharing/myDelete" method="post" enctype="multipart/form-data">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="updateCloseButton">
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
            <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">
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
  <script type="text/javascript">
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
					+ "<i class=\"fa fa-user\">" + comment.id +"</i>"
					+ "</div>"
					+ "<div class=\"box-body\">"
					+ "<h3>"
					+ "<p style=\"text-align : left;\">" + comment.ccontent +"</p>"
					+ "</h3>"
					+ "</div>"
					+ "</div>";
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
				$("#readImage").attr("src", "displayFile?fileName=/" + array.eximgfilename);
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
				$(array).each(
					function() {
						str += "<div class=\"box-header with-border\" style=\"margin : 10px;\">"
							+ "<div class=\"pull-left\">"
							+ "<i class=\"fa fa-user\">" + this.id +"</i>"
							+ "</div>"
							+ "<div class=\"box-body\">"
							+ "<h3>"
							+ "<p style=\"text-align : left;\">" + this.ccontent +"</p>"
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
	
	
	function addFollow(sender, target) {
		$.ajax({
			type : 'post',
			url : '/mypage/addFollow',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				sender : sender,
				target : target
			}), 
			success : function(result) {
    	    		if (result === 'true') {
    	    			swal("팔로우 완료!", "", "success");
    					$("#follow").attr("id", "unfollow")
    					$("#unfollow").attr("class","btn badge bg-red")
    					$("#unfollow").attr("onclick", "removeFollow('"+sender+"','"+target+"')");
    					$("#add").attr("id", "remove")
    					$("#remove").attr("src", "/resources/img/add.png")
    					$("#unfollow").html("<img id='remove' src='/resources/img/unfollow.png' width='50px' height='50px'> 언팔로우") 
    	    		} else {
    	    			swal("이미 팔로우 한 유저입니다!", "", "error");
    	    		}
			}
		});
	}
	
   	function removeFollow(sender, target) {
		$.ajax({
			type : 'post',
			url : '/mypage/removeFollow',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				sender : sender,
				target : target
			}), 
			success : function(result) {
				swal("팔로우 삭제완료!", "", "success");
				
				$("#remove").attr("src", "/resources/img/remove.png")
				$("#unfollow").html("언팔로우 -") 
				$("#unfollow").attr("id", "follow")
				$("#follow").attr("class","btn badge bg-blue")
				$("#follow").attr("onclick","addFollow('"+sender+"','"+target+"')");
				
				$("#follow").html("<img id='add' src='/resources/img/follow.png' width='50px' height='50px'> 팔로우") 
			}
		});
	}  
	</script>




  <jsp:include page="../include/footer.jsp"></jsp:include>

</body>
</html>