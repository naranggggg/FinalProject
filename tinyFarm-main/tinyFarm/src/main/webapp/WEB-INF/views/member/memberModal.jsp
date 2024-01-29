<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/core-img/favicon.ico">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Core Stylesheet -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@400;600&display=swap" rel="stylesheet">
<!-- alert창 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<style>
.mb-4>*{
	display: inline;
}
</style>
</head>
<body>
	<!-- Button trigger modal -->
	<button style="display: none;" type="button"
		class="btn btn-primary btn1" data-toggle="modal"
		data-target="#exampleModalCenter">Launch demo modal</button>
	<!-- Modal -->
	<div class="modal" id="exampleModalCenter" tabindex="-5" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document"
			style="max-width: 630px;">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">🌱 회원 정보</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="checkout_details_area clearfix">

						<div class="row" style="margin-top: -30px">
							<div
								class="col-md-12 mt-30 mb-30 d-flex justify-content-center align-items-center">
								<div
									style="width: 240px; height: 240px; border: 1px solid #ccc; position: relative; overflow: hidden; margin-left: -200px">
									<!-- 이미지 표시 -->
									<img id="profileImage" alt="프로필 사진"
										style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0;">
								</div>
								<input type="hidden" id="userNo" name="userNo">
								<div class="ml-5">
									<div class="mb-4" style="margin-top: -70px">
										<label for="userId">ID&nbsp;:&nbsp;</label>
										<div id="userId"></div>
									</div>
									<div class="mb-4">
										<label for="userName">이름&nbsp;:&nbsp;</label>
										<div id="userName"></div>
									</div>
									<div class="mb-4">
										<label for="userGrade">회원등급&nbsp;:&nbsp;</label>
										<div id="userGrade"></div>
										<!-- 여기에 회원등급 입력 필드 또는 텍스트 추가 -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-start" style="margin-top: -85px;">
					<button type="button" id="followBtn" class="btn alazea-btn2" onclick="followUser();"
							style="margin-bottom: 20px; margin-left: 290px;">팔로우</button>
					<button type="button" class="btn alazea-btn2" onclick="goChat();" style="margin-left: 3px">1:1 채팅</button>
					<button type="button" id="diarybtn" class="btn alazea-btn2" style="margin-left: 3px">일지보기</button>
				</div>
			</div>
		</div>
	</div>

	<script>
		//팔로우 걸기
		function followUser(){
			let followingId= $("#userId").text();
			let form = document.createElement("form");
			let obj; //넘겨받을 값 준비
			//팔로잉 유저 아이디
			obj = document.createElement("input");
			obj.setAttribute("type","hidden");
			obj.setAttribute("name","followingId");
			obj.setAttribute("value",followingId);
			//폼 형식 갖추기
			form.appendChild(obj);
			form.setAttribute("method","post");
			form.setAttribute("action","follow.me");
			//body부분에 폼 추가
			document.body.appendChild(form);
			//전송!
			form.submit();
		}
		
		//팔로우 취소
	    function unfollow(){
	    	let followingId= $("#userId").text();
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
			form.setAttribute("action","unfollow.me");
			//body부분에 폼 추가
			document.body.appendChild(form);
				
			swal({
	    		title : "팔로우 취소",
	    		text : followingId+"님 팔로우를 취소하시겠습니까?\n나중에 다시 팔로우 할 수 있습니다.",
	    		showCancelButton : true,
	    		confirmButtonClass : "btn-danger",
	    		confirmButtonText : "예",
	    		cancelButtonText : "아니오",
	    		closeOnConfirm : false,
	    		closeOnCancel : true
	    	}, function(isConfirm) {
	    		if(isConfirm){ //예 누를시 폼 전송
	    			form.submit();
	    		}else{
	    			return false;
	    		}
	    	});
	    }

	    function showDiary(){
	    	let followingId= $("#userId").text();
	    	let followingName = $("#userName").text();
	    	
	    	let alert = window.confirm(followingName+"님의 영농일지를 구경하시겠습니까?");
	    	let form = document.createElement("form");
			let obj; //넘겨받을 값 준비
	    	
	    	if(alert){//예 누를시
	    		obj = document.createElement("input");
				obj.setAttribute("type","hidden");
				obj.setAttribute("name","followingId");
				obj.setAttribute("value",followingId);
				//폼 형식 갖추기
				form.appendChild(obj);
				form.setAttribute("method","post");
				form.setAttribute("action","follow.di");
				//body부분에 폼 추가
				document.body.appendChild(form);
				//전송!
				form.submit();
	    		
	    	}
	    }
	    //채팅방 이동
	    function goChat(){
	    	var userId = $("#userId").text();
	    	location.href = "chatList.ch?userId="+userId;
	    }

		//영농일지 보기
		$("#diarybtn").click(function(){
    		let followingId= $("#userId").text();
			let userName = $("#userName").text();
			
	    	swal({
    			title : "영농일지 구경",
    			text : userName+"님의 영농일지를 구경하시겠습니까?",
    			icon: 'question',
    			showCancelButton : true,
    			confirmButtonClass : "btn-danger",
    			confirmButtonText : "예",
    			cancelButtonText : "아니오",
    			closeOnConfirm : false,
    			closeOnCancel : true
    		}, function(isConfirm) {
    			if (isConfirm) { //예 누를시 영농일지를 위한 폼 전송
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
    	    		form.setAttribute("action","follow.di");
    	    		//body부분에 폼 추가
    	    		document.body.appendChild(form);
    	    		//폼 전송
    				form.submit();
    			}else{
    				return false;
    			}
    		});
		});    

</script>
<!-- ##### All Javascript Files ##### -->
<!-- jQuery-2.2.4 js -->
<script src="${pageContext.request.contextPath}/resources/js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins js -->
<script src="${pageContext.request.contextPath}/resources/js/plugins/plugins.js"></script>
<!-- Active js -->
<script src="${pageContext.request.contextPath}/resources/js/active.js"></script>
</body>
</html>