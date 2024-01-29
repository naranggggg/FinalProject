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
    <link rel="icon" href="resources/img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="resources/style.css">
	<style>
        table {
        border: 1px #a39485 solid;
        font-size: .9em;
        box-shadow: 0 2px 5px rgba(0,0,0,.25);
        width: 800px;
        margin:0 auto;
        border-collapse: collapse;
        border-radius: 5px;
        overflow: hidden;
        text-align:center;
        }

        th {
        text-align: left;
        }
        
        thead {
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
		.btn{
			font-size:15px;
		}
     	.vegitable{
     		margin-left:300px;
     	}
     	
     	#showMoreBtn{
     		margin-top: 30px;
     	}
     	.searchContainer{
     		width:800px;
			
			display:flex;
			justify-content: flex-end;
			margin:0 auto;
			
		}
		.searchOutDiv{
			width: 320px;
			height:35px;
		
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
			<h2>텃밭 가꾸기</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/"><i
								class="fa fa-home"></i> Home</a></li>
						<li class="breadcrumb-item"><a href="${contextPath}/gardeningList.pp?category=${category}">텃밭 가꾸기</a></li>
						
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
                    	<c:choose>
                    		<c:when test="${category eq '채소'}">
		                        <h2>실내재배 채소 추천 목록</h2>
		                        <p>실내에서 키우기 좋은 채소의 정보를 열람할 수 있습니다</p>
                    			
                    		</c:when>
                    		<c:otherwise>
                    			<c:choose>
                    				<c:when test="${category eq '실내농업'}">
                    					<h2>실내농업 관련 정보</h2>
		                        		<p>실내농업과 관련된 정보를 열람할 수 있습니다</p>
                    				</c:when>
                    				<c:otherwise>
                    				 	<h2>기능별 텃밭 정보</h2>
		                        		<p>용도에 맞는 텃밭을 꾸려보세요</p>
                    				</c:otherwise>
                    			</c:choose>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>
            </div>
        </div>
		<div class="searchContainer">
	        <div class="searchOutDiv">
	        	<div class="searchInDiv">
					<select id="sType">
						<option value="sCntntsSj">제목</option>
						<option value="sWriteNm">작성자</option>
						<option value="sQuestDtl">내용</option>
					</select>
		  			<input type="search" id="searchInput" placeholder="search..">
			  		<button id="searchBtn" onclick="search();"><img src="${contextPath}/resources/img/icon/search.svg"></button>       	
		        	
	        	</div>
	        	
	  			
	  		</div> 
	    </div>
        <div class="container">
        
            <div>
				<!-- Single Portfolio Area -->
                <div class="vegitable" style="margin:0 auto; padding-top:30px;">
                	
                   <table id="veTable">
				        <thead>
				        <tr>
				            <th>번호</th>
				            <th>제목</th>
				            <th>작성자</th>				           
				            <th>조회수</th>				    
				        </tr>
				        </thead>
				        <tbody>
					        <c:forEach items="${list}" var="li">
						        <tr>
						            <td>${li.cntntsNo}</td>
						            <td><a href="gardeningDetail.pp?cntntsNo=${li.cntntsNo}&category=${category}">${li.cntntsSj}</a></td>
						            <td>${li.updusrEsntlNm}</td>				           
						            <td>${li.cntntsRdcnt}</td>
						        </tr>
	                		
	                		</c:forEach>
			
				
				        </tbody>
				    </table>
                </div>
            </div>
            <div class="col-12 text-center">
            	<button class="btn alazea-btn" id="showMoreBtn">더보기</button>
            </div>
        </div>
    </section>
    <script>
	    document.addEventListener("DOMContentLoaded", function() {
	    	  var table = document.getElementById("veTable");
	    	  var rowsToShow = 10; // 초기에 보여줄 행 수
	    	  var rowsIncrement = 10; // 버튼 클릭 시 증가할 행 수
	
	    	  // 초기에 일부 행을 숨김
	    	  var rows = table.getElementsByTagName("tbody")[0].getElementsByTagName("tr");
	    	  for (var i = rowsToShow; i < rows.length; i++) {
	    	    rows[i].style.display = "none";
	    	  }
	
	    	  // 버튼 클릭 시 행 추가 보기
	    	  var showMoreButton = document.getElementById("showMoreBtn");
	    	  showMoreButton.addEventListener("click", function() {
	    	    rowsToShow += rowsIncrement;
	    	  
	    	    if(rowsToShow/${listSize} >= 1){
	    	    	showMoreButton.style.display = "none";
	    	    }
	    	    for (var i = 0; i < rows.length; i++) {
	    	      if (i < rowsToShow) {
	    	        rows[i].style.display = "";
	    	      } else {
	    	        rows[i].style.display = "none";
	    	      }
	    	    }
	    	  });
	    	});
	    function search(){
    		var input = document.getElementById("searchInput");
    		var selectEl = document.getElementById("sType");
    		var selectValue = selectEl.options[selectEl.selectedIndex].value;
    		location.href = "gardeningList.pp?sText="+input.value+"&sType="+selectValue+"&category=${category}";
    		
    	}
    </script>
    <!-- ##### Portfolio Area End ##### -->

    
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
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