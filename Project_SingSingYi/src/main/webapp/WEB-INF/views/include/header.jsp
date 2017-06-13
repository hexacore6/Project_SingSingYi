<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
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
				<!-- 		<div id="headimg" style="margin-left: 50px;">
							<a href="/mypage/sharing"><img src="/resources/img/user.png"></a>
                            <a class="btn btn-primary" href="/member/logout">로그아웃</a>
                            <a class="btn btn-primary" href="/game/gameStart">게임</a>
						</div> -->
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
window.onload = function () {
	var allcookies = document.cookie;
	
    cookiearray  = allcookies.split(';');

    // Now take key value pair out of this array
    var loginCookie= new Array;
    for(var i=0; i<cookiearray.length; i++){
       
        loginCookie = cookiearray[i].split('=');
			
    }
    /*아이디 표시 */
    var iframeObj = $("#ifm").get(0);
    var iframeDocument = iframeObj.contentWindow || iframeObj.contentDocument;
    iframeDocument.$("#userId").html(loginCookie[1]);
 
    $.ajax({
        type: 'get'
        , url: 'http://localhost:3000/first?id=' + loginCookie[1]
        , dataType: 'json'
        , success: function (data) {
            if (data.length != 0) {
                $("#button").attr("id", 'button2');
                console.log("ajax통신성공")
            }
        }
    });
    /*코인갯수  */
    $.ajax({
        type: 'get'
        , url: 'http://localhost:3000/coincnt?id=' + loginCookie[1]
        , dataType: 'json'
        , success: function (data) {
            data.forEach(function(elt, i) {
            	$('#coin').html("x"+elt.coincnt);
            	console.log("ajax통신성공")
            });
    	}
    });
}
</script>
<!--해더END-->
