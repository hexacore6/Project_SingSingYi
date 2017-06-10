<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section id="footer">
	<!--푸터시작-->
	<!--한글폰트-->
	<div class='footervar'>
		<div class="row">
			<!--푸터 메뉴바-->
			<div class="col-lg-6">
				<a href='www.naevr.com' class="menuitem"
					style="text-decoration: none;">
					<p class="text-center">Copyright © 2017 by HAXCORE</p>
				</a>
			</div>
			<div class="col-lg-6">
				<a href='#' class="menuitem" style="text-decoration: none;">
					<p class="text-center">서울시 금천구 가산동</p>
				</a>
			</div>
		</div>
	</div>
</section>
<!--푸터끝-->

<script>
window.onload = function () {
    $("#pluscoin").click(function () {
        var iframeObj = $("#ifm").get(0);
        var iframeDocument = iframeObj.contentWindow || iframeObj.contentDocument;
        iframeDocument.pluscoin();
    });
    var allcookies = document.cookie;
	
    cookiearray  = allcookies.split(';');

    // Now take key value pair out of this array

    for(var i=0; i<cookiearray.length; i++){

       name = cookiearray[i].split('=')[0];

       value = cookiearray[i].split('=')[1];

       alert("키 : " + name + " , 값 : " + value);

    }



}

</script>