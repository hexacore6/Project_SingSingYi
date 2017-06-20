<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>노래방</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
 href="${pageContext.servletContext.contextPath }/resources/css/main.css">
<link rel="stylesheet"
 href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
   <link rel="stylesheet" type="text/css" href="../../resources/css/sweetalert.css">
   <script src="../../resources/js/sweetalert.min.js"></script>
<script src="https://cdn.webrtc-experiment.com/RecordRTC.js"></script>
<script src="https://cdn.webrtc-experiment.com/gif-recorder.js"></script>
<script src="https://cdn.webrtc-experiment.com/getScreenId.js"></script>
<script src="https://cdn.webrtc-experiment.com/gumadapter.js"></script>
<script src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/resources/js/jquery-3.2.0.min.js"></script>
<style type="text/css">
#light {
   width: 140px;
   height: 140px;
}

.bg-greenary {
   background-color: #c4ff5e;
}

.btn-primary {
   color: #fff;
   background-color: #c4ff5e;
   border-color: #c4ff5e;
}

.btn-primary:focus, .btn-primary.focus {
   color: #fff;
   background-color: #c4ff5e;
   border-color: #c4ff5e;
   outline: 0;
}

.btn-primary:hover {
   color: #fff;
   background-color: #c4ff5e;
   border-color: #c4ff5e;
   outline: 0;
}

.btn-primary:active, .btn-primary.active, .open>.dropdown-toggle.btn-primary
   {
   color: #fff;
   background-color: #c4ff5e;
   border-color: #c4ff5e;
   outline: 0;
}

.btn-primary:active:hover, .btn-primary.active:hover, .open>.dropdown-toggle.btn-primary:hover,
   .btn-primary:active:focus, .btn-primary.active:focus, .open>.dropdown-toggle.btn-primary:focus,
   .btn-primary:active.focus, .btn-primary.active.focus, .open>.dropdown-toggle.btn-primary.focus
   {
   color: #fff;
   background-color: #c4ff5e;
   border-color: #c4ff5e;
   outline: 0;
}

.btn-primary:active, .btn-primary.active, .open>.dropdown-toggle.btn-primary
   {
   background-image: none;
   outline: 0;
}

.btn-primary.disabled:hover, .btn-primary[disabled]:hover, fieldset[disabled] .btn-primary:hover,
   .btn-primary.disabled:focus, .btn-primary[disabled]:focus, fieldset[disabled] .btn-primary:focus,
   .btn-primary.disabled.focus, .btn-primary[disabled].focus, fieldset[disabled] .btn-primary.focus
   {
   background-color: #c4ff5e;
   border-color: #c4ff5e;
   outline: 0;
}

.btn-primary .badge {
   color: #337ab7;
   background-color: #fff;
   outline: 0;
}

.btn-primary {
   border: 0;
   outline: 0;
}

*:focus {
   outline: none;
}

#playbutton, #recordbutton, #upload-to-server {
   width: 130px;
   height: 120px;
    border: none;
}

#playbutton {
   background-image: url("/resources/img/play.png");
   background-size: 100px, 2px;
   background-position: center;
   background-repeat: no-repeat;
   background-color: transparent;
}

#recordbutton {
   background-image: url("/resources/img/record.png");
   background-size: 100px, 2px;
   background-position: center;
   background-repeat: no-repeat;
   background-color: transparent;
}

#upload-to-server {
   background-image: url("/resources/img/upload.png");
   background-size: 100px, 2px;
   background-position: center;
   background-repeat: no-repeat;
   background-color: transparent;
}

.easy-btn {
   width: 130px;
   height: 120px;
   background-image: url("/resources/img/easy.png");
   background-size: 110px, 2px;
   background-position: center;
   background-repeat: no-repeat;
   background-color: transparent;
   border: none;
   
}

.normal-btn {
   width: 130px;
   height: 120px;
   background-image: url("/resources/img/normal.png");
   background-size: 110px, 2px;
   background-position: center;
   background-repeat: no-repeat;
   background-color: transparent;
   border: none;
}

.hard-btn {
   width: 130px;
   height: 120px;
   background-image: url("/resources/img/hard.png");
   background-size: 110px, 2px;
   background-position: center;
   background-repeat: no-repeat;
   background-color: transparent;
   border: none;
}

.savebutton {
   width: 130px;
   height: 120px;
   background-image: url("/resources/img/save.png");
   background-size: 110px, 2px;
   background-position: center;
   background-repeat: no-repeat;
   background-color: transparent;
   border: none;
}

#button2 {
   background-image: url("img/light done.png");
   width: 10px;
   height: 40px;
   background-size: 24px, 20px;
   background-position: center;
   background-repeat: no-repeat;
}

#content {
   height: 500px;
   <!--
   마지막
   체크하는
   부분
   -->
}

#body, #html {
   position: absolute;
   margin: 0;
   padding: 0;
   width: 100%;
   height: 100%;
   overflow: hidden;
}

canvas {
   /* position: absolute; */
   width: 1000px;
   height: 800px;
   background-color: rgba(0, 0, 0, 0.3);
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

audio {
  display: none;
  play: none;
}
</style>

</head>
<body onload="init();">
  <%@include file="../include/header.jsp"%>
  <section id="content" class="container">
    <!--내용시작-->
    <div class="row">
      <div class="col-lg-8" id="garaok" style="border-collapse: collapse; border: 2px solid; background-color: black;">
        <!--왼쪽-->
        <div class="music">
          <!--곡명-->
          <h1 id="title" style="text-align: center; color: #CCAC2B; font-weight: bold">곡명</h1>
        </div>
        
        <div class="music">
          <!--곡명-->
          <h2 id="singer" style="text-align:right; color: #CCAC2B; font-weight: bold" >가수명</h2>
        </div>
        <!-- 
        <div class="score">
         <h3 id="score"></h3>
        </div> -->
        <div class="lyrics">
          <h3 id="songText1" style="color: white;">가사 준비중</h3>
          <h3 id="songText2" style="color: white;">...</h3>
        </div>

        <div class="col-lg-3">
          <iframe width="700px" height="500px" src="https://192.168.0.74:3000/robot" style="border: none;"></iframe>
        </div>
      </div>

      <!-- 수정본  -->
      <div class="col-lg-4" style="border: 2px solid; text-align: left">
        <div class="music-controller">
        <div class="buttonss" style="margin-left: 60px; margin-top: 30px;">
          <div class="page" style="margin-top: 10px;">
            <button class="easy-btn" id="easy-btn" onclick="clickEasy();"></button>
          </div>
          <div>
            <button class="normal-btn" id="normal-btn" onclick="clickNormal();"></button>
            
            <button id="playbutton"  onclick="singAsong()"></button>
            <div class="experiment recordrtc" style="float: left">
            <button id="recordbutton" onclick="record()" hidden></button><!-- '${song.sfilename}')" hidden></button> -->
            <!-- Stop recording 후 보여지는 비디오 태그 -->
            <video hidden></video>
            </div>
            <!-- 
            <button id="upload-to-server"></button>
             -->   
         </div>
          <div>
            <button class="hard-btn" id="hard-btn" onclick="clickHard();"></button>
            <button class="savebutton" id="savebutton"></button>
          </div>
          </div>
          
          
          

          <div class="signalbar" style="padding-top: 50px; text-align: center;">
            <!--불륨조절-->
            <img src="/resources/img/nostart.png" id="light">
          </div>

          <!-- 수정본  -->
          <div class="musiclist">
            <!--음악리스트-->
            <div class="box" style="padding: 5px;">
              <div class="box-header">
                <h3 class="box-title" style="color: #e7708d; font-size: 30px;"><b>노래 리스트</b></h3>
              </div>
              <!-- /.box-header -->
              <div class="box-body no-padding">
                <table class="table table-striped type10">
                  <thead>
                    <tr>
                      <th style="width: 30%; text-align: center; font-size: 15px;">곡명</th>
                      <th style="width: 20%; text-align: center; font-size: 15px; ">아티스트</th>
                      <th style="width: 30%; text-align: center; font-size: 15px;">즉시부르기</th>
                    </tr>
                    </thead>
                    <c:forEach items="${list}" var="favorite" varStatus="stat">  
                    <tr class="even">
                      <td style="width: 15px; font-size: 15px; text-align: center;"><b>${favorite.stitle}</b></td>
                      <td style="font-size: 10px; text-align: center;"><b>${favorite.singer}</b></td>
                      <td style="width: 5px; text-align: center;">
                        <form role="form" method="post" action="/song/sing">
                         <input type="hidden" name="sid" value="${favorite.sid}">
                         <button><img src="/resources/img/nowsing.png" style="width: 50px; height: 50px;"> </button>
                         </form>
                      </td>
                    </tr>
                    </c:forEach>
                </table>
              </div>
              <!-- /.box-body -->
                          <div class="box-footer clearfix text-center">
              <ul class="pagination  pagination-sm no-margin   ">
                <c:if test="${pageMaker.prev }">
                  <li><a href="myFavorite${pageMaker.makeQuery(pageMaker.startPage-1 )}">&laquo;</a></li>
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
                  <li><a href="myFavorite${pageMaker.makeQuery(pageMaker.endPage + 1)}">&raquo;</a>
                </c:if>
              </ul>
            </div>
            </div>
          </div>


        </div>
      </div>
    </div>
    <!--/content-->
  </section>
  <!--내용끝-->



  <%@include file="../include/footer.jsp"%>


 <script>
    (function() {
        var params = {},
            r = /([^&=]+)=?([^&]*)/g;

        function d(s) {
            return decodeURIComponent(s.replace(/\+/g, ' '));
        }

        var match, search = window.location.search;
        while (match = r.exec(search.substring(1))) {
            params[d(match[1])] = d(match[2]);

            if(d(match[2]) === 'true' || d(match[2]) === 'false') {
                params[d(match[1])] = d(match[2]) === 'true' ? true : false;
            }
        }
        window.params = params;
    })();
</script>


 <script>

        var recordAudio = new Audio();
        
        //1 t
        function record(){//songFileName){
        	 
        
        	var recordingDIV = document.querySelector('.recordrtc');
            var recordingPlayer = recordingDIV.querySelector('video');
						//2 t
			
                var button = this;

                // 3 t
                if(recordPlaying == false) {
                	
                    button.disabled = true;
                    button.disableStateWaiting = true;
                    setTimeout(function() {
                        button.disabled = false;
                        button.disableStateWaiting = false;
                    }, 2 * 1000);

                    recordPlaying = true;

                    function stopStream() {
                        if(button.stream && button.stream.stop) {
                            button.stream.stop();
                            button.stream = null;
                            
                        }
                    }
                    
                  
                    if(button.recordRTC) {
                        if(button.recordRTC.length) {
                            button.recordRTC[0].stopRecording(function(url) {
                                if(!button.recordRTC[1]) {
                                    button.recordingEndedCallback(url);
                                    stopStream();

                                    saveToDiskOrOpenNewTab(button.recordRTC[0]);
                                    return;
                                }

                                button.recordRTC[1].stopRecording(function(url) {
                                    button.recordingEndedCallback(url);
                                    stopStream();
                                });
                            });
                        }
                        else {
                            button.recordRTC.stopRecording(function(url) {
                                button.recordingEndedCallback(url);
                                stopStream();

                                saveToDiskOrOpenNewTab(button.recordRTC);
                            });
                        }
                    }
                    
                    return;
                }
                //3 p

                button.disabled = true;
								// 4 t
                var commonConfig = {
                    onMediaCaptured: function(stream) {
                        button.stream = stream;
                        if(button.mediaCapturedCallback) {
                            button.mediaCapturedCallback();
                        }
                        recordPlaying = false;
                        button.disabled = false;
                    },
                    onMediaStopped: function() {
												recordPlaying = true;
												
                        if(!button.disableStateWaiting) {
                            button.disabled = false;
                        }
                    },
                    
                    onMediaCapturingFailed: function(error) {
                        if(error.name === 'PermissionDeniedError' && !!navigator.mozGetUserMedia) {
                            InstallTrigger.install({
                                'Foo': {
                                    URL: 'https://addons.mozilla.org/en-US/firefox/addon/enable-screen-capturing/',
                                    toString: function () {
                                        return this.URL;
                                    }
                                }
                            });
                        }
                        commonConfig.onMediaStopped();
                    }
                    
                };
								//4 p
                
                    captureAudio(commonConfig);
                    
								//5 t
                    button.mediaCapturedCallback = function() {
                        button.recordRTC = RecordRTC(button.stream, {
                            type: 'audio',
                            bufferSize: typeof params.bufferSize == 'undefined' ? 0 : parseInt(params.bufferSize),
                            sampleRate: typeof params.sampleRate == 'undefined' ? 44100 : parseInt(params.sampleRate),
                            leftChannel: params.leftChannel || false,
                            disableLogs: params.disableLogs || false,
                            recorderType: webrtcDetectedBrowser === 'edge' ? StereoAudioRecorder : null
                        });
                        
                        button.recordingEndedCallback = function(url) {
                        	var audio = new Audio();
                        	audio.src = url;
                            audio.controls = true;
                          
                            recordingPlayer.parentNode.appendChild(audio);

                            if(audio.paused) audio.play();

                            audio.onended = function() {
                                audio.pause();
                                playingMelody = false;  
                                audio.src = URL.createObjectURL(button.recordRTC.blob);
                            };
                        };

                        button.recordRTC.startRecording();
                    };
                    captureAudio(commonConfig);
//2 p
            function captureAudio(config) {
                captureUserMedia({audio: true}, function(audioStream) {
                    recordingPlayer.srcObject = audioStream;
                    recordingPlayer.play();

                    config.onMediaCaptured(audioStream);

                    audioStream.onended = function() {
                        config.onMediaStopped();
                    };
                }, function(error) {
                    config.onMediaCapturingFailed(error);
                });
            }

            function captureUserMedia(mediaConstraints, successCallback, errorCallback) {
                navigator.mediaDevices.getUserMedia(mediaConstraints).then(successCallback).catch(errorCallback);
            }
            
         // 서버 저장 시작
            function saveToDiskOrOpenNewTab(recordRTC) {
              
                    if(!recordRTC) return alert('No recording found.');
                    
                    recordRTC.save();//저장되는 것
                    this.disabled = true;
    
                    var button = this;
                    uploadToServer(recordRTC, function(progress, fileURL) {
                    	
                        if(progress === 'ended') {
                            button.disabled = false;
                            button.innerHTML = 'Click to download from server';
                         
                            document.getElementById('savebutton').onclick = function(){
                            	swal({
                            		  title: "파일확인 및 저장",
                            		  text: "녹음한 파일 저장 하시고 구경하세요~!",
                            		  type: "warning",
                            		  showCancelButton: true,
                            		  confirmButtonColor: "#DD6B55",
                            		  confirmButtonText: "넵넵 좋아유~!",
                            		  cancelButtonText: "괜찮아유~!",
                            		  closeOnConfirm: false,
                            		  closeOnCancel: false,
                            		  timer: 10000,
                            		},
                            		function(isConfirm){
                            		  if (isConfirm) {
                            			  window.open(fileURL);
                            		    //swal("Deleted!", "Your imaginary file has been deleted.", "success");
                            		  } else {
       
                            		    swal({
                            		 	   title: "괜찮아유~",
                            		 	   text: "그냥 불러봤어유~ :)",
                            		 	   timer: 2000,
                            		 	   showConfirmButton: false,
                            		 	   imageUrl: "/resources/img/wink.png"
                            		 	 });
                            		  }
                            		});
                            }
                            return;
                        }
                    	
                        button.innerHTML = progress;
                    });
            }
            
            var listOfFilesUploaded = [];
						
            function uploadToServer(recordRTC, callback) {
                var blob = recordRTC instanceof Blob ? recordRTC : recordRTC.blob;
                var fileType = blob.type.split('/')[0] || 'audio';
                var fileName = (Math.random() * 1000).toString().replace('.', '');//''; 
                
                fileName += '.' + (!!navigator.mozGetUserMedia ? 'ogg' : 'wav');

                // create FormData
                var formData = new FormData();
                formData.append(fileType + '-filename', fileName);
                formData.append(fileType + '-blob', blob);

                callback('Uploading ' + fileType + ' recording to server.');
								
                console.dir("formData : " + formData);
                
                makeXMLHttpRequest('https://webrtcweb.com/RecordRTC/', formData, function(progress) {
                    if (progress !== 'upload-ended') {
                        callback(progress);
                        return;
                    }

                    var initialURL = 'https://webrtcweb.com/RecordRTC/uploads/';

                    callback('ended', initialURL + fileName);
                    // to make sure we can delete as soon as visitor leaves
                });
            }
            
            function makeXMLHttpRequest(url, data, callback) {
                var request = new XMLHttpRequest();
                request.onreadystatechange = function() {
                    if (request.readyState == 4 && request.status == 200) {
                        callback('upload-ended');
                    }
                };

                request.upload.onloadstart = function() {
                    callback('Upload started...');
                };

                request.upload.onprogress = function(event) {
                    callback('Upload Progress ' + Math.round(event.loaded / event.total * 100) + "%");
                };

                request.upload.onload = function() {
                    callback('progress-about-to-end');
                };

                request.upload.onload = function() {
                    callback('progress-ended');
                };

                request.upload.onerror = function(error) {
                    callback('Failed to upload to server');
                    console.error('XMLHttpRequest failed', error);
                };

                request.upload.onabort = function(error) {
                    callback('Upload aborted.');
                    console.error('XMLHttpRequest aborted', error);
                };

                request.open('POST', url);
                request.send(data);
            }

            //서버 끝
            
        }
        // 1 p
        
        </script>




 <script type="text/javascript"> 
  window.AudioContext = window.AudioContext || window.webkitAudioContext;
  var level = 0;// 0 : easy, 1 : normal,   2 : hard
  var recordPlaying = true;
  var requestId = 0;
  var elm;
  var playing = false;
  var audioContext = null;
  var isPlaying = false;
  var analyser = null;
  var mediaStreamSource = null;
  var noteCorrect = true;
  var goodCount = 0;
  let
  ENERGY_LIMIT = 20000;
  let
  ZERO_CROSSING_LIMIT = 0.5;
  let
  FRAME_SIZE = 2048;
  //최소 이만큼 있어야 음정 체크가 가능한 변수  
  var MIN_SAMPLES = 0; // will be initialized when AudioContext is created.
  var GOOD_ENOUGH_CORRELATION = 0.9; // this is the "bar" for how close a correlation needs to be

  var rafID = null;
  var buflen = 1024;
  var buf = new Float32Array(buflen);

  var noteV = 440;
  var timeArr = [], stateArr = [], channelArr = [], intervalArr = [], veloArr = [];
  var lyricsTxtArr = [], lyricsTimeTxtArr = [];
  var checkCnt = 0;
  var noteAc = "";
  var tick = 0;
  const ilovedTick = 0.0016622340425532;
  const loveExceptMeTick = 0.0023320895522388;//0.0023320895522388;// 나만 안되는 연애 : 0.0023320895522388 사랑했나봐 : 0.0016622340425532;
  // tick = MPQN/1000000/PPQN
  //			= MSPM/BPM/1000000/PPQN
  //			= 60000000/BPM/1000000/PPQN
  // 나만 안되는 연애 : 67bpm, 사랑했나봐 : 94bpm
  var lyricsCnt = 0; // 가사 인덱스
  
  //녹음 관련 변수들
    
    var recordBuffers = [];
    var recording = false;
  
    var playingMelody = false;
    
  //마이크 정보를 얻어오기 위해서 사용하는 함수  
  function getUserMedia(dictionary, callback) {
   try {
    navigator.getUserMedia = navigator.getUserMedia
      || navigator.webkitGetUserMedia
      || navigator.mozGetUserMedia;
    navigator.getUserMedia(dictionary, callback, error);
   } catch (e) {
    alert('getUserMedia threw exception :' + e);
   }
  }

  //윈도우가 처음 load 될 때 audioContext에 객체 할당
  $(document).ready(function(){
   audioContext = new AudioContext();
   init();
   document.getElementById('title').innerHTML = '${song.stitle}';
   document.getElementById('singer').innerHTML = '${song.singer}';
   swal({
	   title: "코인이 소모됩니다!",
	   text: "I will close in 2 seconds.",
	   timer: 2000,
	   showConfirmButton: false,
	   imageUrl: "/resources/img/insert-coin.png"
	 });
  });
	
  //level-controller
	  function clickEasy(){
   level = 0;
   document.getElementById("easy-btn").style.backgroundImage = 'url("/resources/img/easy2.png")';
   document.getElementById("normal-btn").style.backgroundImage = 'url("/resources/img/normal.png")';
   document.getElementById("hard-btn").style.backgroundImage = 'url("/resources/img/hard.png")';

  }

  function clickNormal(){
	   level = 1;
	   document.getElementById("easy-btn").style.backgroundImage = 'url("/resources/img/easy.png")';
	   document.getElementById("normal-btn").style.backgroundImage = 'url("/resources/img/normal2.png")';
	   document.getElementById("hard-btn").style.backgroundImage = 'url("/resources/img/hard.png")';
	};
  
  	function clickHard(){
  		level = 2;
  	  //change text when when button is clicked
  		document.getElementById("easy-btn").style.backgroundImage = 'url("/resources/img/easy.png")';
  	   document.getElementById("normal-btn").style.backgroundImage = 'url("/resources/img/normal.png")';
  	   document.getElementById("hard-btn").style.backgroundImage = 'url("/resources/img/hard2.png")';
  	};
  	
  	
  function error() {
   alert('Stream generation failed.');
  }
  function init() {
	   getUserMedia({
	    "audio" : {
	     "mandatory" : {
	      "googEchoCancellation" : "false",
	      "googAutoGainControl" : "false",
	      "googNoiseSuppression" : "false",
	      "googHighpassFilter" : "false"
	     },
	     "optional" : []
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
	   mediaStreamSource.connect(analyser);
	   // 마이크 입력에서 음정을 얻어오기 
	   updatePitch();
	  }

	  //음정을 추출하는 함수  
	  function updatePitch(time) {
	   var cycles = new Array;
	   analyser.getFloatTimeDomainData(buf);
	   var ac = autoCorrelate(buf, audioContext.sampleRate); // 자기 상관 함수
	   noteAc = divideNote(ac);

	   if (!window.requestAnimationFrame)
	    window.requestAnimationFrame = window.webkitRequestAnimationFrame;
	   // 음정 체크를 중지시키기 위해서 사용
	   if (playing)
	    rafID = window.requestAnimationFrame(updatePitch);
	  }

	  //자기 상관 함수  
	  function autoCorrelate(buf, sampleRate) {
	   var SIZE = buf.length;
	   var MAX_SAMPLES = Math.floor(SIZE / 2);
	   var best_offset = -1;
	   var best_correlation = 0;
	   var rms = 0;
	   var foundGoodCorrelation = false;
	   var correlations = new Array(MAX_SAMPLES);

	   for (var i = 0; i < SIZE; i++) {
	    var val = buf[i];
	    rms += val * val;
	   }
	   rms = Math.sqrt(rms / SIZE);
	   if (rms < 0.01) // not enough signal
	    return -1;

	   var avg = average(buf, FRAME_SIZE);

	   var eng = short_time_energy(buf, FRAME_SIZE, avg);
	   if (eng < ENERGY_LIMIT) {
	    return -1;
	   }

	   var zcr = zero_crossing_rate(buf, SIZE);

	   if (zcr > ZERO_CROSSING_LIMIT) {
	    return -1;
	   }

	   var lastCorrelation = 1;
	   for (var offset = MIN_SAMPLES; offset < MAX_SAMPLES; offset++) {
	    var correlation = 0;

	    for (var i = 0; i < MAX_SAMPLES; i++) {
	     correlation += Math.abs((buf[i]) - (buf[i + offset]));
	    }
	    correlation = 1 - (correlation / MAX_SAMPLES);
	    correlations[offset] = correlation; // store it, for the tweaking we need to do below.
	    if ((correlation > GOOD_ENOUGH_CORRELATION)
	      && (correlation > lastCorrelation)) {
	     foundGoodCorrelation = true;
	     if (correlation > best_correlation) {
	      best_correlation = correlation;
	      best_offset = offset;
	     }
	    } else if (foundGoodCorrelation) {

	     var shift = (correlations[best_offset + 1] - correlations[best_offset - 1])
	       / correlations[best_offset];
	     return sampleRate / (best_offset + (8 * shift));
	    }
	    lastCorrelation = correlation;
	   }
	   if (best_correlation > 0.01) {
	    return sampleRate / best_offset;
	   }
	   return -1;
	  }

	  function average(buffer) {
	   var avg = 0;

	   for (var i = 0; i < FRAME_SIZE; i++) {
	    avg += buffer[i];
	   }

	   avg /= FRAME_SIZE;
	   return avg;
	  }

	  function short_time_energy(buffer, avg) {
	   var eng = 0;
	   var tmp;
	   for (var i = 0; i < FRAME_SIZE; i++) {
	    tmp = buffer[i] - avg;
	    eng += (tmp * tmp) / FRAME_SIZE;
	   }
	  }

	  function zero_crossing_rate(buffer) {
	   var zcr = 0;
	   for (var i = 0; i < FRAME_SIZE; i++) {
	    if ((buffer[i]) * (buffer[i + 1]) < 0)
	     zcr++;
	   }
	   zcr /= FRAME_SIZE;
	   return zcr;
	  }
	  
  //음정을 추출한 숫자를 맞는 범위의 글자로 바꿔주는 함수 
  function divideNote(ac) {
   // C : 도 , D : 레, E : 미, F : 파, G : 솔, A : 라, B : 시 
   //2옥타브
	  if (ac >= 65 && ac < 69)
		    return "C02";
		   else if (ac >= 69 && ac < 73)
		    return "C#2";
		   else if (ac >= 73 && ac < 78)
		    return "D02";
		   else if (ac >= 78 && ac < 82)
		    return "D#2";
		   else if (ac >= 82 && ac < 87)
		    return "E02";
		   else if (ac >= 87 && ac < 92)
		    return "F02";
		   else if (ac >= 92 && ac < 98)
		    return "F#2";
		   else if (ac >= 98 && ac < 104)
		    return "G02";
		   else if (ac >= 104 && ac < 110)
		    return "G#2";
		   else if (ac >= 110 && ac < 117)
		    return "A02";
		   else if (ac >= 117 && ac < 123)
		    return "A#2";
		   else if (ac >= 123 && ac < 131)
		    return "B02";
		   //3옥타브
		   else if (ac >= 131 && ac < 139)
		    return "C03";
		   else if (ac >= 139 && ac < 147)
		    return "C#3";
		   else if (ac >= 147 && ac < 156)
		    return "D03";
		   else if (ac >= 156 && ac < 165)
		    return "D#3";
		   else if (ac >= 165 && ac < 175)
		    return "E03";
		   else if (ac >= 175 && ac < 185)
		    return "F03";
		   else if (ac >= 185 && ac < 196)
		    return "F#3";
		   else if (ac >= 196 && ac < 208)
		    return "G03";
		   else if (ac >= 208 && ac < 220)
		    return "G#3";
		   else if (ac >= 220 && ac < 233)
		    return "A03";
		   else if (ac >= 233 && ac < 247)
		    return "A#3";
		   else if (ac >= 247 && ac < 262)
		    return "B03";
		   //4옥타브
		   else if (ac >= 262 && ac < 277)
		    return "C04";
		   else if (ac >= 277 && ac < 294)
		    return "C#4";
		   else if (ac >= 294 && ac < 311)
		    return "D04";
		   else if (ac >= 311 && ac < 330)
		    return "D#4";
		   else if (ac >= 330 && ac < 349)
		    return "E04";
		   else if (ac >= 349 && ac < 370)
		    return "F04";
		   else if (ac >= 370 && ac < 392)
		    return "F#4";
		   else if (ac >= 392 && ac < 415)
		    return "G04";
		   else if (ac >= 415 && ac < 440)
		    return "G#4";
		   else if (ac >= 440 && ac < 466)
		    return "A04";
		   else if (ac >= 466 && ac < 494)
		    return "A#4";
		   else if (ac >= 494 && ac < 523)
		    return "B04";
		   //5옥타브
		   else if (ac >= 523 && ac < 554)
		    return "C05";
		   else if (ac >= 554 && ac < 587)
		    return "C#5";
		   else if (ac >= 587 && ac < 622)
		    return "D05";
		   else if (ac >= 622 && ac < 659)
		    return "D#5";
		   else if (ac >= 659 && ac < 698)
		    return "E05";
		   else if (ac >= 698 && ac < 740)
		    return "F05";
		   else if (ac >= 740 && ac < 784)
		    return "F#5";
		   else if (ac >= 784 && ac < 831)
		    return "G05";
		   else if (ac >= 831 && ac < 880)
		    return "G#5";
		   else if (ac >= 880 && ac < 932)
		    return "A05";
		   else if (ac >= 932 && ac < 988)
		    return "A#5";
		   else if (ac >= 988 && ac < 1047)
		    return "B05";
		   //6옥타브
		   else if (ac >= 1047 && ac < 1109)
		    return "C06";
		   else if (ac >= 1109 && ac < 1175)
		    return "C#6";
		   else if (ac >= 1175 && ac < 1245)
		    return "D06";
		   else if (ac >= 1245 && ac < 1319)
		    return "D#6";
		   else if (ac >= 1319 && ac < 1397)
		    return "E06";
		   else if (ac >= 1397 && ac < 1480)
		    return "F06";
		   else if (ac >= 1480 && ac < 1568)
		    return "F#6";
		   else if (ac >= 1568 && ac < 1661)
		    return "G06";
		   else if (ac >= 1661 && ac < 1760)
		    return "G#6";
		   else if (ac >= 1760 && ac < 1865)
		    return "A06";
		   else if (ac >= 1865 && ac < 1976)
		    return "A#6";
		   else if (ac >= 1976 && ac < 2093)
		    return "B06";
  }

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

  // handle multiple browsers for requestAnimationFrame()
  window.requestAFrame = (function() {
   return window.requestAnimationFrame
     || window.webkitRequestAnimationFrame
     || window.mozRequestAnimationFrame
     || window.oRequestAnimationFrame ||
     // if all else fails, use setTimeout
     function(callback) {
      return window.setTimeout(callback, 16); // shoot for 60 fps, 16 = 1000/60
     };
  })();

  window.cancelAFrame = (function() {
   return window.cancelAnimationFrame
     || window.webkitCancelAnimationFrame
     || window.mozCancelAnimationFrame
     || window.oCancelAnimationFrame || function(id) {
      window.clearTimeout(id);
     };
  })();
 
  var melodyAudio;
  function singAsong() { // 플레이 버튼을 누르면 이 함수 실행
	    //코인제거
	    var iframeObj = $("#ifm").get(0);
	    var iframeDocument = iframeObj.contentWindow || iframeObj.contentDocument;
	    iframeDocument.postMessage('7000:','https://192.168.0.74:3000/client')
	    
	    
   if(playingMelody == false){
    melodyAudio = new Audio('/resources/mr/${song.mrfilename}.mp3');
    melodyAudio.play();
      readFile("/resources/midi/${song.midifilename}.txt");
      readFile("/resources/lyrics/${song.lyricsfilename}.txt");
      readFile("/resources/lyrics/${song.lyricstimefilename}.txt");
      document.getElementById("playbutton").style.backgroundImage = 'url("/resources/img/stop.png")';
      
      updatePitch();
      playing = true;
      playingMelody = true;
      record();//'${song.sfilename}');
      

      setTimeout("calLyrics()", (lyricsTimeTxtArr[0] * 1000));
   }
   else if(playingMelody == true){
    melodyAudio.pause();
    playingMelody = false;
    document.getElementById("playbutton").style.backgroundImage = 'url("/resources/img/play.png")';
    record();//'${song.sfilename}');
   // calScore();
    swal({
    	  title: "코인소모알림!",
    	  text: "중간에 종료하셔도 코인소모되시는거 아시죠?",
    	  imageUrl: "/resources/img/wink.png"
    	});
   }
  }

  function parsingMIDI(songText) { // midi to txt 파싱하는 함수
   //txt파일 파싱하기
   var txtArr = songText.split(':');
   //시간배열, on/off상태배열, 채널배열, 차이배열??, 노래크기 배열 
   var indexT = 0, indexS = 0, indexC = 0, indexI = 0, indexV = 0;
   for (var a = 0; a < txtArr.length; a++) {

    if (a % 5 == 0)
     timeArr[indexT++] = txtArr[a];
    else if (a % 5 == 1)
     stateArr[indexS++] = txtArr[a];
    else if (a % 5 == 2)
     channelArr[indexC++] = txtArr[a];
    else if (a % 5 == 3)
     intervalArr[indexI++] = txtArr[a];
    else
     veloArr[indexV++] = txtArr[a];
   }
  }

  function parsingLyricsText(lyricsText) { // 가사 txt 파싱하는 함수
   lyricsTxtArr = lyricsText.split(':');
  }

  function parsingLyricsTimeText(lyricsTimeText) { // 가사 시간 txt 파싱하는 함수
   lyricsTimeTxtArr = lyricsTimeText.split(':');
  }

  function readFile(filename) {
   var fileObject = new XMLHttpRequest();

   var xmlhttp;
   var songText;

   if (window.XMLHttpRequest) {
    xmlhttp = new XMLHttpRequest();
   } else {
    // code for older browsers
    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
   }
   xmlhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
     if (filename.indexOf("/midi/") != -1) {// midi to txt 파일 일때
      songText = this.responseText;

      parsingMIDI(songText);

      calNote();
     } else if (filename.indexOf("time.txt") != -1) {// 가사 시간 data txt일때
 
    	 if(filename.indexOf("ilovedlyricstime.txt"))
    			 tick= ilovedTick; 
    			 else
    				 tick = loveExceptMeTick;
      
    			 lyricsTimeText = this.responseText;
      parsingLyricsTimeText(lyricsTimeText);
     } else {// 가사 data txt일때
      lyricsText = this.responseText;
      parsingLyricsText(lyricsText);
     }
    }
   };

   xmlhttp.open("GET", filename, true);
   xmlhttp.send();

  }

  var noteTotal = 1;
  function calNote() {// 현재 음 계산하는 아이.
	  if (stateArr[checkCnt] == 'On')
		    noteV += Number(intervalArr[checkCnt]);
		   else
		    noteV -= Number(intervalArr[checkCnt]);
		   noteVText = divideNote(noteV)
		   noteTotal++;
		   console.log("noteVText : " + noteVText);
		   console.log("noteAc : " + noteAc);
		   var str1 = ''+noteAc
		   var str2 = ''+noteVText;
		   if(level == 2){ // level hard일 때   
		          if ((str1.substring(0, 1) == str2.substring(0, 1)) 
		              && (str1.substring(2, 1) == str2.substring(2, 1))) {
		            console.log("!!!!!!!!!!!!!222222very good!!!!!!!!");
		            calScore();
		            noteCorrect = true;
		          } else {
		           noteCorrect = false;
		          }
		       }
		       else if(level == 1){ // level normal일 때  
		          if(str1.substring(0, 1) == str2.substring(0, 1)){//알파벳만 맞을 경우
		               console.log("!!!!!!!!!!!!!!1111111very good!!!!!!!!!!!!!!!!!!!!!!1");
		            calScore();
		            noteCorrect = true;
		             } else {
		               noteCorrect = false;
		             }
		         }
		       else if(level == 0){ //level easy일 때
		          var s1 = str1.charCodeAt(0);
		          var s2 = str2.charCodeAt(0);
		  
		          var minNum, maxNum;
		          (s2==65)?minNum = 71 : minNum = str2.charCodeAt(0) - 1;
		          (s2==71)?maxNum = 65 : maxNum = str2.charCodeAt(0) + 1;
		           if ((s1 == maxNum)
		              ||(s1 == minNum)
		              ||(s1 == s2)) {
		             console.log("!!!!!!!!!!000000001very good!!!!!!!!!!!!!!!!!!!!");
		             calScore();
		             noteCorrect = true;
		           } else {
		            noteCorrect = false;
		           }
		       }
		         noteCheck();
		         if ((checkCnt < intervalArr.length)&& (playingMelody)) {
		          if (checkCnt == 0)
		           setTimeout("calNote()", timeArr[checkCnt] * 1000 * tick);
		          else
		           setTimeout("calNote()",
		             (timeArr[checkCnt] - timeArr[checkCnt - 1]) * 1000
		               * tick);
		          checkCnt++;
		         
		        }
		      
  }

  function noteCheck() {
   if (noteCorrect) {
    document.getElementById('light').src = "/resources/img/good.png";
   } else if (!noteCorrect) {
    document.getElementById('light').src = "/resources/img/bad.png";
   }
  }

  function calLyrics() { //시간에 맞는 가사 보여주는 함수
	  console.log("length : " + lyricsTimeTxtArr.length);
  
	  if((lyricsTimeTxtArr.length > lyricsCnt)&& (playingMelody)){
        if (lyricsCnt == 0) {
         document.getElementById('songText1').innerHTML = "이제 곧 노래가 시작됩니다. 준비해주세요."
         document.getElementById('songText2').innerHTML = lyricsTxtArr[0];
         document.getElementById('songText1').style.color = 'white';
         document.getElementById('songText2').style.color = 'red';
         lyricsCnt++;
         setTimeout("calLyrics()",
           (lyricsTimeTxtArr[lyricsCnt-1] * 1000));
         
     
        } else if (lyricsCnt != 0) {
       	   if(lyricsCnt%2==1){
         		  
           	    document.getElementById('songText1').innerHTML = lyricsTxtArr[lyricsCnt];
           	 		document.getElementById('songText1').style.color = 'white';
         		  
         	    document.getElementById('songText2').style.color = 'red';
         	   	if(lyricsTimeTxtArr.length == lyricsCnt + 1){
 
         	   	document.getElementById('songText1').innerHTML = "  ";
         	   	}
       	   }
       	   else{
      
          		   document.getElementById('songText2').innerHTML = lyricsTxtArr[lyricsCnt];
          		   document.getElementById('songText2').style.color = 'white';
        		  
       	  	   document.getElementById('songText1').style.color = 'red';
         	  	if(lyricsTimeTxtArr.length == lyricsCnt + 1){

         	  		
         	  		document.getElementById('songText2').innerHTML = "  ";
         	  	}
       	   }
     	   		lyricsCnt++;
     	    	setTimeout(
     	      "calLyrics()",
     	      ((lyricsTimeTxtArr[lyricsCnt-1] - lyricsTimeTxtArr[lyricsCnt - 2]) * 1000));
        }
	  }
	  else if((0 < lyricsCnt)&&(lyricsTimeTxtArr.length <= lyricsCnt)){//노래 중간에 껐을 때. || 노래 종료되었을 때.
		  //점수
		  //record 중지
		  recordPlaying = false;
		  record();

		    if(goodCount > 100)
		    	goodCount = 100;
		    else
		    	goodCount = parseInt(goodCount);
		    
		    swal({
      		  title: "your score is",
      		  text: goodCount,
      		  imageUrl: "/resources/img/crown.png"
      		});
	  }
  }
  function calScore(){
       
	  			if(level == 0){ //level easy일 때
	  				goodCount+=0.6;
	  			}else if(level == 1){
	  				goodCount+=0.8;
	  			}else if(level == 2){
	  				goodCount+=1;
	  			}
	  	}
 </script>

</body>

</html>