<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Title -->
<title>회원 정보 수정</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">
<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">
<link rel="stylesheet" href="resources/jisu/css/mypage.css">
<!-- alert창 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<style>
.container h5 {
	font-size: 30px;
	text-align: center;
}
#center {
	width: 70%;
	margin: auto;
	margin-top: 2%;
}
.col-8 {
	float: right;
	margin-right: 8%;
}
.changeImg {
	margin: auto;
	width: 50%;
	height: 100%;
}
.box-file-input label {
	display: inline-block;
	background: #70c745;
	color: #fff;
	padding: 0px 15px;
	line-height: 35px;
	cursor: pointer;
	margin-left: 26%;
}
.box-file-input label:after {
	content: "사진등록";
}
.box-file-input .file-input {
	display: none;
}
#deleteImg {
	height: 36px;
	width: 25%;
	border: none;
	cursor: pointer;
}
#searchBtn {
	width: 50px;
	height: 46px;
	font-size: 18px;
	position: absolute;
	top: 0;
	right: 0;
	margin-top: 32px;
	margin-right: 15px;
	cursor: pointer;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #dddfdc;
	color: #ffffff;
	border-radius: 0px 3px 3px 0px;
}
#searchBtn:hover {
	background-color: #c9cdc6; /* Darker gray background on hover */
}
.modal-header {
	background-color: #98d479;
	color: #fff;
	font-size: 25px;
}
.modal-content.main {
	width: 60%;
	margin: auto;
}
#pwdModal.modal-content {
	border: none;
}
#deleteModal.modal-content {
	border: none;
	font-size: 14px;
}
#texet-area {
	width: 70%;
	border: none;
}
.btn-click {
	width: 80px;
	height: 40px;
	background-color: #98d479;
	border: none;
	color: #fff;
}
.btn-click:hover {
	background-color: #a4c992;
	border: none;
}
.btn-click:checked, .btn-click:after {
	border: none;
}
.kaUser {
	color: red;
	font-size: 15px;
}
.btn-del{
	width: 20%;
	height: 10%;
	margin: auto;
	background-color: #b6b8b6;
	color: white;
	border: none;
}
.btn-del:focus{
	outline: none;
}
#delText {
	width: 90%;
	height: 40px;
	border: 1px solid #c9cdc6;
	padding-left: 5px;
	font-size: 13px;
}
#delWarn {
	color: red;
	text-align: center;
	margin-top: 2%;
	margin-bottom: 3%;
}
#deleteModal .mr-sm-2 {
	display: flex;
}
#deleteModal .mr-sm-2 p {
	font-size: 14px;
}
.delNum {
	width: 150px;
}
.mr-sm-2.top {
	margin-top: 5%;
}
#updateBtn{
	margin-left: 7%;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="breadcrumb-area">
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>회원 정보 수정</h2>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/tinyfarm"><i class="fa fa-home"></i>작은농장</a></li>
						<li class="breadcrumb-item"><a href="mypage.me">마이페이지</a></li>
						<li class="breadcrumb-item"><a href="update.me">회원 정보 수정</a></li>
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
    <!-- 정보수정 -->
   <div class="checkout_area mb-100">
	        <div class="container">
	            <div class="row justify-content-between">
	                <div class="col-12 col-lg-7 mx-auto">
	                        <h5>정보 수정</h5>
	                        <form action="update.me" method="post" enctype="multipart/form-data" onsubmit="return updateme();">
			                    <div class="checkout_details_area clearfix">
		                           <div class="row">
									     <label for="reUpfile" id="picText">프로필 사진</label>
									    <div id="profileImg">
									        <!-- 이미지 표시 -->
									        <c:choose>
									        	<c:when test="${not empty loginUser.changeName }">
											        <img id="profileImage" src="${loginUser.changeName}" alt="프로필 사진">
									        	</c:when>
									        	<c:otherwise>
									        		<img id="profileImage" src="resources/profile.jpg" alt="기본 프로필 사진">
									        	</c:otherwise>
									        </c:choose>
									    </div>
									        <!-- 파일 업로드 입력 폼 -->
									    <div class="changeImg">
	    									<!-- 파일 업로드 입력 폼 -->
									       <div class="box-file-input">
									       	<label><input type="file"class="file-input" id="reUpfile" name="reUpfile" onchange="loadImg(this, 1)"></label>
									       	<button type="button" id="deleteImg" class="btn-del">사진삭제</button>
									       </div>
										</div>
									</div>
	                                <div class="col-12 mb-4">
	                                    <label for="enrollUserId">아이디</label>
	                                    <input type="text" class="form-control" id="userId" name="userId" value="${loginUser.userId }" readonly>
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label>비밀번호</label>
	                                    <input type="button" class="form-control" data-toggle="modal" data-target="#updatePwdForm" value="변경하기">
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="userName">이름</label>
	                                    <input type="text" class="form-control" id="userName" name="userName" value="${loginUser.userName }" required>
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="email">이메일</label>
	                                    <input type="email" class="form-control" id="email" name="email" value="${loginUser.email }" required> 
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="phone">전화번호</label>
	                                    <input type="text" class="form-control" id="phone" name="phone" value="${loginUser.phone }">
	                                </div>
	                                <div class="col-12 mb-4">
	                                    <label for="address">주소</label>
	                                    <input type="text" class="form-control" id="address" name="address" value="${loginUser.address }">
	                                    <a id="searchBtn" onclick="addrSearch()">검색</a>
	                                </div>
	                            </div>
  								<div class="col-8">
                                    <button type="submit" id="updateBtn" class="btn alazea-btn mt-15">수정하기</button>
                                    <button type="button" class="btn alazea-btn-gray mt-15" data-toggle="modal" data-target="#deleteForm">탈퇴하기</button>
                                </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
	        </div>

	<!-- 비밀번호 수정 버튼 클릭 시 보여질 Modal -->
    <div class="modal fade" id="updatePwdForm">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">비밀번호변경</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                    <!-- Modal body -->
                    <div class="modal-content" id="pwdModal">
                        <div id="center">
                            <label for="userPwd" class="mr-sm-2">현재 비밀번호</label>
                            <input type="password" class="form-control" placeholder="현재 비밀번호 입력" id="userPwd" name="userPwd"> <br>
                            
                            <label for="updatePwd" class="mr-sm-2">변경할 비밀번호</label>
                            <input type="password" class="form-control" placeholder="변경할 비밀번호 입력" id="updatePwd" name="updatePwd"> <br>
                            
                            <label for="upPwdChk" class="mr-sm-2">비밀번호 확인</label>
                            <input type="password" class="form-control" placeholder="변경할 비밀번호 입력" id="upPwdChk" name="upPwdChk"> <br>
                            
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                        <div class="kaUser"></div> <button class="btn-click" onclick="updatePwd();">수정하기</button>
                    </div>
            </div>
        </div>
    </div>


	<!-- 회원탈퇴 버튼 클릭 시 보여질 Modal -->
 	<div class="modal fade" id="deleteForm">
        <div class="modal-dialog">
            <div class="modal-content main">
                <!-- Modal Header -->
                <div class="modal-header">
                    <div class="modal-title">회원탈퇴</div>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                    <!-- Modal body -->
                    <div class="modal-content" id="deleteModal">
                        <div id="center">
		                	<div class="mr-sm-2"><p class="delNum">🌱 작성한 영농일지</p> <p>${diaryCount } 개 </p></div> 
	                        <div class="mr-sm-2"><p class="delNum">🌱 작성한 게시글 수 </p><p>${boardCount } 개 </p></div>
	                        <div class="mr-sm-2"><p class="delNum">🌱 작성한 댓글 수 </p> <p>${replyCount } 개 </p></div>
	                       	<div class="mr-sm-2"><p class="delNum">🌱 함께한 일수 </p> <p>${date } 일 </p></div>
                            <div id="delWarn">
                            탈퇴 후 복구할 수 없습니다. <br>
                            '&nbsp;&nbsp;탈퇴하겠습니다.&nbsp;&nbsp;' <br>
                            작성 후 버튼을 클릭해주세요.
                            </div>
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" align="center">
                    	<div id="texet-area">
    	                	<input type="text" id="delText" name="delText" placeholder="탈퇴하겠습니다.">
                    	</div>
                        <button type="button" class="btn-click" onclick="deleteUser();">탈퇴하기</button>
                    </div>
            </div>
        </div>
    </div>

	<script>
		//프로필 사진 삭제   	
		$(function(){
			$("#deleteImg").click(function(){
				//삭제버튼 클릭시 src값 null로 변경, 대체이미지로 기본프로필 사용
				$("#profileImage").attr("src", "").attr("onerror","this.src='resources/profile.jpg'");
			});		
		});
		//프로필 사진 변경
		function loadImg(inputFile, num) {
			let profileImage = document.getElementById('profileImage');
			if (inputFile.files.length == 1) { //파일이 등록되면(length = 1)
				let reader = new FileReader();
				
				//파일을 읽어줄 메소드 :  reader.readAsDataURL(파일)
				reader.readAsDataURL(inputFile.files[0]);
				reader.onload = function(e) {
					profileImage.src = e.target.result;
				}
			}else{
				profileImage = "${loginUser.changeName}";
			}
		};
		
	    
	    //비밀번호 변경    	
		function updatePwd(){
			let currentPwd = $("#userPwd").val(); //현재비밀번호
			let wantPwd =  $("#updatePwd").val(); //변경할비밀번호
			let chkPWd = $("#upPwdChk").val(); //변경비번확인
			let pwdReg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
			
			//카카오 로그인 회원 변경 막기 (pwd 값 null)
			if(${loginUser.userPwd eq null}){
				swal('카카오 로그인 회원', '카카오 로그인 회원은 변경 불가능합니다.', 'warning');
				return false;
			}
			
			//변경비번 일치하지 않을경우
			if(wantPwd != chkPWd){
				swal('비밀번호 불일치', '변경하실 비밀번호가 일치하지 않습니다.', 'error');
				return false;
			}
			
			if(!pwdReg.test(wantPwd)){
				swal('비밀번호 입력오류', '비밀번호는 영(대/소)문자,숫자,특수문자 포함 8~16자로 설정해주세요.', 'error');
				return false;
			}
			
			//위 if문 다 통과시 변경 진행
		    $.ajax({
		    	url : "updatePwd.me",
		    	data : {
		    		curPwd : currentPwd,
		    		updatePwd : wantPwd
		    	},
		    	type : "post",
		    	success : function(result){
		    		if(result=="YYYYY"){
		    			swal('변경 성공', '비밀번호 변경 성공', 'success');
			    		currentPwd = "";
			    		wantPwd ="";
			    		chkPWd="";
		    			//성공시 모달창 닫기
			    		$("#updatePwdForm>.close").click();

		    		}else if(result=="NNNYY"){
		    			swal('변경 실패', '현재 비밀번호가 일치하지 않습니다.', 'error');
				    	$("#userPwd").focus();
				    }else{
				    	swal('변경 실패', '비밀번호 변경 실패. 다시 시도해주세요.', 'error');
		    		}
		    		
		    	},error : function(){
		    		console.log("비번변경 ajax 통신오류");
		    	}
		    });
		};
		
		//정보수정 클릭시 실행
		//카카오톡 로그인 유저의 경우 회원정보 수정 막기
		function updateme(){
			let userPwd = "${loginUser.userPwd}";
			if(userPwd == ""){ 
				swal('카카오 로그인 회원', '카카오톡 로그인 회원은 정보변경이 불가합니다.\n카카오톡에서 변경 부탁드립니다.', 'warning');
				return false;
			}
		}
		
		//회원탈퇴
		function deleteUser(){
			let delText = $("#delText").val(); //탈퇴 문구 입력값 가져오기
			$.ajax({
				url: "delete.me",
				data: {
					text:delText
				},
				success:function(result){
					if(result=='YY'){
						alert("그동안 저희 사이트를 이용해주셔서 감사합니다.");
						//탈퇴 후 메인페이지
						window.location.href='<%=contextPath%>'; 
					}else if(result=='NY'){ //문구 틀렸을시
						swal('탈퇴 실패', '탈퇴문구를 정확하게 입력해주세요.', 'error');
					}else{ //탈퇴 실패
						swal('탈퇴 실패', '다시 시도해주세요.', 'error');
					}
				},error:function(){
					console.log("회원탈퇴 ajax 실패");
				}
			});
		}
	</script>
	
	<!-- 주소변경 카카오 지도 API-->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
    function addrSearch() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; //주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { //사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address").focus();
            }
        }).open();
    }
</script>

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