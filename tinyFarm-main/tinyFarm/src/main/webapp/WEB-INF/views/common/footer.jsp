<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작은농장</title>
<style>
.footer-area{
	padding:1em;
	height:300px;
}
.footer-bottom-area{
	margin-top:20px;
}
.footer-message{
    font-weight: bold;
    font-size:0.9rem;
    color:white;
    margin:0 0 0 0.6rem;
}
.footer-contact{
    font-size:0.9rem;
    color:white;
    margin:0.6rem;
}
.footer-copyright{
    font-size:0.9rem;
    color:white;
    margin:0.6rem;
}	

.inner{
	width:1050px;
	margin:0 auto;
	text-align: center;
}
</style>
</head>
<body>
	   <footer class="footer-area bg-img" style="background-image: url(resources/img/bg-img/3.jpg);">
        <!-- Main Footer Area -->
        
        <div class="inner">
        	<div style="margin-top:40px;">
	        	
			  	<nav>
				  	<a href = '' target = '_blank' style = "margin-left:10px; color:white;">Blog</a> |
					<a href = 'https://github.com/ggasin/tinyFarm' target = '_blank' style ="color:white;">Github</a>
			  	</nav>
			    <div class="footer-message">작은농장</div>
			    <div class="footer-contact">주소 : 서울특별시 영등포구 선유동2로 57 이레빌딩 지번 서울특별시 영등포구 양평동4가 2</div>
			    <div class="footer-contact">Contact : tinyfarm@fun-coding.org</div>
			    <div class="footer-copyright" style = "margin-top :-10px">Copyright 2020 All ⓒ rights reserved</div>
        	</div>
		  </div>

        <!-- Footer Bottom Area -->
        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="border-line"></div>
                    </div>
                    <!-- Copywrite Text -->
                    <div class="col-12 col-md-6">
                        <div class="copywrite-text">
                            <p>&copy; <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
                        </div>
                    </div>
                    <!-- Footer Nav -->
                    <div class="col-12 col-md-6">
                        <div class="footer-nav">
                            <nav>
 								<ul>
 									<li><div class="new-message-div px-2 hidden"></div></li>
 									<li><a href="${contextPath}/chatList.ch">채팅</a></li>
                                    <li><a href="noticeList.no">공지</a></li>
                                    <li><a href="qnaList.qa">1:1문의</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <script type="text/javascript">
	  //메세지 도착 알림 div 클릭 이벤트
		$(".new-message-div").click(function() {
			location.href = "${contextPath}/chatList.ch";
		});
    </script>
    <!-- ##### Footer Area End ##### -->
</body>
</html>