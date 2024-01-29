<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<!-- Title -->
<title>나의 활동내역</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">
<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">
<link rel="stylesheet" href="resources/jisu/css/mypage.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<style>
table {
	width: 100%;
	height: 100%;
	text-align: center;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	border-radius: 5px;
}

thead {
	font-weight: bold;
	color: #fff;
	background-color: #70c745;
}

.single-widget-area .widget-title {
	width: 100%;
	position: relative;
	margin-left: 10%;
}

#boardList>table thead tr:hover, #replyList>table thead tr:hover,
	#followingTableContainer>table thead tr:hover, #followerTableContainer>table thead tr:hover
	{
	cursor: default;
}

#boardList>table tbody tr:hover, #replyList>table tbody tr:hover,
	#followingTableContainer>table tbody tr:hover, #followerTableContainer>table tbody tr:hover
	{
	cursor: pointer;
	background-color: #e9f0e6;
}

.page-item.current-page a {
	background-color: #70c745;
}

#boardCount, #replyCount {
	font-size: 13px;
}

#followingCount, #followerCount {
	font-weight: lighter;
}

thead, tbody tr{
	height: 40px
}
#titleTd, #reTd{
	max-width: 440px;
	overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
}
#fiTd, #fwTd{
	max-width: 250px;
	overflow:hidden;
    text-overflow:ellipsis;
    white-space:nowrap;
}

</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/member/memberModal.jsp"></jsp:include>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <!-- ##### nav 그림 + 페이지 설명 ##### -->

    
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>활동내역</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/tinyfarm"><i class="fa fa-home"></i>작은농장</a></li>
						<li class="breadcrumb-item"><a href="mypage.me">마이페이지</a></li>
						<li class="breadcrumb-item"><a href="active.me">활동내역</a></li>
						
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
    <!-- 활동내역 -->
    <section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-8">
                    <div class="row">
                    	<div id="boardList">
                    		<div class="widget-title">
                                <h4>게시글 <span id="boardCount"></span></h4>
                            </div>
                            <!-- 게시글 테이블 -->
                    		<table>
                    			<thead>
                    				<tr>
                    					<td style="width: 10%">글번호</td>
                    					<td style="width: 50%">제목</td>
                    					<td style="width: 20%">작성일</td>
                    					<td style="width: 10%">조회수</td>
                    					<td style="width: 10%">좋아요</td>
                    				</tr>
                    			</thead>
                    			<tbody>
                    				<!-- 게시글 리스트 영역 -->
                    			</tbody>
                    		</table>
                    		<!-- 게시글 페이징바 -->
                    		<div id="boardPageArea" class="pagingArea">
								<ul class="pagination" id="boPage">
									<!-- 페이지 영역 -->
								</ul>
							</div>
                    	</div>
                    	
                    	<div id="replyList">
                    		<div class="widget-title">
                                <h4>댓글 <span id="replyCount"></span></h4>
                            </div>
                            <!-- 댓글 테이블 -->
                    		<table>
                    			<thead>
                    				<tr>
                    					<td style="width: 10%">글번호</td>
                    					<td style="width: 70%">댓글내용</td>
                    					<td style="width: 20%">작성일</td>
                    				</tr>
                    			</thead>
                    			<tbody>
                    				<!-- 댓글 리스트 영역 -->
                    			</tbody>
                    		</table>
                    		<!-- 댓글 페이징바 -->
                    		<div id="replyPageArea" class="pagingArea">
								<ul class="pagination" id="rePage">
									<!-- 댓글 페이지 영역 -->
								</ul>
							</div>
                    	</div>
                    </div>
                </div>
                <!-- 팔로우목록 -->
                <div class="col-12 col-md-4">
                    <div class="post-sidebar-area">
                        <div class="single-widget-area">
                            <div id="follow">
                            <div class="widget-title">
                                <h4>Follow List</h4>
                            </div>
                            	<div class="pagination-container">
                            		<div id="fiPrePage">
                            		</div>
        								<div id="followingTableContainer">
		                            	 <table id="following">
											<thead>
												<tr>
													<td>Following List&nbsp;&nbsp;[&nbsp;<span id="followingCount"></span>&nbsp;]</td>
												</tr>
											</thead>
											<tbody>
											</tbody>
										 </table>
										</div>
									<div id="fiNextPage">
										
									</div>
   								</div>
   								<br>
   								<div class="pagination-container">
        							<div id="fwPrePage">
                            		</div>
        								<div id="followerTableContainer">
		                            	 <table id="follower">
											<thead>
												<tr>
													<td>Follower List&nbsp;&nbsp;[&nbsp;<span id="followerCount"></span>&nbsp;]</td>
												</tr>
											</thead>
											<tbody>
											</tbody>
										 </table>
										</div>
									<div id="fwNextPage">
										
									</div>
   								</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <script>
    	let myId = "${loginUser.userId}"; //로그인한 회원 아이디
	    let curPage = 0;
	    let startPage = 0;
	    let endPage = 0;
		let maxPage0;
	    	
		// 게시글 테이블의 날짜 포맷팅
		function formatDateForBoard(dateString) {
		    return moment(dateString).format("YYYY-MM-DD");
		}

		// 댓글 테이블의 날짜 포맷팅
		function formatDateForReply(dateString) {
		    return moment(dateString).format("YYYY-MM-DD");
		}
		
    	//게시글 영역
	    function loadBoardPage(page){ //페이지 로드 할 함수
	    	$.ajax({
	    		url : "boardPage.me",
	    		type: "post",
	    		data : {
	    			userId : myId,
	    			currentPage : page
	    		},
	    		success : function(result){
	    			curPage = result.bPi.currentPage;
	    			startPage = result.bPi.startPage;
	    			endPage = result.bPi.endPage;
	    			maxPage = result.bPi.maxPage;
	    			let bList = result.bList;
	    			let count = result.bPi.listCount;
	    			let str = ""; //게시글
	    		    let pStr = ""; //페이징 
	    		    let nStr = ""; //다음페이지
	    		    
	    			//게시글 리스트 추가해주기위한 작업
	    			if(bList.length == 0){
	    				str += "<tr>"
		    				+ "<td colspan='5'>게시글이 존재하지 않습니다.</td>"
		    				+ "</tr>";
	    			}else{
		    			$.each(bList, function(key, b){
		    				let date = new Date(b.createDate);
		    				str += '<tr onclick="location.href=\'detail.bo?boardNo=\' + '+b.boardNo+'">'  //클릭시 해당 게시글로 이동
			    				+ "<td>"+b.boardNo+"</td>"
			    				+ "<td id='titleTd'>"+b.boardTitle+"</td>"
			    				+ "<td>"+formatDateForBoard(b.createDate)+"</td>"
			    				+ "<td>"+b.count+"</td>"
			    				+ "<td>"+b.likeCount+"</td>"
			    				+ "</tr>";
		    			});
	    			}
	    			$("#boardList tbody").html(str); //게시글 리스트 띄워주기
	    			$("#boardList #boardCount").html(count+"개"); //게시글 수 띄워주기
	    			
	    			//페이징 처리
	    			if(startPage==1){ //시작이 1이면 이전버튼 비활성
	    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">이전</a></li>';
	    			}else{
	    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadBoardPage('+(startPage-5)+')">이전</a></li>';
	    			}
		    		for(var i=startPage; i<endPage+1; i++){
		    			if (i==curPage) { //현재페이지일때 current-page class 추가
		    		        pStr += '<li class="page-item current-page"><a class="page-link" href="javascript:void(0)" onclick="loadBoardPage('+i+')">'+i+'</a></li>';
		    		    } else {
		    		        pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadBoardPage('+i+')">'+i+'</a></li>';
		    		    }
		    		}
		    		if(endPage>=maxPage){ //마지막페이지가 최대페이지보다 크면 다음버튼 비활성
		    			pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">다음</a></li>';
		    		}else{
	    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadBoardPage('+(startPage+5)+')">다음</a></li>';
		    		}
	    			$("#boardPageArea>#boPage").html(pStr);
	    		},error : function(){
	    			console.log("내가 쓴 글 ajax 통신 실패");
	    		}
	    	});
	    }
	    
	    //댓글 영역
	    function loadReplyPage(page){ //페이지 로드 할 함수
	    	$.ajax({
	    		url : "replyPage.me",
	    		type: "post",
	    		data : {
	    			userId : myId,
	    			currentPage : page
	    		},
	    		success : function(result){
	    			curPage = result.rPi.currentPage;
	    			startPage = result.rPi.startPage;
	    			endPage = result.rPi.endPage;
	    			maxPage = result.rPi.maxPage;
	    			let rList = result.rList;
	    			let count = result.rPi.listCount;
	    			let str = ""; //게시글
	    		    let pStr = ""; //페이징 
	    			
	    			//게시글 리스트 추가해주기위한 작업
	    			if(rList.length == 0){
	    				str += "<tr>"
		    				+ "<td colspan='6'>댓글이 존재하지 않습니다.</td>"
		    				+ "</tr>";
	    			}else{
		    			$.each(rList, function(key, r){
		    				str += '<tr onclick="location.href=\'detail.bo?boardNo=\' + '+r.refBno+'">'
			    				+ "<td>"+r.refBno+"</td>"
			    				+ "<td id='reTd'>"+r.replyContent+"</td>"
			    				+ "<td>"+formatDateForReply(r.createDate)+"</td>"
			    				+ "</tr>";
		    			});
	    			}
	    			$("#replyList tbody").html(str); //댓글 리스트 띄워주기
	    			$("#replyList #replyCount").html(count+"개"); //댓글 수 띄워주기
	    			
	    			//페이징 처리
	    			if(startPage==1){ //시작이 1이면 이전버튼 비활성
	    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">이전</a></li>';
	    			}else{
	    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadReplyPage('+(startPage-5)+')">이전</a></li>';
	    			}
	    			
	    			for (var i=startPage; i<endPage+1; i++) {
		    			if (i==curPage) { //현재페이지일때 current-page class 추가
		    		        pStr += '<li class="page-item current-page"><a class="page-link" href="javascript:void(0)" onclick="loadReplyPage('+i+')">'+i+ '</a></li>';
		    		    } else {
		    		        pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadReplyPage('+i+')">'+i+'</a></li>';
		    		    }
	    			}
		    			
		    		if(endPage>=maxPage){//마지막페이지가 최대페이지보다 크면 다음버튼 비활성
		    			pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="return false;">다음</a></li>';
		    		}else{
	    				pStr += '<li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="loadReplyPage('+(startPage+5)+')">다음</a></li>';
	    			}
		    		
	    			$("#replyPageArea>#rePage").html(pStr);
	    		},error : function(){
	    			console.log("내가 쓴 댓글 ajax 통신 실패");
	    		}
	    	});
	    }
	    
	  	//팔로잉 영역
	    function loadFollowingPage(page){ //페이지 로드 할 함수
	    	$.ajax({
	    		url : "followingPage.me",
	    		type: "post",
	    		data : {
	    			userId : myId,
	    			curPage : page
	    		},
	    		success : function(result){
	    			curPage = result.fiPi.currentPage;
	    			startPage = result.fiPi.startPage;
	    			endPage = result.fiPi.endPage;
	    			maxPage = result.fiPi.maxPage;
	    			let fiList = result.fiList;
	    			let count = result.fiPi.listCount; //팔로잉 수
	    			let str = ""; //게시글
	    		    let pStr = ""; //페이징 
	    		    let nStr = ""; //다음페이지
	    			//게시글 리스트 추가해주기위한 작업
	    			if(fiList.length == 0){
	    				str += "<tr>"
		    				+ "<td colspan='2' onclick='event.cancelBubble=true;'>친구를 만들어보세요!</td>"
		    				+ "</tr>";
	    			}else{ 
		    			$.each(fiList, function(key, fi){
		    				str += '<tr data-toggle="modal" data-target="#loadMemberModal"><td id="fiTd">'+fi.followingId+'</td></tr>';
		    			});
	    			}
	    				
	    			$("#followingTableContainer tbody").html(str); //팔로잉 리스트 띄워주기
	    			$("#followingTableContainer #followingCount").html(count);
	    			
	    			//페이징 처리
	    			if(startPage == maxPage){ //시작과 최대가 같으면
	    				pStr += '<a href="javascript:void(0)" onclick="window.alert(\'첫번째 페이지입니다.\'); return false;">&lt;</a>';
	    				nStr += '<a href="javascript:void(0)" onclick="window.alert(\'마지막 페이지입니다.\'); return false;">&gt;</a>';
						 	
	    			}else{
		    			if(curPage==1){ //현재페이지랑 시작페이지 같으면
		    				pStr += '<a href="javascript:void(0)" onclick="window.alert(\'첫번째 페이지입니다.\'); return false;">&lt;</a>';
		    			}else{
		    				pStr += '<a href="javascript:void(0)" onclick="loadFollowingPage('+(curPage-1)+')">&lt;</a>';
		    			}
		    			
			    		if(curPage==maxPage){ //현재페이지랑 끝페이지 같으면
			    			nStr += '<a href="javascript:void(0)" onclick="window.alert(\'마지막 페이지입니다.\'); return false;">&gt;</a>';
			    		}else{
			    			nStr += '<a href="javascript:void(0)" onclick="loadFollowingPage('+(curPage+1)+')">&gt;</a>';
			    		}
	    			}
	    			
	    			$("#fiPrePage").html(pStr);
	    			$("#fiNextPage").html(nStr);
	    			
	    			// 클릭 이벤트를 추가하여 해당 followingId를 전달(회원정보 모달창 띄우기)
	    			$("#followingTableContainer tbody tr").on('click', function () {
	    			    // 클릭한 행에서 followingId 값을 가져옴
	    			    let userId = $(this).find('td:first').text();
	    			    
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
	    				        
	    				 		}else{
	    				 			//회원정보가 없는데 팔로우 목록에 뜨는 경우
	    				 			swal({
	    					    		title : "회원정보 없음",
	    					    		text : "해당 회원 정보가 존재하지 않습니다.\n목록에서 제거하시겠습니까?",
	    					    		showCancelButton : true,
	    					    		confirmButtonClass : "btn-danger",
	    					    		confirmButtonText : "예",
	    					    		cancelButtonText : "아니오",
	    					    		closeOnConfirm : false,
	    					    		closeOnCancel : true
	    					    	}, function(isConfirm) {
	    					    		if(isConfirm){ //예 누를시 폼 전송
	    					    			let followingId = userId;
	    					    			let form = document.createElement("form");
	    					    			let obj; //넘겨받을 값 준비
	    					    			//폼 준비
	    					    			obj = document.createElement("input");
	    					    			obj.setAttribute("type","hidden");
	    					    			obj.setAttribute("name","followingId");
	    					    			obj.setAttribute("value",followingId);
	    					    			//폼 형식 갖추기
	    					    			form.appendChild(obj);
	    					    			form.setAttribute("method","post");
	    					    			form.setAttribute("action","deleteNonUser.me");
	    					    			//body부분에 폼 추가
	    					    			document.body.appendChild(form);
	    					    			form.submit();
	    					    		}else{
	    					    			return false;
	    					    		}
	    					    	});
	    				 		}
	    				 	}, error: function () {
	    				 		console.log('following modal ajax 통신실패');
	    				    }
	    				});
	    			});

	    			
	    		},error : function(){
	    			console.log("팔로잉 ajax 통신 실패");
	    		}
	    	});
	    }
	  	
	  	//팔로워 영역
	    function loadFollowerPage(page){ //페이지 로드 할 함수
	    	$.ajax({
	    		url : "followerPage.me",
	    		type: "post",
	    		data : {
	    			userId : myId,
	    			currentPage : page
	    		},
	    		success : function(result){
	    			curPage = result.fwPi.currentPage;
	    			startPage = result.fwPi.startPage;
	    			endPage = result.fwPi.endPage;
	    			maxPage = result.fwPi.maxPage;
	    			let fwList = result.fwList; //팔로워 목록
	    			let count = result.fwPi.listCount; //팔로워 수
	    			let str = ""; //게시글
	    		    let pStr = ""; //페이징 
	    		    let nStr = ""; //다음페이지
	    			//게시글 리스트 추가해주기위한 작업
	    			if(fwList.length == 0){
	    				str += "<tr>"
		    				+ "<td colspan='2' onclick='event.cancelBubble=true;'>친구를 만들어보세요!</td>"
		    				+ "</tr>";
	    			}else{
		    			$.each(fwList, function(key, fw){
		    				str += '<tr data-toggle="modal" data-target="#loadMemberModal"><td colspan="2" id="fwTd">'+fw.userId+'</td></tr>';
		    			});
	    			}
	    			
	    			$("#followerTableContainer tbody").html(str); //팔로잉 리스트 띄워주기
	    			$("#followerTableContainer #followerCount").html(count);
	    			//페이징 처리
	    			if(startPage == maxPage){ //시작과 최대가 같으면
	    				pStr += '<a href="javascript:void(0)" onclick="window.alert(\'첫번째 페이지입니다.\'); return false;">&lt;</a>';
	    				nStr += '<a href="javascript:void(0)" onclick="window.alert(\'마지막 페이지입니다.\'); return false;">&gt;</a>';
						 	
	    			}else{
		    			if(curPage==1){ //현재페이지랑 시작페이지 같으면
		    				pStr += '<a href="javascript:void(0)" onclick="window.alert(\'첫번째 페이지입니다.\'); return false;">&lt;</a>';
		    			}else{
		    				pStr += '<a href="javascript:void(0)" onclick="loadFollowerPage('+(curPage-1)+')">&lt;</a>';
		    			}
		    			
			    		if(curPage==maxPage){ //현재페이지랑 끝페이지 같으면
			    			nStr += '<a href="javascript:void(0)" onclick="window.alert(\'마지막 페이지입니다.\'); return false;">&gt;</a>';
			    		}else{
			    			nStr += '<a href="javascript:void(0)" onclick="loadFollowerPage('+(curPage+1)+')">&gt;</a>';
			    		}
	    			}
	    			
	    			$("#fwPrePage").html(pStr);
	    			$("#fwNextPage").html(nStr);
	    				
	    			// 클릭 이벤트를 추가하여 해당 followingId를 전달(회원정보 모달창 띄우기)
	    			$("#followerTableContainer tbody tr").on("click", function () {
	    			    // 클릭한 행에서 Id 값을 가져옴
	    			    let userId = $(this).find('td:first').text();
	    			    
	    			    $.ajax({
		    				url: "getFollowingInfo.me",
		    				type: 'post',
		    				data: { followingId: userId },
		    				success: function (m) {
		    			        if(m.changeName == null){ //사진 없을경우 기본이미지
		    			        	$("#profileImage").attr("src","resources/profile.jpg");
		    			        }else{
			    			        $("#profileImage").attr("src",m.changeName); //프로필 사진
		    			        }
		    			        $("#userId").text(m.userId); //아이디
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
		    			      
		    			        $(".btn1").click();
		    			 		
		    			 	}, error: function () {
		    			 		console.log('following modal ajax 통신실패');
		    			    }
		    			});
	    			    
	    			});
	    		},error : function(){
	    			console.log("팔로워 ajax 통신 실패");
	    		}
	    	});
	    }

	    $(function(){ //초기 페이지 로딩은 1페이지여야 한다
	    	loadBoardPage(1);
	    	loadReplyPage(1);
	    	loadFollowingPage(1);
	    	loadFollowerPage(1);
    	});
    </script>

   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/js/active.js"></script>
</body>

</html>