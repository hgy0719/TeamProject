<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
  	import = "java.util.*,gayeong.*"
   	isELIgnored = "false"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

	
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
      margin: 12px 0 12px 25px;
    }
    
    .logo > img { height: 50px;
    
    }
    
    nav {
    display: flex;
    justify-content: space-around;
    
    }
    .nav-items {margin-right: 20px;}
    .nav-items > li {display: inline-block;}
    .nav-items > li > a {
      /* for Vertical Centering */
      line-height: 80px;
      padding: 0 30px;
      color: rgb(0, 0, 0);}
    .nav-items > li > a:hover {color: gold;}
	
    a{
        text-decoration: none;
        color: black;
    }
    li{
        list-style: none;
    }

    #bar1{
        text-decoration: none;
        width: 100%;
        height: 50px;
        outline: 1px dotted red;
        margin-bottom : 5%;
    }
    #bar1 ul li{
        float: left;
        width: 15%;
        height: 100%;
        line-height: 50px;
        text-align: center;
 
    }
    #bar1 ul li a{
        display: block;
    }
    #bar1 ul li a:hover{
       
       font-size : 20px;
       font-weight: bold;
    }
    #bar2 ul li{
 
	    text-align: center;
	    float: right;
        height: 50px;
        text-decoration: none;
        color: black;
        display: block;
    }
     #bar2 ul li a{
        display: block;
    }
    
     #bar2 ul li a:hover{
       
       font-size : 20px;
       font-weight: bold;
    }
    
    #menu2{
   		padding-right : 20%;
    }
    #bt1{
    	float : right;
    }


	
	.card{
		font-size: 20px;
		font-weight: bold;
	}
	
	#text1{
	
		font-size: 35px;
		font-weight: bold;
	}
	
	.menu{
	     border: solid 1px red;
	     border : hidden;
	     position: relative;
	     text-align: center;
	     display: inline-block;
	     width: 300px;
	     height: 300px;
     
    }
    
    .card_image{
    	filter: brightness(1);
    }
    
    .card_image:hover{
    
        filter: brightness(0.7);
	}
	
	.card_name{
		font-size: 20px;
		font-weight:bold;
	}
	
	.card_price{
		font-size: 20px;
		font-weight: normal;
	}
    
    .card_main{
    	padding-left: 10%;
    	padding-right: 10%;
    }
	
</style>



       
         
         
<body>
 <header>
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
 </header>

 	 <div class = "title">	
	    <div id = "bar1">
	        <ul>
	            <li><a href="/HumanCinema/menu/snack.do?menu_type=10">스낵</a></li>
	            <li><a href="/HumanCinema/menu/drink.do?menu_type=20">음료</a></li>
	            <li class = "card"><a href="/HumanCinema/menu/card.do?menu_type=30">영화관람권</a></li>
	            
	        </ul>
	        
		    <div id = "bar2"> 
		    	<ul>
		    		<li><a href= "#">장바구니</a></li>
		      	</ul>
		    </div>
		 </div>
			
			
	<div class = "card_main">
		<div>	  
		<span id = "text1">영화관람권</span>
		영화, 모두에게 즐거운 경험
		</div>		
		
		<hr style="border: solid 1px black;">	
		
		
		

		<c:forEach var = "card" items = "${card_list }">
			<div class = "menu">
			         <div class = "card_image"><a href = "/HumanCinema/menu/info_page.do?menu_id=${card.menu_id }"><img src="${card.image }" width="300px" height= "300px";></a></div> 
			         <div class = "card_name">${card.name }</div> 
			         <div class = "card_price"> ${card.price}</div> 
			        
			        
			 </div>
       	 </c:forEach>
		
		
	</div>		  
</div>
	
</body>
</html>