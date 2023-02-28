<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<style>
* {
    margin: 0;
    padding: 0;
}
html{
    font-size: 10px;
}
ul, li {
    list-style: none;
}


a {
    text-decoration: none;
    color: inherit;
    
}
.board_wrap{
    width: 1000px;
    margin: 100px auto;
    font-size: 20px;
    
    
}
.board_title{
    margin-bottom: 50px;
   
}
.board_title strong{
    font-size: 3rem;
    border-bottom: 2px solid rgb(20, 20, 20);
   
}
.board_title{
    width: 100%;
    border-top: 2px solid #000;
}
.board_title > div{
    border-bottom: 2px solid #ddd;
    font-size: 20px;
    

}
.board_title > div.top1 {
    border-bottom: 2px solid #999;
}
.board_title > div:last-child {
    border-bottom: 1px solid #000;
}
.board_title > div > div {
    display: inline-block;
    margin-top: 18px;
    height: 50px;
    text-align: center;
    font-size: 2.5rem;
}
.board_title > div.top1 > div {
    font-weight: 740;
    
    
}
.board_title .QnA{
    width: 10%;
    
    
   
}
.board_title .공지사항{
    width: 10%;
    
    
}
.bt_wrap{
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}
.bt_wrap a{
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid rgb(122, 115, 115);
    border-radius: 2px;
    font-size: 1.4rem;
    position: relative;
    top: 60px;
}
.bt_wrap a:first-child{
    margin-left: 0;
}


.board_list{
    width: 100%;
    border-top: 2px solid #000;
}
.board_list > div{
    border-bottom: 2px solid #ddd;
    font-size: 0;

}
.board_list > div.top {
    border-bottom: 2px solid #999;
}
.board_list > div:last-child {
    border-bottom: 1px solid #000;
}
.board_list > div > div {
    display: inline-block;
    padding: 15px 0;
    text-align: center;
    font-size: 1.7rem;
}
.board_list > div.top > div {
    font-weight: 740;
}
.board_list .num{
   
    width: 5%;
}

.board_list .id{
	width: 18%;
}

.board_list .title{
    
  	width: 50%;
    
}


.board_list .date{
	
	width: 25%;
}

table{
	width: 100%;
	position: relative;
	top:40px;
	margin-left:auto;
	margin-right:auto;
}

.t {
	width: 5%;
	text-align: center;
	talble-layout:fixed;
	
	
}
.t1 {
	text-align: center;
	width: 50%;
	talble-layout:fixed;
}
.t2{
	text-align: center;
	width: 15%;
	talble-layout:fixed;
}

.t3{
	text-align: center;
	width: 25%;
	talble-layout:fixed;
	
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="board_wrap">
<a>고객센터</a><br>
<div class="board_title">
	<div class="top1">
	<div class="QnA"><a href="/team/board/qna.do">QnA</a></div>
	<div class="공지사항"><a href="/team/board">공지사항</a></div>
	
</div>
<p> [공지/뉴스] </p><br>
<p> 휴먼시네마의 공지/뉴스 및 다양한 이벤트 소식을 확인하실수 있습니다.</p>
</div>
<!--  글 쓰기 버튼 구현  -->

<div class="board_list_wrap">
  <div class="board_list">
      <div class="top">
          <div class="num">NO</div>
          <div class="id">작성자</div>
          <div class="title">제목</div>
          <div class="date">등록일</div>
      </div>
             

<table border=1 >
<c:forEach var="vo" items="${ articlesList1}">
<tr>
	
	<td class="t" >
		${vo.level }
	</td>
	<td class="t2">
		${vo.id}
	</td>
	<td class="t1" style="padding-left: ${(vo.level-1) * 20 }px">
		<a href="/team/board/viewArticle.do?articleNO=${vo.articleNO }">${vo.title }</a>
	</td>
	
	<td class="t3">
	${vo.writeDate }
	</td>
	<input type="hidden" name="content" value="${param.content}">
	
</tr>
</c:forEach>
</table>

<div class="bt_wrap">
	<a href="/team/board" class="on">목록</a>
	<a href="/team/board01/articleForm.jsp?n=2">등록</a>
	
</div>
	


</body>
</html>