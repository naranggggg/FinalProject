<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>작은농장</title>

<!-- Favicon -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">

<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- alert창 꾸미기 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.updateButton, .deleteButton, .updateRbutton, .deleteRbutton,
	.reportButton {
	width: 100%;
	height: 50px;
	border: none;
	outline: none;
	background-color: white;
}

.updateButton:hover, .deleteButton:hover, .updateRbutton:hover,
	.deleteRbutton:hover, .reportButton:hover {
	width: 100%;
	height: 50px;
	border: none;
	outline: none;
	background-color: #ebebe9;
}

#updateRbutton {
	display: none;
}

#replyBtn, .boardAllModal {
	border: none;
	outline: none;
	background-color: white;
}

.modal-content {
	margin-top: 300px;
}

#originContent {
	width: 600px;
	height: auto;
	word-wrap: break-word;
}

.reply-report-btn {
	margin-right: 10px;
	color: #b7b7b7;
}

.reply-report-btn:hover {
	cursor: pointer;
	color: #FF6C30;
}

.reply-report-div {
	width: 100%;
	display: flex;
	justify-content: flex-end;
}

.post-content {
	width: 100%;
	word-wrap: break-word;
}

.ffbtn {
	display: flex;
	justify-content: space-around;
}

.modal-content {
	margin-top: 300px;
}
.replyInsertBtn{
	width: 120px;
	height: 36px;
	background-color: #70c745;
	color: white;
	border: none;
	font-weight: bold;
}
.replyInsertBtn:focus{
	outline: none;
}
.replyInsertBtn:hover{
	background-color: white;
	color: #70c745;
	border-style: solid;
	border-width: 1px;
	border-color: #70c745;
	transition-duration: 400ms;
}
#shareTag{
	display: flex;
    justify-content: flex-end;
    align-items: flex-end;
}
.link-icon {
	position: relative;
	display: inline-block;
	width: auto;
	font-size: 14px;
	font-weight: 500;
	color: #333;
	margin-right: 10px;
	padding-right:40px;
	padding-top: 40px;
	margin-top: -70px;
}
			
.link-icon.kakao {
	background-image:
	url("resources/img/icon/icon-kakao.png");
	background-repeat: no-repeat;
}
			
.link-icon.twitter {
	background-image:
	url("resources/img/icon/icon-twitter.png");
	background-repeat: no-repeat;
}
			
.link-icon.link {
	background-image:
	url("resources/img/icon/icon-link.png");
	background-repeat: no-repeat;
}
</style>



</head>

<body>
	<%@include file="../common/header.jsp"%>

	<!-- 상단 시작  -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>이야기 공간</h2>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/tinyfarm"><i class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="moveList.bo">이야기해요</a></li>
							<li class="breadcrumb-item active" aria-current="page">이야기공간</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 끝 -->

	<!-- 게시물 세부사항 영역 -->
	<section class="blog-content-area section-padding-0-100">
		<div class="container">
			<div class="row justify-content-center">
				<!-- Blog Posts Area -->
				<div class="col-12 col-md-8">
					<div class="blog-posts-area">
						<!-- Post Details Area -->
						<div class="single-post-details-area">
							<div class="post-content">
								<h4 class="post-title">${boardInfo.boardTitle }</h4>
								<div class="post-meta mb-30">
									<a href="#" id="boardCreateDate"><i class="fa fa-clock-o" aria-hidden="true"></i></a>
									<a href="#"><i class="fa fa-user" aria-hidden="true"></i> ${boardInfo.boardWriter }</a>
									<!-- 수정 /삭제 버튼  -->
									<button type="button" data-toggle="modal" data-target="#myModal" class="boardAllModal" style="outline: none;">
										<img src="resources/img/icon/dots.png" style="width: 25px; height: 25px;">
									</button>
								</div>
								<div class="post-thumbnail mb-30">
									<img src="${boardInfo.titleImg }" alt="">
								</div>
								<p>${boardInfo.boardContent }</p>
							</div>
						</div>

						
						<!-- 해시태그 -->
						<div class="post-tags-share d-flex justify-content-between align-items-center">
							<!-- Tags -->
							<ol class="popular-tags d-flex align-items-center flex-wrap hashTagOl">
								<li><span>Tag:</span></li>
							</ol>
						</div>
						<div id="shareTag">
							<a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();" style = "margin-left:5px"></a>
							<a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();"></a>
							<a id="btnlink" class="link-icon link" href="javascript:shareLink();"></a>	
						</div>
						<!-- 댓글창 -->
						<div class="leave-comment-area clearfix">
							<div class="comment-form">
								<h4 class="headline">
									<span id="rcount"></span> Comments
								</h4>

								<div class="contact-form-area">
									<div class="row">
										<div class="col-12">
											<div class="form-group">
												<textarea class="form-control" name="replyContent" id="replyContent" cols="30" rows="10" style="resize: none;" placeholder="Comment"></textarea>
											</div>
										</div>
										<div class="col-12">
											<button type="submit" class="replyInsertBtn " id="insertRbutton">댓글 작성</button>
											<button type="submit" class="btn alazea-btn" id="updateRbutton">댓글 수정</button>
										</div>
									</div>
								</div>
							</div>

							<div class="comment_area clearfix">
								<ol>
									<li class="single_comment_area"></li>
								</ol>
							</div>

						</div>

					</div>
				</div>

				<!-- 사이드바 -->
				<div class="col-12 col-sm-9 col-md-4">
					<div class="post-sidebar-area">
						<div class="single-widget-area">
							<div class="author-widget">
								<div class="author-thumb-name d-flex align-items-center">
									<div class="author-thumb">
										<img src="${boardInfo.profile}" alt="${boardInfo.profile}">
									</div>
									<div class="author-name">
										<h5>${boardInfo.userName }</h5>
										<p>${boardInfo.email }</p>
									</div>
								</div>
								<br>
								<p>
									"안녕하세요! 나는 '${boardInfo.userName}'이라고 해요.<br>여러분과 소통하며 새로운
									친구들을 만나고 싶어요!"
								</p>

								<c:choose>
									<c:when test="${isFollow eq 1}">
										<form action="deleteFollow.fw">
											<input type="hidden" name="userNo" value="${loginUser.userNo }"> <input type="hidden" name="followingId" value="${boardInfo.boardWriter}">
											<input type="hidden" name="boardNo" value="${boardInfo.boardNo}">

											<c:choose>
												<c:when test="${loginUser.userId eq boardInfo.boardWriter }">
												</c:when>
												<c:otherwise>
													<div class="ffbtn">
														<button type="submit" class="btn alazea-btn" id="unfollowBtn">팔로우끊기</button>
														<img src="resources/img/icon/profileModal.png" id="profileModal" style="width: 50px; height: 50px;">
													</div>
												</c:otherwise>
											</c:choose>
										</form>
									</c:when>
									<c:otherwise>
										<form action="insertFollow.fw">
											<input type="hidden" name="userNo" value="${loginUser.userNo }"> <input type="hidden" name="followingId" value="${boardInfo.boardWriter}">
											<input type="hidden" name="boardNo" value="${boardInfo.boardNo}">

											<c:choose>
												<c:when test="${loginUser.userId eq boardInfo.boardWriter }">
												</c:when>
												<c:otherwise>
													<div class="ffbtn">
														<button type="submit" class="btn alazea-btn" id="followBtn">팔로우</button>
														<img src="resources/img/icon/profileModal.png" id="profileModal" style="width: 50px; height: 50px;">
													</div>
												</c:otherwise>
											</c:choose>
										</form>
									</c:otherwise>
								</c:choose>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 게시물 세부사항 영역 끝 -->

	<!-- 게시글 수정/삭제/신고 모달 -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">더보기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<c:choose>
					<c:when test="${boardInfo.boardWriter eq loginUser.userId }">
						<!-- Modal body -->
						<div class="modal-body">
							<div class="buttonContent">
								<button class="updateButton" onclick="location.href='moveUpdate.bo?boardNo=${boardInfo.boardNo}'" style="outline: none;">수정하기</button>
								<br>
								<form action="delete.bo" method="post">
									<input type="hidden" name="boardNo" value="${boardInfo.boardNo }">
									<button class="deleteButton" type="submit" style="outline: none;">삭제하기</button>
								</form>
							</div>
						</div>
					</c:when>
					<c:when test="${loginUser.userId eq 'admin'}">
						<!-- Modal body -->
						<div class="modal-body">
							<div class="buttonContent">
								<form action="delete.bo" method="post">
									<input type="hidden" name="boardNo" value="${boardInfo.boardNo }">
									<button class="deleteButton" type="submit" style="outline: none;">삭제하기</button>
								</form>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<!-- Modal body -->
						<div class="modal-body">
							<div class="buttonContent">
								<form action="moveReport.bo" method="post">
									<input type="hidden" name="boardNo" value="${boardInfo.boardNo }"> 
									<input type="hidden" name="userNo" value="${loginUser.userNo }">
									<button class="reportButton" style="outline: none;">신고하기</button>
								</form>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<!-- 댓글 수정/삭제/신고 모달 -->
	<div class="modal" id="replyModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">더보기</h4>
					<button type="button" class="close closeReply" data-dismiss="modal">&times;</button>
				</div>
				<!-- Modal body -->
				<div class="modal-body">
					<div class="replyBody">
						<input id="hiddenRno" type="hidden"> 
						<input id="hiddenRContent" type="hidden">
						<c:choose>
							<c:when test="${loginUser.userId eq 'admin' }">
								<button type="button" class="deleteRbutton" onclick="deleteReply(this);" style="border: none; outline: none;">삭제하기</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="updateRbutton" onclick="updateReply(this);" style="border: none; outline: none;">수정하기</button>
								<button type="button" class="deleteRbutton" onclick="deleteReply(this);" style="border: none; outline: none;">삭제하기</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/member/memberModal.jsp"></jsp:include>
	<jsp:include page="../common/footer.jsp"></jsp:include>



	<script>
	<!-- 해시태그 -->
	  var hashTags = ${boardInfo.hashTag};
	    
	  for (var i = 0; i < hashTags.length; i++) {
		    var liArea = $("<li></li>");
		    var aArea = $("<a id='hashTag'></a>");	  	  
	        var value = hashTags[i].value;   
	        aArea.text(hashTags[i].value);
	        liArea.append(aArea);

	        $(".hashTagOl").append(liArea);       
	    }
	
	</script>
	
	<script>
	
	
	//댓글 리스트조회
    function replyList(){
        $.ajax({
            url: "boardReplyList.bo",
            data : {
                    boardNo: ${boardInfo.boardNo}
                    },
            success: function(result){
                
                $(".single_comment_area").empty();  
                
                for(var i in result) {

                   var loginUserId = "${loginUser.userId}";
                   var wraperDiv = $("<div class='comment-wrapper d-flex'></div>");
                   var profileDiv = $("<div class='comment-author'></div>");
                   var commentContent = $(" <div class='comment-content'></div>");
                   var inConmmentContent = $("<div class='d-flex align-items-center justify-content-between'></div>");
                   var profileStr = $("<img>");
                   var replyWriterStr = $("<h5></h5>");
                   var replyCreateDate = $("<span class='comment-date'></span>");
                   var replyContentStr = $("<p id='originContent'></p>");
                  
                   if(loginUserId == result[i].replyWriter || loginUserId == "admin"){
                  	   var replyModalBtn = $("<button type='button' id='replyBtn' data-toggle='modal' data-target='#replyModal' style='border: none;' onclick='giveRno(this);'><img src='resources/img/icon/dots.png' id='replyImg' style='width: 20px; height: 20px;'></button>");
                   }else{
                	   var replyModalBtn = $("<button type='button' id='replyBtn' data-toggle='modal' data-target='#replyModal' style='border: none;' onclick='giveRno(this);'></button>");
                   }
                   var contentBetweenDiv = $("<div></div>");
                   var hiddenReplyNo = $("<input>");
                   
                   hiddenReplyNo.attr("type","hidden").attr("name","replyNo").attr("value",result[i].replyNo); 
                   profileStr.attr("src",result[i].profile);
                   replyWriterStr.text(result[i].replyWriter);
                   replyContentStr.text(result[i].replyContent);
                   
                   profileDiv.append(profileStr);
                   contentBetweenDiv.append(hiddenReplyNo).append(replyCreateDate).append(replyModalBtn)
                   inConmmentContent.append(replyWriterStr).append(contentBetweenDiv)
                   
                   	//시간: 방금전/몇분전/몇시간전/몇일전
		            var today = new Date();
			        var dateString = result[i].createDate; 
			        var dateParts = dateString.split(/[- :]/);
			        var timeValue = new Date(dateParts[0], dateParts[1] - 1, dateParts[2], dateParts[3], dateParts[4], dateParts[5]);

			        const timeDifference = today - timeValue; // 밀리초 단위의 차이
			        const seconds = Math.floor(timeDifference / 1000);
			        const minutes = Math.floor(seconds / 60);
			        const hours = Math.floor(minutes / 60);
			        const days = Math.floor(hours / 24);
		
			        let msg = "";
   
			        if (days > 0 && days <= 7) {
			            msg = days + "일 전";
			        } else if (days > 7) {
			            // 날짜 형식으로 표시
			            const year = timeValue.getFullYear();
			            const month = timeValue.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
			            const day = timeValue.getDate();
			            msg = year + ". " + month + ". " + day;
			        } else if (hours > 0) {
			            msg = hours + "시간 전";
			        } else if (minutes > 0) {
			            msg = minutes + "분 전";
			        } else {
			            msg = "방금 전";
			        }
			        replyCreateDate.text(msg);
                          
                   //승민 추가-------------------
                   if(loginUserId == result[i].replyWriter || loginUserId == "admin"){
	                   commentContent.append(inConmmentContent).append(replyContentStr);
                	   
                   }else {
                	   //승민 추가-------
                       var replyReportDiv = $("<div class='reply-report-div'></div>");
                       var replyReportBtn = $("<p class='reply-report-btn' onclick='reportReply(this);' '></p>").text("신고");
                       replyReportDiv.append(replyReportBtn);
                       //-------------
                	   commentContent.append(inConmmentContent).append(replyContentStr).append(replyReportDiv);
                   }
                   //승민추가 끝 ---------------------
                   wraperDiv.append(profileDiv).append(commentContent);
               
                   
               /* 	<div class='comment-wrapper d-flex'>
                       <div class='comment-author'>
                           <img src="">
                       </div>
                       <div class='comment-content'>
                           <div class='d-flex align-items-center justify-content-between'>
                               <h5>replyWriter</h5>
                               <div>
                                   <input type="hidden" name="replyNo" value="result[i].replyNo">
                                   <span class='comment-date'>createDate</span>
                                   <button type='button' id='replyBtn' data-toggle='modal' data-target='#replyModal' style='border: none;'><img src='resources/img/icon/dots.png' style='width: 10px; height: 10px;'></button>
                               </div>
                           </div>
                           <p>replyContent</p>
                       </div>
                   </div> */

                    $(".single_comment_area").append(wraperDiv);
                    
                }
                    
                    $("#rcount").text(result.length);
            },
            error: function(){
                console.log("통신오류");
            }
        });
    }
    
    
    //댓글모달창을 클릭할때 숨겨진 input요소에 클릭한 각각의 값 부여해주기
    function giveRno(el) {
    	
        var giveRno = $(el).parents().children().eq(0).val();
        var giveRContent = $(el).parents().parents().parents().children().eq(1).text();        
        $("#hiddenRno").attr("value",giveRno);
        $("#hiddenRContent").attr("value",giveRContent);
        
    } 

        $("#insertRbutton").click(function(){
            $.ajax({
                url: "insertReply.bo",
                data: {
                    replyContent : $("#replyContent").val(),
                    replyWriter : "${loginUser.userNo}", 
                    refBno : ${boardInfo.boardNo}
                    },
                success: function(result){
                    if(result>0){
                        swal("Success", "댓글 작성 성공!", "success");
                
                    }else{
                        swal("Error!", "이용에 불편을 줘서 죄송합니다.");
                    }
                    replyList();
                    $("#replyContent").val("");
                },
                error: function(){
                    console.log("댓글작성실패");
                }
            }); 
        });	

   //댓글수정버튼 클릭시 댓글수정 기능수행(swal이용)
   $("#updateRbutton").click(function(){
       var refRno = $("#hiddenRno").val();
        $.ajax({
            url: "updateReply.bo",
            data : {
                replyNo : refRno,
                replyContent : $("#replyContent").val()
            },
            success: function(result){
                if(result>0){
                    swal("Success", "댓글 수정 성공!", "success");
            
                }else{
                    swal("Error!", "이용에 불편을 줘서 죄송합니다.");
                }
                replyList(); //댓글 수정을 한 후 다시 댓글조회해오기
                $("#replyContent").val("");
                
            },
            error : function(){
                console.log("통신오류");
            }
        });
	});
	
   
   //댓글수정버튼 클릭시 다시 댓글게시버튼으로 바꾸기 
	$("#updateRbutton").click(function(){
		$("#updateRbutton").hide();
		$("#insertRbutton").show();
	});  
    


    function deleteReply(el) {
       
       var refRno = $("#hiddenRno").val(); //this함수를 사용했기에 클릭한 댓글rno가 뽑아짐
       
       $.ajax({
           url: "deleteReply.bo",
           data: {
               replyNo : refRno
               },
           success: function(result){
               if(result>0){
                    swal("Success", "댓글 삭제 성공!", "success");

                }else{
                    swal("Error!", "이용에 불편을 줘서 죄송합니다.");
                }
               replyList();
           },
           error: function(){
               console.log("통신오류");
           }
       }); 
		   $(".closeReply").click();
		   $(".modal-backdrop").remove();
   }
    
    
    
    function updateReply(el){
        var refRno = $("#hiddenRno").val();    
        var originContent=$("#hiddenRContent").val();
        var contentArea = document.getElementById("replyContent");
        contentArea.innerText = originContent;
        
        //모달창에서 수정하기버튼을 누르면 기존등록버튼 사라지고 수정버튼이 보여지기
        $("#insertRbutton").css({"display":"none"});
        $("#updateRbutton").css({"display":"block"});
        
 		
        $(".closeReply").click();
        $(".modal-backdrop").remove();
       
    }
	//승민 추가-----------
	function reportReply(el){
		var replyNo = $(el).parent().siblings("div").find("input[name='replyNo']").val();
		location.href = "moveReplyReport.bo?replyNo="+replyNo;
	}
	
	
	//팔로우버튼 클릭시 언팔로우 버튼으로 변경
	$("#followBtn").click(function(){
		var followBtn= $("#followBtn");
		followBtn.css("display","none");
	});
	
	//시간표시
	function time(){
			var today = new Date();
	        var dateString = "${boardInfo.createDate}"; 
	        var dateParts = dateString.split(/[- :]/);
	        var timeValue = new Date(dateParts[0], dateParts[1] - 1, dateParts[2], dateParts[3], dateParts[4], dateParts[5]); 

	        const timeDifference = today - timeValue; // 밀리초 단위의 차이
	        const seconds = Math.floor(timeDifference / 1000);
	        const minutes = Math.floor(seconds / 60);
	        const hours = Math.floor(minutes / 60);
	        const days = Math.floor(hours / 24);

	        let msg = "";

	        if (days > 0 && days <= 7) {
	            msg = days + "일 전";
	        } else if (days > 7) {
	            // 날짜 형식으로 표시
	            const year = timeValue.getFullYear();
	            const month = timeValue.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
	            const day = timeValue.getDate();

	            msg = year + ". " + month + ". " + day;
	        } else if (hours > 0) {
	            msg = hours + "시간 전";
	        } else if (minutes > 0) {
	            msg = minutes + "분 전";
	        } else {
	            msg = "방금 전";
	        }

	        $("#boardCreateDate").append(msg)
	}
	
	
	
	
	//사이드바에 있는 회원프로필 정보보는 모달창
    $("#profileModal").on('click', function () {
        let userId = "${boardInfo.boardWriter}";

    	
        // 모달 열기 및 정보 표시 함수 호출
        $.ajax({
            url: "getFollowingInfo.me",
            type: 'post',
            data: { followingId: userId }, //클릭한 회원 아이디로 정보 불러오기
            success: function (m) { 
                if(m.userId != null){//아이디가 존재하면
                    if(m.changeName == null){ //유저 프로필 사진 있으면
                        $("#profileImage").attr("src","resources/profile.jpg");
                    }else{//없으면 기본사진
                        $("#profileImage").attr("src",m.changeName);
                    }
                $("#userId").text(m.userId); //모달창에 아이디값 넣기
                $("#userName").text(m.userName); //이름
                $("#userGrade").text(m.grade); //등급
                //팔로우 여부 체크
                $(function(){
                    let followingId = $("#userId").text();
                    let userNo = ${loginUser.userNo};
                    $.ajax({
                        url : "followChk.me",
                        data : {
                            followingId : followingId,
                            userNo : userNo
                        },
                        success : function(result){
                            if(result=='YY'){
                                $("#followBtn").text("팔로우취소").attr("onclick","unfollow();");
                            }
                        },error : function(){
                            console.log("팔로우 확인 실패");
                        }
                    });
                });
                //모달창 실행
                $(".btn1").click();
                }
            }, error: function () {
                console.log('following modal ajax 통신실패');
             }
        });
    });
	
	
    function shareKakao() {
        // 사용할 앱의 JavaScript 키 설정
        Kakao.init('aef906bc476f983341072fc51f3c5b36');

        var currentProductNo = '${boardInfo.boardNo}';

        // 카카오링크 버튼 생성
        Kakao.Link.createDefaultButton({
          container: '#btnKakao', // 카카오공유버튼ID
          objectType: 'feed',
          content: {
            title: "작은농장", // 보여질 제목
            description: "${boardInfo.boardTitle}", // 보여질 설명
            imageUrl:"https://ifh.cc/g/yoKVMG.jpg", // 콘텐츠 URL
            link: {
               mobileWebUrl: 'http://localhost:8888/tinyfarm/detail.bo?boardNo=' + currentProductNo,
               webUrl: 'http://localhost:8888/tinyfarm/detail.bo?boardNo=' + currentProductNo
              }
            },
            social: {

          }
        });
      }
    function shareTwitter() {
   		var currentProductNo = '${boardInfo.boardNo}';
        var sendText = "작은농장"; // 전달할 텍스트
        var sendUrl = 'http://localhost:8888/tinyfarm/detail.bo?boardNo=' + currentProductNo; // 전달할 URL
        window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
    }
   
    function shareLink(){
    	var currentProductNo = '${boardInfo.boardNo}';
        
        var url = 'http://localhost:8888/tinyfarm/detail.bo?boardNo=' + currentProductNo;
        
        var textarea = document.createElement("textarea");
        document.body.appendChild(textarea);
        textarea.value = url;
        textarea.select();
        document.execCommand("copy");
        document.body.removeChild(textarea);
        
        alert("링크가 복사되었습니다");
    };
    </script>
    


 <script>
   //상세게시물에 댓글 불러오기
   $(function(){  
       replyList();
   	   time();
   });
</script>


		<!-- 카카오 공유하기 -->
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

	<!-- ##### All Javascript Files ##### -->
	<!-- jQuery-2.2.4 js -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script src="js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script src="js/active.js"></script>
</body>

</html>