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

#playbutton {
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
		 
		  
		 // this.context = stream.context;
		  var recordBuffers = [];
		  var recording = false;
		

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

		function myFunction() {
			var totalT = 0;
			for (var i = 0; i <= 3; i++) {
				totalT += sheetTime[i] * 1000;
				//console.log(totalT);
				setTimeout("timerfun(" + i + ")", totalT);
			}
		}
		function timerfun(i) {
			console.log(i);

			if (i == 0) {
				document.getElementById('myImage').src = "./resources/images/1.png";
			} else if (i == 1) {
				document.getElementById('myImage').src = "./resources/images/2.png";
			} else if (i == 2) {
				document.getElementById('myImage').src = "./resources/images/3.png";
			} else {
				document.getElementById('myImage').src = "./resources/images/4.png";
			}
		}

		function RecordAudio(stream, cfg) {
			 var config = cfg || {};
			 var bufferLen = config.bufferLen || 4096;
			  var numChannels = config.numChannels || 2;
			  
			  node = (audioContext.createScriptProcessor ||
			    audioContext.createJavaScriptNode).call(audioContext,
			    bufferLen, numChannels, numChannels);

			  mediaStreamSource.connect(node);
			  node.connect(audioContext.destination);

			  node.onaudioprocess = function(e) {
			    if (!recording) return;
			    for (var i = 0; i < numChannels; i++) {
			      if (!recordBuffers[i]) recordBuffers[i] = [];
			      recordBuffers[i].push.apply(recordBuffers[i], e.inputBuffer.getChannelData(i));
			    }
			  }
			}
		
			 function recordGetData() {
				    var tmp = recordBuffers;
				    recordBuffers = [];
				    return tmp; // returns an array of array containing data from various channels
				  };
			
			 
				  function recordStart() {
				    recording = true;
				  };

				  function recordStop() {
				    recording = false;
				  
					//var fileObject = new XMLHttpRequest();

					
					
					var xmlhttp;
					var recordedData;
					if (window.XMLHttpRequest) {
						xmlhttp = new XMLHttpRequest();
					} else {
						// code for older browsers
						xmlhttp = new ActiveXObject("Scripting.FileSystemObject");
					}
					
					
					xmlhttp.onreadystatechange = function() {
							//console.log('here');
								recordedData = recordGetData();
					};
					
					xmlhttp.open("POST", "/song/save", true);
					
					//console.log("5초 후yes!");
					//console.log(recordedData);
					//var textVoice = JSON.stringify(recordedData);
					//console.log(recordedData.toString());
					//xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
					//xmlhttp.send("song=" +textVoice);
					
		
					
		/*
					  var firstFile = '/resources/music/iloved.mp3';
					  var secondFile = '/resources/music/dayday.mp3';

					  var socket = io.connect('http://localhost');
					  socket.emit('mergeFiles', { firstFile: firstFile, secondFile: secondFile });
					 */
					  /*
				    var txtFile = "/resources/record/test.txt";
				    var test = [];
				    var file = new File(test,txtFile);
				    var str = "My string of text";

				    file.open("w"); // open file with write access
				    file.writeln("First line of text");
				    file.writeln("Second line of text " + str);
				    console.log(str);
				    file.write(str);
				    file.close();
				    */
					//console.log("data : " + recordedData);
			 };
			
		function singAsong() {
			var audio = new Audio('/resources/music/iloved.mp3');
			audio.play();
			readFile("/resources/notes/songTest.txt");
			readFile("/resources/lyrics/iloved.txt");
			readFile("/resources/lyrics/ilovedTime.txt");

			playing = true;
			updatePitch();
			
			//노래 합치기
			var ctx = new AudioContext();
			ctx.destination.channelCount = 1;
			ctx.destination.channelCountMode = 'explicit';

			var inputNode;
			var splitter = ctx.createChannelSplitter(1);
			var merger = ctx.createChannelMerger(1);

			splitter.connect(merger, 0, 0);

			merger.connect(ctx.destination);

			navigator.webkitGetUserMedia({ audio: true }, function (stream) {
			  
			  inputNode = ctx.createMediaStreamSource(stream);
			  // below doesn't do anything on StreamSource node.
			  inputNode.channelCount = 1;
			  inputNode.channelCountMode = 'explicit';
			  inputNode.connect(splitter);
			  
			}, function () {});
			
			setTimeout("calLyrics()", (lyricsTimeTxtArr[0] * 1000));
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
			// var fileName = "/resources/notes/songTest.txt";
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
						//console.log("1 : "+songText);

						parsingMIDI(songText);

						calNote();
					} else if (filename.indexOf("Time.txt") != -1) {// 가사 시간 data txt일때
						lyricsTimeText = this.responseText;
						parsingLyricsTimeText(lyricsTimeText);
						//console.log("Time");
						//console.log(lyricsTimeTxtArr);
					} else {// 가사 data txt일때
						lyricsText = this.responseText;
						parsingLyricsText(lyricsText);
						//console.log("no");
						//console.log(lyricsTxtArr);
					}
				}
			};

			xmlhttp.open("GET", filename, true);
			xmlhttp.send();

		}

		function calNote() {// 현재 음 계산하는 아이.
			//console.log(intervalV);
			if (stateArr[checkCnt] == 'On')
				noteV += Number(intervalArr[checkCnt]);
			else
				noteV -= Number(intervalArr[checkCnt]);
			//console.log(noteV);
			//checkCnt++;
			noteVText = divideNote(noteV)

			console.log("noteVText : " + noteVText);
			console.log("noteAc : " + noteAc);
			if (noteAc == noteVText) {
				//console.log("very good!");
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

		function loadimages() {
			light01 = new Image;
			light01.src = "./resources/img/greenlight.png";

			light02 = new Image;
			light02.src = "./resources/img/redlight.png";

			pictures = new Array(2);
			pictures[0] = light01;
			pictures[1] = light02;

		}

		function noteCheck() {
			if (noteCorrect) {
				document.getElementById('light').src = "/resources/img/greenlight.png";
			} else if (!noteCorrect) {
				document.getElementById('light').src = "/resources/img/redlight.png";
			}
		}

		function calLyrics() { //시간에 맞는 가사 보여주는 함수
			//console.log(lyricsTxtArr);
			//console.log(lyricsTimeTxtArr);
			if (lyricsCnt == 0) {
				//console.log(lyricsTimeTxtArr[lyricsCnt]);
				document.getElementById('songText').innerHTML = lyricsTxtArr[lyricsCnt];

				setTimeout("calLyrics()",
						(lyricsTimeTxtArr[lyricsCnt++] * 1000));

			} else if (lyricsCnt != 0) {
			//	console.log((lyricsTimeTxtArr[lyricsCnt] - lyricsTimeTxtArr[lyricsCnt - 1]));
				document.getElementById('songText').innerHTML = lyricsTxtArr[lyricsCnt - 1];

				setTimeout(
						"calLyrics()",
						((lyricsTimeTxtArr[lyricsCnt] - lyricsTimeTxtArr[lyricsCnt - 1]) * 1000));
				lyricsCnt++;
			}

		}

		/* 
		 //현재 어떤 음정인지 체크하는 함수(현재 사용X)
		 function noteFromPitch( frequency ) {
		 var noteNum = 12 * (Math.log( frequency / 440 )/Math.log(2) );
		 return Math.round( noteNum ) + 69;
		 }

		 //음정에서 주파수을 구하는 함수(현재 사용X)  
		 function frequencyFromNoteNumber( note ) {
		 return 440 * Math.pow(2,(note-69)/12);
		 }

		 //지금은 사용안하는 함수(현재 사용X)
		 function centsOffFromPitch( frequency, note ) {
		 return Math.floor( 1200 * Math.log( frequency / frequencyFromNoteNumber( note ))/Math.log(2) );
		 }
		 */
	</script>
 -->
 <!-- <script src="/socket.io/socket.io.js"></script> -->
 <script>
		/*
		 function mergeBuffers(recBuffers, recLength){

		 var result = new Float32Array(recLength*2);
		 var offset = 0;
		 for (var i = 0; i < recBuffers.length; i++){
		 result.set(recBuffers[0], offset);
		 offset += recBuffers[0].length;
		 }
		 return result;
		 }
		 var audioTracks = '/resources/music/iloved.mp3';
		 var recBuffersL = [];
		 for (var i=0;i<audioTracks.length; i++)
		 {
		 recBuffersL[i] = audioTracks[i].currentBuffer.getChannelData(0);

		 }

		 var recBuffersR = [];
		 for (var i=0;i<audioTracks.length; i++)
		 {
		 recBuffersR[i] = audioTracks[i].currentBuffer.getChannelData(1);

		 }


		 var buffers = [];
		 buffers.push( mergeBuffers(recBuffersL, recBuffersL.length) );
		 buffers.push( mergeBuffers(recBuffersR, recBuffersR.length) );
		 */
	</script>

 <script src="//cdn.WebRTC-Experiment.com/RecordRTC.js">
		/*
		 var recordRTC = RecordRTC(mediaStream);
		 recordRTC.startRecording();
		 setTimeout("stopRecord()",(10000));
		 
		 function stopRecord(){
		 recordRTC.stopRecording(function(audioURL) {
		 mediaElement.src = audioURL;
		 });
		 }
		 */
	</script>

</body>

</html>