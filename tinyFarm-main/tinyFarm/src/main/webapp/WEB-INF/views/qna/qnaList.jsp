<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css">
</head>

<body>

   <%@include file="/WEB-INF/views/common/header.jsp" %>

	<!-- ##### Product Area Start ##### -->
	<!-- ##### nav 그림 + 페이지 설명 ##### -->
	<div class="breadcrumb-area">
		<!-- Top Breadcrumb Area -->
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>1:1 문의하기</h2>
		</div>

		<div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="${contextPath }"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">1:1 문의하기</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
	</div>

    <!-- ##### Blog Area Start ##### -->
    <section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row">
            
				<%@ include file="qna_nav.jsp" %>
				
				<div class="col-12 col-md-9">
                    <!-- <div class="row"> -->
                        <div class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
                            <div class="mb-0">
                                <p><h5><b>🌱 나의 문의내역</b></h5></p>
                            </div>
                            <div class="search_by_terms">
                                <form action="qnaList" method="post" class="form-inline">
                                    <select class="custom-select widget-title" id="showPeriod" onchange="changePeriod(this.value)">
                                      <option value="1">Show: ALL</option>
                                      <option value="7">지난 7일</option>
                                      <option value="30">지난 30일</option>
                                    </select>
                                    <button type="submit" style="display:none"></button>
                                </form>
                            </div>
                        </div>


                        <div class="clearfix mt-15 mb-15">
                        	<div class="mb-15">현재 페이지: ${pi.currentPage }</div>
                            <table class="table " align="center" width="100%"> <!-- table-responsive -->
                            
                                <colgroup>
                                    <col width="5%">
                                    <col width="auto%">
                                    <col width="5%">
                                    <col width="15%">
                                    <col width="7%">
                                    <col width="7%">
                                </colgroup>
                                <thead>
                                    <tr align="center">
                                        <th>No.</th>
                                        <th>문의사항</th>
                                        <th></th>
                                        <th>답변</th>
                                        <th>수정</th>
                                        <th>삭제</th>
                                    </tr>
                                </thead>
                                <tbody align="center">
		                        	 <c:if test="${empty qList }">
		                        	 	<tr><td colspan="6">※ 문의한 내역이 없습니다.</td></tr>
		                        	 </c:if>
		                        	 
		                        	 
		                        	 <c:if test="${not empty qList }">
		                        	 
			                        	 <c:forEach items="${qList}" var="qList" varStatus="index">
		                                    <tr>
		                                        <td>${qList.qnaNo }</td>
		                                        <td align="left">
		                                        	<p><b>${qList.qnaTitle }</b> <small>&nbsp;&nbsp; [ ${qList.qnaCreatedate } ]</small></p>
		                                        	<p>${qList.qnaContent }</p>
								                        				                        
							                        <!-- 관리자 답변 -->
				                                	<c:if test="${not empty qList.qnaAnswerContent }">	
							                            <div class="single-comment justify-content-between d-flex">
							                                <div class="user justify-content-between d-flex" style="display:none">
							                                    <div id="qaAdminAnswer${index.count }" class="collapse desc">
																	<div class="py-4" style="border-top: 0.1em dotted #ccc;">
								                                		<p><i class="fa fa-lock" aria-hidden="true"></i>&nbsp;&nbsp;<b> 관리자 답변</b> <small>&nbsp;&nbsp; [ ${qList.qnaAnswerCreatedate } ]</small></p>
														                <p>${qList.qnaAnswerContent }</p>
								                                	</div>
																</div>
							                                </div>
							                            </div>
				                                    </c:if>
		                                        </td>
		                                        
		                                        <td align="center">
		                                        	<c:choose>
		                                        		<c:when test="${empty qList.qnaAnswerContent }"></c:when>
		                                        		<c:otherwise>
						                                	<a href="#" class="text-uppercase" id="checkAdminAnswer" data-toggle="collapse" data-target="#qaAdminAnswer${index.count}"><i class="fa fa-chevron-down" aria-hidden="true"></i></a>
		                                        		</c:otherwise>
		                                        	</c:choose>
		                                        </td>
		                                        
		                                        <td align="center">
		                                        	<c:choose>
		                                        		<c:when test="${empty qList.qnaAnswerContent }"><b># 미답변</b></c:when>
		                                        		<c:otherwise><b># 답변완료</b></c:otherwise>
		                                        	</c:choose>
		                                        </td>
		                                        <td>
		                                        	<c:if test="${empty qList.qnaAnswerContent }">
		                                        		<a href="#" id="qnaUpdateBtn" onclick="qnaUpdateBtn(${qList.qnaNo})"><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a>
			                                        </c:if>
		                                        	<c:if test="${not empty qList.qnaAnswerContent }">-</c:if>
		                                        </td>
												<td><a href="#" id="qnaDeleteBtn" onclick="qnaDeleteBtn(${qList.qnaNo})"><i class="fa fa-times fa-lg" aria-hidden="true"></i></a></td>
		                                    </tr>
	                                    </c:forEach>
		                        	 </c:if>
                                    
                                </tbody>
                            </table>
                            <button type="button" onclick="location.href='qnaForm.qa'" class="btn alazea-btn-orange mb-15  float-right" id="boardMoreDetailBtn">작성하기</button>
                        </div>
                        
                        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
                        	
                        <script type="text/javascript">
                        
	                        $(function(){
	                        	
	                        	$("#showPeriod").val(${period});
	                        })
                        
                        
                        	//수정 form 이동
                        	function qnaUpdateBtn(qnaNo){
                        		
                        		var formObj = $("<form>");		//태그 생성하기
                        		
                        		formObj.attr("action", "qnaUpdateForm.qa").attr("method", "post");
                        		
                        		var inputQno = $("<input>").prop("type", "hidden").prop("name", "qnaNo").prop("value", qnaNo);
                        		var obj = formObj.append(inputQno);
                        		
        						$("body").append(obj)

        						obj.submit();
                        		
                        	}
                        	
                            //QNA 삭제
                        	function qnaDeleteBtn(qnaNo){
                            	
                            	if(confirm("삭제하시겠습니까?")){
                            		
	                        		var formObj = $("<form>");		//태그 생성하기
	                        		formObj.attr("action", "qnaDelete.qa").attr("method", "post");
	                        		
	                        		var inputQno = $("<input>").prop("type", "hidden").prop("name", "qnaNo").prop("value", qnaNo);
	                        		var obj = formObj.append(inputQno);
	                        		
	        						$("body").append(obj)
	
	        						obj.submit();
                            	}
                            	
                        	}
                            
                            
                            function changePeriod(value){
                            	location.href="qnaList.qa?currentPage=1&showPeriod=" + value;
                            	
                            }
                            
			            	
			            </script>
                        
							

                    <div class="row">
                        <div class="col-12 mt-100">
                            <!-- ######### 페이징 바 #########-->
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                
			                        <c:if test="${pi.currentPage > 1}">
			                            <li class="page-item"><a class="page-link" href="qnaList.qa?currentPage=${pi.currentPage-1}&showPeriod=${period}"><i class="fa fa-angle-left"></i></a></li>
									</c:if>
                                    
                                    <!-- paging 개수 -->
                                    <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage }">
	                                    <li class="page-item"><a class="page-link" href="qnaList.qa?currentPage=${i}&showPeriod=${period}">${i}</a></li>
									</c:forEach>
				                    
				                     <c:if test="${pi.currentPage < pi.maxPage}">
			                            <li class="page-item"><a class="page-link" href="qnaList.qa?currentPage=${pi.currentPage+1}&showPeriod=${period}"><i class="fa fa-angle-right"></i></a></li>
									</c:if>
                                    
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
				
			</div>
        </div>
    </section>
    <!-- ##### Blog Area End ##### -->

	<%@include file="/WEB-INF/views/common/footer.jsp" %>


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