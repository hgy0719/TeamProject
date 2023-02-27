<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var = "total" value = "0" />
<c:forEach var="result" items="${movieList}" varStatus="status">     
<c:set var= "total" value="${total + 1}"/>
</c:forEach>

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
		    
		    
		    for (let k = 1; k <= ${total}; k++) {
		    	document.querySelector("#like_btn"+k).addEventListener("click", () => {
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
		    		  
		    		    	$("#like_btn"+k).val("좋아요 "+a);
		    		    },   
		    		    error: 
		    		    function (request, status, error){  
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
		
		<jsp:include page="/hyojung/Header.jsp"></jsp:include>
		</div>
		
		
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
	
	<div class="a1">
		<c:forEach var="movie" items="${movieList }" varStatus="status">
		<input id="count_value" type="hidden" value="1">
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
					  	<input id="articleNO1${status.count }" type="hidden" name="articleNO1" value="${movie.articleNO}">
					  	<input id="command" type="hidden" name="command" value="like_it">
					  	<input id="like_btn${status.count }" name="like_num2" type="button" value="좋아요 ${movie.like_num }">
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
	
		<c:forEach var="movie" items="${movieList }" varStatus="status">
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
				 	
				 	
				 	<form id="like_form">
					  	<input id="like_num" type="hidden" name="like_num" value="${movie.like_num}">
					  	<input id="articleNO1${status.count }" type="hidden" name="articleNO1" value="${movie.articleNO}">
					  	<input id="command" type="hidden" name="command" value="like_it">
					  	<input id="like_btn${status.count }" name="like_num2" type="button" value="좋아요 ${movie.like_num }">
					  	<a href="changsoon/영화탭/예매탭.jsp"><input id="btn2"  type="button" value="예매"></a>
					  </form>
				 	
				 	
					   <%--  <input id="like_btn" type="button" value="좋아요 ${movie.like_num }">
					    <!-- 예매버튼을 눌렀을때 각 영화의 값을 예매탭으로 전달해서 예매탭에서 getparameter할 수 있게만들기 -->
					    <a href="changsoon/영화탭/예매탭.jsp"><input type="button" value="예매"></a> --%>
				    </div>
				</div>
			</c:if>
		</c:forEach>
		<div class="more"><a href="#" id="load">더보기 ▽ </a></div>
	</div>
</body>
</html>