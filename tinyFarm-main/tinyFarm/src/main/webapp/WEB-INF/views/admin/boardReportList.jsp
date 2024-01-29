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
                        <div class="shop-sorting-data d-flex flex-wrap align-items-center justify-content-between">
                            <div class="mb-0">
                                <p><h5><b>🌱 신고 게시글 관리</b></h5></p>
                            </div>
                            <div class="search_by_terms">
                                <select class="custom-select widget-title" id="selectReportCategory" onchange="selectReportCategory(this.value)">
                                  <option value="0" selected>CATEGORY:</option>
                                  <option value="1">스팸</option>
                                  <option value="2">욕설</option>
                                  <option value="3">광고</option>
                                  <option value="4">음란물</option>
                                </select>
                            </div>
                        </div>

                        <!-- 표 작성 내역 -->
                        <div class="clearfix mt-15 mb-15" id="reportListTable">
                        	<div class="mb-15" id="reportListCurrentPage"></div>
                            <table class="table" align="center">
<!--                            <table class="table table-responsive" align="center"> -->
                                <colgroup>
                                    <col width="5%">
                                    <col width="12%">
                                    <col width="13%">
                                    <col width="15%">
                                    <col width="auto%">
                                    <col width="7%">
                                    <col width="5%">
                                </colgroup>
                                <thead>
                                    <tr align="center">
                                        <th>No.</th>
                                        <th>카테고리</th>
                                        <th>신고ID</th>
                                        <th>신고일자</th>
                                        <th>신고내용</th>
                                        <th>상세</th>
                                        <th><input type="checkbox" name="checkAll" id="checkAll"></th>
                                    </tr>
                                </thead>
                                <tbody align="center"></tbody>
                            </table>
                        </div>
                        <div class="single-widget-area float-right">
                            <ol class="popular-tags d-flex flex-wrap" >
                                <li onclick="reportStatus('revoke')"><a><i class="fa fa-reply" aria-hidden="true"></i>&nbsp;&nbsp;신고취소</a></li>
                                <li onclick="reportStatus('delete')"><a><i class="fa fa-times" aria-hidden="true"></i>&nbsp;&nbsp;게시글 삭제</a></li>
<!--                            <li><a><i class="fa fa-download" aria-hidden="true"></i> 다운로드</a></li> -->
                            </ol>
                        </div>

						<!-- ######### 검색 ######### -->
	                    <div class="section-padding-100">
		                    <div class="row">
		                        <div class="col-12 mt-100">
		                            <!-- ######### 페이징 바 #########-->
		                            <nav aria-label="Page navigation">
		                            	<ul class="pagination" id="reportListPagenation"></ul>
		                            </nav>
		                        </div>
		                    </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
    <!-- ##### Blog Area End ##### -->


						<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
                        <script type="text/javascript">
					    	
                        $(function(){
                        	
                        	selectReportList(${currentPage}, 0);
                        	
                        	//Modal 버튼 숨김
                        	$("#memberdetailViewModal").hide();
                        	
                        	//전체 선택/선택해제
                            $("#checkAll").on("change", function(){
                                $("table input[type='checkbox']").prop("checked", $(this).prop("checked"));
                            });
                        	
                        });
                        
                        
                        function selectReportList(currentPage, category){
                        	
                        	
                        	$.ajax({
                        		url: "selectReportList.ad",
                        		data: {
                        			currentPage: currentPage,
                        			category : category,
                        			type: "board"
                        		},
                        		success: function(result){
                        			ReportListTable(result, category);
                        		},error: function(){
                        			console.log("오류났수 ㅠㅠ");
                        		}
                        		
                        	})
                        	
                        }
                        
                        
                        function ReportListTable(result, category){
                        	
                        	let reportList = result.reportList;
                        	let reportPi = result.pi;
                        	
                        	
                        	
                        	
                        	
                        	if(reportList == null || reportList == ''){
                        		
                        		$("#reportListTable table tbody").html("<tr><td colspan='7'> ※ 신고 댓글이 없습니다. </td></tr>")
                        		
                        	}else{
                        	
                        	
                        	
                			let str = "";
                			
                        	reportList.forEach((item) => {
                        		
                        		let categoryStr = "";
                				
                				switch (item.category) {
								case "1" :
									item.category = '스팸';
									break;
								case "2" :
									item.category = '욕설';
									break;
								case "3" :
									item.category = '광고';
									break;
								case "4" :
									item.category = '음란물';
									break;
								default:
									break;
								}
                				
                				
                				
                				str += "<tr class='align-items-center'><td>" + item.reportNo + "</td>" + 
			                        	"<td>" + item.category + "</td>" +
			                        	"<td>" + item.reportWriter + "</td>" +
			                        	"<td>" + item.createDate + "</td>" +
			                        	"<td>" + item.reportContent +"</div>" + 
			                        	"<td><a href='#' onclick='reportDetailInfo(" + item.refBno + ")'><i class='fa fa-search'></i></a></td>" +
			                        	"<td><input type='checkbox' value=" + item.reportNo + " class='checkBoxReport'></td></tr>";
                				
                			})

                			$("#reportListTable table tbody").html(str);
                        	
                        	
                        	
                        	}
                        	
                        	
                        	//pagination
                    		let beforePage = "<li class='page-item'><a class='page-link' onclick='selectReportList(" + (reportPi.currentPage - 1) + ", \"" + category + "\")'><i class='fa fa-angle-left'></i></a></li>"
                    		let afterPage = "<li class='page-item'><a class='page-link' onclick='selectReportList(" + (reportPi.currentPage + 1) + ", \"" + category + "\")'><i class='fa fa-angle-right'></i></a></li>"
                        	
                        	let paging = "";
                    		
                    		
                    		if(reportPi.currentPage > 1){
                    			paging = beforePage;
                    		}
                    		
                    		
                    		for(var i = 1; i <= reportPi.endPage; i++) {
                        		paging += "<li class='page-item'><a class='page-link' onclick='selectReportList(" + i + ", \"" + category + "\")'>" + i + "</a></li>";
                    		}
                        	
                    		if(reportPi.currentPage < reportPi.maxPage){
                       			paging += afterPage;
                       		}	
                        	
                    		$("#reportListCurrentPage").text("현재 페이지: " + reportPi.currentPage);
                			$("#reportListPagenation").html(paging);
                        	
                        }
                        
                        
                        
                        //카테고리별 검색
                        function selectReportCategory(category){
                        	selectReportList(1, category);
                        }
                        
                        
                        
                        function reportStatus(status){
                        	
                        	let statusMsg = "";
                        	
                        	if(status == 'revoke'){
                        		statusMsg = "신고 일괄취소";
                        	}else{
                        		statusMsg = "게시글 삭제"
                        	}
                        	
                        	if(confirm("선택한 건의 " + statusMsg + "를 하시겠습니까?")){

                            let chkReportList = "";
							
                            //체크 요소 접근
                            $(".checkBoxReport:checked").each(function(index, item){
                            	
                                if(index == 0){							//첫번째[0]면 값만 넣기
                                	chkReportList += item.value;
                                } else {								//첫번째 아니면 ,값 넣기
                                	chkReportList += "," + item.value;
                                }

                            });
                            
	                            //선택된 글 없을시
	                            if(chkReportList == null || chkReportList == ""){
	                            	alert("회원을 선택하세요");
	                            }else{
	                            	
	                            
									//선택된 글이 있으면
	                            	$.ajax({
		    							url: "reportStatus.ad",
		    							data: {
		    								status : status,
		    								chkReportList : chkReportList,
		    								type : "board"
		    							},
		    							success: function(result){
		    								
		    								if(result === "NNNY"){
		    									alert("일괄 변경되었습니다.");
		    									
		    									$("input[type=checkbox]").prop("checked",false);
		    									selectReportList(${currentPage}, $("#selectReportCategory").val());
		    								}
		    								
		    							},
		    							error: function(){
		    								console.error("오류발생")
		    							}
		    						})
	    						
	                            }
	                            
                        	}
                            
                        }
                        
                        
                        //신고글 내용 상세조회
                        function reportDetailInfo(refBno){
                        	window.open("detail.bo?boardNo="+ refBno, '신고글');
                        }
                        
						
//                         //회원 정보 변경
//                         function memberInfoUpdate(){

//                         	if(!confirm('회원 정보를 수정하겠습니까?')){
//                         		return false;
//                         	}
                        	
//                         	var userNo = $('#userNo_detail').val();
//                         	var status = $('#userStatus_detail').val();
//                         	var grade = $('#userGrade_detail').val();
                        	
                        	
//                         	$.ajax({
//                         		url : "memberInfoUpdate.ad",
//                         		data: {
//                         			userNo : userNo,
//                         			status : status,
//                         			grade : grade
//                         		},
//                         		success: function(result){
                        			
//                         			$("#userStatus_detail").val(result.status);
//                         			$("#userGrade_detail").val(result.grade);
                        			
//                                 	selectReportList(${currentPage});
                        			
//                         		},
//                         		error: function(){
//                         			alert("오류났수ㅜ");
//                         		}

//                         	})
                        	
//                         }
                        
					</script>





    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
<%--     <script src="${contextPath }/resources/js/jquery/jquery-2.2.4.min.js"></script> --%>
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
