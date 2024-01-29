<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title -->
<title>작은농장</title>
<!-- jQuery 라이브러리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">

<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">


<style>
.boardHeader {
	display: flex;
}

.boardFooter {
	display: flex;
	flex-direction: row;
	justify-content: space-around;
}

.boardContent {
	width: 700px;
	word-wrap: break-word;
}

.post-sidebar-area {
	width: 200%;
}

.search-form {
	width: 400px;
}
#widgetsearch{
	outline: none;
}
.enrollBtn{
	width: 100px;
	height: 30px;
	border: none;
	outline: none;
	background-color:#70c745;
	color : white; 
	display: flex;
    align-items: center;
    justify-content: center; 
}
.enrollBtn:focus{
	outline: none;
}
.enrollBtn:hover{
	cursor: pointer;
	background-color:#70a745;
	transition-duration: 400ms;
}


</style>


</head>

<body>
	<%@include file="../common/header.jsp"%>

	<!-- 상단 시작 -->
	<div class="breadcrumb-area">
		<div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>이야기해요</h2>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="/tinyfarm"><i class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">이야기해요</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 끝 -->



	<!-- 게시글 영역 시작 -->
	<section class="alazea-blog-area mb-100">
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-8">
					<div style="display: flex; justify-content: flex-end;">
						<!-- 
					<a href="insert.bo"><img src="resources/img/icon/글작성1.png"
							style="width: 25px; height: 25px;"></a>  -->
						<button type="button" class="enrollBtn" onclick="location.href='insert.bo'">글작성</button>

						
					</div>
					<div class="row">
						<div>
							<ul class="feed_items"></ul>
							<ul class="searchFeed_items"></ul>
						</div>
					</div>
				</div>


				<div class="col-12 col-md-4">
					<div class="post-sidebar-area">
						<div class="single-widget-area">
							<!-- 검색창 -->
							<div class="search-form">
								<input type="text" name="searchText" id="widgetsearch"
									placeholder="작성자,해시태그 검색...">
								<button onclick="searchBoardList();" id="searchBtn">
									<i class="icon_search"></i>
								</button>
							</div>
						</div>

						<!-- 날씨 api -->
						<jsp:include page="/WEB-INF/views/common/weather/weather_resize.jsp"></jsp:include>

						<div class="col-12 col-lg-7 mt-50">
							<div class="alazea-service-area mb-100" style="margin-bottom: 0px;">
								<div class="single-service-area d-flex align-items-center wow fadeInUp" data-wow-delay="100ms">
									<div class="service-icon mr-30">
										<img src="resources/img/core-img/s1.png" alt="">
									</div>
									<div class="service-content" id="weather__temp">
										<h5></h5>
										<h6></h6>
									</div>
								</div>
								<div class="single-service-area d-flex align-items-center wow fadeInUp" data-wow-delay="300ms">
									<div class="service-icon mr-30">
										<img src="resources/img/core-img/s2.png" alt="">
									</div>
									<div class="service-content" id="weather__moi">
										<h5></h5>
										<h6></h6>
									</div>
								</div>
								<div class="single-service-area d-flex align-items-center wow fadeInUp" data-wow-delay="500ms">
									<div class="service-icon mr-30">
										<img src="resources/img/core-img/s3.png" alt="">
									</div>
									<div class="service-content" id="weather__reco">
										<h5>텃밭에 추천해요!</h5>
										<h6></h6>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 게시글 영역 끝 -->

	<script>
                       	$(function(){
                       		selectBoardList();
                       		time();
                       	});
    </script>

	<script>
							//게시판 조회기능						
                       		function selectBoardList(){
                    	   		 
                       			$.ajax({
                       				url: "list.bo",
                       				success: function(result){
                     					
                       					$(".feed_items").empty(); //비워주면서 중복게시물 삭제
                       					if(result.length == 0){
                       						var text = "게시글이 존재하지 않습니다."
                       						$(".feed_items").append(text);
                       					}else {
                       						
	                       					for(var i in result){
	                       						var liDiv = $("<li class='feed_item'></li>");
	                       						var boardHeaderDiv = $("<div class='boardHeader'></div>");
	                       						var div1 = $("<div style='width:700px;'></div>");
	                       						var pDiv = $("<p></p>");
	                       						var spanDiv1 = $("<span></span>");
	                       						var boardContentDiv= $("<div class='boardContent'></div>");
	                       						var div2 = $("<div></div>");
	                       						var div3 = $("<div></div>");
	                       						var footerUl = $("<ul class='boardFooter'>");
	                       						var footerLi1 = $("<li></li>");
	                       						var footerLi2 = $("<li></li>");  					
	                       						var profileStr = $("<img style='width: 30px; height: 30px; border-radius: 20px;'>");
	                       						var hiddenBno = $("<input type='hidden' name='boardNo'>");
	                       						var replyIcon = $("<img style='width: 23px; height: 23px;'>"); 
	                       						var replyCount = $("<span id='rcount'></span>");
	                       						var hiddenBno2 = $("<input type='hidden' name='boardNo' id='hiddenBno'>");
	                       						var heartIcon = $("<img>");
	                       						var buttonStr = $("<button type='button' onclick='dolike(this);' style='border: none; outline: none; background-color:white;'>좋아요</button>");
	                       						var spanDiv2 = $("<span id='likeCount'></span>");
	                       						var hrStr = $("<hr style='background-color: #E0E0E0; opacity: 0.7'>");
	                       						
	                       						profileStr.attr("src",result[i].profile);
	                       						
	                       						//시간: 방금전/몇분전/몇시간전/몇일전 띄우기
	                       			            var today = new Date();
	                       				        var dateString = result[i].createDate; 
	                       				        var dateParts = dateString.split(/[- :]/);
	                       				        var timeValue = new Date(dateParts[0], dateParts[1] - 1, dateParts[2], dateParts[3], dateParts[4], dateParts[5]);

	                       				        const timeDifference = today - timeValue; // 밀리초 단위의 차이
	                       				        const seconds = Math.floor(timeDifference / 1000);
	                       				        const minutes = Math.floor(seconds / 60);
	                       				        const hours = Math.floor(minutes / 60);
	                       				        const days = Math.floor(hours / 24);
	                       			
	                       				        let msg = "";
	                       			
	                       			                   
	                       				        if (days > 0 && days <= 7) {
	                       				            msg = days + "일 전";
	                       				        } else if (days > 7) {
	                       				            // 날짜 형식으로 표시
	                       				            const year = timeValue.getFullYear();
	                       				            const month = timeValue.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
	                       				            const day = timeValue.getDate();
	                       				            msg = year + ". " + month + ". " + day;
	                       				        } else if (hours > 0) {
	                       				            msg = hours + "시간 전";
	                       				        } else if (minutes > 0) {
	                       				            msg = minutes + "분 전";
	                       				        } else {
	                       				            msg = "방금 전";
	                       				        }
	                       			
	                       				    	spanDiv1.text(msg);
	                       	                   
	                       						pDiv.text(result[i].boardWriter).append(" •").append(spanDiv1);  //이 부분 맞는지 확인
	                       						div1.append(pDiv);
	                       						boardHeaderDiv.append(profileStr).append("&nbsp;&nbsp;").append(div1);
	                       						
	                       						hiddenBno.attr("value",result[i].boardNo);
	                       						div2.append(result[i].boardContent);
	                       						boardContentDiv.append(hiddenBno).append(div2);
	                       						
	                       						replyIcon.attr("src","resources/img/icon/댓글.png");
	                       						replyCount.text(result[i].replyCount);
	                       						footerLi1.append(replyIcon).append("&nbsp;댓글").append("&nbsp;").append(replyCount);
	                       						
	                       						hiddenBno2.attr("value",result[i].boardNo);
	                       						heartIcon.attr("src","resources/img/icon/heart.svg").attr("class","heartClass");
	                       						spanDiv2.text(result[i].likeCount);
	                       						footerLi2.append(hiddenBno2).append(heartIcon).append(" &nbsp;").append(buttonStr).append("&nbsp;").append(spanDiv2);
	                       						
	                       						footerUl.append(footerLi1).append(footerLi2);
	                       						div3.append(footerUl);
	                       						
	                       						liDiv.append(boardHeaderDiv).append(boardContentDiv).append(div3).append(hrStr);
	                       						
	                       						$(".feed_items").append(liDiv);	                       					              					
	                       						
	                       						/*
	                       							<div>
	                      						      <ul class="feed_items">
	                      						    	 <li class="feed_item">
		                      						    	 <div class="boardHeader">  
		     		                                       	    <img src="${b.profile }" style="width: 30px; height: 30px; border-radius: 20px;"> &nbsp;&nbsp;
			     		                                       	<div> 
					                                               <p class="">${b.boardWriter}<span class="">•${b.createDate}</span></p>
					                                            </div>
				                                       		 </div>
				                                       		 
					                                       	  <!--글내용과 사진 작성-->
						                                       <div class="boardContent">
						                                       		<input type="hidden" name="boardNo" value="${b.boardNo }">
						                                            <div>${b.boardContent }</div>
						                                       </div>    
	     		                                       	    
						                                       <!--댓글/좋아요 영역-->
						                                       <div>
						                                            <ul class="boardFooter">  <!--옆으로 띄워야함-->  <!--그리고 좋아요수 댓글수는 비동기식으로 작성하기-->
						                                            	
						                                                <li>
						                                                	<img src="resources/img/icon/댓글.png" style="width: 23px; height: 23px;">
						                                                	&nbsp; 댓글  
						                                                	<span id="rcount">${b.replyCount }</span> 
						                                                </li>
						                                                <li>
						                                                	<input type="hidden" name="boardNo" id='hiddenBno' value="${b.boardNo }">
						                                                	<img class="heartClass" src="resources/img/icon/heart.svg">&nbsp;&nbsp;
						                                                	<button type="button" onclick="dolike(this);" style="border: none;">좋아요</button>  <!-- 내 자신의 정보를 넣어주려고 this 넣음 --> 
						                                                	<span id="likeCount">${b.likeCount }</span> 
						                                                </li>
						                                            </ul>
						                                       </div>
						                                       
						                                       <hr style="background-color: #E0E0E0; opacity: 0.7">
						                                   </li>
						                               </ul>
	
						                           </div>
	                       						*/
	                       						
	                       						
	                       					}
                       					}
                       					findLike();
                       				},
                       				error: function(){
                       					console.log("통신오류");
                       				}
                       			});
                       		}                       
              
                       		
                       		
                       		//검색게시판리스트
                       		function searchBoardList(){
                    	   		 
                       			$(".feed_items").hide(); //검색기능을 사용했으면 게시물 리스트 숨기기
                       			var searchText = $("#widgetsearch").val();
                       			var searchHash = "%"+searchText+"%";
                       			
                       			$.ajax({
                       				url: "search.bo",
                       				data : {
                       					searchText : searchText,
                       					searchHash : searchHash
                       				},
                       				success: function(result){
                     					
                       					$(".searchFeed_items").empty(); //중복게시물 지워주기
                       					if(result.length == 0){
                       						var text = "검색한 게시글이 존재하지 않습니다."
                           					$(".searchFeed_items").append(text);
                       					}else {
                       						
	                       					for(var i in result){
	                       						var liDiv = $("<li class='feed_item'></li>");
	                       						var boardHeaderDiv = $("<div class='boardHeader'></div>");
	                       						var div1 = $("<div style='width:700px;'></div>");
	                       						var pDiv = $("<p></p>");
	                       						var spanDiv1 = $("<span></span>");
	                       						var boardContentDiv= $("<div class='boardContent'></div>");
	                       						var div2 = $("<div></div>");
	                       						var div3 = $("<div></div>");
	                       						var footerUl = $("<ul class='boardFooter'>");
	                       						var footerLi1 = $("<li></li>");
	                       						var footerLi2 = $("<li></li>");    					
	                       						var profileStr = $("<img style='width: 30px; height: 30px; border-radius: 20px;'>");
	                       						var hiddenBno = $("<input type='hidden' name='boardNo'>");
	                       						var replyIcon = $("<img style='width: 23px; height: 23px;'>"); 
	                       						var replyCount = $("<span id='rcount'></span>");
	                       						var hiddenBno2 = $("<input type='hidden' name='boardNo' id='hiddenBno'>");
	                       						var heartIcon = $("<img>");
	                       						var buttonStr = $("<button type='button' onclick='dolike(this);' style='border: none; outline: none; background-color:white;'>좋아요</button>");
	                       						var spanDiv2 = $("<span id='likeCount'></span>");
	                       						var hrStr = $("<hr style='background-color: #E0E0E0; opacity: 0.7'>");
	                       						
	                       						profileStr.attr("src",result[i].profile);
												
	                       						//시간: 방금전/몇분전/몇시간전/몇일전 띄우기
	                       			            var today = new Date();
	                       				        var dateString = result[i].createDate; 
	                       				        var dateParts = dateString.split(/[- :]/);
	                       				        var timeValue = new Date(dateParts[0], dateParts[1] - 1, dateParts[2], dateParts[3], dateParts[4], dateParts[5]);
	                       			
	                       				        const timeDifference = today - timeValue; // 밀리초 단위의 차이
	                       				        const seconds = Math.floor(timeDifference / 1000);
	                       				        const minutes = Math.floor(seconds / 60);
	                       				        const hours = Math.floor(minutes / 60);
	                       				        const days = Math.floor(hours / 24);
	                       			
	                       				        let msg = "";
	                       			
	                       			                   
	                       				        if (days > 0 && days <= 7) {
	                       				            msg = days + "일 전";
	                       				        } else if (days > 7) {
	                       				            // 날짜 형식으로 표시
	                       				            const year = timeValue.getFullYear();
	                       				            const month = timeValue.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
	                       				            const day = timeValue.getDate();
	                       			
	                       				            msg = year + ". " + month + ". " + day;
	                       				        } else if (hours > 0) {
	                       				            msg = hours + "시간 전";
	                       				        } else if (minutes > 0) {
	                       				            msg = minutes + "분 전";
	                       				        } else {
	                       				            msg = "방금 전";
	                       				        }

	                       				    	spanDiv1.text(msg);
	                       	                   
	                       						pDiv.text(result[i].boardWriter).append(" •").append(spanDiv1); 
	                       						div1.append(pDiv);
	                       						boardHeaderDiv.append(profileStr).append("&nbsp;&nbsp;").append(div1);
	                       						
	                       						hiddenBno.attr("value",result[i].boardNo);
	                       						div2.append(result[i].boardContent);
	                       						boardContentDiv.append(hiddenBno).append(div2);
	                       						
	                       						replyIcon.attr("src","resources/img/icon/댓글.png");
	                       						replyCount.text(result[i].replyCount);
	                       						footerLi1.append(replyIcon).append("&nbsp;댓글").append("&nbsp;").append(replyCount);
	                       						
	                       						hiddenBno2.attr("value",result[i].boardNo);
	                       						heartIcon.attr("src","resources/img/icon/heart.svg").attr("class","heartClass");
	                       						spanDiv2.text(result[i].likeCount);
	                       						
	                       						footerLi2.append(hiddenBno2).append(heartIcon).append(" &nbsp;").append(buttonStr).append("&nbsp;").append(spanDiv2);
	                       						
	                       						footerUl.append(footerLi1).append(footerLi2);
	                       						div3.append(footerUl);
	                       						
	                       						liDiv.append(boardHeaderDiv).append(boardContentDiv).append(div3).append(hrStr);
	                       						
	                       						$(".searchFeed_items").append(liDiv);           						
	                       						
	                       					}
                       					}
                       					findLike(); //좋아요한 게시글 찾아주기
                    					
                       				},
                       				error: function(){
                       					console.log("통신오류");
                       				}
                       			});
                       		}     
                       		
                       		
                       		//로그인한 회원이 좋아요한 게시글 찾기
                            function findLike(){
								
                       			//게시된 모든 게시물 번호 가져오기
								var boardNoArray = document.querySelectorAll('.boardFooter input#hiddenBno');

                            	 $.ajax({
                            		url : "findLike.bo",
                            		data : {
                            			userNo : ${loginUser.userNo}			
                            		},
                            		success: function(result){
	                            			
                            				//모든 게시물 번호 중에서 회원이 좋아요한 게시물 번호와 일치하면 실행
                            				for(var j=0;j<boardNoArray.length;j++){    
		                            			for(var i in result){	
		                            				if(boardNoArray[j].value==result[i].refBno){
		                            					$(boardNoArray[j]).siblings("img").eq(0).attr("src","resources/img/icon/heart-fill.svg");
		                            					$(boardNoArray[j]).siblings("button").css("color","#FF9999");
		                            					$(boardNoArray[j]).siblings("#likeCount").css("color","#FF9999");
		                            					break;
		                            				}else{
		                            					$(boardNoArray[j]).siblings("img").eq(0).attr("src","resources/img/icon/heart.svg")
		                            					$(boardNoArray[j]).siblings("button").css("color","black");
		                            					$(boardNoArray[j]).siblings("#likeCount").css("color","black");	
		                            				}
	                            				}
                            				}			
                            		},
                            		error: function(){
                            			console.log("통신오류");
                            		}
                            	}); 
                            		
                           	}
                			
                       		//좋아요 기능
                            function dolike(el){
                            	
                            	var refBno = $(el).parents().children().eq(0).val();  //게시글번호
                            	var heartImg = $(el).parents().children().eq(1); //하트이미지
                            	var like = $(el).parents().children().eq(2); 
                            	var likeText = like.text();
                            	var likeCount = $(el).parents().children().eq(3); //좋아요 수  
                            	var searchText = $("#widgetsearch").val(); //검색키워드

     							
                            //이미지파일이 기본 heart이면 좋아요기능 수행하고 좋아요한 이미지라면 좋아요취소기능 수행하기 
                            if(heartImg.attr("src") =="resources/img/icon/heart.svg"){
                            	 $.ajax({
                            		url : "dolike.bo",
                            		data : {
                            				refBno : refBno,
                            				userNo : "${loginUser.userNo}"
                            			},
                            		success : function(result){
                            			if(result==1){
                            				heartImg.attr("src","resources/img/icon/heart-fill.svg");
                            				if(searchText == "") {
                            					selectBoardList();
                            				}else{
												searchBoardList();
                            				}		
                            			}else{
                            				console.log("좋아요실패");
                            			}
                            		},
                            		error : function(){
                            			console.log("통신오류")
                            		}
                            	}); 
                            	
                            	}else{
	                            	$.ajax({
	                            		url : "cancelLike.bo",
	                            		data : {
	                            			refBno : refBno,
	                        				userNo : "${loginUser.userNo}"
	                            		},
	                            		success: function(result){
	                            			if(result==1){
	                            				heartImg.attr("src","resources/img/icon/heart.svg");
	                            				if(searchText == "") {
	                            					selectBoardList();
	                            				}else{
													searchBoardList();
	                            				}
	                            				
	                            			}else{
	                            				console.log("좋아요취소실패");
	                            			}
	                            		},
	                            		error : function(){
	                            			console.log("통신오류");
	                            		}
	                            	});
                            	}
                            }
                          
                        	//시간표시
                        	function time(){
                        			var today = new Date();
                        	        var dateString = "${boardInfo.createDate}"; 
                        	        var dateParts = dateString.split(/[- :]/);
                        	        var timeValue = new Date(dateParts[0], dateParts[1] - 1, dateParts[2], dateParts[3], dateParts[4], dateParts[5]);

                        	        const timeDifference = today - timeValue; // 밀리초 단위의 차이
                        	        const seconds = Math.floor(timeDifference / 1000);
                        	        const minutes = Math.floor(seconds / 60);
                        	        const hours = Math.floor(minutes / 60);
                        	        const days = Math.floor(hours / 24);

                        	        let msg = "";

                        	        if (days > 0 && days <= 7) {
                        	            msg = days + "일 전";
                        	        } else if (days > 7) {
                        	            // 날짜 형식으로 표시
                        	            const year = timeValue.getFullYear();
                        	            const month = timeValue.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.
                        	            const day = timeValue.getDate();

                        	            msg = year + ". " + month + ". " + day;
                        	        } else if (hours > 0) {
                        	            msg = hours + "시간 전";
                        	        } else if (minutes > 0) {
                        	            msg = minutes + "분 전";
                        	        } else {
                        	            msg = "방금 전";
                        	        }
                        	        $("#boardCreateDate").append(msg)
                        		
                        		
                        	}
                            
                        	//날씨 온도에 따라 경보문 띄우기
                        	function todayGreenCast(todayGreenTemp, todayGreenMoi){
            		   			
            		   			if(todayGreenTemp < 10){
            						
            		   				$("#weather__temp > h5").text("식물 냉해주의보!")
            						$("#weather__temp > h6").html("<p>햇빛이 잘 드는 곳에서 충분한 햇볕을 받게 해주고 난방 시설을 이용하여 식물의 환경을 따뜻하게 유지하세요.</p><p>낮은 온도에서는 식물의 수분 손실이 느려질 수 있으니 물 주는 빈도를 줄이고 적절한 수분을 유지하세요.</p>") //"<p>낮은 온도에서는 식물의 수분 손실이 느려질 수 있습니다. 물 주는 빈도를 줄이고 적절한 수분을 유지하세요.</p><p>");
            		   			
            		   			}else if(todayGreenTemp < 18){
            		   				
            		   				$("#weather__temp > h5").text("대부분의 실내 식물이 잘 성장하고 번식할 수 있는 이상적인 조건!")
            						$("#weather__temp > h6").html("<p>햇빛이 잘 드는 곳으로 이동하여 햇빛을 받게 해주세요.</p><p>일교차 온도를 유의하여 온도를 일관되게 해주세요.</p>") //")<p>낮은 온도에서 실내 습도가 낮아질 수 있습니다. 적절한 수분 공급을 해주세요.</p><p>");
            		   				
            		   			}else if(todayGreenTemp < 26){

            		   				$("#weather__temp > h5").text("식물이 좋아하는 온도!")
            						$("#weather__temp > h6").html("<p>환기를 잘 해주고 비료를 공급해 주세요.</p><p>난방을 이용하여 환경을 따뜻하게 유지하세요.</p>") //"<p>적절한 물을 공급하고 습도를 유지하세요.</p><p>");
            		 	   			
            		   			}else{

            		   				$("#weather__temp > h5").text("식물이 자라기에 온도가 높네요!")
            						$("#weather__temp > h6").html("<p>온실의 온도를 낮춰주세요. 환기가 도움이 됩니다.</p><p>햇빛이 뜨거우면 실내로 옮겨 주거나 가림막을 사용해 주세요.</p>") //"<p>토양이 마르기 전에 물을 주세요.</p><p>");
            		   				
            		   			}
            		   			
            		   			if(todayGreenMoi < 40){
            		   				$("#weather__moi > h5").text("건조주의보!")
            						$("#weather__moi > h6").html("<p>건조한 공기에 노출되면 토양이 빠르게 마릅니다. 수분을 공급해주세요.</p><p>작은 식물들이 모여있으면 수분 손실을 늦출 수 있어요!</p>") //"<p>낮은 온도에서는 식물의 수분 손실이 느려질 수 있습니다. 물 주는 빈도를 줄이고 적절한 수분을 유지하세요.</p><p>");
            		   				
            		   			}else if(todayGreenMoi >= 15 && todayGreenMoi <= 60){
            		   				$("#weather__moi > h5").text("식물이 크기에 촉촉한 습도!")
            						$("#weather__moi > h6").html("<p>대부분의 실내 식물들이 좋아하는 습도예요!</p><p>옆에서 잘 관찰하며 촉촉하게 케어 해주세요!</p>") //"<p>낮은 온도에서는 식물의 수분 손실이 느려질 수 있습니다. 물 주는 빈도를 줄이고 적절한 수분을 유지하세요.</p><p>");   				
            		   				
            		   			}else if(todayGreenMoi < 75){
            		   				$("#weather__moi > h5").text("과습주의보!")
            						$("#weather__moi > h6").html("<p>높은 습도는 곰팡이 및 기타 질병의 발생 가능성을 증가시켜요!</p><p>배수와 통풍에 신경 써주고 토양에 곰팡이가 피는지 관찰하세요.</p>") //"<p></p><p>");
            		   			}else{
            		   				$("#weather__moi > h5").text("과습경보!")
            						$("#weather__moi > h6").html("<p>높은 습도는 곰팡이 및 기타 질병의 발생 가능성을 증가시켜요!</p><p>배수와 통풍에 신경 써주고 토양에 곰팡이가 피는지 관찰하세요.</p>") //"<p>낮은 온도에서는 식물의 수분 손실이 느려질 수 있습니다. 물 주는 빈도를 줄이고 적절한 수분을 유지하세요.</p><p>");
            		   				
            		   			}
            		   			
            		   			var mon = new Date().getMonth() + 1;
            		   			
            		   			if(mon >= 3 && mon <= 5){
            		   				$("#weather__reco > h5").text("봄 텃밭에는 이런 작물을 추천해요!")
            						$("#weather__reco > h6").html("<p>상추 / 방울토마토 / 아스파라거스 / 브로콜리 /감자</p>")
            		   			}if(mon >= 6 && mon <= 8){
            		   				$("#weather__reco > h5").text("여름 텃밭에는 이런 작물을 추천해요!")
            						$("#weather__reco > h6").html("<p>토마토 / 오이 / 고추 / 수박 / 케일 / 바질 / 파프리카</p>")
            		   				
            		   			}if(mon >= 9 && mon <= 10){
            		   				$("#weather__reco > h5").text("가을 텃밭에는 이런 작물을 추천해요!")
            						$("#weather__reco > h6").html("<p>배추 / 무 / 갓 / 대파 / 마늘 / 상추 / 케일 / 루꼴라</p>")
            		   				
            		   			}else{
            		   				$("#weather__reco > h5").text("겨울 텃밭에는 이런 작물을 추천해요!")
            						$("#weather__reco > h6").html("<p>시금치 / 봄동 / 상추 / 갓 / 쑥갓 / 돌산갓 / 케일 / 청경채</p>")
            		   				
            		   			}
            		   		}
                        	
                        	$(function(){
								$(".feed_items").on("click","li>.boardContent",function(){
									location.href="detail.bo?boardNo="+$(this).children().eq(0).val();
								});
								
								$(".searchFeed_items").on("click","li>.boardContent",function(){
									location.href="detail.bo?boardNo="+$(this).children().eq(0).val();
								});
								
							});
                        	
                       </script>







	<jsp:include page="../common/footer.jsp"></jsp:include>


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