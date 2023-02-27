<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="project2.movieDAO"%>
<%@ page import="project2.movieVO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script type="text/javascript">

	
	
	window.onload = function() {
		

		var submit_1 = document.getElementById('submit_1');
		
		submit_1.addEventListener('click', function(event){ //클릭을 변경
			var time = document.getElementById('time').value;
			console.log(time);
			var area = document.getElementById('area').value;
			console.log(area);
			var choice = document.getElementById('choice').value;
			console.log(choice);
			var pnum = document.getElementById('pnum').value;
			console.log(pnum);
			var aa = document.getElementById('pnum').value * 10000;
			console.log(aa);
			document.getElementById('area_2').innerHTML = "<div>" + area
					+ "</div>";
			document.getElementById('area_3').innerHTML = "<div>" + choice
					+ "</div>";
			document.getElementById('area_4').innerHTML = "<div>" + time
					+ "</div>";
			document.getElementById('area_5').innerHTML = "<div>" + "인원수: "
					+ pnum + "</div>";
			document.getElementById('area_6').innerHTML = "<div>" + "영화결제 금액: "
					+ aa + "</div>";
		})

		document.getElementById('choice').addEventListener('change',function(event) {
			var choice = document.getElementById('choice').value;
			console.log(choice);
			if (choice == "영화선택") {
				document.getElementById('poster').src = "/project1/human.png"
			} else if (choice == "교섭") {
				document.getElementById('poster').src = "https://t1.daumcdn.net/movie/d331d74e425a3c71989ab14d9cbe83241377daa5"
			} else if (choice == "아바타: 물의 길") {
				document.getElementById('poster').src = " https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMzFfMjQ3%2FMDAxNjcyNDkyMTEyODc2.X3XgAMXFxkVEWAcE4brxRvl-VwjUcMoSJYnqRe0DG1Ug.V_Koq9cW3AOPzass2_Q26YKrO01pfOqH_ELOK8jsN5Yg.JPEG.soyul9292%2Fcommon.jpeg&type=sc960_832"
			} else if (choice == "유령") {
				document.getElementById('poster').src = "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEyMjRfMTgg%2FMDAxNjcxODkwMzkzODg1.FbqRN2YjTCjEnqPP8ZODYFUAWec-oBRK0FM1mOyCCMwg.vRyGh7O3fabtD3FEtcJonZpCeKY6lxfnnlN7AeInkAkg.JPEG.xman55555%2Fmovie_image.jpg&type=sc960_832"
			} else if (choice == "더 퍼스트 슬램덩크") {
				document.getElementById('poster').src = "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAxMjJfMTI3%2FMDAxNjc0MzE1MDE4ODk0.rl6O1UHC0XmL5NcJPiTIAHEQPgkRPiDyEBWomwF613Ug.EQS6rqnN7gudcsjpqtYoMtO4r3o8xzyVce-If7ZE9ucg.JPEG.goodnamshiri%2F%25B4%25D9%25BF%25EE%25B7%25CE%25B5%25E5%25C6%25C4%25C0%25CF%25A3%25DF20230122%25A3%25DF002914.jpg&type=sc960_832"
			}
		})
		document.getElementById('area').addEventListener('change',function(event) {
			var area = document.getElementById('area').value;
			console.log(123);
			let items = [ "교섭", "아바타: 물의 길", "유령", "더 퍼스트 슬램덩크" ]
			let html1 = "";
			html1 += "<option>"
			html1 += items[0]
			html1 += "</option>"
			html1 += "<option>"
			html1 += items[1]
			html1 += "</option>"
			let html2 = "";
			html2 += "<option>"
			html2 += items[0]
			html2 += "</option>"
			html2 += "<option>"
			html2 += items[1]
			html2 += "</option>"
			html2 += "<option>"
			html2 += items[2]
			html2 += "</option>"
			let html3 = "";
			html3 += "<option>"
			html3 += items[0]
			html3 += "</option>"
			html3 += "<option>"
			html3 += items[1]
			html3 += "</option>"
			html3 += "<option>"
			html3 += items[3]
			html3 += "</option>"
			console.log("html", html1)
			if (area == "천안역") {
				document.getElementById('choice').innerHTML = html1
			} else if (area == "천안터미널") {
				document.getElementById('choice').innerHTML = html2
			} else if (area == "불당동") {
				document.getElementById('choice').innerHTML = html3
			}
		})
		//영화선택
		document.getElementById('choice').addEventListener('change',function(event) {
			var choice = document.getElementById('choice').value;

			if (choice == "교섭") {
				document.getElementById('time').innerHTML = "<option>12:00</option><option>1:00</option><option>2:00</option><option>3:00</option><option>4:00</option><option>5:00</option><option>6:00</option><option>7:00</option>"
			} else if (choice == "아바타: 물의 길") {
				document.getElementById('time').innerHTML = "<option>12:00</option><option>1:00</option><option>2:00</option><option>3:00</option><option>4:00</option>"
			} else if (choice == "유령") {
				document.getElementById('time').innerHTML = "<option>12:00</option><option>1:00</option><option>2:00</option><option>3:00</option><option>4:00</option><option>5:00</option><option>6:00</option>"
			} else if (choice == "더 퍼스트 슬램덩크") {
				document.getElementById('time').innerHTML = "<option>12:00</option><option>1:00</option><option>2:00</option><option>3:00</option><option>4:00</option><option>5:00</option><option>6:00</option><option>7:00</option><option>8:00</option><option>9:00</option>"
			}
		})

	}
 	function on_click(){ 		
 		alert('결제되었습니다!');
 	}
 	
</script>

<style>
body{
background: rgb(2,0,36);
background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(103,10,10,1) 25%, rgba(103,10,10,1) 75%, rgba(2,0,36,1) 100%);
}



#table {
  border: 1px;
   solid: lightblue;
  
 
}
table {
/* 	background-color: lightblue; */
/* 	background-image: */
/* 		url( "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTULo1n9_y3_G_QZyfskzqx3bwf9ta83jNTSqYiwnrnmfTl_qM2ZyGwYFC57Njk9kFm9Iw&usqp=CAU"); */
	background-size: 100%;
	width: 100%;
	height: 650px;
	text-align: center;
	border-radius: 20px;
	padding: 10px;
/* 	solid: lightblue; */
	/* border: 2px solid lightblue; */
}

#submit_1 {
	background-color: #0a0a23;
	color: #fff;
	border-radius: 10px;
	padding: 10px;
	min-height: 20px;
	min-width: 100px;
}
/*  #submit_2 { */
/*  		alert('결제가 완료되었습니다!') */
/* 		frm.method = "post"; */
/* 		frm.action = "moviepay"; */
/* 	    frm.submit(); */
/*  	}  */
#submit_2 {
	background-color: #0a0a23;
	color: #fff;
	border-radius: 10px;
	padding: 10px;
	min-height: 20px;
	min-width: 100px;
}
#next {
	background-color: #0a0a23;
	color: #fff;
	border-radius: 10px;
	padding: 10px;
	min-height: 20px;
	min-width: 100px;
}

#submit_3 {
	background-color: #0a0a23;
	color: #fff;
	border-radius: 10px;
	padding: 10px;
	min-height: 20px;
	min-width: 100px;
}

.table_2 {
	display: inline-block;
	width: 100%;
	color: lightblue;
	display: inline-block;
	font-size: larger;
	font-style: oblique;
	text-align: center;
/* 	solid: lightblue; */

}

select {
	width: 50%;
	height: 50%;
}

#btn_1 {
	width: 30%;
	height: 60%;
}

.top_10 {
	display: inline-block;
}

.pic {
	width: 10%;
	height: 30
}

#poster {
	width: 30%;
	height: 40%;
	padding: 5px;
}

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
select {
	background:url('../project2/background.png') no-repeat 80% 60%/12px auto;
    width: 200px; /* 원하는 너비설정 */
     text_align: center;
    border: 1px solid #999;

    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
    text-align-last: center;
	text-align: center;
	-ms-text-align-last: center;
}

#pnum {

	text-align-last: center;
}

/*         #choice{ */
/*     position:relative; */
/*     display:inline-block; */
/*     height: 100px; */
/*     width:100px; */
/*     border:solid 1px grey; */
/*     overflow:hidden; */
/* } */
/* .pic{ */
/*     position: absolute; */
/*     left: 0px; */
/*     top: 0px; */
/*     cursor: pointer; */
/*     display:none; */
/* } */

.aaa1{
/* 	margin_bottom:50px; */
/* 	margin_top:50px; */
	margin-left:50px;
	margin-right:50px;
	background-color:white;
}



</style>
</head>
<body>

	<form name="frm" action="writedate.do" method="post">
		<div id="wrap">
			<header>
				<nav id="nav">
					<ul class="nav-items">
						<li><a href="#home">영화</a></li>
						<li><a href="#news"type="button" onClick="window.location.reload();">예매</a></li>
						<li><a href="#news">극장</a></li>
						<a class="logo" href="#home">로고</a>
						<li><a href="#contact">스토어</a></li>
						<li><a href="#about">고객센터</a></li>
						<li><a href="#about">로그인</a></li>
					</ul>
				</nav>
			</header>
		</div>
<div class="aaa1">
		
		<div class="table_2">
			<table id="table" border="1">
				<thead>
					<tr>
						<h1>영화예매</h1>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><label for="date">날짜를 선택하세요: <input type="date"
								name="datename" id="date" max="2077-06-20" min="2023-02-10"
								value="2023-02-10">
						</label></td>
					</tr>
					<tr>
						<td><select name="areaname" id="area" >
								<option value="지역선택">지역선택</option>
								<option value="천안역">천안역</option>
								<option value="천안터미널">천안터미널</option>
								<option value="불당동">불당동</option>
						</select></td>
					</tr>
					<tr>
						<td>
							<select name="choicename" id="choice" >	
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<select name="timename" id="time">
								<option value="시간선택">시간선택</option>
								<option value="12:00">12:00</option>
								<option value="1:00">1:00</option>
								<option value="2:00">2:00</option>
								<option value="3:00">3:00</option>
								<option value="4:00">4:00</option>
								<option value="5:00">5:00</option>
								<option value="6:00">6:00</option>
								<option value="7:00">7:00</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<span>인원수</span> 
							<input name="pnumname" id="pnum"
								class="number0" type="number" min="0" max="10" step="1" value="0">
						    <input id="submit_1" type="button" value="확인">
						    <input id="submit_3" type="button" value="다시 예매하기" onClick="window.location.reload()">
					    </td>
					</tr>
					<tr>
						<td>
						<input type="hidden" name="aaname" value="10000" id="cccname">
							<img id="poster" src="/HumanCinema/project2/human.png"> 
							<input type="hidden" name="image" value="">
							<div class="top_10">
								<div id="area_2"></div>
								<div id="area_3"></div>
								<div id="area_4"></div>
								<div id="area_5"></div>
								<div id="area_6"></div>
							</div>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	
	movieDAO dao = new movieDAO();
	movieVO vo = new movieVO();
	
	// 겟파라미터해서 영화값 가져오기
	// 영화값을 
	String choicename = request.getParameter("choicename");
	System.out.println(choicename);
	List<movieVO> list = dao.selectChoiceNames(choicename);
	
	for (int i = 0; i < list.size(); i++) {
		movieVO memberVO = (movieVO) list.get(i);
		String areaname2 = memberVO.getAreaname2();
		String choicename2 = memberVO.getChoicename2();
		String pnumname2 = memberVO.getPnumname2();
		String aaname2 = memberVO.getAaname2();
	
		// 	String title2 = memberVO.getTitle2();
 %> 
 <% } %>						
 						</td>
					</tr>
					<tr>
						<td>
							<input class ="submit_2" id="submit_2" type="submit" value="결제하기" onclick="on_click()">
<!-- 							<a href="project2/writedate.jsp" id="next">다음</a> -->
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</form>
	
	
	</div>


</body>