<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  
  <head>
    <title>종현이게임2</title>
    
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.2.0.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/css/main.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


    <!-- Uncomment the following meta tag if you have issues rendering this page on an intranet site. -->    
    <!--  <meta http-equiv="X-UA-Compatible" content="IE=9"/> -->  
    <script type="text/javascript">
        // Global variable to track current file name.
        var list = new Array();
        var count = 0;
            $.ajax({
                type: 'post'
                , url: 'http://localhost/game/jhgame' 
                , dataType: 'json'
                , success: function (data) {
                    if (data.length != 0) {
                         list[0] = data[0];
                         console.log(list[0].sfilename)
                         $("#audiofile").attr("value",list[0].sfilename)
                         list[1] = data[1];
                         list[2] = data[2];
                    }
                }
            });
        
        var currentFile = "";
        function playAudio() {
            // Check for audio element support.
            if (window.HTMLAudioElement) {
                try {
                    var oAudio = document.getElementById('myaudio');
                    var btn = document.getElementById('play'); 
                    var audioURL = document.getElementById('audiofile');

                    //Skip loading if current file hasn't changed.
                    if (audioURL.value !== currentFile) {
                    	
                    	oAudio.src = audioURL.value;
                        currentFile = audioURL.value;                       
                    }

                    // Tests the paused attribute and set state. 
                    if (oAudio.paused) {
                        oAudio.play();
                        btn.textContent = "다음문제";
                    }
                    else {
                        oAudio.pause();
                        btn.textContent = "재생";
                        $("#answerCheck").html("");
                        $("#quizNum").html((count+2)+"번 문제 ! ");
                        count++;
                        switch (count) {
						case 1:
							$("#audiofile").attr("value",list[1].sfilename)
							break;
						case 2:
							$("#audiofile").attr("value",list[2].sfilename)
							break;
						default:
							$("#audiofile").attr("value","")
							$("#myaudio").remove();
							$("#quizNum").html("게임 끝 !");
							btn.textContent = "END GAME";
							btn.className = "btn btn-warning";
							break;
						}
                        /*count값에 따른 노래 교체  */
                    }
                }
                catch (e) {
                    // Fail silently but show in F12 developer tools console
                     if(window.console && console.error("Error:" + e));
                }
            }
        }
             // Rewinds the audio file by 30 seconds.

        function rewindAudio() {
             // Check for audio element support.
            if (window.HTMLAudioElement) {
                try {
                    var oAudio = document.getElementById('myaudio');
                    oAudio.currentTime -= 30.0;
                }
                catch (e) {
                    // Fail silently but show in F12 developer tools console
                     if(window.console && console.error("Error:" + e));
                }
            }
        }

             // Fast forwards the audio file by 30 seconds.

        function forwardAudio() {

             // Check for audio element support.
            if (window.HTMLAudioElement) {
                try {
                    var oAudio = document.getElementById('myaudio');
                    oAudio.currentTime += 30.0;
                }
                catch (e) {
                    // Fail silently but show in F12 developer tools console
                     if(window.console && console.error("Error:" + e));
                }
            }
        }

             // Restart the audio file to the beginning.

        function restartAudio() {
             // Check for audio element support.
            if (window.HTMLAudioElement) {
                try {
                    var oAudio = document.getElementById('myaudio');
                    oAudio.currentTime = 0;
                }
                catch (e) {
                    // Fail silently but show in F12 developer tools console
                     if(window.console && console.error("Error:" + e));
               }
            }
        }
       
    </script>
  </head>
  
  <body>
  
       <!-- header -->
      <%@ include file="../include/header.jsp"%>
  
   
      
    <p>
      <input type="hidden" id="audiofile" size="80" value="" />
    </p>
    <audio id="myaudio">
    </audio>
    
    <center>
    <h1 style="margin-top: 30px;" id='quizNum'> 1번 문제 !</h1>
    <button class="btn btn-danger" id="play" onclick="playAudio();"
    style="width: 20%; height:100px; margin: 50px; font-size: 50px;"><b>재생</b></button>
    <br>
    <span id="correct"></span>
    <br>
    <input type="text" id="answer" name="answer" placeholder="노래 제목을 입력해주세요 !"
    style="width: 20%; height:40px; font-size: 20px;">
    <button class="btn btn-primary" id="insert"  style="height:40px; font-size: 20px; margin-bottom: 5px;">입력</button>
    <br>
    <span id="answerCheck"></span>
    </center>
    

   <script>
    $(document).ready(function(){
      var correct =0;
      var formObj= $("form[role='form']");
      console.log(formObj);
      
      $("#insert").click(function(event){
		check(count);
		
      })
      function check(data){
    	  if ($('#answer').val() == list[data].stitle) {
	  			$("#answerCheck").html("<font color=green style= 'font-size:30px;'> 딩동댕! 정답입니다.</font>");
	  			correct+=1;
	  			$('#answer').val("");
	  			$('#correct').html("<font style= 'font-size:20px;'>맞춘 개수 :"+correct+"</font>");
	  		} else if($('#answer').val() == "") {
	  			alert("정답을 입력해주세요.");
	  		} else{
	  			$("#answerCheck").html("<font color=red style= 'font-size:30px;'> 땡! 틀렸습니다.</font>");
	  			$('#answer').val("");
	  			
	  		}
      }
          
	}); //END ready

	</script>
  </body>
</html>
