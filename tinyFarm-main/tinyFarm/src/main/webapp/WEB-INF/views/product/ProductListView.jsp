<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>작은농장</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/scss/style.css">
    
    <style>
    .product-meta{
  	  position: relative;
	  z-index: 1;
	  padding-top: 50px; 
	  width: 270px;
	  flex: none;
	  margin-left: 25px;
	}
	
	#widgetsearch{
		width : 300px;
		
	
	}
	
    #psearchButton{
	   	width: 120px;
	   	height: 39px;
	   	border: 1px solid #CED4DA;
   	       
   }
   
   #pimg{
    	width: 403px;
   		height: 320px;

   }
   
   
   .emptylist{
   		align-items : center;
   }
   
	
	
	
    
    </style>
    

</head>

<body>

	<%@include file="/WEB-INF/views/common/header.jsp" %>

    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="img/core-img/leaf.png" alt="">
        </div>
    </div>

   

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/24.jpg);">
            <h2>작물 거래</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/tinyfarm"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">작물거래</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    
    <!-- ##### Breadcrumb Area End ##### -->
    
	<!-- 작물 검색 -->
      <div class="pccontainer" align="center">
		<div id="search-area">
		<form action="plist.bo" method="get" >
			<input type="hidden" name="currentPage" value="1">
			<table class="psearch-area">
				<tr id=psearch>
					<td align="center" class="pcategory" style="width: 200px;">
						<select class="form-control" name="category" id="psearchField" >
							<option value="writer">작성자</option>
							<option value="title">제목</option>
							<option value="content">내용</option>				
						
						</select>
					</td>
					<td class="pcontent">
						<input type="text" name="keyword" value="${map.keyword}" class="form-control" placeholder="거래 하고 싶은 작물을 검색해보세요." id="psearch" maxlength="100" style="width: 700px;">
					</td>
					<td class="psearchbtn">
						<button type="submit" class="btn alazea-btn" id="psearchButton" style="width: 100px;">검색</button>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
	
	<br><br>
	


    <!-- ##### Shop Area Start ##### -->
    <section class="shop-page section-padding-0-100">
        <div class="container">
            <div class="row">
                <!-- All Products Area -->
                <div class="col-10 mx-auto">
                    <div class="shop-products-area">
                        <div class="row">
                        <c:if test="${empty list}">                                   
							<div class="emptylist mx-auto">
								<p style="text-align : center;">등록된 작물이 없습니다.<br><br></p>
							</div>
						</c:if>
                        
						<c:forEach items="${list}" var="p">
 
                            <!-- Single Product Area -->
                            <div class="col-12 col-sm-6 col-lg-4">

                                <div class="single-product-area mb-50">
                        

									<!-- Product Image -->
									<div class="product-img">
                                        <a href="<%=request.getContextPath()%>/pdetail.bo?pno=${p.productNo}">
                                        	<img src="${p.filePath}${p.changeName}" alt="" id="pimg">
                                        </a>
                                        <c:if test="${not empty loginUser}">
	                                        <div class="product-meta" style="padding-left: 40px; width: 310px;">
	                                            <!-- <a href="#" class="wishlist-btn" id="rec_update"><i class="icon_heart_alt"></i></a> -->
	                                            <a href="<%=request.getContextPath()%>/porder.bo?pno=${p.productNo}" class="add-to-cart-btn">즉시구매</a>
	                                        </div>
                                        </c:if>
                                        
                                    </div>

                                        <!-- Product Info -->
                                    	<div class="product-info mt-15 text-center">
	                                        <a href="shop-details.html">
	                                            <p>${p.productTitle }</p>
	                                        </a>
	                                        	<h6>${p.productPrice }원</h6>
	                                        	<input type="hidden" id="regiDate" name="regiDate" value="${p.regiDate}">
	                                        	<input type="hidden" id="count" name="count" value="${p.count}">
	                                        	<input type="hidden" id="count" name="productNo" value="${p.productNo}">
                                    	</div>
                                        
	                         </div>
						</div>
						
                        </c:forEach>   
						
						
                   </div>    
                </div> 
	                                    
                        <!-- Pagination -->
                         <nav aria-label="Page navigation">
                            <ul class="pagination">
                            	<c:if test="${pi.currentPage > 1}">
                                	<li class="page-item"><a class="page-link" href="plist.bo?currentPage=${pi.currentPage-1}&category=${map.category}&keyword=${map.keyword}">
                                	<i class="fa fa-angle-left"></i></a>
                                	</li>
                                </c:if>
                                <c:forEach begin="${pi.startPage}" end="${pi.endPage }" var="p">
                                	<li class="page-item"><a class="page-link" href="plist.bo?currentPage=${p}&category=${map.category}&keyword=${map.keyword}">${p}</a></li>
                                </c:forEach>
                                <c:if test="${pi.currentPage < pi.maxPage}">
	                                <li class="page-item"><a class="page-link" href="plist.bo?currentPage=${pi.currentPage+1}&category=${map.category}&keyword=${map.keyword}">
	                                <i class="fa fa-angle-right"></i></a></li>
                                </c:if>
                            </ul>
                        </nav>
                        
                        <br>
                                                
                        <!-- 로그인 후 상태일 경우만 보여지는 작물 등록 버튼 -->
                        <div class="plistbtn" align="center">
                        	<c:if test="${not empty loginUser}">
						    	<button class="btn alazea-btn" id="pbtn" onclick="location.href='<%=request.getContextPath()%>/pinsert.bo'">
						    	작물 등록
						    	</button>
							</c:if>
					    </div>                     
                    </div>
                </div>
            </div>

    </section>
    <!-- ##### Shop Area End ##### -->
                     

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
</body>

</html>