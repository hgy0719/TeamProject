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

<script>
/* 숫자타입 셋팅 */
function setNumeric(num){
    var numeric = Number($.number(num.value));
    var maxNum = Number(num.dataset.limit);
    
    if(numeric > maxNum){
        alert('최대 점수를 초과하였습니다.');
        numeric = 0;
    }
    num.value = numeric;
}

/*총점 자동계산*/
function autoCal(){
    var total = 0;
    $('.num').each(function(){
        total += Number($(this).val());
    });
    $('input[name="total"]').val(total);
}
</script>

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

	
	.name{
		font-size: 30px;
		font-weight: bold;
	}
	.price{
		font-size: 30px;
		font-weight: normal;
		margin: 20px;
	}
	.text{
		margin: 10%;
		font-size: 20px;
		color: gray;
	}
	
	.info img{
		float : left;
	}
	
	.info1{
		float : right;
	}
	
	
	.num{
		width: 70px;
		height: 30px;
		margin : 20px;
	}
	.cart{
		margin: 30px;
		width: 200px;
		height: 50px;
		background-color: black; 
		color : white;
	}

	.order{
		margin: 30px;
		width: 200px;
		height: 50px;
		background-color: black; 
		color : white;
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
        </ul>
        </nav>
 </header>


 	 <div class = "title">	
	    <div id = "bar1">
	        <ul>
	            <li ><a href="/HumanCinema/menu/snack.do?menu_type=10">스낵</a></li>
	            <li class = "drink"><a href="/HumanCinema/menu/drink.do?menu_type=20">음료</a></li>
	            <li><a href="/HumanCinema/menu/card.do?menu_type=30">영화관람권</a></li>      
	        </ul>
	<c:forEach var = "info" items = "${info_list }">
	
	 	<form method = "post" action= "/HumanCinema/menu/cart.do?menu_id=${info.menu_id}">
		    <div id = "bar2"> 
		    	<ul>
		    		<li><a href= "/HumanCinema/menu/cart.do?menu_id=" >장바구니</a></li>
		      	</ul>
			</div>
		</div>
		
			
				<div class = "name">${info.name }</div> 
					<hr>
				<div class = "info">
					  <div><img src="${info.image }" width="400px" height= "400px"></div> 
					<div class = "info1">
					     <div class = "price"> ${info.price} 원</div> 
							 <hr>
					      <div class = "text">
					      유효기간 : 구매일로부터 6개월 이내
					      </div>
					 
					     <hr>
					     <input class = "num" type="number" name="total" value = "0" step = "1" min = "0" max = "10"/>
					     
				
					     총 구매금액 ${info.price * num} 
					     <br>	
					     			   
					    
					    	<input name = "cart" class = "cart" type = "submit" value = "장바구니" >
					    	<input class = "order" type = "submit" value = "구매하기">
					    	
					    	<hr>
					 </div>
				</div>
		
	
		     
			
			</c:forEach>
		</div>
	</form>	
</body>
</html>