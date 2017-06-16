<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8"%>
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
<script src="https://cdn.webrtc-experiment.com/RecordRTC.js"></script>
<script src="https://cdn.webrtc-experiment.com/gif-recorder.js"></script>
<script src="https://cdn.webrtc-experiment.com/getScreenId.js"></script>
<script src="https://cdn.webrtc-experiment.com/gumadapter.js"></script>

<style type="text/css">
#light {
 width: 300px;
 height: 300px;
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

#playbutton, #recordbutton {
 width: 100px;
 height: 100px;
 background-image: url("/resources/img/play.png");
 background-size: 100px, 2px;
 background-position: center;
 background-repeat: no-repeat;
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
 height: 1200px;
 <!--
 마지막
 체크하는
 부분
 -->
}
</style>

</head>

<body onload="init();">
 <%@include file="../include/header.jsp"%>
 <section id="content" class="container">
  <!--내용시작-->
  <div class="row">
   <div class="col-lg-9">
    <!--왼쪽-->
    <div class="music">
     <!--곡명-->
     <img src="/resources/img/ak.jpg">
    </div>
    <div class="lyrics">
     <h1 id="songText">가사 준비중.. .</h1>
    </div>
    <div class="row">
     <div class="col-lg-5"></div>
     <div class="col-lg-1">
      <div class="music-controller">

       <button class="btn btn-primary" id="playbutton"
        onclick="singAsong()"></button>

       <div class="experiment recordrtc">
        <button class="btn btn-primary" id="recordbutton"
         onclick="recordControl()"></button>
        <!-- Stop recording 후 보여지는 비디오 태그 -->
        <video hidden=true></video>
       </div>

      </div>
     </div>
     <div class="col-lg-6"></div>
    </div>
   </div>
   <div class="col-lg-3">
    <div class="musiclist">
     <!--음악리스트-->
     <div class="box">
      <div class="box-header">
       <h3 class="box-title">노래 리스트</h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body no-padding">
       <table class="table table-striped">
        <tbody>
         <tr>
          <th style="width: 5px"></th>
          <th>곡명</th>
          <th style="width: 50px">Artist</th>
          <th style="width: 40px">시간</th>
         </tr>
         <tr>
          <td>1.</td>
          <td>맞지?</td>
          <td>언니쓰</td>
          <td><span class="badge bg-red">3:30</span></td>
         </tr>
         <tr>
          <td>1.</td>
          <td>맞지?</td>
          <td>언니쓰</td>
          <td><span class="badge bg-red">3:30</span></td>
         </tr>
         <tr>
          <td>1.</td>
          <td>맞지?</td>
          <td>언니쓰</td>
          <td><span class="badge bg-red">3:30</span></td>
         </tr>
         <tr>
          <td>1.</td>
          <td>맞지?</td>
          <td>언니쓰</td>
          <td><span class="badge bg-red">3:30</span></td>
         </tr>
        </tbody>
       </table>
      </div>
      <!-- /.box-body -->
     </div>
    </div>
    <div class="signalbar">
     <!--불륨조절-->
     <img src="/resources/img/blacklight.png" id="light">
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
        function record(){
            var recordingDIV = document.querySelector('.recordrtc');
            var recordingPlayer = recordingDIV.querySelector('video');

            recordingDIV.querySelector('button').onclick = function() {
                var button = this;

                if(button.innerHTML === 'p') {
                    button.disabled = true;
                    button.disableStateWaiting = true;
                    setTimeout(function() {
                        button.disabled = false;
                        button.disableStateWaiting = false;
                    }, 2 * 1000);

                    button.innerHTML = 't';

                    function stopStream() {
                        if(button.stream && button.stream.stop) {
                            button.stream.stop();
                            button.stream = null;
                            
                        }
                    }
                    
                  

                    if(button.recordRTC) {
                        button.recordRTC.stopRecording(function(url) {
                            button.recordingEndedCallback(url);
                            stopStream();
                        });
                    }
                    return;
                }

                button.disabled = true;

                var commonConfig = {
                    onMediaCaptured: function(stream) {
                        button.stream = stream;
                        if(button.mediaCapturedCallback) {
                            button.mediaCapturedCallback();
                        }

                        button.innerHTML = 'p';
                        button.disabled = false;
                    },
                    onMediaStopped: function() {
                        button.innerHTML = 't';

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
                
                    captureAudio(commonConfig);
                    
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
                         
                         recordAudio.src = url;
                         recordAudio.controls = true;
                            recordingPlayer.parentNode.appendChild(document.createElement('hr'));
                            recordingPlayer.parentNode.appendChild(recordAudio);
                            
                            if(recordAudio.paused) recordAudio.play();

                            recordAudio.onended = function() {
                             recordAudio.pause(); 
                              
                             playingMelody = false;
                             recordAudio.src = URL.createObjectURL(button.recordRTC.blob);
            
                                      if(!recordRTC) return alert('No recording found.');
                                      this.disabled = true;

                                      var button = this;
                                      uploadToServer(recordRTC, function(progress, fileURL) {
                                          if(progress === 'ended') {
                                              button.disabled = false;
                                              button.innerHTML = 'Click to download from server';
                                              button.onclick = function() {
                                                  window.open(fileURL);
                                              };
                                              return;
                                          }
                                          button.innerHTML = progress;
                                      });
                             
                            };
                            
                        };
                        button.recordRTC.startRecording();
                        
                    };

               
            };

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
            
            
        }
        function recordControl(){
         record();
        }
        </script>

 </article>


 <script> 
  window.AudioContext = window.AudioContext || window.webkitAudioContext;
  var requestId = 0;
  var elm;
  var playing = false;
  var audioContext = null;
  var isPlaying = false;
  var analyser = null;
  var mediaStreamSource = null;
  var noteCorrect = true;
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
  var tick = 0.0016622340425532;
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
  window.onload = function() {
   audioContext = new AudioContext();
   init();
  }

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
    return "C2";
   else if (ac >= 69 && ac < 73)
    return "C#2";
   else if (ac >= 73 && ac < 78)
    return "D2";
   else if (ac >= 78 && ac < 82)
    return "D#2";
   else if (ac >= 82 && ac < 87)
    return "E2";
   else if (ac >= 87 && ac < 92)
    return "F2";
   else if (ac >= 92 && ac < 98)
    return "F#2";
   else if (ac >= 98 && ac < 104)
    return "G2";
   else if (ac >= 104 && ac < 110)
    return "G#2";
   else if (ac >= 110 && ac < 117)
    return "A2";
   else if (ac >= 117 && ac < 123)
    return "A#2";
   else if (ac >= 123 && ac < 131)
    return "B2";
   //3옥타브
   else if (ac >= 131 && ac < 139)
    return "C3";
   else if (ac >= 139 && ac < 147)
    return "C#3";
   else if (ac >= 147 && ac < 156)
    return "D3";
   else if (ac >= 156 && ac < 165)
    return "D#3";
   else if (ac >= 165 && ac < 175)
    return "E3";
   else if (ac >= 175 && ac < 185)
    return "F3";
   else if (ac >= 185 && ac < 196)
    return "F#3";
   else if (ac >= 196 && ac < 208)
    return "G3";
   else if (ac >= 208 && ac < 220)
    return "G#3";
   else if (ac >= 220 && ac < 233)
    return "A3";
   else if (ac >= 233 && ac < 247)
    return "A#3";
   else if (ac >= 247 && ac < 262)
    return "B3";
   //4옥타브
   else if (ac >= 262 && ac < 277)
    return "C4";
   else if (ac >= 277 && ac < 294)
    return "C#4";
   else if (ac >= 294 && ac < 311)
    return "D4";
   else if (ac >= 311 && ac < 330)
    return "D#4";
   else if (ac >= 330 && ac < 349)
    return "E4";
   else if (ac >= 349 && ac < 370)
    return "F4";
   else if (ac >= 370 && ac < 392)
    return "F#4";
   else if (ac >= 392 && ac < 415)
    return "G4";
   else if (ac >= 415 && ac < 440)
    return "G#4";
   else if (ac >= 440 && ac < 466)
    return "A4";
   else if (ac >= 466 && ac < 494)
    return "A#4";
   else if (ac >= 494 && ac < 523)
    return "B4";
   //5옥타브
   else if (ac >= 523 && ac < 554)
    return "C5";
   else if (ac >= 554 && ac < 587)
    return "C#5";
   else if (ac >= 587 && ac < 622)
    return "D5";
   else if (ac >= 622 && ac < 659)
    return "D#5";
   else if (ac >= 659 && ac < 698)
    return "E5";
   else if (ac >= 698 && ac < 740)
    return "F5";
   else if (ac >= 740 && ac < 784)
    return "F#5";
   else if (ac >= 784 && ac < 831)
    return "G5";
   else if (ac >= 831 && ac < 880)
    return "G#5";
   else if (ac >= 880 && ac < 932)
    return "A5";
   else if (ac >= 932 && ac < 988)
    return "A#5";
   else if (ac >= 988 && ac < 1047)
    return "B5";
   //6옥타브
   else if (ac >= 1047 && ac < 1109)
    return "C6";
   else if (ac >= 1109 && ac < 1175)
    return "C#6";
   else if (ac >= 1175 && ac < 1245)
    return "D6";
   else if (ac >= 1245 && ac < 1319)
    return "D#6";
   else if (ac >= 1319 && ac < 1397)
    return "E6";
   else if (ac >= 1397 && ac < 1480)
    return "F6";
   else if (ac >= 1480 && ac < 1568)
    return "F#6";
   else if (ac >= 1568 && ac < 1661)
    return "G6";
   else if (ac >= 1661 && ac < 1760)
    return "G#6";
   else if (ac >= 1760 && ac < 1865)
    return "A6";
   else if (ac >= 1865 && ac < 1976)
    return "A#6";
   else if (ac >= 1976 && ac < 2093)
    return "B6";
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
   
   
   if(playingMelody == false){
    melodyAudio = new Audio('/resources/music/iloved.mp3');
    melodyAudio.play();
      readFile("/resources/notes/songTest.txt");
      readFile("/resources/lyrics/iloved.txt");
      readFile("/resources/lyrics/ilovedTime.txt");
   
      playing = true;
      playingMelody = true;
      
      updatePitch();
      //record();
      //echo();
      
      
      setTimeout("calLyrics()", (lyricsTimeTxtArr[0] * 1000));
   }
   else if(playingMelody == true){
    melodyAudio.pause();
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
     if (filename.indexOf("/notes/") != -1) {// midi to txt 파일 일때
      songText = this.responseText;

      parsingMIDI(songText);

      calNote();
     } else if (filename.indexOf("Time.txt") != -1) {// 가사 시간 data txt일때
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

  function calNote() {// 현재 음 계산하는 아이.
   if (stateArr[checkCnt] == 'On')
    noteV += Number(intervalArr[checkCnt]);
   else
    noteV -= Number(intervalArr[checkCnt]);
   noteVText = divideNote(noteV)

   console.log("noteVText : " + noteVText);
   console.log("noteAc : " + noteAc);
   if (noteAc == noteVText) {
    noteCorrect = true;
   } else {
    noteCorrect = false;
   }
   noteCheck();
   if (checkCnt < intervalArr.length) {
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
    document.getElementById('light').src = "/resources/img/greenlight.png";
   } else if (!noteCorrect) {
    document.getElementById('light').src = "/resources/img/redlight.png";
   }
  }

  function calLyrics() { //시간에 맞는 가사 보여주는 함수
   if (lyricsCnt == 0) {
    document.getElementById('songText').innerHTML = lyricsTxtArr[lyricsCnt];

    setTimeout("calLyrics()",
      (lyricsTimeTxtArr[lyricsCnt++] * 1000));

   } else if (lyricsCnt != 0) {
    document.getElementById('songText').innerHTML = lyricsTxtArr[lyricsCnt - 1];

    setTimeout(
      "calLyrics()",
      ((lyricsTimeTxtArr[lyricsCnt] - lyricsTimeTxtArr[lyricsCnt - 1]) * 1000));
    lyricsCnt++;
   }

  }
 </script>

</body>

</html>