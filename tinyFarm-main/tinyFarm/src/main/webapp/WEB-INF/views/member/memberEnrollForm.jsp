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
	    <title>Alazea - Gardening &amp; Landscaping HTML Template</title>
	
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
			.box-file-input label {
				display: inline-block;
				background: #70c745;
				color: #fff;
				padding: 0px 5px;
				width:80px;
				line-height: 35px;
				cursor: pointer;

			}
			
			.box-file-input label:after {
				content: "첨부파일";
				line-width: 55px;
			}
			
			.box-file-input .file-input {
				display: none;
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
				<h2>회원가입</h2>
			</div>
	
			<div class="container">
				<div class="row">
					<div class="col-12">
						<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home"></i> Home</a></li>
							<li class="breadcrumb-item"><a href="#">회원가입</a></li>
							
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
	                        
	                        <form action="insert.me" method="post" enctype="multipart/form-data">
		                     <div class="row" style="position: relative;">
								    <label for="upfile" style="position: absolute; top: 90px; left: 50px; z-index: 2;">프로필 사진</label>
								    <div style="width: 300px; height: 300px; border: 1px solid #ccc; margin-top: 45px; margin-bottom: 20px; margin-left: 230px; position: relative; overflow: hidden;">
								        <!-- 이미지 표시 -->
								        <img id="profileImage" src="<%= contextPath %>/resources/profile.jpg" alt="프로필 사진" style="width: 100%; height: 100%; object-fit: cover; position: absolute; top: 0; left: 0;">
								    </div>
								    <!-- 입력 상자 추가 -->
								    <div class="box-file-input" style="position: absolute; top: 345px; left: 50%; transform: translateX(-50%); text-align: center; z-index: 2;">
								        <label style = "margin-top:15px;"><input type="file" class="file-input" id="upfile" name="upfile" onchange="loadImg(this, 1)"></label>
								    </div>
								    <div id="file-name-display" style="position: absolute; top: 70%; left: 50%; transform: translateX(-50%); text-align: center; z-index: 2;"></div>
								</div>
	                                <div class="col-12 mb-4">
	                                    <label for="enrollUserId" style = "margin-top:10px">아이디</label>
	                                    <input type="text" class="form-control" id="enrollUserId" name = "userId" required>
	                                	<div id="checkResult" style="font-size:0.8em; display :none;"></div>
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label>비밀번호</label>
	                                    <input type="password" class="form-control" id="password" min="0" name = "userPwd" required>
	                                	<div id="pwdcheck_blank1" style="font-size: 0.8em;"></div>
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="password">비밀번호 확인</label>
	                                    <input type="password" class="form-control" id="password_check" name = "checkPwd" required>
	                                    <div id="pwdcheck_blank2" style="font-size: 0.8em;"></div>
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="userName">이름</label>
	                                    <input type="text" class="form-control" id="userName" name="userName" required>
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="email">이메일</label>
	                                    <input type="email" class="form-control" id="email" name="email" placeholder = "email@example.com" required> 
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="phone">전화번호</label>
	                                    <input type="text" class="form-control" id="phone" name="phone"  placeholder = "휴대폰 번호(숫자만 입력)" required>
	                                </div>
	                               <div class="col-12 mb-4" style="position: relative;">
									    <label for="address">주소</label>
									    <input type="text" id="address" class="form-control" name="address" readonly required> 
										<div class="button-group-area" id="address_kakao" style="position: absolute; top: 32px; right: 15px;">
										    <a href="#" class="genric-btn primary mt-0" style="height: 46px; border-top-right-radius: 5px; border-bottom-right-radius: 5px;">주소검색</a>
										</div>
									</div>
																		   
	                            </div>
  								<div class="col-8 text-center" style = "margin-left:120px">
                                    <button type="submit" class="btn alazea-btn mt-15">회원가입</button>
                                </div>
	                        </form>
	                    </div>
	                   <script>
	           		$(function(){
						
						//userId 라는 id값은 header에 있는 login Form에 userId 아이디와 겹치기 때문에
						//더 위에 있는 loginForm userId 요소가 잡히게 된다.
						var inputUserId = $("#enrollUserId");
						
						
						inputUserId.keyup(function(){
							
							console.log(inputUserId);
							console.log(inputUserId.val().length);
							
							var idLength = inputUserId.val().trim().length;
						    if (idLength >= 5 && idLength <= 15) {
							
								$.ajax({
									url : "checkId.me",
									data : {checkId : inputUserId.val()},
									success : function(result){
										
										
										if(result=="NNNNN"){
											$("#checkResult").show();
											$("#checkResult").css("color","red").text("사용 불가능한 아이디입니다.");
											
											$("button[type=submit]").attr("disabled",true);
										}else{//사용가능
											$("#checkResult").show();
											$("#checkResult").css("color","blue").text("사용가능한 아이디입니다.");
											
											$("button[type=submit]").attr("disabled",false);
										}
										
									},error : function(){
										console.log("통신 오류");
									}
								});
						
							}else{
								$("#checkResult").hide();
							}
						
						});
						
					});						
						</script>
				
						
						<script>
						$("#password").blur(function() {
						 	let pwdCheck= /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
						 	
						 	if ($("#password").val() == "") {
						         $("#pwdcheck_blank1").css("color", "red");
						         $("#pwdcheck_blank1").text("필수정보입니다");
						         password = false;
						      }	
						      else if (!pwdCheck.test($("#password").val())) {
							  	 $("#pwdcheck_blank1").css("color", "red");
							     $("#pwdcheck_blank1").text("비밀번호는 영문+숫자+특수문자 조합하여 8~16자리를 사용해야 합니다");
							     password = false;
						      }else {
						    	  $("#pwdcheck_blank1").css("color", "blue");
								  $("#pwdcheck_blank1").text("안전한 비밀번호 입니다. 아래에 한번 더 입력하세요");
								  password = true;
						      }
						 	
						 
						 });
						
						/////비밀번호 확인//////
						$("#password_check").blur(function() {
							if($("#password_check").val() == "") {
								$("#pwdcheck_blank2").css("color", "red");
						        $("#pwdcheck_blank2").text("필수정보입니다");
						        password_check = false;
							}
							else if(password == true && $("#password").val() == $("#password_check").val()) {
								$("#pwdcheck_blank2").css("color", "blue");
								$("#pwdcheck_blank2").text("비밀번호가 일치합니다");
								password_check = true;
							}else {
								$("#pwdcheck_blank2").css("color", "red");
								$("#pwdcheck_blank2").text("비밀번호를 다시 확인해주세요");
								$("#password_check").val("");
								password_check = false;
							}
						});
						</script>
						
						<script>
						    $(document).ready(function(){
						        var inputUserId = $("#enrollUserId");
						
						        inputUserId.keyup(function(){
						            var idLength = inputUserId.val().trim().length;
						            var minLength = 6;
						            var maxLength = 15;
						
						            if (idLength >= minLength && idLength <= maxLength) {
						                $.ajax({
						                    url: "checkId.me",
						                    data: {checkId: inputUserId.val()},
						                    success: function(result){
						                        if(result == "NNNNN"){
						                            $("#checkResult").show();
						                            $("#checkResult").css("color","red").text("사용 불가능한 아이디입니다.");
						                            $("button[type=submit]").attr("disabled", true);
						                        } else {
						                            $("#checkResult").show();
						                            $("#checkResult").css("color","blue").text("사용가능한 아이디입니다.");
						                            $("button[type=submit]").attr("disabled", false);
						                        }
						                    },
						                    error: function(){
						                        console.log("통신 오류");
						                    }
						                });
						            } else {
						                $("#checkResult").show();
						                $("#checkResult").css("color","red").text("아이디는 6자 이상 15자 이하로 입력해주세요.");
						                $("button[type=submit]").attr("disabled", true);
						            }
						        });
						    });
						</script>
						<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script type="text/javascript">
		                    	    window.onload = function(){
		                    	        document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
		                    	           
		                    	        	event.preventDefault(); // 링크의 기본 동작을 중지
		                    	        	//카카오 지도 발생
		                    	            new daum.Postcode({
		                    	                oncomplete: function(data) { //선택시 입력값 세팅
		                    	                    document.getElementById("address").value = data.address; 	// 주소 넣기
		                    	                }
		                    	            }).open();
		                    	        });
		                    	    }
	                	</script>
					
						 <script>
							 function loadImg(inputFile, num) {
								    var profileImage = document.getElementById('profileImage');
	
								    if (inputFile.files.length == 1) {
								        var reader = new FileReader();
	
								        reader.readAsDataURL(inputFile.files[0]);
	
								        reader.onload = function (e) {
								            console.log(e.target.result);
								            profileImage.src = e.target.result;
								        }
								    } else {
								        // 파일이 등록되지 않으면 기본 이미지로 설정
								        profileImage = "<%= contextPath %>/resources/profile.jpg";
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
		    <script src="<%= contextPath %>/resources/js/jquery/jquery-2.2.4.min.js"></script>
		    <!-- Popper js -->
		    <script src="<%= contextPath %>/resources/js/bootstrap/popper.min.js"></script>
		    <!-- Bootstrap js -->
		    <script src="<%= contextPath %>/resources/js/bootstrap/bootstrap.min.js"></script>
		    <!-- All Plugins js -->
		    <script src="<%= contextPath %>/resources/js/plugins/plugins.js"></script>
		    <!-- Active js -->
		    <script src="<%= contextPath %>/resources/js/active.js"></script>
		</body>

</html>