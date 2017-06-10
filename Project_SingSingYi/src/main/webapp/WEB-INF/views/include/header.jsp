<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
                      <iframe src="http://192.168.0.63:3000/client" style="width: 200px;height: 200px; margin-left: 250px;"></iframe>
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
<!--해더END-->
<!--부모창 제어-->
<script>
mypage = function () {
    window.location.href="http://localhost/mypage/sharing";
}
</script>
