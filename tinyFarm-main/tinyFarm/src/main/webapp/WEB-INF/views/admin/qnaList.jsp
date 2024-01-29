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
                            <li class="breadcrumb-item active" aria-current="page"><a href="main.ad">Admin</a></li>
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
                                <p><h5><b>🌱 답변 관리</b></h5></p>
                            </div>
                            <div class="search_by_terms">
                                <form action="#" method="post" class="form-inline" >
                                    <select class="custom-select widget-title" id="answerYn" onchange="changeAnswerYn(this.value)">
                                      <option value="2">Show: ALL</option>
                                      <option value="0">미답변</option>
                                      <option value="1">답변완료</option>
                                    </select>
                                </form>
                            </div>
                        </div>

                        <!-- 표 작성 내역 -->
                        <div class="clearfix mt-15 mb-15">
                        	<div class="mb-15">현재 페이지: ${pi.currentPage }</div>
<!--                             <table class="table table-responsive" align="center"> -->
                            <table class="table" align="center">
                                <colgroup>
                                    <col width="5%">
                                    <col width="15%">
                                    <col width="auto%">
                                    <col width="15%">
                                    <col width="15%">
                                    <col width="5%">
                                </colgroup>
                                <thead>
                                    <tr align="center">
                                        <th>No.</th>
                                        <th>ID</th>
                                        <th>문의사항</th>
                                        <th>작성일자</th>
                                        <th>답변일자</th>
                                        <th><input type="checkbox" name="checkAll" id="checkAll"></th>
                                    </tr>
                                </thead>
                                <tbody align="center">
                                		<c:if test="${not empty qList }">
	                                		<c:forEach var="q" items="${qList }">
			                                    <tr>
			                                        <td>${q.qnaNo }</td>
			                                        <td>${q.userNo }</td>
			                                        <c:choose>
			                                        	<c:when test="${empty q.qnaAnswerContent }">
					                                        <td align="left"><a href="#" onclick="qnaAnswerEnrollBtn(${q.qnaNo})">${q.qnaTitle } <span>&nbsp;&nbsp;&nbsp;<i class="fa fa-commenting-o fa-lg"></i></span></a></td>
			                                        	</c:when>
			                                        	<c:otherwise>
					                                        <td align="left"><a href="#" onclick="qnaAnswerUpdateBtn(${q.qnaNo});">${q.qnaTitle } <span>&nbsp;&nbsp;&nbsp;<i class="fa fa-pencil-square-o fa-lg"></i></span></a></td>
			                                        	</c:otherwise>
			                                        </c:choose>
			                                        <td>${q.qnaCreatedate }</td>
			                                        <td>${q.qnaAnswerCreatedate }</td>
			                                        <td><input type="checkbox" value="${q.qnaNo }" class="chkQna"></td>
			                                    </tr>
		                                    </c:forEach>
                                		</c:if>
                                		<c:if test="${empty qList }">
                                			<tr><td colspan="6">※ 문의 내역이 없습니다.</td></tr>
                                		</c:if>
                                </tbody>
                            </table>
                        </div>
                        <div class="single-widget-area float-right">
                            <ol class="popular-tags d-flex flex-wrap" onclick="checkQnaDelete()">
                                <li><a href="#"><i class="fa fa-times">&nbsp;&nbsp;문의내역 삭제</i></a></li>
                            </ol>
                        </div>
                        

                        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
                        <script type="text/javascript">
                        
					    	
                        $(function(){
                        	
                        	
                        	$("#answerYn").val(${answerYn});
                        	
                        	//전체 선택/선택해제
                            $("#checkAll").on("change", function(){
                                $("table input[type='checkbox']").prop("checked", $(this).prop("checked"));
                            });
                        	
                        });
                        
                        
                        
                    	//등록 form 이동
                    	function qnaAnswerEnrollBtn(qnaNo){
                    		
                    		var formObj = $("<form>");		//태그 생성하기
                    		
                    		formObj.attr("action", "qnaAnswerForm.ad").attr("method", "post");
                    		
                    		var inputQno = $("<input>").prop("type", "hidden").prop("name", "qnaNo").prop("value", qnaNo);
                    		var obj = formObj.append(inputQno);
                    		
    						$("body").append(obj)

    						obj.submit();
                    		
                    	}
                    	
						
                    	
                    	//수정 form 이동
                    	function qnaAnswerUpdateBtn(qnaNo){
                    		
                    		var formObj = $("<form>");		//태그 생성하기
                    		
                    		formObj.attr("action", "qnaAnswerUpdateForm.ad").attr("method", "post");
                    		
                    		var inputQno = $("<input>").prop("type", "hidden").prop("name", "qnaNo").prop("value", qnaNo);
                    		var obj = formObj.append(inputQno);
                    		
    						$("body").append(obj)

    						obj.submit();
                    		
                    	}
                        
                        
                        
                        function checkQnaDelete(){
                        	
                        	if(confirm("선택 문의내역을 삭제하시겠습니까?")){

                            let chkQnaList = "";
							
                            //체크 요소 접근
                            $(".chkQna:checked").each(function(index, item){
                            	
                                if(index == 0){							//첫번째[0]면 값만 넣기
                                	chkQnaList += item.value;
                                } else {								//첫번째 아니면 ,값 넣기
                                	chkQnaList += "," + item.value;
                                }

                            });
                            
	                            //선택된 글 없을시
	                            if(chkQnaList == null || chkQnaList == ""){
	                            	
	                            	alert("삭제할 글을 선택하세요");
	                            	
	                            }else{
	                            
		                            //선택된 글이 있는 경우
		                    		var formObj = $("<form>");		//태그 생성하기
		                    		formObj.attr("action", "qnaAnswerDelete.ad").attr("method", "post");
		                    		
		                    		var inputQnos = $("<input>").prop("type", "hidden").prop("name", "chkQnaList").prop("value", chkQnaList);
		                    		var obj = formObj.append(inputQnos);
		                    		
		    						$("body").append(obj)
		
		    						obj.submit();
	    						
	                            }
	                            
                        	}
                            
                        }
                        
                        
                        function changeAnswerYn(value){
                        	location.href = "qnaList.ad?currentPage=1&answerYn=" + value;
                        }
                        
					    </script>
                        
                        
<!--						######### 검색 #########-->
<!--                         <div class="section-padding-100"> -->
<!--                             <div class="single-widget-area"> -->
<!--                                 <form action="#" method="get" class="search-form d-flex float-right">   height-50 css 추가 -->
<!--                                     <div class=""> -->
<!--                                         <select class="custom-select widget-title height-50"> -->
<!--                                             <option value="1">ID</option> -->
<!--                                             <option value="2">내용</option> -->
<!--                                         </select> -->
<!--                                     </div> -->
<!--                                     <div class=""> -->
<!--                                         <input type="search" name="search" id="widgetsearch" placeholder="Search..."> -->
<!--                                         <button type="submit"><i class="icon_search"></i></button> -->
<!--                                     </div> -->
<!--                                 </form> -->
<!--                             </div> -->
<!--                         </div> -->


                    <!-- </div> -->

                    <div class="row">
                        <div class="col-12 mt-100">
                            <!-- ######### 페이징 바 #########-->
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                
			                        <c:if test="${pi.currentPage > 1}">
			                            <li class="page-item"><a class="page-link" href="${contextPath }/qnaList.ad?currentPage=${pi.currentPage-1}&answerYn=${answerYn}"><i class="fa fa-angle-left"></i></a></li>
									</c:if>
                                    
                                    <!-- paging 개수 -->
                                    <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage }">
	                                    <li class="page-item"><a class="page-link" href="${contextPath }/qnaList.ad?currentPage=${i}&answerYn=${answerYn}">${i}</a></li>
									</c:forEach>
									
				                     <c:if test="${pi.currentPage < pi.maxPage}">
			                            <li class="page-item"><a class="page-link" href="${contextPath }/qnaList.ad?currentPage=${pi.currentPage+1}&answerYn=${answerYn}"><i class="fa fa-angle-right"></i></a></li>
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
