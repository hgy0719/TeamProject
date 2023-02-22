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
 
	.title{
	
	   padding: 10%;
	   margin: auto;
	  
	}
	
	 header {
        width: 100%;
        height: 80px;
        z-index: 2000;
        position: fixed;/*z-index 값으로 fixed*/
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
    	background-color:red;
        text-decoration: none;
        width: 100%;
        height: 50px;
        position:fixed; 
        z-index:99;
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
    
    
    #menu1{
    	display: flex;
    	text-align: center;
    
    }
    
    #menu2{
    	float : left;
    	
    }
    
    #menu3{
    	float : right;
    	
    }
    
    .img{
    	float : left; 
    }
   
    .menu2-1{
  		float : right;
  		text-align:center;
  		margin-top:30%;
  		
 
  		
  		
    }
    
    .name{
    	
    }
    
    
 
    
    .main img{
    	filter: brightness(1);
    }
    
    .main img:hover{
    	filter: brightness(0.7);
    }
  
    

	

	
</style>


<body>

 <header>
        <nav id="nav">
        <ul class="nav-items">
            <li><a href="#">영화</a></li>
            <li><a href="#">예매</a></li>
            <li><a href="#">극장</a></li>
            <a class="logo" href="#home">로고</a>
            <li id = "store"><a href="/HumanCinema/menu/store.do">스토어</a></li>
            <li><a href="#">고객센터</a></li>
            <li><a href="#">로그인</a></li>
        </ul></nav>
    </header></div>


		  <div class = "title">	
			    <div id = "bar1">
			        <ul>
			            <li><a href="/HumanCinema/menu/snack.do?menu_type=10">스낵</a></li>
			            <li><a href="/HumanCinema/menu/drink.do?menu_type=20">음료</a></li>
			            <li><a href="/HumanCinema/menu/card.do?menu_type=30">영화관람권</a></li>
			            
			        </ul>
			        
				    <div id = "bar2"> 
				    	<ul>
							<li><a href= "/HumanCinema/menu/cart.do">장바구니</a></li>				      	</ul>
				    </div>
				</div>
			


		<div class = "main">
			
				<h2>영화관람권</h2>
				<hr style="border: solid 1px black;">
			<div id = "menu1">
				<c:forEach 	var = "card" items = "${store_list_card }">
				 	<div class="menu">
			            <div class="card_img"><a href="/HumanCinema/menu/info_page.do?menu_id=${card.menu_id }"><img src="${card.image }" width="250px" height= "250px"></a></div>
			               <div class = "menu1-1">
					            <div class="card_name">${card.name }</div> 
					            <div class = "card_price">${card.price }</div>
				           </div>
			         </div>   
			    </c:forEach> 
		    </div>
		 
		 	<div id = "menu2">
				<h2>스낵</h2>
				<hr style="border: solid 1px black;">
			
				<c:forEach 	var = "snack" items = "${store_list_snack }" end = "2"> 
				
				 	<div class="menu">
				 	 	<div class="img"><a href="/HumanCinema/menu/info_page.do?menu_id=${snack.menu_id }"><img src="${snack.image }" width="250px" height= "250px"></a></div>
					<div class = "menu2-1">
			            <div class="name">${snack.name }</div> 
			            <div class = "price">${snack.price }</div>
			         </div>   
			        </div>
			    </c:forEach>
			      
		     </div>
		    
		     	<div id = "menu3">
				<h2>음료</h2>
				<hr style="border: solid 1px black;">
				<c:forEach 	var = "drink" items = "${store_list_drink }" end = "2">
				 	<div class="menu">
			            <div class="img"><a href="/HumanCinema/menu/info_page.do?menu_id=${drink.menu_id }"><img src="${drink.image }" width="250px" height= "250px"></a></div>
			        <div class = "menu2-1">
			            <div class="name">${drink.name }</div> 
			            <div class = "price">${drink.price }</div>
			        </div>
			         </div>   
			    </c:forEach> 
		     </div>
		</div>
	
	
</body>
</html>