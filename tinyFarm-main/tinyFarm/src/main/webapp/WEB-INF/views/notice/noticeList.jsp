<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작은농장</title>
 <!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- 부트스트랩 5.3.2 -->
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
crossorigin="anonymous">
<style>
	
	table {
        border: 1px #a39485 solid;
        font-size: .9em;
        box-shadow: 0 2px 5px rgba(0,0,0,.25);
        width: 1000px;
        margin:0 auto;
        border-collapse: collapse;
        border-radius: 5px;
        overflow: hidden;
        text-align:center;
    }

    th {
    text-align: left;
    }
    
    .tableHeader {
    font-weight: bold;
    color: #fff;
    background-color: #70c745;
    }
 
    td, th {
    padding: 1em .5em;
    vertical-align: middle;
    }
    
    td {
    border-bottom: 1px solid rgba(0,0,0,.1);
    background: #fff;
    }
    .searchContainer{
    	width:1000px;
		
		display:flex;
		justify-content: space-between;
		margin:0 auto;
		
	}
	.searchOutDiv{
		width: 320px;
		height:38px;
	
		/* margin-top: 15px;
		margin-bottom: 15px; */
		vertical-align:middle;
		border: 2px #70c745 solid ;
	}
	.searchOutDiv input{
		width: 210px;
		height: 20px;
		border-style: none;
		padding:10px;
		outline: none;
		
	}
	.searchInDiv{
		display:flex;
		align-items:center;
		width:310px;
		height:20px;
		margin:0 auto;
		margin:5px auto;
	}
	.searchInDiv img{
		width:15px;
		height:15px;
	}
	#searchBtn{
		display: flex;
		justify-content: center;
		align-items: center;
	 	width:30px;
	 	height:25px;
		background-color:transparent;
	 	border:none;
	 	align-content: center;
	}
	#sType{
		border:none;
		outline:none;
		
	}
	.pageBarDiv{
		margin-top:15px;
	}
	.impoTypeDiv{
		border-radius: 30px;
		background-color: red;
		color:white;
	}
	.title{
		max-width:300px;
		text-overflow: ellipsis;
		overflow: hidden;
		white-space: nowrap;
	}
	.page-link.active{
		background-color: #70c745;
		color:white;
		border-color: #70c745;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
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
    <section class="alazea-portfolio-area portfolio-page section-padding-0-100">
        <div class="container">
            <div class="row">
                <div class="col-12" style="margin-top:30px;">
                    <!-- Section Heading -->
                    <div class="section-heading text-center">                  	
                        <h2>공지사항</h2>
                    </div>
                </div>
            </div>
        </div>
		<div class="searchContainer">
			
				<div class="insertNoticeDiv">
					<c:if test="${loginUser.userId eq 'admin'}">
						<!-- <a href="goInsertNotice.no" class="btn btn-success" id="insertNoticeBtn">글쓰기</a> -->
						<a href="goInsertNotice.no" class="btn btn-success" id="insertNoticeBtn">글쓰기</a>
					</c:if>
				</div>
			<form action="noticeList.no">
		        <div class="searchOutDiv">
		        	<div class="searchInDiv">
						<select id="sType" name="sType">
							<option>제목</option>
							<option>내용</option>
						</select>
			  			<input type="search" id="searchInput" name="sText" placeholder="search..">
				  		<button id="searchBtn" type="submit"><img src="${contextPath}/resources/img/icon/search.svg"></button>       		        	
		        	</div>	        	  			
		  		</div> 
			
			</form>
	    </div>
        <div class="container" style="margin-top:30px;">
        

            <div>
				<!-- Single Portfolio Area -->

                   <table id="veTable" style="margin:0 auto;">
                   		<colgroup>
						  <col width="10%" />
						  <col width="10%" />
						  <col width="40%"/>
						  <col width="15%"/>
						  <col width="10%"/>
						   <col width="15%"/>
						</colgroup>
                   		
				        <thead>
					        <tr class="tableHeader">
					            <th>번호</th>
					            <th>분류</th>
					            <th>제목</th>
					            <th>작성자</th>				           
					            <th>조회수</th>
					            <th>작성일</th>				    
					        </tr>
					        <c:if test="${not empty impoList}">
						        <c:forEach items="${impoList}" var="li">	
									<tr>
							            <td>${li.noticeNo}</td>
							            <td><div class="impoTypeDiv"><b>${li.noticeType}</b></div></td>
							            <td class="title"><a href="detailNotice.no?noticeNo=${li.noticeNo}">${li.noticeTitle}</a></td>
							            <td>${li.noticeWriter}</td>
							            <td>${li.count}</td>
							            <td>${li.createDate}</td>
							        </tr>			
								</c:forEach>
					        
					        </c:if>
				         
				        </thead>
				        <tbody>
							<c:choose>
								<c:when test="${empty list}">
									<tr align="center">
										<td colspan="6">공지사항이 존재하지 않습니다</td>
										
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list}" var="li">	
										<tr>
								            <td>${li.noticeNo}</td>
								            <td>${li.noticeType}</td>
								            <td class="title"><a href="detailNotice.no?noticeNo=${li.noticeNo}">${li.noticeTitle}</a></td>
								            <td>${li.noticeWriter}</td>
								            <td>${li.count}</td>
								            <td>${li.createDate}</td>
								        </tr>			
											
					
									</c:forEach>
								</c:otherwise>
							</c:choose>			
				        </tbody>
				    </table>
             
            </div>				
        </div>
         <!-- 페이징바 -->
			<div class="pageBarDiv" align="center">
				 <ul class="pagination">
				<c:choose>
					<c:when test="${not empty sText}">
						<c:choose>
		                    <c:when test="${pi.currentPage eq 1}">
		                       <li class="page-item">
			                       	<button class="page-link" disabled>
			                       	<i class="fa fa-angle-left"></i></button>
                               </li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item">
		                        	<button class="page-link" onclick="location.href='noticeList.no?currentPage=${pi.currentPage-1}&sText=${sText}&sType=${sType}'"><i class="fa fa-angle-left"></i></button>
		                    	</li>
		                    </c:otherwise>
		                </c:choose>
		                <c:forEach var="i" begin="${pi.startPage}" end ="${pi.endPage}">
		                	<c:choose>
		                		<c:when test="${i eq pi.currentPage}">
		                			<li class="page-item">
		                				<button style='color:white;' class='page-link active' onclick="location.href='noticeList.no?currentPage=${i}&sText=${sText}&sType=${sType}'">${i}</button>
		                			</li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item">
		                				<button class='page-link' onclick="location.href='noticeList.no?currentPage=${i}&sText=${sText}&sType=${sType}'">${i}</button>
		                			</li>
		                		</c:otherwise>
		                	</c:choose>
		                </c:forEach>
		                <c:choose>
		                    <c:when test="${pi.currentPage eq pi.maxPage}">
		                    	<li class="page-item">
		                        	<button  class='page-link' disabled><i class="fa fa-angle-right"></i></button>
		                        </li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item">
		                        	<button  class='page-link' onclick="location.href='noticeList.no?currentPage=${i}&sText=${sText}&sType=${sType}'"><i class="fa fa-angle-right"></i></button>
		                    	</li>
		                    </c:otherwise>
		                </c:choose>
					</c:when>
					<c:otherwise>
		                <c:choose>
		                    <c:when test="${pi.currentPage eq 1}">
		                    	<li class="page-item">
		                        	<button  class="page-link" disabled><i class="fa fa-angle-left"></i></button>
		                        </li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item">
		                        	<button class="page-link" onclick="location.href='noticeList.no?currentPage=${pi.currentPage-1}'"><i class="fa fa-angle-left"></i></button>
		                        </li>
		                    </c:otherwise>
		                </c:choose>
		                <c:forEach var="i" begin="${pi.startPage}" end ="${pi.endPage}">
		                	<c:choose>
		                		<c:when test="${i eq pi.currentPage}">
		                			<li class="page-item">
		                				<button style='color:white;' class='page-link active' onclick="location.href='noticeList.no?currentPage=${i}'">${i}</button>
		                			</li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item">
		                				<button class='page-link' onclick="location.href='noticeList.no?currentPage=${i}'">${i}</button>
		                			</li>
		                		</c:otherwise>
		                	</c:choose>
		                </c:forEach>
		                <c:choose>
		                    <c:when test="${pi.currentPage eq pi.maxPage}">
		                        <li class="page-item">
		                        	<button  class='page-link' disabled><i class="fa fa-angle-right"></i></button>
		                        </li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item">
		                        	<button  class='page-link' onclick="location.href='noticeList.no?currentPage=${pi.currentPage+1}'"><i class="fa fa-angle-right"></i></button>
		                    	</li>
		                    </c:otherwise>
		                </c:choose>
					
					</c:otherwise>
				</c:choose>
				</ul>
			</div>
    </section>

	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>