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
		padding-left: 10%;
		padding-right: 10%;
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
		font-weight: bold;
		margin: 20px;
	}
	.text{
		margin: 10%;
		font-size: 20px;
		color: gray;
		text-align: left;
	}
	
	.text2{
		font-size:20px;
		font-weight: bold;
	}
	
	.info_main{
	
		display:inline-block;
	}
	
	.info{
		width :450px;
		height :400px;
		display:inline-block;
	}
	
	
	.info1{
		margin:auto;
		display:inline-block;
	}
	.count{
		width: 70px;
		height: 30px;
		margin : 20px;
	}
	.plus, .minus{
		width: 50px;
		height: 30px;
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
	
	.total > div{
		display:inline-block;
		vertical-align: middle;
	}
	
	#result{
		font-size: 25px;
		margin: 10px;
	
	}
	
	#result1{
		color:red;
		font-size: 25px;
		font-weight: bold;
		float:right;
		
	}
	
	#bt1{
		width: 50px;
		height: 50px;
	}
	

    
 </style>
<body>
<!-- 메인 상단바-->


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

 <!-- 스토어 상단바 -->
 	 <div class = "title">	
		    <div id = "bar1">
		        <ul>
		            <li ><a href="/HumanCinema/menu/snack.do?menu_type=10">스낵</a></li>
		            <li class = "drink"><a href="/HumanCinema/menu/drink.do?menu_type=20">음료</a></li>
		            <li><a href="/HumanCinema/menu/card.do?menu_type=30">영화관람권</a></li>      
		        </ul>
	
			    <div id = "bar2"> 
			    	<ul>
			    		<li><a href= "/HumanCinema/menu/cart.do?menu_id=" >장바구니</a></li>
			      	</ul>
				</div>
			</div>
			
	<!-- 메뉴 불러오기 -->
		<c:forEach var = "info" items = "${info_list }">
			<form method = "post" action= "/HumanCinema/menu/order.do?menu_id=${info.menu_id}">
				<div class = "name">${info.name }</div> 
					<hr style="border: solid 1px black;">
			<div class = "info_main">
				<div class = "info">
					  <div><img src="${info.image }" width="400px" height= "400px"></div>
				</div>	   
					<div class = "info1">
					     <div class = "price"> ${info.price} 원</div> 
							 <hr style="border: solid 1px gray;">
					      <div class = "text">
					      유효기간 : 내가 집가고 싶을 때...까...지....
					      </div>
					      <hr>
					
					<div class = "total">  
						<div><input id = "bt1" type='button' onclick='count("plus")' value='+'></div>
						<div id='result'>1</div>
						<div><input id = "bt1" type='button' onclick='count("minus")'  value='-'></div>
						<div id='result1'>40000원</div>
     				</div>
    
    <!-- 수량 선택 후 자동계산 --> 				
<script>

		function count(type)  {
			  // 결과를 표시할 element
			  const resultElement = document.getElementById('result');
			  
			  // 현재 화면에 표시된 값
			 let number = resultElement.innerText;
			  
			  // 더하기/빼기
			  if(type === 'plus') {
				  
			    number = parseInt(number) + 1;
			    
			    
			    if(number > 10){
			    	number = 10;
			    }
			       
			  }else if(type === 'minus')  {
			    number = parseInt(number) - 1;
			    if(number < 1){
			    	number = 1;
			    }
			
			  }
			  
			  // 결과 출력
			  resultElement.innerText = number;
			  
			  
			  // 총 수량 출력
			 const result1Element = document.getElementById('result1');
			  
			  let total = parseInt ('${info.price}') * number ;
			  console.log(total);
			  
			  result1Element.innerText = total + "원";
			  
			  
			}
	
		
</script>

					<div>
     				     <br>	
					    	<input name = "cart" class = "cart" type = "submit" value = "장바구니" >
					    	<input class = "order" type = "submit" value = "구매하기">
				 	</div>
			</div>
			</form>
		</c:forEach>
	
		<hr style="border: solid 1px black;">
	
	<div class = "info_main2_1">
	   <p class = "text2">이용안내</p><br>
		• 해당 기프트콘은 Human모바일, 홈페이지, 오프라인 극장에서 영화를 예매할 수 있는 온라인 상품권입니다.<br>
		<strong>• 구매 후 전송받으신 기프트콘은</strong><br>
		 - 사용가능한 Human에서 지정된 상영타입의 영화만 예매 가능합니다. (골드클래스관에서 상영하는 일반 2D/ 일반 3D 영화)<br>
		 - 금액권이 아니므로 차액 환급이 불가합니다. (ex.조조영화/청소년 관람 시 차액환급 불가)<br>
		 - 영화 상영 후 환불 및 반품은 불가합니다.<br>
		<strong>• 관람권 기프트콘을 온라인에 등록하시는 경우</strong><br>
		 - 모바일 : MY > 관람권/카드 > 기프트콘에서 '기프트콘 등록' 버튼 선택하여 수신받은 쿠폰번호 입력<br>
		 - 홈페이지(PC) : ‘MyHuman > 스토어 > 내 기프트콘'에서 [기프트콘 등록]버튼 선택하여 수신받은 쿠폰번호 입력<br>
		<strong>• 유효기간 연장을 신청하는 경우</strong><br>
		 유효기간은 발급일로부터 5년 이내 횟수 제한 없이 기간 연장 가능하며, 1회 연장 시 3개월(92일) 단위로 유효기간이 연장됩니다.<br>
		 유효기간 만료 이후에는 결제금액의 90% 환불이 가능합니다.<br>
		 단, 이벤트 경품 및 프로모션 상품의 경우 유효기간 연장 및 환불이 불가할 수 있습니다.<br>
		• 관람권 기프트콘 구매/사용 시 Human ONE 포인트는 적립되지 않습니다.<br>
	</div>
	<div class = "info_main2_2">
		<p class = "text2">취소/환불</p><br>
		• 구매자는 최초 유효기간 이내에 결제금액의 100%에 대해 결제취소/환불이 가능하며, 최초 유효기간 만료 후에는 수신자가 결제금액의 90%에 대해 환불 요청 가능합니다.<br>
		• 단, 이미 사용된 기프트콘에 대해서는 결제취소/환불 신청이 불가합니다. <br>
		<strong>• 결제취소/환불 방법</strong><br>
		결제취소는 모바일App,웹 > MY > 결제내역조회 > 스토어 or 홈페이지 > My Human > 스토어 > 결제내역의 해당 주문 상세내역에서 가능합니다.<br>
		(기프트콘은 구매일로부터 60일 이내 결제취소 가능하며, 카드 결제취소 가능 기간이 경과하였을 경우, 고객센터로 연락주시면 됩니다)<br>
		환불은 모바일App,웹 > MY > 기프트콘 or 홈페이지 > My CGV > 스토어 > 내 기프트콘에서 환불을 원하는 기프트콘 등록 후 진행 가능하며, 비회원의 경우 고객센터로 신청 가능합니다.<br>
		단 이 때, 본인 확인 및 계좌 확인 절차가 진행됩니다.<br>
		• 수신자는 선물받은 기프트콘의 수신거절을 요청할 수 있으며, 이 경우 구매자에게 취소 및 환불에 대한 안내가 이루어집니다. <br>
		• 결제취소 가능 기간이 경과한 후 수신자가 수신거절을 요청할 경우 구매자에게 기프트콘이 재발송됩니다. <br>
		• Human고객센터 041-561-1122<br>
	</div>
	<div class = "info_main2_3">
		<p class = "text2">미성년자 권리보호 안내</p><br>
		미성년자인 고객께서 계약을 체결하시는 경우 법정대리인이 그 계약에 동의하지 아니하면 미성년자 본인 또는 법정대리인이 그 계약을 취소할 수 있습니다.
	</div>
	<div class = "info_main2_4">
		<p class = "text2">분쟁 해결</p><br>
		1) 회사는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해의 보상 등에 관한 처리를 위하여<br>
		  Human고객센터 041-561-1122 를 설치 운영하고 있습니다.<br>
		2) 회사는 고객센터를 통하여 이용자로부터 제출되는 불만사항 및 의견을 처리합니다.<br>
		  다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보합니다.<br>
		3) 전자상거래 분쟁(청약철회등)과 관련한 이용자의 피해구제는 이용약관 및 전자상거래법 등 관련 법령에 따릅니다.<br>
	</div>
</div>

</body>
</html>