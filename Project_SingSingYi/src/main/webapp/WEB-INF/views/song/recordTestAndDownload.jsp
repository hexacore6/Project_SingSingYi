<!DOCTYPE html>
<html lang="en">

<head>
    <script src="https://cdn.webrtc-experiment.com/RecordRTC.js"></script>
    <script src="https://cdn.webrtc-experiment.com/gif-recorder.js"></script>
    <script src="https://cdn.webrtc-experiment.com/getScreenId.js"></script>
    <!-- for Edige/FF/Chrome/Opera/etc. getUserMedia support -->
    <script src="https://cdn.webrtc-experiment.com/gumadapter.js"></script>
</head>

<body>
    <article>
        <section class="experiment recordrtc">
            <h2 class="header">
                <button>Start Recording</button>
            </h2>

            <!-- Stop recording 후 보여지는 비디오 태그 -->
            <video controls muted></video>
        </section>

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
            var recordingDIV = document.querySelector('.recordrtc');
            var recordingPlayer = recordingDIV.querySelector('video');

            recordingDIV.querySelector('button').onclick = function() {
                var button = this;

                if(button.innerHTML === 'Stop Recording') {
                    button.disabled = true;
                    button.disableStateWaiting = true;
                    setTimeout(function() {
                        button.disabled = false;
                        button.disableStateWaiting = false;
                    }, 2 * 1000);

                    button.innerHTML = 'Start Recording';

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

                            //saveToDiskOrOpenNewTab(button.recordRTC);
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

                        button.innerHTML = 'Stop Recording';
                        button.disabled = false;
                    },
                    onMediaStopped: function() {
                        button.innerHTML = 'Start Recording';

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
                            var audio = new Audio();
                            audio.src = url;
                            audio.controls = true;
                            //recordingPlayer.parentNode.appendChild(document.createElement('hr'));
                            recordingPlayer.parentNode.appendChild(audio);

                            if(audio.paused) audio.play();

                            audio.onended = function() {
                                audio.pause();
                                audio.src = URL.createObjectURL(button.recordRTC.blob);
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
/*
            function saveToDiskOrOpenNewTab(recordRTC) {
                recordingDIV.querySelector('#save-to-disk').parentNode.style.display = 'block';
                recordingDIV.querySelector('#save-to-disk').onclick = function() {
                    if(!recordRTC) return alert('No recording found.');

                    recordRTC.save();
                };

                recordingDIV.querySelector('#upload-to-server').disabled = false;
                recordingDIV.querySelector('#upload-to-server').onclick = function() {
                    if(!recordRTC) return alert('No recording found.');
                    this.disabled = true;

                    var button = this;
                    uploadToServer(recordRTC, function(progress, fileURL) {
                        if(progress === 'ended') {
                            button.disabled = false;
                            button.onclick = function() {
                                window.open(fileURL);
                            };
                            return;
                        }
                        button.innerHTML = progress;
                    });
                };
            }
*/
/*
            var listOfFilesUploaded = [];

            function uploadToServer(recordRTC, callback) {
                var blob = recordRTC instanceof Blob ? recordRTC : recordRTC.blob;
                var fileType = blob.type.split('/')[0] || 'audio';
                var fileName = (Math.random() * 1000).toString().replace('.', '');

                fileName += '.' + (!!navigator.mozGetUserMedia ? 'ogg' : 'wav');

                // create FormData
                var formData = new FormData();
                formData.append(fileType + '-filename', fileName);
                formData.append(fileType + '-blob', blob);

                callback('Uploading ' + fileType + ' recording to server.');

                makeXMLHttpRequest('https://webrtcweb.com/RecordRTC/', formData, function(progress) {
                    if (progress !== 'upload-ended') {
                        callback(progress);
                        return;
                    }

                    var initialURL = 'https://webrtcweb.com/RecordRTC/uploads/';

                    callback('ended', initialURL + fileName);
                    // to make sure we can delete as soon as visitor leaves
                    listOfFilesUploaded.push(initialURL + fileName);
                });
            }
*/
        </script>
    </article>
    <script src="https://cdn.webrtc-experiment.com/commits.js" async></script>
</body>
</html>