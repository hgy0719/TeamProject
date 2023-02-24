<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴먼시네마</title>


<style>
	body {
		background: rgb(121,9,9);
		background: linear-gradient(90deg, rgba(121,9,9,1) 0%, rgba(0,0,0,1) 30%, rgba(10,1,1,1) 70%, rgba(121,9,9,1) 100%);
	}
		
		.a1{
			display:flex;
			justify-content: center;
			flex-wrap: wrap;
			margin-top : 30px;
			
		}
		
		.show1{
			width: 240px;
		    height: 550px;
		    margin-left : 20px;
		    margin-right : 20px;
		    
		}
		
		/* 영화 호버시 보이는 설명 글 */
		.explain{
		    position: relative;
		    top:-300px;
		    color: white;
		    font-size: 15px;
		    padding: 30px;
		    opacity: 0;
		    transition: opacity 0.2s linear;
		    z-index: 1;
		    width: 180px;
			height: 230px;
			word-wrap: break-word;
			overflow: hidden;
			text-overflow: ellipsis;
			text-align : center;
		}
		
		.image{
		
			width: 240px;
		    height: 330px;
		}
		
		.image:hover .explain{
		    opacity: 1;
		}
		
		.poster{
		    transition: 0.2s;
		    width: 240px;
		    height: 330px;
		}
		.image:hover .poster {
		    filter: brightness(50%); 
		}
		
		.info{
		    font-size: 20px;
		}
		
		.info div {
		    margin-top: 5px;
		    margin-bottom: 5px;
		}
		
		
		/* 좋아요와 예매버튼 */
		.btn1 {
			width:230px;
			text-align:center;
		}
		
		.btn1 input{
			
		    width: 48%;
		    height: 40px;
		    vertical-align:top;
		    
		}
		
	/* 상단바 */
	
        header{
            color: white;
            margin-top: 30px;
        }
        .header_list {
            background-color: black;
            
            display: flex;
            justify-content: space-around;
            text-align: center;
            height: 100px;
        }
        .header_list >div{
            width: 100px;
            line-height: 100px;
            font-weight: 600;
            font-size: 20px;
        }
        .header_list a {
        	text-decoration:none;
        	color: white;
        }
        #logo_human{
            width: 150px;
            height: 100px;
        }
        #logo_human img{
            width: 150px;
            height: 100px;
        }
        
        .login_signup {
        	
            margin-top: 10px;
            display: flex;
            justify-content: flex-end;
            color: white;
                       
        }
        .login_signup div{
            margin-left: 20px;
            font-weight: 600;
            
        }
        .login_signup a{
            text-decoration:none;
            color: white;
            
        }
        
	
	
	
	/* ----------- */
	
	
		.a1 {
			padding-bottom : 20px;
		}
		
		#wrap_all {
			margin-left : 40px;
			margin-right : 40px;
		}
		
		.btn1 {
			margin-top : 20px;
		}
		
		.ddd{
			color:white;
			padding-top : 20px;
			text-align:center;
		}
		
		#logologo{
			width:200px;
			height:50px;
		}
</style>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
window.onload =()=>{
	for (let k = 1; k < 5; k++) {
    	document.querySelector("#like_btn"+k).addEventListener("click", function(){
       	 $.ajax({
    		    url: "../movie1",
    		    type: "POST",
    		    dataType: "html",
    		   	data:{
    	            command : $('#command').val(),
    	            articleNO1 : $('#articleNO1'+k).val()
    	        },
    		    success:function(data){      					
    		    	let a = JSON.parse(data).like;
    		    	console.log(a);
    		    	 /* 화면에 표시하는 방법  */
    		    	$("#like_btn"+k).val("좋아요 "+a);
    		    },   
    		    error: 
    		    function (request, status, error){  
    		    }
    		  });
       })
    }
	
}
</script>
</head>
<body>
	<div id="wrap_all">
<!--상단바  -->
		   <header>
		       <div class="header_list">
		           <div>
		               <a href="../movie1/movieTab.do">영화</a>
		           </div>
		           <div>
		               <a href="">예매</a>
		           </div>
		           <div>
		               <a href="/HumanCinema/cinema/cinema.do">극장</a>
		           </div>
		           <div id="logo_human">
		           		<a href="../movie1/main.do">
		               		<img src="../changsoon/image/logo.png">
		               </a>
		           </div>
		           <div>
		               <a href="/HumanCinema/menu/store.do">스토어</a>
		           </div>
		           <div>
		               <a href="">이벤트</a>
		           </div>
		           <div>
		               <a href="">고객센터</a>
		           </div>
		       </div>
		       <div class="login_signup">
		           <div>
		               <a href="">로그인</a>
		           </div>
		           <div>
		               <a href="">회원가입</a>
		           </div>
		       </div>
		   </header>


			
			<div class="ddd">
				<h1>무비차트</h1>
			</div>
			
			<div class="a1">
				
			<c:forEach var="movie" items="${movieList }" end="4" varStatus="status">
				
				<c:if test="${movie.opendate < 20230217 }">
					<div class="show1">
					    <div class="image">
					    <img class="poster" src="${movie.poster_main }">
					        <div class="explain">
					        	<form id="article_form" action="movieInfo.do" method="post">
						          	<input type="hidden" name="articleNO" value="${movie.articleNO }">
						       		<input id="detail" type="submit" value="상세보기">
					    		</form>
					     	</div>
					   		
					 	</div>
					 	
						<div class="btn1">
						<form id="like_form">
					  	<input id="like_num" type="hidden" name="like_num" value="${movie.like_num}">
					  	<input id="articleNO1${status.count }" type="hidden" name="articleNO1" value="${movie.articleNO}">
					  	<input id="command" type="hidden" name="command" value="like_it">
					  	<input id="like_btn${status.count }" name="like_num2" type="button" value="좋아요 ${movie.like_num }">
					  	<a href=""><input id="btn2"  type="button" value="예매"></a>
					  </form>
						 <%--  <form id="like_form">
						  	<input id="like_num" type="hidden" name="like_num" value="${movie.like_num}">
						  	<input id="command" type="hidden" name="command" value="like_it">
						  	<input id="like_btn" name="like_num2" type="button" value="좋아요 ${movie.like_num }">
						  	<!-- 예매탭만들면 이동 -->
						  	<a href=""><input id="btn2"  type="button" value="예매"></a>
						  </form> --%>
						     <!-- 예매버튼을 눌렀을때 각 영화의 값을 예매탭으로 전달해서 예매탭에서 getparameter할 수 있게만들기 -->
					    </div>
					</div>
				</c:if>
			</c:forEach>
		</div>	
	</div>
</body>
</html>