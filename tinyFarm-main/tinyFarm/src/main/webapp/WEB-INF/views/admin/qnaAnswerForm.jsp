<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>작은농장</title>

    <!-- Favicon -->
    <link rel="icon" href="${contextPath }/resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="${contextPath }/resources/style.css">
</head>
<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="${contextPath }/resources/img/core-img/leaf.png" alt="">
        </div>
    </div>


    <%@ include file="/WEB-INF/views/common/header.jsp" %>

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${contextPath }/resources/img/bg-img/24.jpg);">
            <h2>Admin</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${contextPath }"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Admin</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Blog Area Start ##### -->
    <section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row">
            
            
            	<%@ include file="admin_nav.jsp" %>

                
                <div class="col-12 col-md-9">
                    <!-- <div class="row"> -->
                        <div class=" d-flex flex-wrap align-items-center justify-content-between">
                            <div class="mb-50">
                                <p><h5><b>🌱 문의사항</b></h5></p>
                            </div>
                        </div>

                        <!-- QNA 조회하기-->
                        <div class="clearfix mt-15 mb-15 mx-auto">
<!--                        <table class="table table-responsive" align="center" width="90%"> -->
                            <table class="table" align="center">
                                <colgroup>
                                    <col width="25%">
                                    <col width="30%">
                                    <col width="20%">
                                    <col width="30%">
                                </colgroup>
                                <tr>
                                    <th>No</th>
                                    <td>${qna.qnaNo }</td>
                                    <th>작성자</th>
                                    <td>${qna.userNo }</td>
                                </tr>
                                <tr>
                                    <th>작성날짜</th>
                                    <td colspan="3">${qna.qnaCreatedate }</td>
                                </tr>
                                <tr>
                                    <th>제목</th>
                                    <td colspan="3">${qna.qnaTitle }</td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td colspan="3">${qna.qnaContent }</td>
                                </tr>
                            </table>
                        </div>


                        <section class="contact-area section-padding-100">
                            <div class="container">
                                <div class="row align-items-center justify-content-between">
                                    <div class="col-12">
                                        <!-- Section Heading -->
                                        <div class=" d-flex flex-wrap align-items-center justify-content-between">
                                            <div class="mb-50">
                                                <p><h5><b>🌱 답변하기</b></h5></p>
                                            </div>
                                        </div>

                                        <!-- Contact Form Area -->
                                        <div class="contact-form-area mb-100">
                                            <form action="qnaAnswer.ad" method="post">
                                            	<input type="hidden" name="qnaNo" value="${qna.qnaNo }">
                                                <div class="row">
                                                    <div class="col-12 col-md-6">
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" id="contact-name" placeholder="Your Name" value="관리자" readonly="readonly">
                                                        </div>
                                                    </div>
                                                    <div class="col-12 col-md-6">
                                                        <div class="form-group">
                                                        	<c:set var="now"><fmt:formatDate value="<%= new Date() %>" pattern="yy/MM/dd" /></c:set>
                                                            <input type="text" class="form-control" id="contact-email" value="${now}" readonly="readonly">
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group">
                                                            <textarea name="qnaAnswerContent" class="form-control height-200" name="message" id="qnaAnswerContent" cols="30" rows="80" placeholder="내용">${qna.qnaAnswerContent }</textarea>
                                                        </div>
                                                    </div>
                                                    <div class="col-12 ">
                                                        <button type="button" class="btn alazea-btn-orange mt-15 float-right" onclick="location.href='qnaList.ad'">목록</button>
                                                        <button type="submit" class="btn alazea-btn mt-15 mr-15 float-right" onclick="return confirm('답변을 등록하시겠습니까?')">전송</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    <!-- </div> -->
                </div>
                
            </div>
        </div>
    </section>
    <!-- ##### Blog Area End ##### -->

	<script type="text/javascript">
	
		$("#qnaAnswerContent").keyup(function(){
			
			let qnaAnswerContent = $(this).val();
			
			if(qnaAnswerContent.length > 500){
				alert("500자 미만으로 작성이 가능합니다.");
				qnaAnswerContent = qnaAnswerContent.substr(0, 500);
				$(this).val(qnaAnswerContent);
			}
			
		})
	
	
	</script>




	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="${contextPath }/resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${contextPath }/resources/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${contextPath }/resources/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${contextPath }/resources/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${contextPath }/resources/js/active.js"></script>
</body>

</html>

