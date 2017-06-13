<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" ></script>
<div class="row">
	<div class="col-lg-12">
		<div class='headerimg'>
			<!--좌표값수정-->
			<div class="container">
				<div class="row">
					<div class="col-lg-3"></div>
					<div class="col-lg-3 pull-left">
						<a id='logo' href="/song/main"></a>
					</div>
					<div class="col-lg-3" style="margin-left: 50px;">
						<div id="headimg" style="margin-left: 50px;">
<!-- 							<a href="/mypage/sharing"><img src="/resources/img/user.png"></a>
                            <button id='button' class="btn btn-primary bg-greenary" ></button>
                            <div id='jsonp'></div> -->
						</div>
             
                       <iframe src="http://192.168.0.63:3000/client" id="ifm"style="width: 200px;height: 200px; margin-left: 250px;"></iframe>
					
          
          </div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--해어디이미지-->
<section id='header' class="container">
	<!--해더스타트-->
	<div class='headerbar'>
		<div class="row">
			<!--해더 메뉴바-->
			<!--한글폰트-->
			<div class="col-lg-3">
				<a href='<%=application.getContextPath()%>/song/main' class="menuitem">
					<p class="text-center">
						<strong>노래하기</strong>
					</p>
				</a>
			</div>
			<div class="col-lg-3">
				<a href="<%=application.getContextPath()%>/sharing/list"
					class="menuitem">
					<p class="text-center">
						<strong>SNS</strong>
					</p>
				</a>
			</div>
			<div class="col-lg-3">

				<a href="<%=application.getContextPath()%>/board/nlist"
					class="menuitem">
					<p class="text-center">
						<strong>공지사항</strong>
					</p>
				</a>
			</div>
			<div class="col-lg-3">
				<a href="<%=application.getContextPath()%>/board/list"
					class="menuitem">
					<p class="text-center">
						<strong>Q&A</strong>
					</p>
				</a>
			</div>
		</div>
	</div>
</section>
<script>
/*알람갯수  */
var iframeDocument =null;
window.onload = function () {
	var allcookies = document.cookie;
	
    cookiearray  = allcookies.split(';');
	
    var loginCookie= new Array;
    for(var i=0; i<cookiearray.length; i++){
       
        loginCookie = cookiearray[i].split('=');
			
    }
     
    var iframeObj = $("#ifm").get(0);
    var iframeDocument = iframeObj.contentWindow || iframeObj.contentDocument;
    iframeDocument.postMessage('1000:'+loginCookie[1],'http://192.168.0.63:3000/client')
}













/*새로쓰는부분끝 */

    
    
    /*아이디 표시 */
/*  var iframeObj = $("#ifm").get(0);
    var iframeDocument = iframeObj.contentWindow || iframeObj.contentDocument;
    iframeDocument.contents().find("#userId").html(loginCookie[1])
 */  	/*알림표시  */
   /*   $.ajax({
        type: 'get'
        , url: 'http://localhost:3000/first?id=' + loginCookie[1]
        , dataType: 'json'
        , success: function (data) {
            if (data.length != 0) {
                alert('알람보내기')
                iframeDocument.alram();           
            }
        }
    }); */
     /*코인갯수  */
/*      $.ajax({
        type: 'get'
        , url: 'http://localhost:3000/coincnt?id=' + loginCookie[1]
        , dataType: 'json'
        , success: function (data) {
            data.forEach(function(elt, i) {
                iframeDocument.contents().find('#coin').html("x"+elt.coincnt);
            	console.log("ajax통신성공")
            });
    	}
    });
 */
</script>
<!--해더END-->
