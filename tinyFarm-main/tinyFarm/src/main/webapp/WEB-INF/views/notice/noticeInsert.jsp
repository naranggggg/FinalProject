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
        outline: none;
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
							<li class="breadcrumb-item"><a href="#">공지사항 작성</a></li>
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


	<!-- ##### Portfolio Area Start ##### -->
	<section
		class="alazea-portfolio-area portfolio-page section-padding-0-100">
		<div class="container">
			<div class="row">
				<div class="col-12" style="margin-top: 30px;">
					<!-- Section Heading -->
					<div class="section-heading text-center">
						<h2><b>공지사항 작성</b></h2>
					</div>
				</div>
			</div>
		</div>

		<div class="container">

			<form action="insertNotice.no" method="post">
				<table>
					<colgroup>
						<col width="10%">
						<col width="90%">
					</colgroup>
	
					<tbody align="left">
						<tr>
							<th>제목</th>
							<td><input type="text" style="width: 100%; height: 100%;" name="noticeTitle" required></td>
						</tr>
						<tr>
							<th>분류</th>
							<td><select name="noticeType">
									<option>일반</option>
									<option>중요</option>
							</select></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea
									style="resize: none; width: 100%; height: 500px;" name="noticeContent" required></textarea></td>
						</tr>
	
					</tbody>
					<tfoot align="center">
						<tr>
							<td colspan="2">
								<input type="hidden" name="noticeWriter" value="${loginUser.userNo}">
								<button class="btn btn-success" id="insertBtn">글작성</button>
							</td>
						</tr>
					</tfoot>
				</table>
			
			</form>

		</div>
	</section>
	<!-- <script>
		$("#insertBtn").click(function(){				
			var writerNo = "${loginUser.userNo}";
			var title = $("#title").val();
			var content = $("#content").val();
			var type = $("select[name='type']").val();
			location.href = "insertNotice.no?noticeWriter="+writerNo+"&noticeTitle="+title+"&noticeContent="+content+"&noticeType="+type;
		});
	</script> -->


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>