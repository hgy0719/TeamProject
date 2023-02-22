<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
  	import = "java.util.*,gayeong.*"
   	isELIgnored = "false"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
	
	.snack{
		font-size: 20px;
		font-weight: bold;
	}
	
	#text1{
	
		font-size: 30px;
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
    
    .step1{
    	color : red;
    }
    
    .main{
    	margin-left: 10%;
    	display : inline-flex;
    	text-align: center;
    }
     [class^=step]{

    	margin-left: 30%;
     	margin-right: 30%;
     }

	.bt1{
		margin: 20%;
		margin-left: 40%;
		width: 200px;
		height: 50px;
		background-color: black; 
		color : white;
	}
	
	.table{
		margin : 10%;
		text-align: center;
		margin-left: 20%; 
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
				    		<li><a href= "/HumanCinema/menu/cart.do">장바구니</a></li>
				      	</ul>
				    </div>
				</div>
	

	
	
		    <div class="main"> <!--이모티콘 넣어주기-->
		        <div class="step1">
		            <!-- <span class="cart1"></span> -->
		            <p id="text1">STEP 01</p><p id="text2">장바구니</p>
		        </div>
		        <div class="step2">
		            <!-- <span class="cart2"></span> -->
		            <p id="text1">STEP 02</p><p id="text2">결제하기</p>
		        </div>
		        <div class="step3">
		            <p id="text1">STEP 03</p><p id="text2">결제완료</p>
		        </div>
		      </div>
		
		      <hr>
		 <table class = "table" border="1"> 
		      <tr align = "center" border = "2">
		          <td colspan="2">상품명</td>
		          <td>판매금액</td>
		          <td>수량</td>
		          <td>구매금액</td>
		       </tr>
		        
		  
	
			
		     <!--DB연동 후 불러올때 border 지워주기-->
		     
		      <c:forEach var = "cart" items = "${cart_list }">
		      
		  
		        <tr>
		          <td><img src="${cart.image }" width="200px" height="200px"></td>
		          <td>${cart.name }</td>
		          <td>${cart.price }</td>
		          <td>${param.num }</td>
		          <td>총 금액</td>
		        </tr>
		      </table>

		</c:forEach>
	
		<input class = "bt1" type = "submit" value = "결제하기">

</div>	
</body>
</html>

