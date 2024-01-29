<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
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
                                <p><h5><b>🌱 회원 관리</b></h5></p>
                            </div>
                        </div>

                        <!-- 표 작성 내역 -->
                        <div class="clearfix mt-15 mb-15" id="memberListTable">
                        	<div class="mb-15" id="memberListCurrentPage">현재 페이지: ${result.pi.currentPage }</div>
                            <table class="table table-responsive" align="center">
                                <colgroup>
                                    <col width="5%">
                                    <col width="13%">
                                    <col width="13%">
                                    <col width="18%">
                                    <col width="auto%">
                                    <col width="12%">
                                    <col width="13%">
                                    <col width="8%">
                                    <col width="5%">
                                </colgroup>
                                <thead>
                                    <tr align="center">
                                        <th>No.</th>
                                        <th>ID</th>
                                        <th>이름</th>
                                        <th>연락처</th>
                                        <th>EMAIL</th>
                                        <th>등급</th>
                                        <th>활동여부</th>
                                        <th>상세</th>
                                        <th><input type="checkbox" name="checkAll" id="checkAll"></th>
                                    </tr>
                                </thead>
                                <tbody align="center"></tbody>
                            </table>
                        </div>
                        <div class="single-widget-area float-right">
                            <ol class="popular-tags d-flex flex-wrap" >
                                <li onclick="memberStatus('N')"><a><i class="fa fa-ban" aria-hidden="true"></i>&nbsp;&nbsp;일괄중지</a></li>
                                <li onclick="memberStatus('Y')"><a><i class="fa fa-check" aria-hidden="true"></i>&nbsp;&nbsp;일괄중지 해제</a></li>
<!--                            <li><a><i class="fa fa-download" aria-hidden="true"></i> 다운로드</a></li> -->
                            </ol>
                        </div>

                        
                        <%@ include file="memberDetail.jsp" %>
                        
						<!-- ######### 검색 ######### -->
	                    <div class="section-padding-100">
	                        <div class="single-widget-area">
	                        	<!-- height-50 css 추가 -->
	                           <div class="mx-auto search-form d-flex float-right">
	                               <input type="search" name="searchId" id="searchMemberId" placeholder="ID 검색">
	                               <button type="button" onclick="searchMemberId()"><i class="fa fa-search"></i></button>
	                           </div>
	                        </div>
	                    </div>
	
	                    <div class="row">
	                        <div class="col-12 mt-100">
	                            <!-- ######### 페이징 바 #########-->
	                            <nav aria-label="Page navigation">
	                            	<ul class="pagination" id="memberListPagenation"></ul>
	                            </nav>
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
                        	
                        	selectMemberList(${currentPage}, "");
                        	
                        	//Modal 버튼 숨김
                        	$("#memberdetailViewModal").hide();
                        	
                        	//전체 선택/선택해제
                            $("#checkAll").on("change", function(){
                                $("table input[type='checkbox']").prop("checked", $(this).prop("checked"));
                            });
                        	
                        });
                        
                        
                        //회원 리스트
                        function selectMemberList(currentPage, searchId){
                        	
                        	$.ajax({
                        		url: "selectMemberList.ad",
                        		data: {
                        			currentPage: currentPage,
                        			searchId : searchId
                        		},
                        		success: function(result){
                        			makeMemberListTable(result, searchId);
                        		},error: function(){
                        			console.log("오류났수 ㅠㅠ");
                        		}
                        		
                        	})
                        	
                        }
                        
                        
                        function makeMemberListTable(result, searchId){
                        	
                        	let mList = result.mList;
                        	let mPi = result.pi;
                        	
                        	let str = "";
                			
                        	mList.forEach((item) => {
                				
                				if(item.status == 'Y'){
                					item.status = '활동';
                				}else{
                					item.status = '활동중지';
                				}
                				
                				if(item.email == null){
                					item.email = '-';
                				}
                				
                				if(item.phone == null){
                					item.phone = '-';
                				}
                				
                				
                				str += "<tr><td>" + item.userNo + "</td>" +
                                 		"<td>" + item.userId + "</td>" +
                                 		"<td>" + item.userName + "</td>" +
                                 		"<td>" + item.phone + "</td>" +
                                 		"<td>" + item.email + "</td>" +
                                 		"<td>" + item.grade + "</td>" +
                                 		"<td>" + item.status + "</td>" +
                                 		"<td><a href='#' onclick='memberDetailInfo(" + item.userNo + ")'><i class='fa fa-search'></i></a></td>" +
                               			"<td><input type='checkbox' value=" + item.userNo + " class='chkMember'></td></tr>"
                				
                			})

                			$("#memberListTable table tbody").html(str);
                        	
                        	
                        	//pagination
                    		let beforePage = "<li class='page-item'><a class='page-link' onclick='selectMemberList(" + (mPi.currentPage - 1) + ", \"" + searchId + "\")'><i class='fa fa-angle-left'></i></a></li>"
                    		let afterPage = "<li class='page-item'><a class='page-link' onclick='selectMemberList(" + (mPi.currentPage + 1) + ", \"" + searchId + "\")'><i class='fa fa-angle-right'></i></a></li>"
                        	
                        	let paging = "";
                    		
                    		
                    		if(mPi.currentPage > 1){
                    			paging = beforePage;
                    		}
                    		
                    		
                    		for(var i = 1; i <= mPi.endPage; i++) {
                        		paging += "<li class='page-item'><a class='page-link' onclick='selectMemberList(" + i + ", \"" + searchId + "\")'>" + i + "</a></li>";
                    		}
                        	
                    		if(mPi.currentPage < mPi.maxPage){
                       			paging += afterPage;
                       		}	
                        	
                    		
                    		$("#memberListCurrentPage").text("현재 페이지: " + mPi.currentPage);
                			$("#memberListPagenation").html(paging);
                        	
                        }
                        
                        
                        //아이디 검색
                        function searchMemberId(){
                        	selectMemberList(1, $("#searchMemberId").val());
                        }
                        
                        
                        
                        function memberStatus(status){
                        	
                        	let statusMsg = "";
                        	
                        	if(status == 'Y'){
                        		statusMsg = "활동중지 해지";
                        	}else{
                        		statusMsg = "활동중지 처리"
                        	}
                        	
                        	if(confirm("선택한 회원의 " + statusMsg + "를 하시겠습니까?")){

                            let chkMemberList = "";
							
                            //체크 요소 접근
                            $(".chkMember:checked").each(function(index, item){
                            	
                                if(index == 0){							//첫번째[0]면 값만 넣기
                                	chkMemberList += item.value;
                                } else {								//첫번째 아니면 ,값 넣기
                                	chkMemberList += "," + item.value;
                                }

                            });
                            
	                            //선택된 글 없을시
	                            if(chkMemberList == null || chkMemberList == ""){
	                            	alert("회원을 선택하세요");
	                            }else{
	                            
									//선택된 글이 있으면
	                            	$.ajax({
		    							url: "memberStatus.ad",
		    							data: {
		    								status : status,
		    								chkMemberList : chkMemberList
		    							},
		    							success: function(result){
		    								
		    								if(result === "NNNY"){
		    									alert("회원 활동 상태변경이 일괄 변경되었습니다.");
		    									
		    									$("input[type=checkbox]").prop("checked",false);
		    									selectMemberList(${currentPage}, $("#searchMemberId").val());
		    								}
		    								
		    							},
		    							error: function(){
		    								console.error("오류발생")
		    							}
		    						})
	    						
	                            }
	                            
                        	}
                            
                        }
                        
                        
                        function memberDetailInfo(userNo){
                        	
                        	$.ajax({
                        		url : "memberDetailInfo.ad",
                        		data: { userNo : userNo },
                        		success: function(result){
                        			
                        			$("#userNo_detail").val(result.userNo);
                        			$("#userId_detail").val(result.userId);
                        			$("#userName_detail").val(result.userName);
                        			$("#userEnrollDate_detail").val(result.enrollDate);
                        			$("#userStatus_detail").val(result.status);
                        			$("#userGrade_detail").val(result.grade);
                        			$("#userAddress_detail").val(result.address);
                        			$("#userPhone_detail").val(result.phone);
                        			$("#profileImage").prop("src", "${contextPath}/" + result.changeName);
                        			
                                	$("#memberdetailViewModal").click();
                                	
                        		},
                        		error: function(){
                        			alert("오류났수ㅜ");
                        		}

                        	})
                        	
                        }
                        
						
                        //회원 정보 변경
                        function memberInfoUpdate(){

                        	if(!confirm('회원 정보를 수정하겠습니까?')){
                        		return false;
                        	}
                        	
                        	var userNo = $('#userNo_detail').val();
                        	var status = $('#userStatus_detail').val();
                        	var grade = $('#userGrade_detail').val();
                        	
                        	
                        	$.ajax({
                        		url : "memberInfoUpdate.ad",
                        		data: {
                        			userNo : userNo,
                        			status : status,
                        			grade : grade
                        		},
                        		success: function(result){
                        			
                        			$("#userStatus_detail").val(result.status);
                        			$("#userGrade_detail").val(result.grade);
                        			
                                	selectMemberList(${currentPage}, $("#searchMemberId").val());
                                	
                                	alert('회원 정보 변경이 완료되었습니다.');
                                	
                        		},
                        		error: function(){
                        			alert("오류났수ㅜ");
                        		}

                        	})
                        	
                        }
                        
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
