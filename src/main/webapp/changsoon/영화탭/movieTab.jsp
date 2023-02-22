<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화탭</title>
	<style>
		#header {
		    height: 150px;
		    border:1px solid red
		}
		.tab{
		    font-size: 0;    
		}
		.tab > div {
		    display: inline-block;
		    width: 49.9%;
		    height: 50px;
		    font-size: 18px;
		    margin-top: 20px;
		    text-align: center;
		    padding-top: 25px;
		}
		.violet{
		    border: 1px solid #503396;
		    border-bottom: none;
		}
		.violet2{
		    border-bottom: 1px solid #503396;
		}
		
		.a1, .a2 {
			display:flex;
			flex-wrap: wrap;
			margin-top : 30px;
		}
		
		.show1, .show2 {
			width: 240px;
		    height: 550px;
		    margin-left : 35px;
		    margin-right : 35px;
		    
		}
		
		/* 영화 호버시 보이는 설명 글 */
		.explain{
		    position: absolute;
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
		li { 
			list-style: none; 
		}
		 
		a { 
			text-decoration: none; 
		}
		
		#wrap2 {
			width: 100%;
			margin-top: 80px;
		}
		 
		header {
			position: fixed;
			top: 0;
			width: 100%;
			height: 80px;
			z-index: 2000;
			background-color: #fff;
			box-shadow: 0 2px 2px rgba(0, 0, 0, 0.05), 0 1px 0 rgba(0, 0, 0, 0.05);
		}
		 
		.logo {
			display: inline-block;
			height: 5px;
			margin: 12px 0 12px 25px;
		}
		 
		.logo > img { 
			height: 50px; 
		}
		
		nav {
			display: flex;
			justify-content: space-around;
		}
		
		.nav-items {
			margin-right: 20px;
		}
		
		.nav-items > li {
			display: inline-block;
			margin-left: 40px;
			margin-right: 40px;
		}
		.nav-items > li > a {
			line-height: 80px;
			padding: 0 30px;
			color: rgba(0, 0, 0, 0.4);
		}
		.nav-items > li > a:hover {
			color: rgba(0, 0, 0, 0.8);
		}
			
		#detail{
			font-size : 20px;
		}
		.title_long{
			white-space: nowrap; 
			overflow: hidden;  
			text-overflow: ellipsis;
		}
		/* 더보기 */
.article{
	display:none;
}

#load {
    text-decoration: none;
    color: black;
    padding-top: 9px;
    padding-bottom: 9px;
    padding-left: 46%;
    padding-right: 46%;
}
.more {
    padding: 10px;
    margin-top: 70px;
    width: 100%;
    text-align: center;
    font-size: 20px;
    border: 1px solid black;
}

.more1 {
    padding: 10px;
    margin-top: 70px;
    width: 100%;
    text-align: center;
    font-size: 20px;
    border: 1px solid black;
    background-color: gainsboro;
}

.show1{
	display:none;
}
	</style>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
	<script>
		window.onload = () => {
		    document.querySelector("#tab1").classList.add("violet");
		    document.querySelector("#tab2").classList.add("violet2");
		    document.querySelector(".a2").style.display = "none";
		    for (let k = 1; k < 3; k++) {
		        document.querySelector("#tab"+k).addEventListener("click", () => {
		            for (let i = 1; i < 3; i++) {
		                if (i == k) {
		                	document.querySelector(".a" + i).style.display = "flex";
		                    document.querySelector("#tab" + i).classList.add("violet");
		                    document.querySelector("#tab" + i).classList.remove("violet2");
		                } else {
		                	document.querySelector(".a" + i).style.display = "none";
		                    document.querySelector("#tab" + i).classList.remove("violet");
		                    document.querySelector("#tab" + i).classList.add("violet2");
		                }
		            }
		        })
		    }
		   	for(let i=1; i<20; i++){
		    	document.querySelector("#like_btn").addEventListener("click", function(){
		       	 $.ajax({
		    		    url: "../movie",
		    		    type: "POST",
		    		    dataType: "html",
		    		   	data:{
		    	            command : $('#command').val(),
		    	            like_num : $('#like_num').val()
		    	        },
		    		    success:function(data){      					
		    		    	let a = JSON.parse(data).like;
		    		    	console.log(a);
		    		    	alert("좋아요가 반영되었습니다!");
		    		    	 /* 화면에 표시하는 방법  */
		    		    	$("#like_btn").val("좋아요 "+a);
		    		    },   
		    		    error: 
		    		    function (request, status, error){  
		    		      alert("ajax실패")                  
		    		    }
		    		  });
		       })
		    }
		    
		    
		    /* document.querySelector("#search_btn").addEventListener("click", function(){
		    	 $.ajax({
		 		    url: "../movie",
		 		    type: "POST",
		 		    dataType: "html",
		 		   	data:{
		 		   		search_text : $('#search_text').val(),
		 	        },
		 		    success:function(data){      					
		 		    	let a = JSON.parse(data).search;
		 		    	console.log(a);
		 		    	alert("검색시작");
		 		    	$("#search_text").html(a);
		 		    },   
		 		    error: 
		 		    function (request, status, error){  
		 		      alert("ajax실패")                  
		 		    }
		 		  });
		    	
		    }) */
		    
			document.querySelector(".more").addEventListener("mouseover",function(){
			    document.querySelector(".more").classList.add("more1");
			});
			document.querySelector(".more").addEventListener("mouseout",function(){
			    document.querySelector(".more").classList.remove("more1");
			});
			
			$(function(){
			    $(".show1").slice(0, 8).show(); 
			    $("#load").click(function(e){ 
			        e.preventDefault();
			        $(".show1:hidden").slice(0, 4).show();
			        if($(".show1:hidden").length == 0){
			            $(".more").css('display', 'none');
			        }
			    });
			});
			
			
			
		}
	</script>
</head>
<body>
	<div id="wrap">
		<form>
			<div id="wrap2">
				<header>
					<nav id="nav">
						<ul class="nav-items">
							<li><a href="#home">영화</a></li>
							<li><a href="#news">예매</a></li>
							<li><a href="#news">극장</a></li>
							<a class="logo" href="#home">로고</a>
							<li><a href="#contact">스토어</a></li>
							<li><a href="#about">고객센터</a></li>
							<li><a href="#about">로그인</a></li>
						</ul>
					</nav>
		        </header>
		   	</div>
		</form>
		<h1>전체영화</h1>
		<c:forEach var="movie" items="${movieList2 }">
			<div>${movie.count }개의 영화가 검색되었습니다.</div>
		</c:forEach>
		<div class="tab">
		    <div id="tab1">상영중</div>
		    <div id="tab2">상영예정</div>
	    </div> 
		<!-- 검색기능 -->
		<!--<form>
				<input id="search_text" type="text" placeholder="검색어 입력" name="search_text">
				<input id="search_btn" type="submit" value="검색">
			</form> -->
	</div>
	<div class="a1">
		<c:forEach var="movie" items="${movieList }" varStatus="status">
			<c:if test="${movie.opendate < 20230217 }">
				<div class="show1">
				    <div class="image">
				        <div class="explain">
				        	<form id="article_form" action="movieInfo.do" method="post">
					          	<input type="hidden" name="articleNO" value="${movie.articleNO }">
					       		<input id="detail" type="submit" value="상세보기">
				    		</form>
				     	</div>
				   	<img class="poster" src="${movie.poster_main }">
				 	</div>
				 	<div class="info">
					    <div class="title_long">${movie.title }</div>
						<div>${movie.age }</div>
					  	<div>
							<fmt:parseDate var="parsedDate" value="${movie.opendate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${parsedDate }" pattern="yyyy/MM/dd"/> 
					  	</div>
				 	</div>
					<div class="btn1">
					  <form id="like_form">
					  	<input id="like_num" type="hidden" name="like_num" value="${movie.like_num}">
					  	<input id="command" type="hidden" name="command" value="like_it">
					  	<input id="like_btn" name="like_num2" type="button" value="좋아요 ${movie.like_num }">
					  	<a href="changsoon/영화탭/예매탭.jsp"><input id="btn2"  type="button" value="예매"></a>
					  </form>
					     <!-- 예매버튼을 눌렀을때 각 영화의 값을 예매탭으로 전달해서 예매탭에서 getparameter할 수 있게만들기 -->
				    </div>
				</div>
			</c:if>
		</c:forEach>
		<div class="more"><a href="#" id="load">더보기 ▽ </a></div>
	</div>	
	
	<div class="a2">
		<c:forEach var="movie" items="${movieList }">
			<c:if test="${movie.opendate > 20230216 }">
				<div class="show2">
					<div class="image">
						<div class="explain">
				        	<form id="article_form" action="movieInfo.do" method="post">
					          	<input type="hidden" name="articleNO" value="${movie.articleNO }">
					       		<input id="detail" type="submit" value="상세보기">
				    		</form>
				     	</div>
				   		<img class="poster" src="${movie.poster_main }">
				 	</div>
					<div class="info">
						<div class="title_long">${movie.title }</div>
					  	<div>${movie.age }</div>
					  	<div>
							<fmt:parseDate var="parsedDate" value="${movie.opendate }" pattern="yyyyMMdd" />
							<fmt:formatDate value="${parsedDate }" pattern="yyyy/MM/dd"/> 
					  	</div>
				 	</div>
				 	<div class="btn1">
					    <input id="like_btn" type="button" value="좋아요 ${movie.like_num }">
					    <!-- 예매버튼을 눌렀을때 각 영화의 값을 예매탭으로 전달해서 예매탭에서 getparameter할 수 있게만들기 -->
					    <a href="changsoon/영화탭/예매탭.jsp"><input type="button" value="예매"></a>
				    </div>
				</div>
			</c:if>
		</c:forEach>
	</div>
</body>
</html>