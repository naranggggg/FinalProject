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
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
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
                    	
                        <div class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
                            <div class="mb-0">
                                <p><h5><b>🌱 도서 관리</b></h5></p>
                            </div>
                            <div class="search_by_terms">
                                <select class="custom-select widget-title" id="selectBookCategory" onchange="selectBookCategory(this.value)">
                                  <option value="all">Show:</option>
                                  <option value="gardening">원예</option>
                                  <option value="landscaping">조경</option>
                                  <option value="vegetableGarden">텃밭</option>
                                </select>
                            </div>
                        </div>

						<script type="text/javascript">
							function selectBookCategory(bookCategory){
								location.href = 'bookList.ad?currentPage=1&bookCategory=' + bookCategory;
							}
						
						</script>


                        <!-- 표 작성 내역 -->
                        <div class="mb-15" id="">현재 페이지:&nbsp;&nbsp;${pi.currentPage }</div>
						<div class=" ">
							<table class="table" align="center">
								<colgroup>
									<col width="5%">
									<col width="15%">
									<col width="auto">
									<col width="10%">
									<col width="15%">
									<col width="15%">
									<col width="10%">
									<col width="7%">
								</colgroup>
								<thead>
									<tr align="center">
										<th>No</th>
										<th>표지</th>
										<th>제목</th>
										<th>가격</th>
										<th>저자</th>
										<th>출판사</th>
										<th>조회수</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody align="center">
								
								
									<c:if test="${empty bookList }">
										<tr><td colspan="8">※ 등록된 도서가 없습니다.</td></tr>
									</c:if>
									<c:if test="${not empty bookList }">
										<c:forEach var="bl" items="${bookList }">
											<tr>
												<td>${bl.bookNo }</td>
												<td class="cart_product_img"><a href="bookDetail.re?bookNo=${bl.bookNo }"><img src="${contextPath }/${bl.bookChangeName}" alt="_book"></a></td>
												<td align="left"><a href="bookDetail.re?bookNo=${bl.bookNo }"><span># ${bl.bookCategory }</span> <p>${bl.bookTitle }</p></a></td>
												<td>${bl.bookPrice } 원</td>
												<td>${bl.bookAuthor }</td>
												<td>${bl.publisher }</td>
												<td>${bl.bookCount }</td>
												<td><a href="#" onclick="bookDeleteBtn(${bl.bookNo})"><i class="icon_close"></i></a></td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
                        
                        
                        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
                        <script type="text/javascript">
					    	
                        $(function(){
                        	
                        	//전체 선택/선택해제
                            $("#checkAll").on("change", function(){
                                $("table input[type='checkbox']").prop("checked", $(this).prop("checked"));
                            });
                        	
                        	let val = "${bookCategory}";
                        	$("#selectBookCategory").val(val);
                        	
                        });
                        
                        
                        
                        //등록 form 이동
	                   	function bookDeleteBtn(bookNo){
                        	
                        	if(confirm('해당 도서를 삭제하시겠습니까?')){
                        		
    	                   		var formObj = $("<form>");		//태그 생성하기
    	                   		
    	                   		formObj.attr("action", "bookDelete.re").attr("method", "post");
    	                   		
    	                   		var inputBook1 = $("<input>").prop("type", "hidden").prop("name", "bookNo").prop("value", bookNo);
    	                   		var inputBook2 = $("<input>").prop("type", "hidden").prop("name", "type").prop("value", "adminBook");

    	                   		var obj = formObj.append(inputBook1);
    	                   		obj = formObj.append(inputBook2);
    	                   		
    	   						$("body").append(obj)
    	
    	   						obj.submit();
                        		
                        	}
                        	
	                   	}
					</script>
                        

                    <div class="row">
                        <div class="col-12 mt-100">
                        
                            <!-- ######### 페이징 바 #########-->
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                
			                        <c:if test="${pi.currentPage > 1}">
			                            <li class="page-item"><a class="page-link" href="bookList.ad?currentPage=${pi.currentPage-1}&bookCategory=${bookCategory}"><i class="fa fa-angle-left"></i></a></li>
									</c:if>
                                    
                                    <!-- paging 개수 -->
                                    <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage }">
	                                    <li class="page-item"><a class="page-link" href="bookList.ad?currentPage=${i}&bookCategory=${bookCategory}">${i}</a></li>
									</c:forEach>
				                    
				                     <c:if test="${pi.currentPage < pi.maxPage}">
			                            <li class="page-item"><a class="page-link" href="bookList.ad?currentPage=${pi.currentPage+1}&bookCategory=${bookCategory}"><i class="fa fa-angle-right"></i></a></li>
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
