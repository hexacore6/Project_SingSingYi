<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath }/resources/css/main.css">
    <!-- Bootstrap 3.3.4 -->
    <link href="<%=application.getContextPath() %>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="<%=application.getContextPath() %>/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
    
    <!-- jQuery 2.1.4 -->
    <script src="<%=application.getContextPath() %>/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    
<meta charset="utf-8">
<title>readPage</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<!-- handlebars template -->
<script id="template" type="text/x-handlebars-template">
            {{#each .}}
               <li class="replyLi" data-rno={{rid}}>
                  <i class="fa fa-comments bg-blue"></i>
                  <div class="timeline-item">
                     <span class="time">
                        <i class="fa fa-clock-o"></i>{{prettifyDate rregdate}}
                     </span>
                     <h3 class="timeline-header"style="text-align: left;"><strong>{{rid}}</strong> -{{id}}</h3>
                    <div class="timeline-body"style="text-align: left;">{{rcontent}} </div>
                     <div class="timeline-footer" style="text-align: left;">
					 {{#eqReplyer id}}
                        <a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">댓글 관리</a>
					 {{/eqReplyer}}
                     </div>
                  </div>
               </li>
            {{/each}}
         </script>
         <style type="text/css">
         .timeline:before {
         background-color: none;
         }
         .timeline:before{
         background-color: white;
         }
         </style>
</head>




<body>
  <!-- Main content -->
  <%@include file="../include/header.jsp"%>
  
  <section id="content" class="container">
    <div class="row">
      <!-- left column -->
      <div class="col-md-12">
        <!-- general form elements -->
        <div class="box" >
          <div class="box-header with-border">
            <h3 class="box-title" style="text-align: left;">READ BOARD</h3>
          </div>

          <form role="form" action="" method="post">
            <input type="hidden" name="bid" value="${article.bid}"> 
            <input type="hidden" name="aid" value="${article.aid}"> 
            <input type="hidden" name="page" value="${cri.page}"> 
            <input type="hidden" name="perPageNum" value="${cri.perPageNum}"> 
            <input type="hidden" name="searchType" value="${cri.searchType}"> 
            <input type="hidden" name="keyword" value="${cri.keyword}">
          </form>

          <div class="box-body"style="text-align: left;">
            <div class="form-group">
              <label for="exampleInputEmail1">Title</label> <input type="text" name="title" class="form-control" value="${article.atitle}" readonly />
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Content</label>
              <textarea name="content" class="form-control" rows="3" readonly>${article.acontent}</textarea>
            </div>
            <div class="form-group">
              <label for="exampleInputEmail1">Writer</label> <input type="text" name="writer" class="form-control" value="${article.id}" readonly />
            </div>
          </div>
          <!-- /.box-body -->
          
          <div class="box-footer">
          <c:if test="${login.id == article.id }">
              <c:if test="${article.bid == 1 }">
               <button type="submit" class="btn btn-warning" id="qnaModifyBtn">QnA 수정</button>
               <button type="submit" class="btn btn-danger" id="qnaRemoveBtn">QnA 삭제</button>
              </c:if>
              <c:if test="${article.bid == 2 }">
               <button type="submit" class="btn btn-warning" id="noticeModifyBtn">공지사항 수정</button>
               <button type="submit" class="btn btn-danger"  id="noticeRemoveBtn">공지사항 삭제</button>
              </c:if>
          </c:if>
           <c:if test="${article.bid == 1 }">
            <button type="submit" class="btn btn-primary" id="qnaListBtn">QnA 목록</button>
           </c:if>
           <c:if test="${article.bid == 2 }">
            <button type="submit" class="btn btn-primary" id="noticeListBtn">공지사항 목록</button>
           </c:if>
          </div>

          <!-- /.box-footer -->
        </div>

        <!-- Reply -->
        <div class="box box-success">

          <div class="box-header" style="text-align: left;">
            <h3 class="box-title">ADD NEW REPLY</h3>
          </div>
        
   <!-- if START -->
        <c:if test="${not empty login}">
          <div class="box-body" style="text-align: left;">
            <label for="exampleInputEmail1">Writer</label> 
            <input class="form-control" type="text" placeholder="USER ID" id="newReplyWriter" value="${login.id }" readonly="readonly"> 
            <label for="exampleInputEmail1">ReplyText</label>
            <input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText">
          </div>
          <!-- /.box-body -->

          <div class="box-footer">
            <button type="submit" class="btn btn-info" id="replyAddBtn">댓글 등록</button>
          </div>
          <!-- /.box-footer -->
        </c:if>
          
          <!-- if END --> 
          
          <c:if test="${empty login }">
            <div class="box-body">
              <div><a href="javascript:goLogin();"> 로그인을 해주세요.</a></div>
            </div>
          </c:if>

        </div>
          <!--  reply END -->
          
        <!-- The time line -->
        <ul class="timeline">
          <!-- timeline time label -->
          <li class="time-label" id="repliesDiv"><span class="bg-green">댓글 목록</span></li>
        </ul>
        
         <div class="text-center">
          <ul id="pagination" class="pagination pagination-sm no-margin">

          </ul>
        </div>
      </div>
      <!-- /.col(left) -->
    </div>
    <!-- /.row -->
  </section>

        <!-- Modal -->
        <div id="modifyModal" class="modal modal-primary fade" role="dialog">
          <div class="modal-dialog">
            <!-- Modal content -->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"></h4>
              </div>
              <div class="modal-body" data-rno>
                <p>
                  <input type="text" id="rcontent" class="form-control">
                </p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-info" id="replyModBtn">댓글 수정</button>
                <button type="button" class="btn" id="replyDelBtn">댓글 삭제</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
              </div>
            </div>
          </div>
        </div> 
        <!-- Modal END -->


  <!-- /.content -->
  
    <!-- Bootstrap 3.3.2 JS -->
    <script src="/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='/resources/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="/resources/dist/js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="/resources/dist/js/demo.js" type="text/javascript"></script>
    
  <%@include file="../include/footer.jsp"%>
  
    
    
  <script>

				var formObj = $("form[role='form']");

				console.log(formObj);
				
				
				//QnA 수정 버튼
				$("#qnaModifyBtn").on("click", function() {
					formObj.attr("action", "/board/qnamodifypage");
					formObj.attr("method", "get");
					formObj.submit();
				});
				//공지사항 수정 버튼
				$("#noticeModifyBtn").on("click", function() {
					formObj.attr("action", "/board/noticemodifypage");
					formObj.attr("method", "get");
					formObj.submit();
				});
				//QnA 리스트 버튼
				$("#qnaListBtn").on("click", function() {
					formObj.attr("method", "get");
					formObj.attr("action", "/board/list");
					formObj.submit();
				});
				//공지사항 리스트 버튼
				$("#noticeListBtn").on("click", function() {
					formObj.attr("method", "get");
					formObj.attr("action", "/board/nlist");
					formObj.submit();
				});
				//QnA 삭제 버튼
				$("#qnaRemoveBtn").on("click", function() {
					formObj.attr("action", "/board/qnaRemovePage");
					formObj.submit();
	             });
				//공지사항 삭제 버튼
				$("#noticeRemoveBtn").on("click", function() {
					formObj.attr("action", "/board/noticeRemovePage");
					formObj.submit();
	             });


			// Replies List 버튼 클릭 시 이벤트
			$("#repliesDiv").on("click", function() {
				if ($(".timeline li").size() > 1) {
					return;
				}
				getPage("/replies/" + aid + "/1");
			});

			// 댓글 페이징 이벤트 처리
			$(".pagination").on("click", "li a", function(event) {
        		event.preventDefault();
        		
        		replyPage = $(this).attr("href");
        		
        		getPage("/replies/" + aid + "/" + replyPage);
        	});

			// 댓글 등록의 이벤트 처리
			$("#replyAddBtn").on("click", function() {
				var replyerObj = $("#newReplyWriter");
				var replytextObj = $("#newReplyText");
				var id = replyerObj.val();
				var rcontent = replytextObj.val();

				$.ajax({
					type : 'post',
					url : '/replies/',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						bid : bid,
						aid : aid,
						id : id,
						rcontent : rcontent
					}),
					success : function(result) {
						console.log("result : " + result);
						if (result == 'SUCCESS') {
							alert("등록 되었습니다");
							replyPage = 1;
							getPage("/replies/" + aid + "/" + replyPage);
							//replyerObj.val("");
							replytextObj.val("");
						}
					}
				});
			}); // ajax END

			// 각 댓글의 버튼 이벤트 처리
			$(".timeline").on("click", ".replyLi", function(event) {
				var reply = $(this);

				$("#rcontent").val(reply.find('.timeline-body').text());
				$(".modal-title").html(reply.attr("data-rno"));
			});

			// 각 댓글의 수정 버튼
			$("#replyModBtn").on("click", function() {
				var rid = $(".modal-title").html();
				var rcontent = $("#rcontent").val();

				$.ajax({
					type : 'put',
					url : '/replies/' + rid,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "PUT"
					},
					data : JSON.stringify({
						rcontent : rcontent
					}),
					dataType : 'text',
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							alert("수정 되었습니다.");
							getPage("/replies/" + aid + "/" + replyPage);
						}
					}
				});
			});

			// 각 댓글의 삭제 버튼
			$("#replyDelBtn").on("click", function() {

				var rid = $(".modal-title").html();
				var rcontent = $("#rcontent").val();

				$.ajax({
					type : 'delete',
					url : '/replies/' + rid,
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "DELETE"
					},
					dataType : 'text',
					success : function(result) {
						console.log("result: " + result);
						if (result == 'SUCCESS') {
							alert("삭제 되었습니다.");
							getPage("/replies/" + aid + "/" + replyPage);
						}
					}
				});
			});

			// handlebars
			Handlebars.registerHelper("prettifyDate", function(timeValue) {
				var dateObj = new Date(timeValue);
				var year = dateObj.getFullYear();
				var month = dateObj.getMonth() + 1;
				var date = dateObj.getDate();

				return year + "/" + month + "/" + date;
			});
			// handlebars2
			//댓글 목록 로그인 관계없이 접근, 수정삭제 작업은 로그인한 사용자
			Handlebars.registerHelper("eqReplyer", function(id, block){
				var accum ='';
				if(id == '${login.id}'){
					accum += block.fn();
				}
				return accum;
			});

			var printData = function(replyArr, target, templateObject) {
				var template = Handlebars.compile(templateObject.html());

				var html = template(replyArr);
				$(".replyLi").remove();
				target.after(html);
			}

			// helper
			var aid = ${article.aid};
			var bid = ${article.bid};
			var replyPage = 1;

			function getPage(pageInfo) {

				$.getJSON(pageInfo, function(data) {
					printData(data.list, $("#repliesDiv"), $('#template'));
					printPaging(data.pageMaker, $(".pagination"));

					$("#modifyModal").modal('hide');
				});
			}

			var printPaging = function(pageMaker, target) {

				var str = "";
				
				if(pageMaker.prev) {
					str += "<li><a href='" + (pageMaker.startPage - 1) + "'> << </a></li>";
				}
				
				for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++) {
					var strClass = pageMaker.cri.page == i? 'class=active' : '';
					str += "<li " + strClass + "><a href='" + i + "'>" + i + "</a></li>";
				}
				
				if(pageMaker.next) {
					str += "<li><a href='" + (pageMaker.endPage + 1) + "'> << </a></li>";
				}
				
				target.html(str);
			};

		</script>


</body>
</html>

