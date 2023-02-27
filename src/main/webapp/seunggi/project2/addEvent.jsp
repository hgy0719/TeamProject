<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored= "false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
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
<title>Insert title here</title>
</head>

<body>
<!--   수정/삭제   -->
<p class="cls1">이벤트</p>
<table align="center" border="1">
	<tr align="center" bgcolor="lightgreen">
		<td width="5%"><b>이벤트아이디</b></td>
		<td width="5%"><b>이벤트제목</b></td>
		<td width="5%"><b>이미지주소</b></td>
		<td width="5%"><b>첫번째이미지내용(x)</b></td>
		<td width="5%"><b>두번째이미지주소</b></td>
		<td width="5%"><b>이벤트기간</b></td>
		<td width="5%"><b>수정</b></td>
		<td width="5%"><b>삭제</b></td>
	</tr>
	
	<c:choose>
		<c:when test="${ empty eventsList }">
		  <tr>
		    <td colspan=5>
		      <b>등록된 이벤트가 없습니다</b>
		    </td>
		  </tr>
		</c:when>
		
		<c:when test = "${!empty eventsList }">
	      <c:forEach var="eve" items="${eventsList }">
	      	<tr align="center">
	      		<td>${eve.id }</td>
	      		<td>${eve.title }</td>
	      		<td>${eve.firstimage }</td>
	      		<td>${eve.firstimagead }</td>
	      		<td>${eve.secondimage }</td>
	      		<td>${eve.eventday }</td>
	      		<td><a href="/HumanCinema/event1/modEventForm.do?id=${eve.id }">수정</a></td>
	      		<td><a href="/HumanCinema/event1/delEvent.do?id=${eve.id }">삭제</a></td>
			</tr>
		  </c:forEach>
		</c:when>	  
	</c:choose>
</table>   

<a href="/HumanCinema/event1/eventForm.do">
	<p class="cls2">이벤트 등록하기</p>
</a>
    
</body>
</html>