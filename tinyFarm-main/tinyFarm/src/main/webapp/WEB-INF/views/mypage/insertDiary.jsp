<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String selectDate = request.getParameter("selectDate"); //달력에서 선택한 날짜
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Title -->
<title>마이페이지</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">
<!-- summernote emoji -->
<link href="resources/tam-emoji/css/emoji.css" rel="stylesheet">
<!-- Core Stylesheet -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/style.css">
<link rel="stylesheet" href="resources/jisu/css/mypage.css">
<!-- alert창 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<style>
a, p {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.pl{
	width: 100px;
	height: 35px;
	box-sizing: border-box;
	border-radius: 10px;
	font-style: normal;
	font-size: 14px;
	line-height: 16px;
}
		
.pl:focus{
	border: 1px solid #70c745;
	box-sizing: border-box;
	border-radius: 10px;
	border-radius: 10px;
}

#diaryTitle {
	width: 100%;
	height: 40px;
	border: 1px solid #cdcdcd;
	padding-left: 10px;
}

#datelabel {
	float: right;
	text-align: right;
	padding-top: 20px;
	width: 30%;
	font-size: 17px;
}
.btn-green, .btn-red{
	width: 10%;
	height: 15%;
	float: right;
	margin-top: 1%;
}
.btn-red{
	margin-left: 1%;
}
.radioBtn>label{ font-size: 14px;}
</style>
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>

	<div class="breadcrumb-area">
		<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>영농일지</h2>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/tinyfarm"><i class="fa fa-home"></i>작은농장</a></li>
							<li class="breadcrumb-item"><a href="diary.me">영농일지</a></li>
							<li class="breadcrumb-item"><a href="javascript:void(0)">영농일지 작성</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<section class="alazea-blog-area mb-100">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-md-8">
					<div class="row">
						<form action="insert.di" method="post" onsubmit="return insertDiary();">
							<input type="hidden" name="diaryWriter" value="${loginUser.userNo }">
							<label for="categorys">텃밭유형 : </label>
								<select id="categoryNo" name="categoryNo" class="pl">
									<option value="1">개인밭</option>
									<option value="2">마당</option>
									<option value="3">베란다</option>
									<option value="4">옥상</option>
									<option value="5">주말농장</option>
									<option value="6">정원</option>
									<option value="7">학교</option>
								</select>
							<div id="datelabel">
								<input type="hidden" id="selectDate" name="selectDate" value=" <%=selectDate%>"> 작성일 : <%=selectDate%>
							</div>
							<input type="text" name="diaryTitle" id="diaryTitle" placeholder="제목을 입력해주세요.">
							<textarea id="diaryContent" name="diaryContent"></textarea>

							<div class="radioBtn">
								<label>공개 시 내가 팔로우 한 사람들에게만 공개됩니다. </label>
								<input type="radio" id="openY" name="selectOpen" value="Y"> <label for="openY">공개</label>
								<input type="radio" id="openN" name="selectOpen" value="N"> <label for="openN">비공개</label>
								<input type="button" id="backBtn" class="btn-red alazea-btn-gray" value="취소">
								<input type="submit" id="diBtn" class="btn-green alazea-btn" value="등록">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 일지 작성 스크립트 -->
	<script>
	//sweetalert css 사용
	$(function(){
	    document.emojiSource = 'resources/tam-emoji/img'; //이모지 사진 사용
		$('#diaryContent').summernote({
					width : 900,
					height : 800,
					minHeight : 800,
					maxHeight : 800,
					focus : true,
					lang : "ko-KR",
					placeholder : '나만의 영농일지를 작성해보세요! 공개/비공개 여부에 따라 다른 회원에게 보여질 수 있습니다!',
					toolbar : [
							['insert', ['emoji']],
							[ 'fontname', [ 'fontname' ] ],
							[ 'fontsize', [ 'fontsize' ] ],
							[ 'style', [ 'bold', 'italic', 'underline', 'strikethrough', 'clear' ] ],
							[ 'color', [ 'forecolor', 'color' ] ],
							[ 'table', [ 'table' ] ],
							[ 'para', [ 'paragraph' ] ],
							[ 'height', [ 'height' ] ],
							[ 'insert', [ 'picture', 'link' ] ] ],
					fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New',
									'맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체' ],	
					fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
								'20', '22', '24', '28', '30', '36', '50', '72' ]
		});
	});
	
	//제목 글자수 제한(50자)
	$("#diaryTitle").keyup(function(){
		let titleLength = $(this).val().length; //입력한 제목의 길이
		if(titleLength>50){ //50자가 넘을때
			//알림 띄우고
			swal('글자수 초과', '제목은 50자까지 작성 가능합니다.', 'error');
			//50자 까지 글자 자른 상태로 보여주기
			$(this).val($(this).val().substring(0,50));
		}
	});
	
	//뒤로가기 버튼 클릭시
	$("#backBtn").click(function() {
		let alert = swal({
    		title : "작성취소",
    		text : "이전 페이지로 이동하시겠습니까?\n작성 중인 내용이 사라집니다.",
    		icon: 'question',
    		showCancelButton : true,
    		confirmButtonClass : "btn-danger",
    		confirmButtonText : "예",
    		cancelButtonText : "아니오",
    		closeOnConfirm : false,
    		closeOnCancel : true
    	}, function(alert) { 
    			if(!alert){return false;} //아니오 클릭시 현재페이지 유지
    			location.href="diary.me"; //이전페이지로 이동
	    });
	});
		function insertDiary() {
		let diaryTitle = $("#diaryTitle").val(); //제목
		let diaryContent = $("#diaryContent").val(); //내용
		let openVal = $("input[name=selectOpen]:checked").val(); //공개여부
		
		//제목 공백
			if (diaryTitle == "") {
		swal('제목 입력', '제목을 입력해주세요.', 'error');
			$(this).focus;
			return false;
		}
		
		//제목 50자 넘을시 작성 막기
		if(diaryTitle.length >50){
			swal('제목 입력', '제목은 최대 50자까지 가능합니다.', 'error');
			$(this).focus;
			return false;
		}
		//내용 공백
		if (diaryContent == "") {
			swal('내용 입력', '내용을 입력해주세요.', 'error');
			$(this).focus;
			return false;
		}
		//공개여부 선택 안할시
		if (openVal == null) {
			swal('공개/비공개 선택', '공개여부를 선택해주세요.', 'error');
			return false;
		}
	}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<!-- ##### All Javascript Files ##### -->
<!-- jQuery-2.2.4 js -->
<!-- <script src="resources/js/jquery/jquery-2.2.4.min.js"></script> -->
<!-- Popper js -->
<script src="resources/js/bootstrap/popper.min.js"></script>
<!-- Bootstrap js -->
<script src="resources/js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins js -->
<script src="resources/js/plugins/plugins.js"></script>
<!-- Active js -->
<script src="resources/js/active.js"></script>
<!-- summernote 이모지 -->
<script src="resources/tam-emoji/js/config.js"></script>
 <script src="resources/tam-emoji/js/tam-emoji.min.js"></script>
</body>
</html>