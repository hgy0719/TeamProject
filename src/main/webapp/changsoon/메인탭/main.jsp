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
<title>Insert title here</title>
<style>
body {
background: rgb(121,9,9);
background: linear-gradient(90deg, rgba(121,9,9,1) 0%, rgba(0,0,0,1) 30%, rgba(10,1,1,1) 70%, rgba(121,9,9,1) 100%);

	}


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
			justify-content: center;
			flex-wrap: wrap;
			margin-top : 30px;
			
		}
		
		.show1, .show2 {
			width: 240px;
		    height: 550px;
		    margin-left : 20px;
		    margin-right : 20px;
		    
		}
		
		/* 영화 호버시 보이는 설명 글 */
		.explain{
		    position: relative;
		    top:-230px;
		    left:40px;
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
		* {top: 0; margin: 0; box-sizing: border-box;}
    a { text-decoration: none; }
    li { list-style: none; }
    /* h1, h2, h3, h4, h5, h6, p {margin: 10px 5px;} */
    /* h1 { font-size: 1.8em; } */

    body {
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        color: #58666e;
        background-color: #f0f3f4;
        -webkit-font-smoothing: antialiased;
        /* iphone font size 변경 방지 */
        -webkit-text-size-adjus: 100%;  
    }

    .wrap {
        width: 100%; 
        margin-top: 80px;
        position:relative;
        /* background:url() no-repeat center; */
    }
    header {
        width: 100%;
        height: 80px;
        background-color: #fff;
        /* box-shadow: 0 2px 2px rgba(0, 0, 0, 0.05),
                       0 1px 0 rgba(0, 0, 0, 0.05); */
    }
    .logo {
      display: inline-block;
      height: 5px;
      margin: 12px 0 12px 25px;}
    .logo > img { height: 50px;}
    nav {
    	display: flex;
        justify-content: space-around;
        }
    .nav-items {margin-right: 20px;}
    .nav-items > li {display: inline-block;
    	
    }
    .nav-items > li > a {
      /* for Vertical Centering */
      line-height: 80px;
      padding: 0 30px;
      color: rgb(0, 0, 0);}
    .nav-items > li > a:hover {color: gold;}
		
		.a1 {
			
			padding-top:30px;
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
			text-align:center;
			padding-top : 50px;
		}
		
		#logologo{
			width:200px;
			height:50px;
		}
</style>

</head>
<body>
	<div id="wrap_all">
	<div>
		<form>
				<div class="wrap">
				    <header>
				        <nav id="nav">
				        <ul class="nav-items">
				            <li><a href="../movie/movieTab.do">영화</a></li>
				            <li><a href="#">예매</a></li>
				            <li><a href="#">극장</a></li>
				            <a class="logo" href="../movie1/main.do"><img id="logologo" src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/201702/09/htm_20170209151440812443.png" /></a>
				            <li><a href="/HumanCinema/menu/store.do">스토어</a></li>
				            <li><a href ="#">이벤트</a></li>
				            <li><a href="#">고객센터</a></li>
				            <li><a href="#">로그인</a></li>
				        </ul></nav>
					</header>
				    
				    </div>
			</form>
			</div>
			<br>
			<br>
			
			<div class="ddd">
			<h1>박스오피스</h1>
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
						  	<input id="command" type="hidden" name="command" value="like_it">
						  	<input id="like_btn" name="like_num2" type="button" value="좋아요 ${movie.like_num }">
						  	<a href="changsoon/영화탭/예매탭.jsp"><input id="btn2"  type="button" value="예매"></a>
						  </form>
						     <!-- 예매버튼을 눌렀을때 각 영화의 값을 예매탭으로 전달해서 예매탭에서 getparameter할 수 있게만들기 -->
					    </div>
					</div>
				</c:if>
			</c:forEach>
		</div>	
	</div>
</body>
</html>