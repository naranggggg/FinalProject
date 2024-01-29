<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- Button trigger modal -->
		<button type="button" id="memberdetailViewModal" class="btn  btn-primary" data-toggle="modal" data-target="#exampleModalCenter"></button>
		 
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
								        이미지 표시
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
                                    <input type="text" class="form-control" id="userName_detail" name="userName" readonly="readonly">
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="country">회원등급</label>
                                    <select class="custom-select d-block w-100" id="userGrade_detail" name="grade">
                                        <option value="씨앗">씨앗</option>
                                        <option value="새싹">새싹</option>
                                        <option value="잎새">잎새</option>
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
</body>
</html>