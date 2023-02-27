<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*,gayeong.*"
    isELIgnored = "false"
  %>
<%@ page import="javax.servlet.http.HttpSession" %>
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


.dropbtn {
    background-color: black;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    width : 200px;
    cursor: pointer;
}


.dropdown {
    position: relative;
    display: inline-block;
}


.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}


.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}


.dropdown-content a:hover {background-color: #f1f1f1}


.dropdown:hover .dropdown-content {
    display: block;
}


.dropdown:hover .dropbtn {
    background-color: #3e8e41;
}




</style>


<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script>
	window.onload = () => {

	    	document.querySelector(".cinema_main1").style.display = "none";
		    document.querySelector(".cinema_main2").style.display = "none";
		    document.querySelector(".cinema_main3").style.display = "none";
		    document.querySelector(".cinema_main4").style.display = "none";
	
	   		for (let i = 1; i < 5; i++) {
	    	
	        document.querySelector("#name"+i).addEventListener("click", (event) => {
	
			let dom = event.target;
			let idx = dom.getAttribute("data-value");
			console.log(idx);
		
	           for (let j = 1; j < 5; j++) {
	        	   
	                if (idx == j) {
	                	
	                    document.querySelector(".cinema_main" + j).style.display = "block";
	                    document.querySelector(".cinema_main").style.display = "none";
	                    document.querySelector("#name" + j).classList.add("violet");
	                    document.querySelector("#name" + j).classList.remove("violet2");
	                    
	  				  } else {
	  					  
	                	document.querySelector(".cinema_main" + j).style.display = "none";
	                	document.querySelector(".cinema_main").style.display = "none";
	                    document.querySelector("#name" + j).classList.remove("violet");
	                    document.querySelector("#name" + j).classList.add("violet2");
	                }
	           }
	        })
	    }
 }
    
    






</script>

<body>
<jsp:include page="/hyojung/Header.jsp"></jsp:include>
		
	<!-- 지역 선택 상단바  cinema_area -->
		<c:forEach 	var = "cinema" items = "${cinema_list }" varStatus = "v">
	
			<div class="dropdown">
				 <button id = "area" class="dropbtn">${cinema.cinema_area }</button>
				 <div class="dropdown-content">
					 <a id = "name${v.count }" data-value = "${v.count }" >${cinema.cinema_name }</a>
				 </div>
			</div>	
			
		</c:forEach>	
	
	 <!-- 기본 정보창 -->
	 	<div class="cinema_main">
			 	<div><h2>HUMAN CINEMA</h2></div>
			 	<div><img src = "https://img.cgv.co.kr/Theater/Theater/2017/0308/14889569732790.JPG"></div>
		</div>
	 

	<!-- 해당 지역 선택하면 나오는 극장 정보 -->
		<c:forEach var = "ci" items = "${cinema_list }" varStatus = "v">	
			
			<div class="cinema_main${v.count }">
				 	<div><h2>${ci.cinema_name }</h2></div>
				 	<div><img src = "${ci.cinema_image }"></div>
			 </div>
		</c:forEach> 
		
	 
	<!-- 극장 정보랑 영화 정보 사이에 로고 -->
		<div class = "hr">
		    <hr style ="border-top:20px double #bbb">
		    <img src="https://img.cgv.co.kr/R2014/images/title/h3_theater.gif">
		    <hr style ="border-top:20px double #bbb">
		</div>
	
			
			
			<hr style="border: solid 2px black;">
		
		<div class="cinema_date"> <!-- 영화 예매 날짜 -->
		
		    <input type="button" value="<">
		        2월22일 
		    <input type="button" value=">">
		    
		</div>
		
			<hr style="border: solid 1px rgb(56, 55, 55);">
		
		<div class="cinema_name">	<!-- 영화 관람가능 나이, 영화명, 개봉날짜 -->
		    15 마루이 비디오 / 2023.02.22 개봉
		</div>
		<div class="cinema_time">		<!-- 영화 상영시간 -->
		    <p>13:10</p>
		    <p>15:20</p>
		    <p>19:30</p>
		</div>
		
			<hr>
			
	
</body>
</html>