<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>register</title>

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
                     <h3 class="timeline-header"><strong>{{rid}}</strong> -{{id}}</h3>
                    <div class="timeline-body">{{rcontent}} </div>
                     <div class="timeline-footer">
					 {{#eqReplyer id}}
                        <a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#modifyModal">댓글 관리</a>
					 {{/eqReplyer}}
                     </div>
                  </div>
               </li>
            {{/each}}
         </script>
</head>




<body>
  <!-- Main content -->
  <%@include file="../include/header.jsp"%>
  
  <section class="content">
    <div class="row">
      <!-- left column -->
      <div class="col-md-12">
        <!-- general form elements -->
        <div class="box">
          <div class="box-header with-border">
            <h3 class="box-title">READ BOARD</h3>
          </div>

          <form role="form" action="" method="post">
            <input type="hidden" name="bid" value="${article.bid}"> 
            <input type="hidden" name="aid" value="${article.aid}"> 
            <input type="hidden" name="page" value="${cri.page}"> 
            <input type="hidden" name="perPageNum" value="${cri.perPageNum}"> 
            <input type="hidden" name="searchType" value="${cri.searchType}"> 
            <input type="hidden" name="keyword" value="${cri.keyword}">
          </form>

          <div class="box-body">
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
          <c:if test="${login.userid == article.id }">
            <button type="submit" class="btn btn-warning" id="modifyBtn">수정</button>
            <button type="submit" class="btn btn-danger"  id="removeBtn">삭제</button>
          </c:if>
            <button type="submit" class="btn btn-primary" id="goListBtn">목록</button>
          </div>

          <!-- /.box-footer -->
        </div>

        <!-- Reply -->
        <div class="box box-success">

          <div class="box-header">
            <h3 class="box-title">ADD NEW REPLY</h3>
          </div>
        
        <!-- if START -->
          <div class="box-body">
            <label for="exampleInputEmail1">Writer</label> 
            <input class="form-control" type="text" placeholder="USER ID" id="newReplyWriter"> 
            <label for="exampleInputEmail1">ReplyText</label>
            <input class="form-control" type="text" placeholder="REPLY TEXT" id="newReplyText">
          </div>
          <!-- /.box-body -->

          <div class="box-footer">
            <button type="submit" class="btn btn-info" id="replyAddBtn">댓글 등록</button>
          </div>
          <!-- /.box-footer -->
          
          <!-- if END --> 

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
  <%@include file="../include/footer.jsp"%>
  
  <script>
			$(document).ready(function() {

				var formObj = $("form[role='form']");

				console.log(formObj);

				$(".btn-warning").on("click", function() {
					formObj.attr("action", "/sboard/modifyPage");
					formObj.attr("method", "get");
					formObj.submit();
				});

				$(".btn-primary").on("click", function() {
					formObj.attr("method", "get");
					formObj.attr("action", "/sboard/list");
					formObj.submit();
				});
				
				//게시물 삭제
				$("#removeBtn").on("click", function() {
					formObj.attr("action", "/sboard/removePage");
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
				accum += block.fn();

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

		});
		</script>


</body>
</html>

