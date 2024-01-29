<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작은농장</title>
   <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
		.plantImg,.plantName:hover{
			cursor : pointer;
		}
		.plantImg{
			width:250px;
			height:250px;
			border-radius: 10px;
		}
		.searchContainer{
			margin-bottom:50px;
			display:flex;
			justify-content: flex-end;
		}
		.searchOutDiv{
			width: 235px;
			height:35px;
		
			/* margin-top: 15px;
			margin-bottom: 15px; */
			vertical-align:middle;
			border: 2px #70c745 solid ;
		}
		.searchOutDiv input{
			width: 200px;
			height: 20px;
			border-style: none;
			padding:10px;
			outline: none;
			
		}
		.searchInDiv{
			display:flex;
			align-items:center;
			width:420px;
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
			<h2>실내정원용 식물</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item"><a href="${contextPath}/inGardenPlantList.pp">실내정원용 식물</a></li>
					
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
    <section class="new-arrivals-products-area section-padding-0-100">
    	<!-- ##### Single Widget Area ##### -->
  		
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center">
                        <h2>실내정원용 식물</h2>
                        <p>실내정원용 식물에 대한 정보를 알아볼 수 있어요</p>
                    </div>
                </div>
            </div>
        	<div class="searchContainer">
		        <div class="searchOutDiv">
		        	<div class="searchInDiv">
			  			<input type="search" id="searchInput" placeholder="search..">
				  		<button id="searchBtn" onclick="search();"><img src="${contextPath}/resources/img/icon/search.svg"></button>       	
			        	
		        	</div>
		        	
		  			
		  		</div> 
        	</div>
			
            <div class="row itemRow">
				<c:forEach items="${result}" var="p">
	                <!-- Single Product Area -->
		                <div class="col-12 col-sm-6 col-lg-3">
		                    <div class="single-product-area mb-50 wow fadeInUp" data-wow-delay="100ms">
			                	
				                <form action="detailInGarden.pp" method="post">
				                	<input type="hidden" name="rtnFileUrlStr" value="${p.rtnFileUrlStr}">
				                	<input type="hidden" name="cntntsNo" value="${p.cntntsNo}">
				                	<input type="hidden" name="cntntsSj" value="${p.cntntsSj}">
				                	<input type="submit" class="submitBtn" hidden>
			                        <!-- Product Image -->
			                        <div class="product-img">
			                            <img class="plantImg" src="${p.rtnFileUrl[0]}">
			                        </div>
			                        <!-- Product Info -->
			                        <div class="product-info mt-15 text-center">
	
			                            <p class="plantName">${p.cntntsSj}</p>
			                        </div>
			                    </form>
		                    </div>
		                </div>
	                	
	               
				
				</c:forEach>
				
            </div>

            <!-- 페이징바 -->
			<div class="wholeList" align="center">
				<ul class="pagination">
				<c:choose>
					<c:when test="${not empty sText}">
						<c:choose>
		                    <c:when test="${pi.currentPage eq 1}">
			                    <li class="page-item">
			                        <button class='page-link' disabled><i class="fa fa-angle-left"></i></button>
			                    </li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item">
		                        	<button class='page-link' onclick="location.href='inGardenPlantList.pp?currentPage=${pi.currentPage-1}&sText=${sText}'"><i class="fa fa-angle-left"></i></button>
		                   		</li>
		                    </c:otherwise>
		                </c:choose>
		                <c:forEach var="i" begin="${pi.startPage}" end ="${pi.endPage}">
		                	<c:choose>
		                		<c:when test="${i eq pi.currentPage}">
		                			<li class="page-item">
		                				<button style='color:white;' class='page-link active' onclick="location.href='inGardenPlantList.pp?currentPage=${i}&sText=${sText}'">${i}</button>
		                			</li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item">
		                				<button class='page-link' onclick="location.href='inGardenPlantList.pp?currentPage=${i}&sText=${sText}'">${i}</button>
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
		                        	<button  class='page-link' onclick="location.href='inGardenPlantList.pp?currentPage=${pi.currentPage+1}&sText=${sText}'"><i class="fa fa-angle-right"></i></button>
		                    	</li>
		                    </c:otherwise>
		                </c:choose>
					</c:when>
					<c:otherwise>
		                <c:choose>
		                    <c:when test="${pi.currentPage eq 1}">
		                    	<li class="page-item">
		                        	<button  class='page-link' disabled><i class="fa fa-angle-left"></i></button>
		                        </li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item">
		                        	<button class='page-link' onclick="location.href='inGardenPlantList.pp?currentPage=${pi.currentPage-1}'"><i class="fa fa-angle-left"></i></button>
		                    	</li>
		                    </c:otherwise>
		                </c:choose>
		                <c:forEach var="i" begin="${pi.startPage}" end ="${pi.endPage}">
		                	<c:choose>
		                		<c:when test="${i eq pi.currentPage}">
		                			<li class="page-item">
		                				<button style='color:white;' class='page-link active' onclick="location.href='inGardenPlantList.pp?currentPage=${i}'">${i}</button>
		                			</li>
		                		</c:when>
		                		<c:otherwise>
		                			<li class="page-item">
		                				<button class='page-link' onclick="location.href='inGardenPlantList.pp?currentPage=${i}'">${i}</button>
		                			</li>
		                		</c:otherwise>
		                	</c:choose>
		                </c:forEach>
		                <c:choose>
		                    <c:when test="${pi.currentPage eq pi.maxPage}">
		                    	<li class="page-item">
		                        	<button  class='btn btn-sm' disabled><i class="fa fa-angle-right"></i></button>
		                        </li>
		                    </c:when>
		                    <c:otherwise>
		                    	<li class="page-item">
		                        	<button  class='btn btn-sm' onclick="location.href='inGardenPlantList.pp?currentPage=${pi.currentPage+1}'"><i class="fa fa-angle-right"></i></button>
		                   		<li class="page-item">
		                    </c:otherwise>
		                </c:choose>
					
					</c:otherwise>
				</c:choose>
				</ul>
			</div>
            
            <script>
            	
            	$(function(){
            	
            		$(".plantImg").click(function(){
            	
            			$(this).parents("form").children(".submitBtn").click();
            		});
            		$(".plantName").click(function(){
            			$(this).parents("form").children(".submitBtn").click();
            		});
            		
    
            	});
            	function search(){
            		var input = document.getElementById("searchInput");
            		
            		location.href = "inGardenPlantList.pp?sText="+input.value;
            		
            	}
            </script>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <!-- ##### Product Area End ##### -->
</body>
</html>