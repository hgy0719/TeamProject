<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*,gayeong.*"
    isELIgnored = "false"
  %>
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
        text-decoration: none;
        width: 100%;
        height: 50px;
        outline: 1px dotted red;
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

	#store{
	
	 font-size: 20px;
	 
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
            <li id = "store"><a href="/HumanCinema/store_page/store.jsp">스토어</a></li>
            <li><a href="#">고객센터</a></li>
            <li><a href="#">로그인</a></li>
        </ul></nav>
    </header></div>

	<c:forEach var = "menu" items = "${menu_list }">
		  <div class = "title">	
			    <div id = "bar1">
			        <ul>
			            <li><a href="/HumanCinema/menu/snack.do?menu_type=10">스낵</a></li>
			            <li><a href="#">음료</a></li>
			            <li><a href="#">영화관람권</a></li>
			            
			        </ul>
			        
				    <div id = "bar2"> 
				    	<ul>
				    		<li><a href= "#">장바구니</a></li>
				      	</ul>
				    </div>
				</div>
			
			
			<div id = "menu1">
				<h3>영화관람권</h3>
			<input id = "bt1" type = "button" value = "+"><br> <!-- 버튼 누르면 해당페이지로 이동 -->
				<hr>
				 <div class="menu">
			            <div class="img"><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/16094706927780.jpg" width="200px" height= "200px">
			            <div class="name">Human영화관람권</div> 
			            <div class = "price">12,000원</div> 
			     </div>  
		    </div>
		 	<div id = "menu2">
				<h3>스낵</h3>
				<hr>
				 <div class="menu">
			            <div class="img"><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/16751302789660.jpg" width="200px" height= "200px";>
			            <div class="name">칠리치즈나쵸<div> 
			            <div class = "price">4,900원</div>  
			     </div>  
		     </div>
		     	<div id = "menu3">
				<h3>음료</h3>
				<hr>
				 <div class="menu">
			            <div class="img"><img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/16680718728370.jpg" width="200px" height= "200px";>
			            <div class="name">탄산음료(M)<div> 
			            <div class = "price">2,500원</div>  
			     </div>  
		     </div>
		</div>
	</c:forEach>
</body>
</html>