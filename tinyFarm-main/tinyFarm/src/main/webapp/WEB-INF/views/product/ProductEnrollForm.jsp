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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/style.css">
    <link href="resources/tam-emoji/css/emoji.css" rel="stylesheet">
    <!-- summernote -->
   <!--  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet"> -->
    
    <style>

       .inserttable{
            width: 1000px;
            height: 500px;
            font-size: 14px;
        }

        input{
            /* border: 1px solid #D2D2D2; */
            border: none;
            border-bottom: 1px solid #D2D2D2;
            outline: none;
            height: 30px;
        }

        select{
            border: none;
            border-bottom: 1px solid #D2D2D2;
            outline: none;
            width: 80px;
            text-align: center;
            margin-left: 10px;

        }

        #inputimage{
            margin: -100px 0 0 25px;
            width: 262px;
            height: 286px;
        }

        #file{
            display: none;
        }

        #summernote{
            resize: none;
            width: 98%;
            height: 98%;
            border: none;
            padding: 20px 0 0 10px;
            outline: none;
            font-size: 14px;
            margin-left : 20px;
            outline : none;
        }
        
        
    </style>
</head>
<body>

	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="resources/img/core-img/leaf.png" alt="">
        </div>
    </div>

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(resources/img/bg-img/24.jpg);">
            <h2>작물 등록</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="/tinyfarm"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item"><a href="plist.bo">작물거래</a></li>
                            <li class="breadcrumb-item active" aria-current="page">작물등록</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- 상품 등록 테이블 -->
    <div class="enrollarea" align="center">
    <form action="pinsert.bo" id="penrollForm" method="post" enctype="multipart/form-data">
        <table class="inserttable">
            <tbody>
                <tr style="height: 50px;">
                    <th align="left">사진</th>
                    <th>작물종류</th>
                    <td style="width: 10%;">
                   	<!-- 카테고리 선택 말머리 -->
                       <select name="categoryNo" id="productselect">
                           <c:forEach items="${clist}" var="c">
							<option value="${c.categoryNo }">${c.categoryName }</option>
						</c:forEach>
                       </select>
                    </td>
                </tr>
                <tr style="">
                    <td rowspan="3"> 
                            <label for="file">
                                <img src="resources/img/bg-img/product-inputfile.png" alt="이미지 첨부" id="inputimage">                               
                            </label>
                            <input type="file" id="file" name="upfile" onchange="loadImg(this)" id="pimg">
                            <input type="hidden" id="userNo" name="userNo" value="${loginUser.userNo}">
                            <!-- <input type="hidden" id="originName" name="originName" value="originName"> -->

                    </td>
                    <th>상품명</th>
                    <td colspan="2"><input type="text" id="name" name="productTitle"></td>  
                    <th style="padding-left: 50px;">가격</th>
                    <td colspan="2"><input type="text" id="price" name="productPrice">원</td>
                </tr>
                <tr>
                    <th rowspan="2">상품내용</th>
                    <td colspan="5">
                        <textarea id="summernote" name="productContent"></textarea>
                    </td> 
                </tr>
            </tbody>
        </table>
        
        <br><br>

        <!-- 등록, 취소 -->
        <div class="penrollbtn" align="center">
            <button type="reset" class="btn alazea-btn-gray ml-15" onclick="javascript:history.go(-1);">취소하기</button>
            <button type="submit" class="btn alazea-btn-orange ml-15">등록하기</button>
        </div>
        
        <br><br><br>
        </form>

    </div>
    
    <!--------------------------- script 구문 -------------------------------->
    <script>
    
   		<!-- summernote(게시글 내용) 스크립트 -->
   		
		$(document).ready(function() {
			document.emojiSource = 'resources/tam-emoji/img'; //이모지 사진 사용
				$('#summernote').summernote({
					placeholder: '작물 상태와 거래 내용을 상세하게 적어주세요.',
					width : 500,
	                height : 300, // 에디터 높이
	                minHeight : null, // 최소 높이
	                maxHeight : null, // 최대 높이
	                focus : true, // 에디터 로딩후 포커스를 맞출지 여부
	                lang : "ko-KR", // 한글 설정  
	                toolbar : [
	                  //   ['a11y',['a11y']], // The Button
	                    ['insert', ['emoji']],
	                    [ 'fontname', [ 'fontname' ] ],
	                    [ 'fontsize', [ 'fontsize' ] ],
	                    [ 'style', [ 'bold', 'italic', 'underline', 'strikethrough', 'clear' ] ],
	                    [ 'color', [ 'forecolor', 'color' ] ],
	                    [ 'table', [ 'table' ] ],
	                    [ 'para', [ 'paragraph' ] ],
	                    [ 'height', [ 'height' ] ],
	                    [ 'insert', [ 'picture', 'link' ] ] ],
	            fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New',
	                            '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체' ],   
	            fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
	                        '20', '22', '24', '28', '30', '36', '50', '72' ]
	            });
			
		});

    
	<!-- 이미지 미리보기 스크립트 -->
     
     function loadImg(inputFile,num){
         //inputFile : 이벤트가 발생된 요소 객체 
         console.log(inputFile.files);
         //inputFile.files : 파일업로드 정보를 배열의 형태로 반환해주는 속성
         //파일을 선택하면 files속성의 length가 1이 반환됨
         if(inputFile.files.length == 1){ //파일이 등록되면 
             //해당 파일을 읽어줄 FileReader라고 하는 자바스크립트 객체를 이용한다.
             var reader = new FileReader();
             //파일을 읽어줄 메소드 : reader.readAsDataURL(파일)
             //해당 파일을 읽어서 고유한 url을 부여해주는 메소드 
             //반환받은 url을 미리보기 화면에 넣어주면 된다. 
             reader.readAsDataURL(inputFile.files[0]);

             //해당 reader객체가 읽혀진 시점에 img src속성에 부여된 고유 url을 넣어주기
             reader.onload = function(e){//e : event 객체
                 console.log(e);
                 //이벤트 객체에서 reader가 부여한 고유 url 정보 
                 //event.target.result 
                 console.log(e.target.result);
                 
                 $("#inputimage").attr("src",e.target.result);
                 }
         			}else{//length가 1이 아니면 
                	 
                     $("#inputimage").attr("src",null);

                 }
        	 }

     
     <!-- 글작성 제목,가격 글자수 제한 --> 	
 	     $("#name,#price").keyup(function(){
 		
 		let insertTitle = $(this).val();
 		
 		if(insertTitle.length > 30){
 			alert("30자 미만으로 작성이 가능합니다.");
 			insertTitle = insertTitle.substr(0, 30);
 			$(this).val(insertTitle);
 		}
 		
 	})
         
     
     
	</script>
    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

	<script src="resources/tam-emoji/js/config.js"></script>
    <script src="resources/tam-emoji/js/tam-emoji.min.js"></script>

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
    
    <!-- summernote css/js -->
<%--     <script src="<%=request.getContextPath()%>/resources/summernote1/js/summernote/summernote-lite.js"></script>
	<script src="<%=request.getContextPath()%>/resources/summernote1/js/summernote/lang/summernote-ko-KR.js"></script> --%>
	

</body>
</html>