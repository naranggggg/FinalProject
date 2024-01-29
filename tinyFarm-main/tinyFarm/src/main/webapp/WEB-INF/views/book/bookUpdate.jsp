<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	    <meta charset="UTF-8">
	    <meta name="description" content="">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	    
	    <% String contextPath = request.getContextPath(); %>
	    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	
	    <!-- Title --> 
	    <title>작은농장</title>
	
	    <!-- Favicon -->
	    <link rel="icon" href="/resources/img/core-img/favicon.ico">
	
	    <!-- Core Stylesheet -->
	    <link rel="stylesheet" href="<%= contextPath %>/resources/style.css">
	
		<style>
			.genric-btn {
			    display: inline-block;
			    padding: 10px 15px;
			    font-size: 14px;
			    text-align: center;
			    text-decoration: none;
			    cursor: pointer;
			    background-color: #DCDCDC; /* 배경 색상 지정 */
			    color: black; /* 텍스트 색상 지정 */
			}
			
			.genric-btn:hover {
			    background-color: #BDBDBD; /* 호버 시 배경 색상 변경 */
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
				style="background-image: url(resources/img/book/bookmain.jpg);">
				<h2>도서수정</h2>
			</div>
	
			<div class="container">
				<div class="row">
					<div class="col-12">
						<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">도서수정</a></li>
							
						</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
	
	    <!-- ##### Checkout Area Start ##### -->
	    <div class="checkout_area mb-100">
	        <div class="container">
	            <div class="row justify-content-between">
	                <div class="col-12 col-lg-7 mx-auto">
	                    <div class="checkout_details_area clearfix">
	                        <h5 style= "font-size : 30px; color:black">도서수정</h5>
	                        <form action="bookUpdate.re" method="post" enctype="multipart/form-data">
	                        	<input type="hidden" value=${book.bookNo } id="bookNo" name="bookNo">
			                    <div class="row">
							        <div class="col-md-6 mb-4">
							            <div style="width: 310px; height: 380px; border: 1px solid #ccc; margin-top: 45px; margin-bottom: 20px; position: relative; overflow: hidden;">
							                <!-- 이미지 표시 -->
							                <img id="bookImage" src="${contextPath}/${book.bookChangeName}" name="" style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0;">
							                 </div>
							                <div>
							                    <!-- 파일 업로드 입력 폼 -->
							                    <input type="file" id="upfile" name="upfile" style="cursor: pointer; background-color:white; border:none; align:center" onchange="loadImg(this, 1)">
							                </div>
							           
							
							            <div id="file-name-display" style="position: absolute; top: 70%; left: 50%; transform: translateX(-50%); text-align: center;"></div>
							        </div>
							
							        <div class="col-md-6 mb-4">
							            <div class="row">
							                <div class="col-md-12 mb-4">
							                    <label for="bookTitle" style = "margin-top : 40px">책제목</label>
							                    <input type="text" class="form-control" id="bookTitle" name ="bookTitle" value="${book.bookTitle }" required>
							                </div>
							
							                <div class="col-md-12 mb-4">
							                    <label for="bookAuthor" style="display:block; ">저자</label>
							                    <input type="text" class="form-control" id="bookAuthor" name="bookAuthor" value="${book.bookAuthor }" required>
							                </div>
							                
							                <div class="col-md-12 mb-4">
											    <label for="bookCategory">카테고리</label>
											    <select class="form-control" id="bookCategory" name="bookCategory" required>
											        <option value="" selected disabled>카테고리를 선택하세요</option>
											        <option value="원예">원예</option>
											        <option value="조경">조경</option>
											        <option value="텃밭">텃밭</option>
											    </select>
											</div>
											<div class="col-md-12 mb-4">
							                    <label for="bookPrice" style="display:block; ">가격</label>
							                    <input type="text" class="form-control" id="bookPrice" name="bookPrice" value="${book.bookPrice }" required>
							                </div>
							            </div>
							        </div>
							    </div>
							    <div class="row">
				                   <div class="col-md-6 mb-4">
	                                    <label for="publisher">출판사</label>
	                                    <input type="text" class="form-control" id="publisher" name="publisher" value="${book.publisher }" required>
	                                </div>
	                                <div class="col-md-6 mb-4">
	                                    <label for="bookDate">발행일</label>
	                                    <input type="date" class="form-control" id="bookDate" name="bookDate" value="${book.bookDate }" required>
	                                </div>       
		                        </div>
	                                <div class="col-12 mb-4">
	                                    <label for="bookInfo" style = "margin-left:-15px">책소개</label>
	                                    <input type="text" value="${book.bookInfo }" class="form-control" style ="width:730px; height:200px; margin-left :-15px" id="bookInfo" name="bookInfo" required>
	                                </div>
	                            </div>
  								<div class="col-12 text-center my-5">
                                    <button type="submit" class="btn alazea-btn mt-15">수정</button>
                                    <button type="button"  class="btn alazea-btn-gray mt-15" onclick="deleteBook(${book.bookNo})">삭제</button>
                                    <button type="button"  class="btn alazea-btn-orange mt-15" onclick="location.href='bookMain.re'">목록</button>
                                </div>
	                        </form>
	                    </div>
					
						 <script>
						 	
						 	$(function(){
						 		$("#bookCategory").val("${book.bookCategory}");
						 	})
						 
						 	
						 	
						 	function deleteBook(bookNo){
						 		
						 		if(confirm('도서 정보를 삭제하시겠습니까?')){
						 			
							 		var formobj = $("<form>");
							 		formobj.prop("method", "post").prop("action", "bookDelete.re");
							 		formobj.html("<input type='hidden' name='bookNo' value='" + bookNo + "'>");
							 		
							 		$("body").append(formobj);
							 		formobj.submit();
							 		
						 		}
						 		
						 	}
						 	
						 
							 function loadImg(inputFile, num) {
								    var bookImage = document.getElementById('bookImage');
	
								    if (inputFile.files.length == 1) {
								        var reader = new FileReader();
	
								        reader.readAsDataURL(inputFile.files[0]);
	
								        reader.onload = function (e) {
								            bookImage.src = e.target.result;
								        }
								    } else {
								        // 파일이 등록되지 않으면 기본 이미지로 설정
								        bookImage = "${contextPath}/resources/img/book/bookImage.jpg";
								    }
								}
						</script>
						
	                </div>
	            </div>
	        </div>
	    </div>
	    
  
	    <!-- ##### Checkout Area End ##### -->
	
	    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	      <!-- ##### All Javascript Files ##### -->
		    <!-- jQuery-2.2.4 js -->
		    <script src="${contextPath}/resources/js/jquery/jquery-2.2.4.min.js"></script>
		    <!-- Popper js -->
		    <script src="${contextPath}/resources/js/bootstrap/popper.min.js"></script>
		    <!-- Bootstrap js -->
		    <script src="${contextPath}/resources/js/bootstrap/bootstrap.min.js"></script>
		    <!-- All Plugins js -->
		    <script src="${contextPath}/resources/js/plugins/plugins.js"></script>
		    <!-- Active js -->
		    <script src="${contextPath}/resources/js/active.js"></script>
		</body>

</html>