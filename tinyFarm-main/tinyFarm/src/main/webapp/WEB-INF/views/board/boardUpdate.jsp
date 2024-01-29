<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Title -->
<title>작은농장</title>


<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">

<!-- 썸머노트 이용하기 -->
<!--  <script src="resources/summernote1/js/summernote/summernote-lite.js"></script>
	<script src="resources/summernote1/js/summernote/lang/summernote-ko-KR.js"></script>
    <link rel="stylesheet" href="resources/summernote1/css/summernote/summernote-lite.css"> -->

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<!-- 해시태그 -->
<script src="https://unpkg.com/@yaireo/tagify"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />



<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@400;600&display=swap" rel="stylesheet">
<link href="resources/tam-emoji/css/emoji.css" rel="stylesheet">
	

<style>
a, p {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
	font-family: 'Noto Sans KR', sans-serif !important;
}

#boardTitle {
	width: 100%;
	height: 30px;
}

.tagify {
	width: 1000px;
}
</style>

</head>

<body>

	<%@include file="../common/header.jsp"%>

	<!-- 상단 시작 -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>글 수정하기</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/tinyfarm"><i class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="moveList.bo">이야기해요</a></li>
							<li class="breadcrumb-item active" aria-current="page">글 수정</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 끝 -->


	<div class="post-content" align="center">
		<form action="update.bo" method="post" id="boardUpdate">
			<table>
				<tr>
					<th><label for="boardTitle">제목</label></th>
					<td><input type="text" id="boardTitle" name="boardTitle" value="${boardInfo.boardTitle}" style="width: 100%; height: 30px;" required></td>
				</tr>
				<tr>
					<th><label for="boardContent">내용</label></th>
					<td><textarea id="summernote" name="boardContent">${boardInfo.boardContent }</textarea></td>
				</tr>
				<tr>
					<th><label for="boardHashTag">해시태그&nbsp;&nbsp;</label></th>
					<td id="tagId"><input placeholder="type tags" id="hashTag" name="hashTag" value=${boardInfo.hashTag }></td>
				</tr>
			</table>
			<br><br>
			<input type="hidden" name="boardWriter" value="${boardInfo.boardWriter }" readonly="readonly"> 
			<input type="hidden" name="boardNo" value="${boardInfo.boardNo }">
			<button type="submit" class="btn alazea-btn" value="boardUpdate" id="boardUpdateBtn">글 수정</button>
		</form>
	</div>
	<br>
	<br>
	<br>
	<br>


	<script>
	
		//해시태그 추가이벤트 기능
		var hashTag = document.getElementById('hashTag');
		var tagify = new Tagify(hashTag);

		// 태그가 추가되면 이벤트 발생
		tagify.on('add', function() {
			console.log(tagify.value);

		})
		
		//썸머노트 기능수행
		$(document).ready(function() {
			 document.emojiSource = 'resources/tam-emoji/img'; 

			$('#summernote').summernote({
				width : 1000,
				height : 500, // 에디터 높이
				minHeight : null, // 최소 높이
				maxHeight : null, // 최대 높이
				focus : true, // 에디터 로딩후 포커스를 맞출지 여부
				lang : "ko-KR", // 한글 설정	
				toolbar : [
					 ['a11y',['a11y']], // The Button
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
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<!-- 썸머노트 이모지 -->
	<script src="resources/tam-emoji/js/config.js"></script>
    <script src="resources/tam-emoji/js/tam-emoji.min.js"></script>

	<!-- ##### All Javascript Files ##### -->
	<!-- jQuery-2.2.4 js -->
	<!-- <script src="resources/js/jquery/jquery-2.2.4.min.js"></script>  -->
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