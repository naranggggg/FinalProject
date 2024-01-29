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
                                <p><h5><b>🌱 회원 관리</b></h5></p>
                            </div>
                            <div class="search_by_terms">
                                <form action="#" method="post" class="form-inline">
                                    <select class="custom-select widget-title">
                                      <option selected>Show:</option>
                                      <option value="1">미답변</option>
                                      <option value="2">답변완료</option>
                                    </select>
                                </form>
                            </div>
                        </div>

                        <!-- 표 작성 내역 -->
                        <div class="clearfix mt-15 mb-15" id="memberListTable">
<%--                         	<div class="mb-15">현재 페이지: ${pi.currentPage }</div> --%>
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
                                <tbody>
<%--                                 	<c:forEach var="m" items="${mList }"> --%>
<!-- 	                                    <tr> -->
<%-- 	                                        <td>${m.userNo }</td> --%>
<%-- 	                                        <td>${m.userId }</td> --%>
<%-- 	                                        <td>${m.userName }</td> --%>
<%-- 	                                        <td>${m.phone }</td> --%>
<%-- 	                                        <td>${m.email }</td> --%>
<%-- 	                                        <td>${m.grade }</td> --%>
<!-- 	                                        <td> -->
<%-- 	                                        	<c:choose> --%>
<%-- 	                                        		<c:when test="${m.status == 'Y' }">활동</c:when> --%>
<%-- 	                                        		<c:otherwise>활동중지</c:otherwise> --%>
<%-- 	                                        	</c:choose> --%>
<!-- 	                                        </td> -->
<%-- 	                                        <td><a href="#" onclick="memberDetailInfo(${m.userNo})"><i class="fa fa-search"></i></a></td> --%>
<%-- 	                                        <td><input type="checkbox" value="${m.userNo }" class="chkMember"></td> --%>
<!-- 	                                    </tr> -->
<%--                                     </c:forEach> --%>
                                </tbody>
                            </table>
                        </div>
                        <div class="single-widget-area float-right">
                            <ol class="popular-tags d-flex flex-wrap" onclick="memberStatus()">
                                <li><a href="#"><i class="fa fa-ban" aria-hidden="true"></i>&nbsp;&nbsp;일괄중지</a></li>
<!--                            <li><a href="#"><i class="fa fa-download" aria-hidden="true"></i> 다운로드</a></li> -->
                            </ol>
                        </div>

                        
                        
                        <!-- Button trigger modal -->
						<button type="button" id="memberdetailViewModal" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter"></button>
						
						<!-- Modal -->
						<div class="modal" id="exampleModalCenter" tabindex="-5" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
						  <div class="modal-dialog modal-dialog-centered" role="document">
						    <div class="modal-content">
						      <div class="modal-body">
						      
							      <div class="col-12">
				                    <div class="checkout_details_area clearfix">
				                        <h5>🌱 회원 정보</h5>
				                            <div class="row mt-15">
				                            	<div class="col-md-12 mt-30 mb-30">
					                            	<div class="mx-auto" style="width: 150px; height: 150px; border: 1px solid #ccc; position: relative; overflow: hidden;">
												        <!-- 이미지 표시 -->
												        <img id="profileImage" alt="프로필 사진" style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0;">
												    </div>
											    </div>
				                                <div class="col-md-6 mb-4">
				                                    <label for="first_name">No</label>
				                                    <input type="text" class="form-control" id="userNo_detail" name="userNo" value="" readonly="readonly">
				                                </div>
				                                <div class="col-md-6 mb-4">
				                                    <label for="first_name">ID</label>
				                                    <input type="text" class="form-control" id="userId_detail" name="userId" readonly="readonly">
				                                </div>
				                                <div class="col-md-6 mb-4">
				                                    <label for="last_name">이름</label>
				                                    <input type="text" class="form-control" id="userName_detail" name="userName" required>
				                                </div>
				                                <div class="col-md-6 mb-4">
				                                    <label for="country">회원등급</label>
				                                    <select class="custom-select d-block w-100" id="userGrade_detail" name="grade">
				                                        <option value="씨앗">씨앗</option>
				                                        <option value="새싹">새싹</option>
				                                        <option value="열매">열매</option>
				                                        <option value="관리자">관리자</option>
				                                    </select>
				                                </div>
				                                <div class="col-md-6 mb-4">
				                                    <label for="city">가입일자</label>
				                                    <input type="text" class="form-control" id="userEnrollDate_detail" name="enrolldate" readonly="readonly">
				                                </div>
				                                <div class="col-md-6 mb-4">
				                                    <label for="country">활동</label>
				                                    <select class="custom-select d-block w-100" id="userStatus_detail" name="status">
				                                        <option value="Y">활동</option>
				                                        <option value="N">활동중지</option>
				                                    </select>
				                                </div>
				                                <div class="col-12 mb-4">
				                                    <label for="company">주소</label>
				                                    <input type="text" class="form-control" id="userAddress_detail" name="address" readonly="readonly">
				                                </div>
				                                <div class="col-12 mb-4">
				                                    <label for="company">연락처</label>
				                                    <input type="text" class="form-control" id="userPhone_detail" name="phone" readonly="readonly">
				                                </div>
				                            </div>
			                              	<button type="button" class="btn alazea-btn mt-15 float-right" onclick="memberInfoUpdate()">수정</button>
					                    </div>
					                </div>
							      </div>
							    </div>
							  </div>
							</div>
                        
                        
                        
                        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
                        <script type="text/javascript">
					    	
                        $(function(){
                        	
                        	//Modal 버튼 숨김
                        	$("#memberdetailViewModal").hide();
                        	
                        	//전체 선택/선택해제
                            $("#checkAll").on("change", function(){
                                $("table input[type='checkbox']").prop("checked", $(this).prop("checked"));
                            });
                        	
                        });
                        
                        
                        
                        
                        function selectMemberList(){
                        	
                        	
                        	$.ajax({
                        		url: "selectMemberList.ad",
                        		data: {
                        			currentPage: currentPage
                        		},
                        		success: function(result){
                        			
                        			
                        			let str = "";
                        			
                        			result.each((itme) => {
                        				
                        				str += "dd";
                        				
//                                         	<c:forEach var='m' items='${mList }''>
// 	                                    <tr>
// 	                                        <td>${m.userNo }</td>
// 	                                        <td>${m.userId }</td>
// 	                                        <td>${m.userName }</td>
// 	                                        <td>${m.phone }</td>
// 	                                        <td>${m.email }</td>
// 	                                        <td>${m.grade }</td>
// 	                                        <td>
// 	                                        	<c:choose>
// 	                                        		<c:when test='${m.status == 'Y' }'>활동</c:when>
// 	                                        		<c:otherwise>활동중지</c:otherwise>
// 	                                        	</c:choose>
// 	                                        </td>
// 	                                        <td><a href="#" onclick="memberDetailInfo(${m.userNo})"><i class="fa fa-search"></i></a></td>
// 	                                        <td><input type="checkbox" value="${m.userNo }" class="chkMember"></td>
// 	                                    </tr>
//                                     </c:forEach>
                        					
                        					
                        					
                        				
                        			})
                        			
                        			
                        			
                        			
                        			
                        			
                        			
                        			memberListTable.html(str);
                        			
                        			
                        			
                        			
                        		}
                        		
                        	})
                        	
                        	
//                         	<c:forEach var="m" items="${mList }">
//                             <tr>
//                                 <td>${m.userNo }</td>
//                                 <td>${m.userId }</td>
//                                 <td>${m.userName }</td>
//                                 <td>${m.phone }</td>
//                                 <td>${m.email }</td>
//                                 <td>${m.grade }</td>
//                                 <td>
//                                 	<c:choose>
//                                 		<c:when test="${m.status == 'Y' }">활동</c:when>
//                                 		<c:otherwise>활동중지</c:otherwise>
//                                 	</c:choose>
//                                 </td>
//                                 <td><a href="#" onclick="memberDetailInfo(${m.userNo})"><i class="fa fa-search"></i></a></td>
//                                 <td><input type="checkbox" value="${m.userNo }" class="chkMember"></td>
//                             </tr>
//                         </c:forEach>
                        	
                        }
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        function memberStatus(){
                        	
                        	if(confirm("선택한 회원의 활동 중지 처리를 하시겠습니까?")){

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
	                            
		                            //선택된 글이 있는 경우
		                    		var formObj = $("<form>");		//태그 생성하기
		                    		formObj.attr("action", "memberStatus.ad").attr("method", "post");
		                    		
		                    		var inputQnos = $("<input>").prop("type", "hidden").prop("name", "chkMemberList").prop("value", chkMemberList);
		                    		var obj = formObj.append(inputQnos);
		                    		
		    						$("body").append(obj)
		
		    						obj.submit();
	    						
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
                        			
                        			var imageSrc = "";
                        			
                        			if(result.changeName == null){
                        				imageSrc = "${contextPath}/resources/img/icon/common_koongya.jpg";
                        			
                        			}else{
                        				imageSrc = "${contextPath}/" + result.changeName;
                        			}
                        			
                        			$("#profileImage").prop("src", imageSrc);
                        			
                                	$("#memberdetailViewModal").click();
                                	
                        		},
                        		error: function(){
                        			alert("오류났수ㅜ");
                        		}

                        	})
                        	
                        }
                        
                        
                        
                        //div 새로고침
//                         function memberListReload(){
//                             $('#memberListTable').load(window.location.href + '#memberListTable');
//                      	}
                        
                        
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
                        			
                        			location.reload();
                        			
                        		},
                        		error: function(){
                        			alert("오류났수ㅜ");
                        		}

                        	})
                        	
                        }
                        
					</script>
                        
                        
                        
<!--				######### 검색 ######### -->
                    <div class="section-padding-100">
                        <div class="single-widget-area">
                        	<!-- height-50 css 추가 -->
                            <form action="" method="get" class="search-form d-flex float-right">   
                                <div class="mx-auto">
                                    <input type="search" name="searchId" id="widgetsearch" placeholder="ID 검색">
                                    <button type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12 mt-100">
                        
                            <!-- ######### 페이징 바 #########-->
<!--                             <nav aria-label="Page navigation"> -->
<!--                                 <ul class="pagination"> -->
                                
<%-- 			                        <c:if test="${pi.currentPage > 1}"> --%>
<%-- 			                            <li class="page-item"><a class="page-link" href="memberList.ad?currentPage=${pi.currentPage-1}"><i class="fa fa-angle-left"></i></a></li> --%>
<%-- 									</c:if> --%>
                                    
<!--                                     paging 개수 -->
<%--                                     <c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage }"> --%>
<%-- 	                                    <li class="page-item"><a class="page-link" href="memberList.ad?currentPage=${i}">${i}</a></li> --%>
<%-- 									</c:forEach> --%>
				                    
<%-- 				                     <c:if test="${pi.currentPage < pi.maxPage}"> --%>
<%-- 			                            <li class="page-item"><a class="page-link" href="memberList.ad?currentPage=${pi.currentPage+1}"><i class="fa fa-angle-right"></i></a></li> --%>
<%-- 									</c:if> --%>
<!--                                 </ul> -->
<!--                             </nav> -->
                            
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
