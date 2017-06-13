<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  
  <head>
    <title>절대음감게임</title>
    
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.2.0.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/css/main.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


    <!-- Uncomment the following meta tag if you have issues rendering this page on an intranet site. -->    
    <!--  <meta http-equiv="X-UA-Compatible" content="IE=9"/> -->  
    <style type="text/css">
    hr{height:1px; background-color:#ccc; color:#ccc; border:none; }
    </style>
    
    <script type="text/javascript">
    window.AudioContext = window.AudioContext || window.webkitAudioContext;
    var requestId = 0;
    var elm;
    var playing = false;
    var audioContext = null;
    var isPlaying = false;
    var analyser = null;
    var mediaStreamSource = null;
    var noteCorrect = true;
    let ENERGY_LIMIT = 20000;
    let ZERO_CROSSING_LIMIT = 0.5;
    let FRAME_SIZE = 2048;
    //최소 이만큼 있어야 음정 체크가 가능한 변수  
    var MIN_SAMPLES = 0;  // will be initialized when AudioContext is created.
    var GOOD_ENOUGH_CORRELATION = 0.9; // this is the "bar" for how close a correlation needs to be

    var rafID = null;
    var buflen = 1024;
    var buf = new Float32Array( buflen );
    
    var timeArr=[], stateArr=[], channelArr=[], intervalArr=[], veloArr=[];
    var checkCnt = 0;
    var noteAc = "";
    var tick = 0.0016622340425532;
    var lyricsCnt = 0; // 가사 인덱스
    var random = 0;
    var noteVText = "";
    
    
    var correct = 0;
    var note;
    var count =1;
  //마이크 정보를 얻어오기 위해서 사용하는 함수  
    function getUserMedia(dictionary, callback) {
        try {
            navigator.getUserMedia = 
             navigator.getUserMedia ||
             navigator.webkitGetUserMedia ||
             navigator.mozGetUserMedia;
            navigator.getUserMedia(dictionary, callback, error);
        } catch (e) {
            alert('getUserMedia threw exception :' + e);
        }
    }


  

    function error() {
        alert('Stream generation failed.');
    }

    function init() {
       getUserMedia(
        {
               "audio": {
                   "mandatory": {
                       "googEchoCancellation": "false",
                       "googAutoGainControl": "false",
                       "googNoiseSuppression": "false",
                       "googHighpassFilter": "false"
                      },
                   "optional": []
               },
         }, gotStream);
    }

    //마이크 입력 스트림을 얻어와서 처리함
    function gotStream(stream) {
        // Create an AudioNode from the stream.
        mediaStreamSource = audioContext.createMediaStreamSource(stream);

        // Connect it to the destination.
        analyser = audioContext.createAnalyser();
        analyser.fftSize = 2048;
        // 얻어온 스트림을 analyaser로 보내서 fft시킴.
        mediaStreamSource.connect( analyser );
        // 마이크 입력에서 음정을 얻어오기 
        updatePitch();
    }

	
    function singAsong(){
    	    playing = true;
    	    updatePitch();
    	    document.getElementById("play").textContent = "소리 ㄱ";
    	    $("#play").attr("onclick","none");
    	   
    	    
    	    musicName();
    	    noteVText = divideNote(random);
      		calNote(divideNote(random));
      		 $("#answerCheck").html("<font color=orange style= 'font-size:30px;'> 3초이상 소리를 내세요 ! </font>");
    	    
    	}
    
    function musicName(){
		 
 		// 문제 낼 때 계이름 랜덤으로 내기	
       	var randomValue = Math.random();
   		var key = (randomValue * 7) +1;
   		
       	switch (parseInt(key)) {
   		case 1:
   			$("#musicNote").html("도");
   			random= 262;
   			break;
   			
   		case 2:
   			$("#musicNote").html("레");
   			random= 294;
   			break;
   			
           case 3:
           	$("#musicNote").html("미");
           	random= 330;
           	break;
           	
           case 4:
           	$("#musicNote").html("파");
           	random= 349;
           	break;
           	
           case 5:
           	$("#musicNote").html("솔");
           	random= 392;
           	break;
           	
           case 6:
           	$("#musicNote").html("라");
           	random= 440;
           	break;
           	
           case 7:
           	$("#musicNote").html("시");
           	random= 494;
           	break;
           	
   		default:
   			break;
   		}
 	 }

    
    //음정을 추출하는 함수  
    function updatePitch( time ) {
     
       var cycles = new Array;
       analyser.getFloatTimeDomainData( buf );
       var ac = autoCorrelate( buf, audioContext.sampleRate ); // 자기 상관 함수
       noteAc = divideNote(ac); //노래마이크에서부터 
       //console.log(noteAc);
       
       //내 음과 맞는지 체크
       /*
       var singNote = new Array();
       singNote[0] = "F4";
       singNote[1] = "C#4";
       singNote[2] = "D4";
       singNote[3] = "D#4";
       if(noteAc == singNote[0])
         console.log("good!");
       */
       
       if (!window.requestAnimationFrame)
        window.requestAnimationFrame = window.webkitRequestAnimationFrame;
       // 음정 체크를 중지시키기 위해서 사용
       if (playing)
         rafID = window.requestAnimationFrame( updatePitch );
    }     


    //자기 상관 함수  
    function autoCorrelate( buf, sampleRate ) {
        var SIZE = buf.length;
        var MAX_SAMPLES = Math.floor(SIZE/2);
        var best_offset = -1;
        var best_correlation = 0;
        var rms = 0;
        var foundGoodCorrelation = false;
        var correlations = new Array(MAX_SAMPLES);
        
        for (var i=0;i<SIZE;i++) {
           var val = buf[i];
           rms += val*val;
        }
        rms = Math.sqrt(rms/SIZE);
        if (rms<0.01) // not enough signal
        return -1;
        
        var avg = average(buf, FRAME_SIZE);
        
        var eng = short_time_energy(buf, FRAME_SIZE, avg);
        if(eng < ENERGY_LIMIT)
        {
         return -1;
        }
        
        var zcr = zero_crossing_rate(buf, SIZE);
        
        if(zcr > ZERO_CROSSING_LIMIT)
        {
         return -1;
        }
        
        var lastCorrelation=1;
        for (var offset = MIN_SAMPLES; offset < MAX_SAMPLES; offset++) {
          var correlation = 0;
          
          for (var i=0; i<MAX_SAMPLES; i++) {
            correlation += Math.abs((buf[i])-(buf[i+offset]));
          }
          correlation = 1 - (correlation/MAX_SAMPLES);
          correlations[offset] = correlation; // store it, for the tweaking we need to do below.
          if ((correlation>GOOD_ENOUGH_CORRELATION) && (correlation > lastCorrelation)) {
             foundGoodCorrelation = true;
             if (correlation > best_correlation) {          
          best_correlation = correlation;
          best_offset = offset;
         }
       } else if (foundGoodCorrelation) {

        var shift = (correlations[best_offset + 1] - correlations[best_offset - 1])/ correlations[best_offset];
        return sampleRate / (best_offset + (8 * shift));
       }
       lastCorrelation = correlation;
      }
      if (best_correlation > 0.01) {
       return sampleRate / best_offset;
      }
      return -1;
     }
     
    function average(buffer){
      var avg = 0;
      
      for(var i = 0;i<FRAME_SIZE;i++){
       avg += buffer[i];
      }
      
      avg /= FRAME_SIZE;
      return avg;
     }

    function short_time_energy(buffer, avg){
     var eng = 0;
     var tmp;
     for(var i=0;i<FRAME_SIZE;i++){
      tmp = buffer[i] - avg;
      eng += (tmp*tmp)/FRAME_SIZE;
     }
    }
     
    function zero_crossing_rate(buffer){
     var zcr = 0;
     for(var i = 0;i<FRAME_SIZE;i++){
      if((buffer[i]) * (buffer[i+1]) < 0)
       zcr++;
     }
     zcr /= FRAME_SIZE;
     return zcr;
    }
    
  //음정을 추출한 숫자를 맞는 범위의 글자로 바꿔주는 함수 
    function divideNote(ac){
     // C : 도 , D : 레, E : 미, F : 파, G : 솔, A : 라, B : 시 
     //2옥타브
     if(ac>=65 && ac<69) return "도"; 
     else if(ac>=69 && ac<73) return "도";//#
     else if(ac>=73 && ac<78) return "레";
     else if(ac>=78 && ac<82) return "레";//#
     else if(ac>=82 && ac<87) return "미";
     else if(ac>=87 && ac<92) return "파";
     else if(ac>=92 && ac<98) return "파";//#
     else if(ac>=98 && ac<104) return "솔";
     else if(ac>=104 && ac<110) return "솔";//#
     else if(ac>=110 && ac<117) return "라";
     else if(ac>=117 && ac<123) return "라";//#
     else if(ac>=123 && ac<131) return "시";
     //3옥타브
     else if(ac>=131 && ac<139) return "도";
     else if(ac>=139 && ac<147) return "도";
     else if(ac>=147 && ac<156) return "레";
     else if(ac>=156 && ac<165) return "레";
     else if(ac>=165 && ac<175) return "미";
     else if(ac>=175 && ac<185) return "파";
     else if(ac>=185 && ac<196) return "파";
     else if(ac>=196 && ac<208) return "솔";
     else if(ac>=208 && ac<220) return "솔";
     else if(ac>=220 && ac<233) return "라";
     else if(ac>=233 && ac<247) return "라";
     else if(ac>=247 && ac<262) return "시";
     //4옥타브
     else if(ac>=262 && ac<277) return "도";
     else if(ac>=277 && ac<294) return "도";
     else if(ac>=294 && ac<311) return "레";
     else if(ac>=311 && ac<330) return "레";
     else if(ac>=330 && ac<349) return "미";
     else if(ac>=349 && ac<370) return "파";
     else if(ac>=370 && ac<392) return "파";
     else if(ac>=392 && ac<415) return "솔";
     else if(ac>=415 && ac<440) return "솔";
     else if(ac>=440 && ac<466) return "라";
     else if(ac>=466 && ac<494) return "라";
     else if(ac>=494 && ac<523) return "시";
     //5옥타브
     else if(ac>=523 && ac<554) return "도";
     else if(ac>=554 && ac<587) return "도";
     else if(ac>=587 && ac<622) return "레";
     else if(ac>=622 && ac<659) return "레";
     else if(ac>=659 && ac<698) return "미";
     else if(ac>=698 && ac<740) return "파";
     else if(ac>=740 && ac<784) return "파";
     else if(ac>=784 && ac<831) return "솔";
     else if(ac>=831 && ac<880) return "솔";
     else if(ac>=880 && ac<932) return "라";
     else if(ac>=932 && ac<988) return "라";
     else if(ac>=988 && ac<1047) return "시";
     //6옥타브
     else if(ac>=1047 && ac<1109) return "도";
     else if(ac>=1109 && ac<1175) return "도";
     else if(ac>=1175 && ac<1245) return "레";
     else if(ac>=1245 && ac<1319) return "레";
     else if(ac>=1319 && ac<1397) return "미";
     else if(ac>=1397 && ac<1480) return "파";
     else if(ac>=1480 && ac<1568) return "파";
     else if(ac>=1568 && ac<1661) return "솔";
     else if(ac>=1661 && ac<1760) return "솔";
     else if(ac>=1760 && ac<1865) return "라";
     else if(ac>=1865 && ac<1976) return "라";
     else if(ac>=1976 && ac<2093) return "시";
    }
  
  
  
 	// handle multiple browsers for requestAnimationFrame()
    window.requestAFrame = (function () {
        return window.requestAnimationFrame ||
                window.webkitRequestAnimationFrame ||
                window.mozRequestAnimationFrame ||
                window.oRequestAnimationFrame ||
                // if all else fails, use setTimeout
                function (callback) {
                    return window.setTimeout(callback, 16); // shoot for 60 fps, 16 = 1000/60
                };
    })();

    window.cancelAFrame = (function () {
        return window.cancelAnimationFrame ||
                window.webkitCancelAnimationFrame ||
                window.mozCancelAnimationFrame ||
                window.oCancelAnimationFrame ||
                function (id) {
                    window.clearTimeout(id);
                };
    })();


    //마이크 입력을 받기 위해, plaing true로 바꾸고 마이크 입력을 받는 updatePitch를 실행함.
    function start() {
        if (playing == false)
         playing = true;
          updatePitch(); // 이거 주석 하면 안됨!
    }
    // 위에꺼랑 반대
    function stop() {
        if (playing)
         playing = false;
    }
    
       
  	//결과 페이지로
	function send(){		      
    	  console.log('클라이언트 요청');

			$("#correctinput").attr("value",correct)
	}
  	
  	
	 function check(){
	        if ($('#musicNote').html() == $('#userNote').html()) {
	          $("#answerCheck").html("<font color=green style= 'font-size:30px;'> 정확한 음정입니다! It's good! </font>");
	          console.log(correct);
	          if(correct >= count){
	        	  correct = count;
	        	  return;
	          }
	          correct++;
	          $('#correct').html("<font style= 'font-size:20px;'>맞춘 개수 :"+correct+"</font>");
	          $("#play").attr("onclick","none");
	          document.getElementById("play").textContent = "다음문제";
	          if(correct == 2){
	        	  document.getElementById("play").textContent = "결과보기";
	          }
	          clearTimeout(note);
	        } else{
	          $("#answerCheck").html("<font color=red style= 'font-size:30px; margin-bottom:50px;'> 음정이 정확하지 않습니다.</font>");
	          setTimeout("check()", 300);
	          //$("#play").attr("onclick","none");
	          //document.getElementById("play").textContent = "다음문제";
	        }
	      }
  	
	function calNote(noteVText){// 현재 음 계산하는 아이.
		
		   console.log("noteVText : " + noteVText);
		   console.log("noteAc : " + noteAc);
		   if( (noteAc == noteVText) && (noteAc !== undefined) && (noteVText !== undefined) ){
		      console.log("very good!");
		      noteCorrect = true;
		   }
		   else{
		      noteCorrect = false;
		   }
	   	 	 //if( (noteAc !== undefined) && (noteVText !== undefined))
	   		 // console.log("note : " + noteAc);
	   	 	if((noteAc !== undefined) && (noteVText !== undefined)){
	   	 		check();
	   	 	} 
	   	
		   note = setTimeout("calNote('"+noteVText+"')", 1000);
		   
		   $("#userNote").html(noteAc);
		   updatePitch();
		   
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
    

    
    <h1 style="margin: 30px;" id='quizNum'> 1번 문제 !</h1>
    <span id="musicNote" style="font-size: 50px;"></span>
    <div style="width: 500px; padding-left: 50px; padding-right: 20px;">
    <hr> 
    </div>
    <br>
    <span id="userNote" style="font-size: 50px;"></span>
    <input type="hidden" name="correct" id="correctinput" value=""> 
    <br>
    <span id="correct"><font style= 'font-size:20px;'>맞춘 개수 : 0</font></span>
    <br>
    <span id="answerCheck" style="margin: 30px;"></span>
    </center>
    
    <div>
    <button class="btn btn-primary" id="play" onclick="singAsong()"
    style="width: 20%; height:100px; margin: 50px; font-size: 50px;">준비</button>
    </div>  
    
 

   <script>
    $(document).ready(function(){
      var formObj= $("form[role='form']");
      
  	 audioContext = new AudioContext();
 	 init();
     
      	
      	$("#play").on("click", function() {
      		
      	 	  if(document.getElementById("play").innerHTML == "다음문제"){
      	 		count++;
      			$("#quizNum").html((count)+"번 문제 ! ");// 몇번째 문제
      			document.getElementById("play").textContent = "준비";
      			$("#answerCheck").html("");             // 정답체크 문장 비우기
      			playing = false;
      			$("#play").attr("onclick","singAsong()");
      			$("#musicNote").html(" ");
      			$("#userNote").html(" ");
  	            clearTimeout(note);
      		 }else if(document.getElementById("play").innerHTML == "결과보기"){
      			$("#musicNote").html(" ");
      			$("#userNote").html(" ");
      			self.location = "/game/ppgameResult"
      			}
      			


		});
  }); //END ready

  </script>
  </body>
</html>
