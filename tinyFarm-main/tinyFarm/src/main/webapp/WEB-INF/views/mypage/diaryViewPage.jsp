<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>영농일지보기</title>
<link rel="icon" href="resources/img/core-img/favicon.ico">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" href="resources/style.css">
<link rel="stylesheet" href="resources/jisu/css/mypage.css">
<!-- alert창 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<style>
.content {
	width: 100%;
	border: 1px solid #dee2e6;
	border-radius: 10px;
	padding: 3%;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 3%;
}

#cNt p {
	font-size: 15px;
	color: grey;
}

#cNt {
	text-align: center;
	margin-bottom: 5%;
}

#miniProfile {
	display: inline-block;
}

#miniProfile img {
	width: 35px;
	height: 35px;
	border-radius: 100%;
	margin-bottom: 2%;
}

#selectDate {
	font-size: 15px;
	color: grey;
}

.content>.note-editor.note-frame {
	border: none;
}

#diaryContent {
	width: 100%;
	margin-top: 5%;
}

.btn-area {
	width: 50%;
	margin: auto;
	text-align: center;
}

.btn-green {
	width: 90px;
	height: 50px;
	margin: auto;
	background-color: #70C745;
	color: white;
	border: none;
}

.btn-green:focus {
	outline: none;
}

.btn-green:hover {
	background-color: white;
	color: #70C745;
	border-style: solid;
	border-width: 1px;
	border-color: #70C745;
	transition-duration: 400ms;
}

#diarylike {
	width: 28px;
	height: 28px;
	float: right;
	text-align: center;
	font-size: 14px;
}

#likeCount {
	margin-top: -2%;
}

#diarylike img {
	width: 100%;
	height: 100%;
}

#diarylike:hover {
	cursor: pointer;
}
</style>
</head>

<body>
    <%@ include file="../common/header.jsp" %>

    <div class="breadcrumb-area">
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
            style="background-image: url(resources/img/bg-img/24.jpg);">
            <h2>영농일지</h2>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/tinyfarm"><i class="fa fa-home"></i>작은농장</a></li>
                            <li class="breadcrumb-item"><a href="mypage.me">마이페이지</a></li>
                            <li class="breadcrumb-item"><a href="javascript:void(0)">일지보기</a></li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>

     <section class="alazea-blog-area my-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-8">
                	<div class="row">
	                    <div class="content">
	                    	<div id="cNt">
		                        <p>${d.categoryNo }</p>
		                        <h4>${d.diaryTitle }</h4>
	                    	</div>
			                <span id="miniProfile"><img src="${w.changeName }">&nbsp;${w.userName } &nbsp;</span>
	                    	<span id="selectDate">${d.selectDate }</span>
	                    	<div id="diarylike">
	                    		<c:choose>
	                    			<c:when test="${like.userNo eq loginUser.userNo }">
	                    				<img alt="좋아요후" src="resources/jisu/img/likeafter.png" onclick="diaryUnLike();">
	                    			</c:when>
	                    			<c:otherwise>
			                    		<img alt="좋아요전" src="resources/jisu/img/likebefore.png" onclick="diaryLike();">
	                    			</c:otherwise>
	                    		</c:choose>
		                    	<span id="likeCount">${d.likeCount} </span>
	                    	</div>
	                    	<hr>
	                        <div id="diaryContent">${d.diaryContent }</div>
	                    </div>
	                    <div class="btn-area">
	                    	<c:choose>
	                    		<c:when test="${d.diaryWriter eq loginUser.userNo}">
			                        <button id="updateBtn" class="btn-green">수정</button>
			                        <button id="delBtn" class="btn-green">삭제</button>
			                        <button id="backBtn" class="btn-green">뒤로가기</button>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<button id="backBtn" class="btn-green" onclick="window.history.back();">뒤로가기</button>
	                    		</c:otherwise>
	                    	</c:choose>
	                    </div>
                	</div>
                </div>
            </div>
        </div>
    </section>

    <script>
    $('#diaryContent').summernote("destroy"); //게시글 터치불가능
    let diaryNo = ${d.diaryNo}; // 일지번호 추출
	let userNo = ${d.diaryWriter}; //회원번호 추출
	
	//영농일지 좋아요
	function diaryLike(){
	   	$(function(){
	    	$.ajax({
	    		url : "like.di",
	    		data : {
	    			refDbno : diaryNo,
		    		userNo : ${loginUser.userNo} //회원번호는 로그인 한 회원의 번호
	    		},
		    		success : function(like){
	   			if(like != null){
	    				//해당유저와 해당일지의 정보가 있으면 좋아요 후 좋아요 취소 버튼으로 바꿔주기
	    				$("#diarylike img").attr("src", "resources/jisu/img/likeafter.png").attr("onclick", "diaryUnLike();");
	    				
	    				//성공 후 페이지 좋아요수 정정
	    				$.ajax({
	    					url:"likeCount.di",
	    					data : {diaryNo : diaryNo},
	    					success : function(result){
	    						$("#likeCount").html(result);
	    					},error : function(){
	    						console.log("좋아요 수 재조회 실패");
	    					}
	    				});
	    			}
	    		},error:function(){
	    			console.log("일지 좋아요 ajax 실패 ");
	    		}
	    	});
	    });
	  }
    	
	  //영농일지 좋아요 취소
	  function diaryUnLike(){
	  	$(function(){
		    $.ajax({
		    	url : "unLike.di",
		    	data : {
		    		refDbno : diaryNo,
		    		userNo :  ${loginUser.userNo} //회원번호는 로그인 한 회원의 번호
		    	},success : function(like){
		    		if(like != null){
		    			//해당유저와 해당일지의 정보가 있으면 취소 후 좋아요 가능 버튼으로 바꿔주기
	    				$("#diarylike img").attr("src", "resources/jisu/img/likebefore.png").attr("onclick", "diaryLike();");
	    				
	    				//취소 후 페이지 좋아요수 정정
	    				$.ajax({
	    					url:"likeCount.di",
	    					data : {diaryNo : diaryNo},
	    					success : function(result){
	    						$("#likeCount").html(result);
	    					},error : function(){
	    						console.log("좋아요 수 재조회 실패");
	    					}
	    				});
	    			}
		    	},error:function(){
		    		console.log("일지 좋아요 ajax 실패 ");
		    	}
		   	});
	    });
	  }
    	

       $(function () {
           $("#delBtn").click(function () { //삭제버튼 클릭시
               let warn = swal({
    			title : "영농일지 삭제",
    			text : "삭제 후 되돌릴 수 없습니다.\n등급 기준에 따라 등급이 하락할 수도 있습니다.\n정말로 삭제하시겠습니까?",
    			icon: 'question',
    			showCancelButton : true,
    			confirmButtonClass : "btn-danger",
    			confirmButtonText : "예",
    			cancelButtonText : "아니오",
    			closeOnConfirm : false,
    			closeOnCancel : true
    		}, function(warn) {
    			//아니오 누를시 현재페이지 유지
    			if (!warn) {return false;}
                   location.href = "delete.di?diaryNo="+${d.diaryNo}; //삭제 메소드로 ~
    			});
    		}); 
       });
           
       	//영농일지 수정
        $("#updateBtn").click(function(){
           let update = swal({
	       		title : "수정하기",
	       		text : "일지를 수정하시겠습니까?",
	       		icon: 'question',
	       		showCancelButton : true,
	       		confirmButtonClass : "btn-danger",
	       		confirmButtonText : "예",
	       		cancelButtonText : "아니오",
	       		closeOnConfirm : false,
	       		closeOnCancel : true
	       	}, function(update) {
	       		//아니오 누를시 현재페이지 유지
	       		if (!update) {return false;}
		      	location.href="updatePage.di?diaryNo="+${d.diaryNo}; //업데이트 메소드로 ~
	       	}); 
        });
           
       	//뒤로가기 버튼 클릭시
        $("#backBtn").click(function(){
        	let back = swal({
    			title : "뒤로가기",
    			text : "이전페이지로 이동하시겠습니까?",
    			icon: 'question',
    			showCancelButton : true,
    			confirmButtonClass : "btn-danger",
    			confirmButtonText : "예",
    			cancelButtonText : "아니오",
    			closeOnConfirm : false,
    			closeOnCancel : true
    		}, function(back) {
    			//아니오 누를시 현재페이지 유지
    			if (!back) {return false;}
    			location.href="diary.me";
    			
    		}); 
    	 });
    </script>

     <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>

</html>