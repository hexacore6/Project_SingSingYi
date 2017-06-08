<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    
    <head>
         
        <title>종현이게임 진행률</title>
        
        <!-- 합쳐지고 최소화된 최신 CSS -->
    <script src="<%=application.getContextPath()%>/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/css/main.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
        <!-- Uncomment the following meta tag if you have issues rendering this page on an intranet site. -->    
        <!--  <meta http-equiv="X-UA-Compatible" content="IE=9"/> --> 
        <style id="inlinecss" type="text/css">
            /* put a border around the canvas element */
            #canvas  
            {
                margin-top:10px; 
                border-style:solid; 
                border-width:1px; 
                padding:3px; 
            }
        </style>
        <script type="text/javascript">
            //Global variable to track current file name        
            var currentFile = "";

            //display and update progress bar
            function progressBar() { 
                var oAudio = document.getElementById('myaudio'); 
                //get current time in seconds
                var elapsedTime = Math.round(oAudio.currentTime);
                //update the progress bar
                if (canvas.getContext) {
                    var ctx = canvas.getContext("2d");
                    //clear canvas before painting
                    ctx.clearRect(0, 0, canvas.clientWidth, canvas.clientHeight);
                    ctx.fillStyle = "rgb(255,0,0)";
                    var fWidth = (elapsedTime / oAudio.duration) * (canvas.clientWidth);
                    if (fWidth > 0) {
                        ctx.fillRect(0, 0, fWidth, canvas.clientHeight);
                    }
                }
            }
            //Play and pause function 
            function playAudio() {
                try {
                    //return objects we need to work with 
                    var oAudio = document.getElementById('myaudio'); 
                    var btn = document.getElementById('play');
                    var audioURL = document.getElementById('audiofile');               

                    //Skip loading if current file hasn't changed.
                    if (audioURL.value !== currentFile) {
                        oAudio.src = audioURL.value;
                        currentFile = audioURL.value;                        
                    }

                    //Tests the paused attribute and set state. 
                    if (oAudio.paused) {
                        oAudio.play();
                        btn.textContent = "Pause";
                    }
                    else {
                        oAudio.pause();
                        btn.textContent = "Play";
                    }
                }
                catch (e) {
                    // Fail silently but show in F12 developer tools console
                    if (window.console && console.error("Error:" + e));
                }
            }

            //Rewinds the audio file by 30 seconds.
            function rewindAudio() {
                try {
                    var oAudio = document.getElementById('myaudio');
                    oAudio.currentTime -= 30.0;
                }
                catch (e) {
                    // Fail silently but show in F12 developer tools console
                    if (window.console && console.error("Error:" + e));
                }
            }

            //Fast forwards the audio file by 30 seconds.
            function forwardAudio() {
                try {
                    var oAudio = document.getElementById('myaudio');
                    oAudio.currentTime += 30.0;
                }
                catch (e) {
                    // Fail silently but show in F12 developer tools console
                    if (window.console && console.error("Error:" + e));
                }
            }

            //Restart the audio file to the beginning.

            function restartAudio() {
                try {
                    var oAudio = document.getElementById('myaudio');
                    oAudio.currentTime = 0;
                }
                catch (e) {
                    // Fail silently but show in F12 developer tools console
                    if (window.console && console.error("Error:" + e));
                }
            }

            //added events

            function initEvents() {
                var canvas = document.getElementById('canvas');  
                var oAudio = document.getElementById('myaudio');

                //set up event to toggle play button to pause when playing
                oAudio.addEventListener("playing", function() {
                    document.getElementById("play").textContent = "Pause";
                }, true);

                //set up event to toggle play button to play when paused
                oAudio.addEventListener("pause", function() {
                    document.getElementById("play").textContent = "Play";
                }, true);
                //set up event to update the progress bar
                oAudio.addEventListener("timeupdate", progressBar, true); 
                //set up mouse click to control position of audio
                canvas.addEventListener("click", function(e) {
                    //this might seem redundant, but this these are needed later - make global to remove these
                    var oAudio = document.getElementById('myaudio'); 
                    var canvas = document.getElementById('canvas');            

                    if (!e) {
                        e = window.event;
                    } //get the latest windows event if it isn't set
                    try {
                        //calculate the current time based on position of mouse cursor in canvas box
                        oAudio.currentTime = oAudio.duration * (e.offsetX / canvas.clientWidth);
                    }
                    catch (err) {
                    // Fail silently but show in F12 developer tools console
                        if (window.console && console.error("Error:" + err));
                    }
                }, true);
            }
            //this event gets fired when a page has loaded
            window.addEventListener("DOMContentLoaded", initEvents, false);
        </script>
    </head>    
    <body>
           <!-- header -->
      <%@ include file="../include/header.jsp"%>
  
        <h1>HTML5 audio player with progress bar</h1>
        <p>
            <input type="text" id="audiofile" size="80" value=".././resources/music/onelove.mp3" />
        </p>
        <audio id="myaudio">
            HTML5 audio not supported
        </audio>
        <p>
            <button id="play" onclick="playAudio();" disabled>
                Play
            </button>
            <button id="rewind" onclick="rewindAudio();" disabled>
                Rewind
            </button>
            <button id="forward" onclick="forwardAudio();" disabled>
                Fast forward
            </button>
            <button id="restart" onclick="restartAudio();" disabled>
                Restart
            </button>
        </p>
        <p>
            <canvas id="canvas" width="500" height="20">
                canvas not supported
            </canvas>
        </p>
        <script type="text/javascript">
            //Check for support and enable buttons
            if (window.HTMLAudioElement) {
                document.getElementById("play").disabled = false;
                document.getElementById("rewind").disabled = false;
                document.getElementById("forward").disabled = false;
                document.getElementById("restart").disabled = false;
            }
        </script>
        
           <!-- footer -->
  <%@include file="../include/footer.jsp"%>
    </body>

</html>