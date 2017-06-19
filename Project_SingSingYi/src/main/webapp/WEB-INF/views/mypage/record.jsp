<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>

<head>
<style type="text/css">
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

table.type10 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
}
table.type10 thead th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #e7708d;
    margin: 20px 10px;
}
table.type10 tbody th {
    width: 150px;
    padding: 10px;
}
table.type10 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
}
table.type10 .even {
    background: #fdf3f5;
}

</style>

<title>노래방</title>
  <!-- 합쳐지고 최소화된 최신 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../../resources/css/main.css?ver=1">
  <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="../../../resources/css/bootstrap3-wysihtml5.min.css?ver=2">
  <link rel="stylesheet" type="text/css" href="../../resources/css/sweetalert.css">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="../../../resources/js/bootstrap3-wysihtml5.all.min.js?ver=2"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <script src="../../../resources/js/bootstrap3-wysihtml5.all.min.js?ver=2"></script>
  <script src="../../resources/js/sweetalert.min.js"></script>
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
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
  
  $("#closeButton").on("click", function() {
    $("#recordList").empty();
  });
});
</script>
    <jsp:include page="../include/header.jsp"></jsp:include>
    <section id="content" class='container'>
    <div class="row">
      <%@include file="side.jsp"%>
      <div class="col-lg-9" style="margin-top: 50px;">
        <!--content-->
        <div class="row">
          <div class="col-lg-12">
            <div class="box">
              <div class="box-header">
                <h1 class="box-title" style="text-align: left;">
                <img width="50px;" height="50px;" src="/resources/img/record1.png"><strong style="color: #e7708d;"> 녹음 저장소</strong>
              </h1>
                
                <!-- <script>
          		cmp.writePlayer();
          		</script>  -->
              
              </div>
              <!-- /.box-header C:/record/upload/123.mp3-->
              
              

              
              <div class="box-body no-padding">
                <table class="table table-striped type10" >
                
                   <thead>  
                    <tr>
                      <th style="width: 20px; text-align: center; font-size: 20px;">곡명</th>
                      <th style="width: 50px; text-align: center; font-size: 20px; ">아티스트</th>
                      <th style="width: 50px; text-align: center; font-size: 20px; ">재생 / 볼륨조절</th>
                      <th style="width: 50px; text-align: center; font-size: 20px; ">공유</th>                    
                      <th style="width: 5px; font-size: 20px;">삭제</th>
                    </tr>
                   </thead>
                    <tbody>                     
                      <c:forEach items="${list}" var="record" varStatus="stat">  
                      <tr class="even" id="trRecord${record.rrid}">
                        <%-- <td style="text-align: center">${((pageMaker.cri.page-1)*10)+(stat.index)}</td> --%>
                        <td style="text-align: center; font-size: 20px;"><b>${record.recordfilename}</b></td>
                        <td style="text-align: center;"><span class="badge bg-black" style="font-size: 20px;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${record.recordregdate}" /></span></td>
                        <td style="text-align: center; font-size: 20px;">
                        <button id="play${stat.index}" onclick="playAudio(${stat.index});" style="font-size: 20px;"><img id="buttonimg"src="../../../resources/img/play.png"></button>
                        <button id="pvolume${stat.index}" onclick="pvolume(${stat.index});" style="font-size: 20px;"><img id="buttonimg" src="../../../resources/img/plus.png" ></button>
                        <button id="mvolume${stat.index}" onclick="mvolume(${stat.index});"  style="font-size: 20px;" ><img id="buttonimg" src="../../../resources/img/remove.png"></button>
                          <audio controls name="media" id="audio${stat.index}" hidden="hidden">
                            <source src="../../../resources/music/${mrfilename}" type="audio/mpeg">
                            <!-- <source src="/resources/mp3/123.mp3" type="audio/mpeg"> -->
                          </audio>
                          <c:if test=""></c:if>
                          <audio controls name="media2" id="audio2${stat.index}" hidden="hidden">
                            <source src="../../../resources/record/${record.recordfilename}" type="audio/mpeg">
                            <!-- <source src="/resources/mp3/123.mp3" type="audio/mpeg"> -->
                          </audio>
                        </td>
                        <td style="width: 5px; text-align: center; ">
							<a onclick="writeModal('${record.recordfilename}');"><img alt="sharing" src="/resources/img/sharing.png" style="width: 40px; height: 40px;"></a>

                        </td>
                        <td style="width: 5px; text-align: center; ">
                          <a onclick="removeRecord(${record.rrid})"><img alt="remove" src="/resources/img/delete.png" style="width: 40px; height: 40px;"></a>
                        </td>
                      </tr>
                      </c:forEach>
                  </tbody>
                </table>
              </div>
              
              <!-- /.box-body -->
              <div class="box-footer clearfix text-center">
                <ul class="pagination  pagination-sm no-margin   ">
                  <c:if test="${pageMaker.prev }">
                    <li><a href="myRecord${pageMaker.makeQuery(pageMaker.startPage-1 )}">&laquo;</a></li>
                  </c:if>

                  <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
                  
                  <c:choose>
                    <c:when test="${pageMaker.cri.page==idx}">
                      <li class="active" ><a style="background-color:#e7708d; border-color:#e7708d; " href="coin${pageMaker.makeQuery(idx)}">${idx }</a></li>
                    </c:when>
                  <c:otherwise>
                      <li><a href="coin${pageMaker.makeQuery(idx)}">${idx }</a></li>
                  </c:otherwise>
                  </c:choose>
                 
                </c:forEach>


                  <c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
                    <li><a href="myRecord${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a>
                  </c:if>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </section>
    <!--내용끝-->
    
          <!-- 글 작성하기 모달 -->
          <!-- write modal -->
          <div class="modal" id="myModal">
            <div class="modal-dialog">
              <div class="modal-content">
                <form role="form" action="/sharing/register" method="post"
                  enctype="multipart/form-data">
                  <div class="modal-header">
                    <button type="button" class="close" id="closeButton" data-dismiss="modal"
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
                    <div class="pull-left" id="recordList" >
                    
                    </div>
                    

                    <button type="submit" id="textAddbtn" class="btn" style="background-color: #d6d6c2;">
                      <i class="fa fa-pencil"> </i>Sing Sing
                    </button>
                    <!-- MP3 업로드 공간 -->
                    <div id="imageDrop" hidden>
                    </div>
                    <div id="mp3Drop" hidden>
                      <input type="text" name="recordfilename" id="selected" hidden>
                      <input type="text" id="dataCheck" hidden>
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
    
  <!-- 녹음저장소 삭제 ajax 처리 -->
  <script type="text/javascript">
  function removeRecord(rrid){
    swal({
      title: "녹음파일을 삭제하시겠습니까?",
      text: "",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: "#DD6B55",
      confirmButtonText: "삭제",
      cancelButtonText: "취소",
      closeOnConfirm: false
    },
    function(){ 
          $.ajax({
            type : 'post',
            url : '/mypage/removeRecord',
            headers : {
              "Content-type" : "application/json",
              "X-HTTP-method-Override" : "POST"
            },
            dataType : 'text',
            data : JSON.stringify({
              rrid : rrid
            }),
            success : function(result){
              $("#trRecord"+rrid).remove();
              swal("녹음파일 삭제 완료!", "", "success");
            }   
      });
  });
  }
  
  function writeModal (recordfilename){
	  swal("녹음파일 선택 완료!", "", "success");
	  $("#myModal").modal('show');
	  $("#selected").attr("value", recordfilename);
	  $("#recordList").html("선택된 녹음파일 이름 : " + recordfilename);
	  
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
    <jsp:include page="../include/footer.jsp"></jsp:include>
</body>

</html>