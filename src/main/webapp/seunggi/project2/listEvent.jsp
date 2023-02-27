<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored= "false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<c:choose>
		<c:when test='${msg == "addEvent" }'>
		  <script>
		    window.onload = function() {
		    	alert("이벤트가 등록되었습니다.");
		    }
		  </script>
		</c:when>
		
		<c:when test='${msg == "modified" }'>
		  <script>
		   window.onload = function() {
			   alert("이벤트를 수정했습니다.");
		   }
		  </script>
		 </c:when>
		 
		 <c:when test='${msg == "deleted" }'>
		   <script>
		   window.onload = function() {
			   alert("이벤트를 삭제했습니다.");
		   }
		   </script>
		 </c:when>
	</c:choose>
		 
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript">



    </script>
<style>
/* 상단바시작         */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
}

#wrap {
	width: 100%;
	/* margin-top = header height */
	margin-top: 80px; /*상단 탭이랑 사이즈 잘 맞춰야함*/
}

/* Navigation bar */
header {
	/* for sticky header */
	position: fixed;
	top: 0;
	width: 100%;
	height: 80px;
	z-index: 2000;
	background-color: #fff;
	box-shadow: 0 2px 2px rgba(0, 0, 0, 0.05), 0 1px 0 rgba(0, 0, 0, 0.05);
}

.logo {
	display: inline-block;
	height: 5px;
	margin: 12px 0 12px 25px;
}

.logo>img {
	height: 50px;
}

nav {
	display: flex;
	justify-content: space-around;
}

.nav-items {
	margin-right: 20px;
}
/* nav-items 가로정렬 */
.nav-items>li {
	display: inline-block;
	margin-left: 40px;
	margin-right: 40px;
}

.nav-items>li>a {
	/* for Vertical Centering */
	line-height: 80px;
	padding: 0 30px;
	color: rgba(0, 0, 0, 0.4);
}

.nav-items>li>a:hover {
	color: rgba(0, 0, 0, 0.8);
}
/* 상단바 끝 */
/* .event_menu>ul>li{ */
    
/*     display: inline-block; */
/* } */
/* .event_main>ul>li{ */
/*     display:inline-block; */
/*     width: 20%; */
/*     height: 10%; */
/*     float: left; */
/*     margin-top: 20px; */
/*     margin-left: auto; */
/*     margin-right: auto; */
/* } */
/* .evt-thumb>img { */
/*     width: 100%; */
/* } */

.event_t {
	
	width:30%;
 	display:inline-block; 
}
/* .event_t > img { */
	
/* 	width:100%; */
 	
/* } */
.event_top{
	width:30%;
	margin:150px;
}

.cls1{
	width:50%;
	height:30%;
	font-size : 20px;
	text-align: center;
}
.cls2{
	font-size : 20px;
	text-align: center;
}
</style>
</head>
<body>
		<div id="wrap">
			<header>
				<nav id="nav">
				<jsp:include page="/hyojung/Header.jsp"></jsp:include>
<!-- 					<ul class="nav-items"> -->
<!-- 						<li><a href="#home">영화</a></li> -->
<!-- 						<li><a href="#news">예매</a></li> -->
<!-- 						<li><a href="#news">극장</a></li> -->
<!-- 						<a class="logo" href="#home">로고</a> -->
<!-- 						<li><a href="#contact">스토어</a></li> -->
<!-- 						<li><a href="#about">고객센터</a></li> -->
<!-- 						<li><a href="#about">로그인</a></li> -->
<!-- 					</ul> -->
				</nav>
			</header>
		</div>


	<div class="event_top"></div>
          <h1>EVENT</h1>
    </div> 
    
<!--   수정/삭제   -->
<!-- <p class="cls1">이벤트</p> -->
<!-- <table align="center" border="1"> -->
<!-- 	<tr align="center" bgcolor="lightgreen"> -->
<!-- 		<td width="5%"><b>이벤트아이디</b></td> -->
<!-- 		<td width="5%"><b>이벤트제목</b></td> -->
<!-- 		<td width="5%"><b>이미지주소</b></td> -->
<!-- 		<td width="5%"><b>첫번째이미지내용(x)</b></td> -->
<!-- 		<td width="5%"><b>두번째이미지주소</b></td> -->
<!-- 		<td width="5%"><b>이벤트기간</b></td> -->
<!-- 		<td width="5%"><b>수정</b></td> -->
<!-- 		<td width="5%"><b>삭제</b></td> -->
<!-- 	</tr> -->
	
<%-- 	<c:choose> --%>
<%-- 		<c:when test="${ empty eventsList }"> --%>
<!-- 		  <tr> -->
<!-- 		    <td colspan=5> -->
<!-- 		      <b>등록된 이벤트가 없습니다</b> -->
<!-- 		    </td> -->
<!-- 		  </tr> -->
<%-- 		</c:when> --%>
		
<%-- 		<c:when test = "${!empty eventsList }"> --%>
<%-- 	      <c:forEach var="eve" items="${eventsList }"> --%>
<!-- 	      	<tr align="center"> -->
<%-- 	      		<td>${eve.id }</td> --%>
<%-- 	      		<td>${eve.title }</td> --%>
<%-- 	      		<td>${eve.firstimage }</td> --%>
<%-- 	      		<td>${eve.firstimagead }</td> --%>
<%-- 	      		<td>${eve.secondimage }</td> --%>
<%-- 	      		<td>${eve.eventday }</td> --%>
<%-- 	      		<td><a href="/HumanCinema/event1/modEventForm.do?id=${eve.id }">수정</a></td> --%>
<%-- 	      		<td><a href="/HumanCinema/event1/delEventForm.do?id=${eve.id }">삭제</a></td> --%>
<!-- 			</tr> -->
<%-- 		  </c:forEach> --%>
<%-- 		</c:when>	   --%>
<%-- 	</c:choose> --%>
<!-- </table>    -->

<!-- <a href="/HumanCinema/event1/eventForm.do"> -->
<!-- 	<p class="cls2">이벤트 등록하기</p> -->
<!-- </a> -->
    
    
<!--  원래화면         -->
<c:forEach var="vo" items="${ eventsList}">
<div class=event_t>
	
		<a href="/HumanCinema/event1/viewEvent.do?id=${vo.id }">
			<img src ="${vo.firstimage }" width = "100%" ><br>
			${vo.title }<br>
			${vo.eventday }<br>
		</a>
	
</div>
</c:forEach>











<!--         <div class="event_title"> -->
<!--             <table border=1> -->
<%--             <c:forEach var="vo" items="${ eventsList}"> --%>
<!--             <tr> -->
<!--             	<td> -->
<%--             	${vo.id } --%>
<%--             	${vo.title } --%>
<%--             	${vo.firstimage } --%>
<%--             	${vo.secondimage } --%>
<%--             	${vo.eventday } --%>
<!--             	</td> -->
<!--             </tr> -->
<%--             </c:forEach> --%>
<!--             </table> -->
<!--         </div> -->

<!--         <div class="event_menu"> -->
<!--             <ul class="event_menuul"> -->
<!--                 <li><a href="">SPECIAL</a></li> -->
<!--                 <li><a href="">영화/예매</a></li> -->
<!--                 <li><a href="">멤버십/CLUB</a></li> -->
<!--                 <li><a href="">CGV</a></li> -->
<!--                 <li><a href="">제휴/할인</a></li> -->
<!--             </ul> -->
<!--         </div> -->

<!--         <div class="event_main"> -->
<!--             <ul class="main_list"> -->
<!--                 <li> -->
<!-- 	                <a id="tile_0" href="./seunggi/project2/event2.jsp"> -->
<!-- 		                <div class="evt-thumb"> -->
<!-- 	                		<img src="https://img.cgv.co.kr/WebApp/contents/eventV4/36502/16768561232210.jpg" alt="★미니게임천국★  [멍뭉이] 예매권 이벤트"> -->
<!-- 	                    </div> -->
<!-- 	                    <div class="evt-desc"> -->
<!-- 		                    <p class="txt1"> -->
<!-- 		                    	★미니게임천국★[멍뭉이] 예매권 이벤트 -->
<!-- 		                    </p> -->
<!-- 		                    <p class="txt2"> -->
<!-- 		                    	2023.02.20~2023.02.27<span> . </span><em>D-5</em> -->
<!-- 		                    </p> -->
<!-- 	                    </div> -->
<!--                     </a> -->
<!--                 </li> -->
                
<!--                 <li><a id="tile_1" href="./seunggi/project2/event2.jsp"><div class="evt-thumb"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/36490/16766047619100.jpg" alt="[앤트맨과 와스프] -->
<!--                     4DX 포스터"></div><div class="evt-desc"><p class="txt1">[앤트맨과 와스프] -->
<!--                     4DX 포스터</p><p class="txt2">2023.02.17~2023.02.28<span> . </span><em>D-6</em></p></div></a> -->
<!--                 </li> -->
<!--                 <li><a id="tile_2" href="./seunggi/project2/event2.jsp"><div class="evt-thumb"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/36491/16766046775130.jpg" alt="[앤트맨과 와스프] -->
<!--                     SX 포스터"></div><div class="evt-desc"><p class="txt1">[앤트맨과 와스프] -->
<!--                     SX 포스터</p><p class="txt2">2023.02.17~2023.02.28<span> . </span><em>D-6</em></p></div></a> -->
<!--                 </li> -->
<!--                 <li><a id="tile_3" href="./seunggi/project2/event2.jsp"><div class="evt-thumb"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/36489/16765984777910.jpg" alt="[앤트맨과 와스프] -->
<!--                     IMAX 포스터"></div><div class="evt-desc"><p class="txt1">[앤트맨과 와스프] -->
<!--                     IMAX 포스터</p><p class="txt2">2023.02.17~2023.02.28<span> . </span><em>D-6</em></p></div></a> -->
<!--                 </li> -->
<!--                 <li><a id="tile_4" href="./seunggi/project2/event2.jsp"><div class="evt-thumb"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/36503/16766191891070.jpg" alt="[스즈메의 문단속] -->
<!--                     IMAX 프리미어 상영!"></div><div class="evt-desc"><p class="txt1">[스즈메의 문단속] -->
<!--                     IMAX 프리미어 상영!</p><p class="txt2">2023.02.17~2023.02.26<span> . </span><em>D-4</em></p></div></a> -->
<!--                 </li> -->
<!--                 <li><a id="tile_5" href="./seunggi/project2/event2.jsp"><div class="evt-thumb"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/36436/16759153895210.jpg" alt="[ 더 퍼스트 슬램덩크] -->
<!--                     N차 이벤트"></div><div class="evt-desc"><p class="txt1">[ 더 퍼스트 슬램덩크] -->
<!--                     N차 이벤트</p><p class="txt2">2023.02.09~2023.02.28<span> . </span><em>D-6</em></p></div></a> -->
<!--                 </li> -->
<!--                 <li><a id="tile_6" href="./seunggi/project2/event2.jsp"><div class="evt-thumb"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/36479/16765141838110.jpg" alt="★미니게임천국★  -->
<!--                     [카운트] 예매권 이벤트"></div><div class="evt-desc"><p class="txt1">★미니게임천국★  -->
<!--                     [카운트] 예매권 이벤트</p><p class="txt2">2023.02.16~2023.02.22<span> . </span><em>종료임박</em></p></div></a> -->
<!--                 </li> -->
<!--                 <li><a id="tile_7" href="./seunggi/project2/event2.jsp"><div class="evt-thumb"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/36475/16763555523510.jpg" alt="[PRIVATE BOX] -->
<!--                     투 로맨틱 이벤트"></div><div class="evt-desc"><p class="txt1">[PRIVATE BOX] -->
<!--                     투 로맨틱 이벤트</p><p class="txt2">2023.02.14~2023.03.31</p></div></a> -->
<!--                 </li> -->
<!--                 <li><a id="tile_8" href="./seunggi/project2/event2.jsp"><div class="evt-thumb"><img src="https://img.cgv.co.kr/WebApp/contents/eventV4/36442/16760063770510.jpg" alt="[앤트맨과 와스프 -->
<!--                     -퀸텀매니아] 필름마크"></div><div class="evt-desc"><p class="txt1">[앤트맨과 와스프 -->
<!--                     -퀸텀매니아] 필름마크</p><p class="txt2">2023.02.10~2023.03.15</p></div></a> -->
<!--                 </li> -->
<!--             </ul>          -->
<!--         </div> -->

</body>
</html>