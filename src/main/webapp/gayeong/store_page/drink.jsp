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
        z-index: 2000;
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
	
	.drink{
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


	.drink_image{
		filter: brightness(1);
	}
	.drink_image:hover{
		filter: brightness(0.7);
	}
	
	.drink_name{
		font-size: 20px;
		font-weight:bold;
	}

	.drink_price{
		font-size: 20px;
		font-weight:nomal;
	}
	.drinck_main{
		padding-left: 10%;
    	padding-right: 10%;
	}
	
	
</style>


<body>

   <div id="wrap_all">
	<jsp:include page="/hyojung/Header.jsp"></jsp:include>


 	 <div class = "title">	
	    <div id = "bar1">
	        <ul>
	            <li ><a href="/HumanCinema/menu/snack.do?menu_type=10">스낵</a></li>
	            <li class = "drink"><a href="/HumanCinema/menu/drink.do?menu_type=20">음료</a></li>
	            <li><a href="/HumanCinema/menu/card.do?menu_type=30">영화관람권</a></li>
	            
	        </ul>
	        
		    <div id = "bar2"> 
		    	<ul>
		    		<!-- <li><a href= "/HumanCinema/menu/cart.do">장바구니</a></li> -->
		      	</ul>
		    </div>
		 </div>
			
			
	<div class = "drinck_main">
		<div>	  
		<span id = "text1">음료</span>
		탄산부터 에이드까지, 마시는 즐거움!
		</div>		
		
		<hr style="border: solid 1px black;">	
		
		
		

		<c:forEach var = "drink" items = "${drink_list }">
			<div class = "menu">
			         <div class = "drink_image"><a href = "/HumanCinema/menu/info_page.do?menu_id=${drink.menu_id }"><img src="${drink.image }" width="300px" height= "300px";></a></div> 
			         <div class = "drink_name">${drink.name }</div> 
			         <div class = "drink_price"> ${drink.price}</div> 
			       
			        
			 </div>
       	 </c:forEach>
		
	</div>	  
</div>
</body>
</html>