<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Title -->
<title>영농일지</title>
<!-- Favicon -->
<link rel="icon" href="resources/img/core-img/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Core Stylesheet -->
<link rel="stylesheet" href="resources/style.css">
<link rel="stylesheet" href="resources/jisu/css/mypage.css">
<!-- 달력 API -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
<script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<!-- alert창 cdn -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<style>
.fc-event {
	background: none;
	border: none;
	width: 30px;
}

.fc-daygrid-event-harness {
	display: flex;
	align-items: center;
	justify-content: center;
}

.fc-day-sun a {
	color: red;
	text-decoration: none;
}

.fc-toolbar-chunk {
	display: inline-block;
}

.fc-day-sat a {
	color: blue;
	text-decoration: none;
}

.fc-today-button.fc-button.fc-button-primary, .fc-prev-button.fc-button.fc-button-primary,
	.fc-next-button.fc-button.fc-button-primary, .fc-dayGridMonth-button.fc-button.fc-button-primary,
	.fc-listMonth-button.fc-button.fc-button-primary {
	background-color: #98d479;
	border: 1px solid #d6e5c5;
}

.fc-listMonth-button.fc-button.fc-button-primary.fc-button-active,
	.fc-dayGridMonth-button.fc-button.fc-button-primary.fc-button-active {
	background-color: #98d479;
	border: none;
}

.fc-today-button.fc-button.fc-button-primary:active, .fc-prev-button.fc-button.fc-button-primary:active,
	.fc-next-button.fc-button.fc-button-primary:active,
	.fc-dayGridMonth-button.fc-button.fc-button-primary:active,
	.fc-listMonth-button.fc-button.fc-button-primary:active {
	background-color: #aae48c;
	border: none;
}

.fc-prev-button.fc-button.fc-button-primary {
	margin-right: 3%;
}

.fc-prev-button.fc-button.fc-button-primary, .fc-next-button.fc-button.fc-button-primary
	{
	width: 5%;
	height: 5%;
}

.fc-col-header-cell.fc-day {
	background-color: #98d479;
}

.fc-scrollgrid.fc-scrollgrid-liquid tbody {
	border: 1px solid #98d479;
}

.fc-day.fc-day-today.fc-daygrid-day {
	background-color: #ebdfd3;
}

.fc-daygrid-bg-harness {
	background-color: #f1efec;
}
.breadcrumb li{
	cursor: pointer;
}
</style>
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>

	<div class="breadcrumb-area">
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>${f.userName}님의 영농일지</h2>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/tinyfarm"><i class="fa fa-home"></i>작은농장</a></li>
						<li class="breadcrumb-item"><a onclick="window.history.back();">뒤로가기</a></li>
					</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<section class="alazea-blog-area mb-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-8">
                    <div id="selectDay">
						<div id="calendar"></div>
                       	<input type="hidden" id="selectDate" name="selectDate" value="formattedDate">
		          	</div>
                </div>
            </div>
        </div>
    </section>

	<script>
	//sweetalert css 사용
	//달력 화면에 띄우기
	document.addEventListener('DOMContentLoaded', function() {
		let calendarEl = document.getElementById('calendar');
		let calendar = new FullCalendar.Calendar(calendarEl, {
		
		initialView: 'dayGridMonth', //캘린더 초기화면 형식
		headerToolbar: {				// 상단 툴바 설정
            left: 'today,dayGridMonth,listMonth',
            center: 'title',
            right: 'prev,next'
            
        },
		selectable: true, //날짜 선택 가능
		locale: 'ko',//한글 설정
		editable: true, //수정여부
	    eventContent: function(img) { //새싹이미지를 위한 함수
	    	let imageUrl = img.event.extendedProps.imageUrl;
	        return {
	           html: '<div class="fc-content"><div class="fc-title">' + img.event.title + '</div><img src="' + imageUrl + '" alt="Event Image" style="max-width: 100%; height: auto;"></div>'
	        };
	    },events: //일지 작성된 날짜에 이미지 띄우기
	    	function(info, successCallback, failureCallback){
	    		let userNo = ${f.userNo};
	        	let events = [];
	        	
	        	$.ajax({
	        		url: "calendarImg.do",
	        		data: {
	        			userNo : userNo //회원번호 받아오기
	        		}
	        		,success: function(result){ //해당 날짜에 일지 있을시 새싹 이미지 띄우기
	        			$.each(result,function(index,el){ //반복문 돌려서 날짜 뽑기
			        	let startDate = moment(el.selectDate).format('YYYY-MM-DD');//날짜 형식 바꾸기
	        			let open = el.selectOpen;
			        	
	        				if(startDate != null && open =='Y'){ //일지 존재하고 공개일지일 경우
		        				events.push({
		        					start: startDate,
		        			        imageUrl: "resources/jisu/img/calender-icon.png"
		        				});
	        				}else if(startDate != null && open =='N'){ //일지 존재하고 비공개 일지일 경우
	        					events.push({
		        					start: startDate,
		        					imageUrl: "resources/jisu/img/openN.png"
		        				});
	        				}
	        			});
	        			successCallback(events); //이벤트 호출
	        		},error: function(){
	        			console.log("달력 ajax통신 실패");
	        		}
	        	});
	    },eventClick: function(info){ //새싹 이미지 클릭시 일지 보러가기
	    	let year = info.event.start.getFullYear();
		    let month = info.event.start.getMonth()+1;
		    let day = info.event.start.getDate();
		    let userNo = ${f.userNo};
	        let view = swal({
    			title : "영농일지 구경",
    			text : year+"년 "+month+"월 "+day+"일의 일지를 보시겠습니까?",
    			icon: 'question',
    			showCancelButton : true,
    			confirmButtonClass : "btn-danger",
    			confirmButtonText : "예",
    			cancelButtonText : "아니오",
    			closeOnConfirm : false,
    			closeOnCancel : true
	        },function(view){
	        		//아니오 클릭시 현재 페이지 유지
	        		if(!view){return false;}
	        		
	        		//예 누를시 
					let date = moment(info.event.start).format('YYYY/MM/DD');
					//디테일뷰 세팅
					$.ajax({
						url : "viewSet.di",
						type : "post",
						data : {
							date:date,
							userNo:userNo
						},
						success:function(result){
							if(result.selectOpen == 'N'){ //작성자가 비공개 설정시 뷰페이지 막기
								swal('비공개 일지', '비공개 일지입니다.\n채팅을 통해 작성자에게 문의해보세요!', 'info'); //채팅기능 사용하도록 유도!
							}else{ //공개 일지일시
								//post방식으로 페이지 이동을 위한 준비
								let diaryNo = result.diaryNo;
								let selectDate = moment(result.selectDate).format('YYYY/MM/DD');
								let form = document.createElement("form");
								let obj; //넘겨받을 값 준비
								//일지번호
								obj = document.createElement("input");
								obj.setAttribute("type","hidden");
								obj.setAttribute("name","diaryNo");
								obj.setAttribute("value",diaryNo);
								form.appendChild(obj);
								//일지날짜
								obj = document.createElement("input");
								obj.setAttribute("type","hidden");
								obj.setAttribute("name","selectDate");
								obj.setAttribute("value",selectDate);
								//폼 형식 갖추기
								form.appendChild(obj);
								form.setAttribute("method","post");
								form.setAttribute("action","view.di");
								//body부분에 폼 추가
								document.body.appendChild(form);
								//전송!
								form.submit();
							}
						},error:function(){
							console.log("일지불러오기 ajax 통신 실패");
						}
					});
	       		});
	        }
	    });
		calendar.render(); //달력 띄우기
		});
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