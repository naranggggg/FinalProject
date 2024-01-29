<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작은농장</title>
<style>
    table {
        border: 1px #a39485 solid;
        font-size: .9em;
        box-shadow: 0 2px 5px rgba(0,0,0,.25);
        width: 800px;
        margin:0 auto;
        border-collapse: collapse;
        border-radius: 5px;
        overflow: hidden;
        text-align:center;
    }    
    thead {
    font-weight: bold;

    }
 
    td, th {
    padding:5px 10px;
    vertical-align: middle;
    }
    th {
        text-align: center;
        font-size:15px;
    }
    
    td {
    border-bottom: 1px solid rgba(0,0,0,.1);
    background: #fff;
    }
    input,textarea{
        border:none;
    }
    .content{
    	margin-bottom:200px;
    }
    .titleDiv{
        border-bottom: 1px solid rgba(0,0,0,.1);
    
    }
    .title-sub-writer>p,#noticeType{
		color: rgba(0,0,0,0.4);
	}
	#noticeType{
		min-width: 90px;
	}
	.title-sub,.title-sub-btn{
		display:flex;
		justify-content: space-between;
	}
	.update-btn:hover,.delete-btn:hover{
		cursor:pointer;
		color:#FF6C30;
	}
	.title{
		max-width:1100px;
		word-wrap:break-word;
	}
	#board_content{
		width:100%;
		word-wrap:break-word;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>

	<!-- ##### nav 그림 + 페이지 설명 ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>공지사항</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/"><i
								class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="${contextPath}/noticeList.no">공지사항</a></li>
							<li class="breadcrumb-item"><a href="#">상세보기</a></li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- Preloader -->
	<div class="preloader d-flex align-items-center justify-content-center">
		<div class="preloader-circle"></div>
		<div class="preloader-img">
			<img src="resources/img/core-img/leaf.png" alt="">
		</div>
	</div>


	<div class="outer content">
		<div id="single_main">
			<div
				class="mnmd-block mnmd-block--contiguous page-heading page-heading--has-background pb-4 pt-4 mb-3">
				<div class="container">
					<div class="row">
						<div class="col-md-12 titleDiv" role="main">
							<div style="display:flex;">
								<h2 id="noticeType"><b>[${notice.noticeType}]</b>&nbsp;&nbsp;</h2>
								<h2 class="title"><b>${notice.noticeTitle}</b></h2>
							</div>
							
								
							<div class="title-sub">
								<div class="title-sub-writer">
									<p class="float-left">
										<small>${notice.noticeWriter}
										</small>
										<small>&nbsp;|&nbsp;${notice.createDate}</small><small>&nbsp;|&nbsp;조회수 : ${notice.count}</small>
									</p>
								</div>
								<div class="title-sub-btn">
									<c:if test="${loginUser.userId eq 'admin'}">
										<form action="updateNotice.no" method="get">
											<input type="hidden" value="${notice.noticeNo}" name="noticeNo">
											<button type="submit" id="hiddenUpdateBtn" hidden></button>
											<p class="update-btn" onclick="updateNotice();" style="margin-right:15px;">수정</p>
										</form>
										<form action="deleteNotice.no" method="post">
											<input type="hidden" value="${notice.noticeNo}" name="noticeNo">
											<button type="submit" id="hiddenDeleteBtn" hidden></button>
											<p class="delete-btn" onclick="deleteNotice();">삭제</p>
										</form>
											
									</c:if>
								
								</div>
								
								
							</div>
							
						</div>
						<div class="col-md-12"></div>
						
					</div>
				</div>
			</div>
			<div class="container mb-4">
				<div class="row">
					<div class="col-md-12" role="main">
						<div id="board_content">
							${notice.noticeContent}
						</div>
	
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<script>

		function updateNotice(){
			var noticeNo = "${notice.noticeNo}";
			
			//form태그안에 숨겨져있던 submit 버튼 클릭
			$("#hiddenUpdateBtn").click();
		}
		function deleteNotice(){
			var noticeNo = "${notice.noticeNo}";
			if(confirm("정말로 삭제하시겠습니까?")){
				//form태그안에 숨겨져있던 submit 버튼 클릭
				$("#hiddenDeleteBtn").click();
			}
		
		}
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>