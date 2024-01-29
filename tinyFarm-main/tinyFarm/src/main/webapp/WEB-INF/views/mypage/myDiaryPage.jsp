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
<title>마이페이지</title>
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
</style>
</head>

<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>

	<div class="breadcrumb-area">
		<div
			class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center"
			style="background-image: url(resources/img/bg-img/24.jpg);">
			<h2>영농일지</h2>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/tinyfarm"><i class="fa fa-home"></i>작은농장</a></li>
						<li class="breadcrumb-item"><a href="mypage.me">마이페이지</a></li>
						<li class="breadcrumb-item"><a href="diary.me">영농일지</a></li>
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
	//달력 화면에 띄우기
	document.addEventListener('DOMContentLoaded', function() {
		let calendarEl = document.getElementById('calendar');
		let calendar = new FullCalendar.Calendar(calendarEl, {
		initialView: 'dayGridMonth',
		headerToolbar: {				// 상단 툴바 설정
            left: 'today,dayGridMonth,listMonth',
            center: 'title',
            right: 'prev,next'
        },
		selectable: true, //날짜 선택
		locale: 'ko',//한글 설정
		navLinks: true, //날짜 선택 가능
		navLinkDayClick: function(date,jsEvent){ //날짜 클릭시
			let formattedDate = moment(date).format('YYYY/MM/DD'); //DB저장을 위해 date 형식 변경
		    let str = date.getFullYear() + "년 " + (date.getMonth() + 1) + "월 " + date.getDate() + "일";
			let userNo = ${loginUser.userNo};
			//클릭 날짜에 일지 있는지 없는지 확인(없으면 작성 있으면 일지보기)
			$.ajax({
				url : "info.di",
				type : "post",
				data : {
					date : formattedDate,
					userNo : userNo
				},success:function(result){
					if(result=='NN'){ //작성된 일지 없을시
					    let goInsert =swal({
			    			title : "영농일지 작성",
			    			text : "선택하신 날짜는 " + str + "입니다.\n일지를 작성하시겠습니까?",
			    			icon: 'question',
			    			showCancelButton : true,
			    			confirmButtonClass : "btn-danger",
			    			confirmButtonText : "예",
			    			cancelButtonText : "아니오",
			    			closeOnConfirm : false,
			    			closeOnCancel : true 
					    },function(goInsert){
					    	if(!goInsert){return false;}
						    	location.href = "insert.di?selectDate=" + encodeURIComponent(formattedDate);
					    });
					}else{//일지가 있을시
						swal('영농일지가 있습니다.', str+'에 작성하신 일지가 있습니다.\n확인하시려면 새싹 아이콘을 눌러주세요.', 'info');
					}
				},error:function(){
					console.log("일지 유무확인 ajax 통신오류");
				}
			
			})
	    },editable: true, 
	    eventContent: function(img) { //새싹이미지를 위한 함수 ..
	    	let imageUrl = img.event.extendedProps.imageUrl;
	        return {
	           html: '<div class="fc-content"><div class="fc-title">' + img.event.title
	           		+'</div><img src="' + imageUrl + '" alt="Event Image" style="max-width: 100%; height: auto;"></div>'
	        };
	    },events: //일지 작성된 날짜에 이미지 띄우기
	    	function(info, successCallback, failureCallback){
	    		let userNo = ${loginUser.userNo};
	        	let events = [];
	        	
	        	$.ajax({
	        		url: "calendarImg.do",
	        		data: {
	        			userNo : userNo //회원번호 받아오기
	        		}
	        		,success: function(result){ //해당 날짜에 일지 있을시 새싹 이미지 띄우기
	        			$.each(result,function(index,el){ //반복문 돌려서 날짜 뽑기
			        	let startDate = moment(el.selectDate).format('YYYY-MM-DD');//날짜 형식 바꾸기
	        				if(startDate != null){ //날짜가 존재하면
		        				events.push({
		        					start: startDate, //해당 날짜에
		        			        imageUrl: "resources/jisu/img/calender-icon.png" //이미지 띄우기
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
		    let userNo = ${loginUser.userNo};
	        let view = swal({ //confirm 창
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
		    	//아니오 누를시 현재 페이지 유지
					let date = moment(info.event.start).format('YYYY/MM/DD');
		    		if(!view){return false;}
		    		//예 클릭시 해당 날짜 데이터 받아와 뷰페이지 띄우기
					$.ajax({
						url : "viewSet.di",
						type : "post",
						data : {
							date:date,
							userNo:userNo
						},
						success:function(result){
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