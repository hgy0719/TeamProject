<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored= "false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<c:set var="contextPath" value= "${pageContext.request.contextPath }"/>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 수정창</title>
<style>
 	.cls1{
 	font-size:40px;
 	text-align:center;
 	}
</style>
</head>
<body>
	<h1 class="cls1">이벤트 수정창</h1>
	<form method="post" action= "/HumanCinema/event1/modEvent.do?id=${eveInfo.id }">
		<table align="center">
			<tr>
				<td width="200">
					<p align="right">이벤트 아이디</p>
				</td>
				<td width="400"><input type="text" name="id" value="${eveInfo.id }" >
				</td>
			</tr>
			<tr>
				<td width="200">
					<p align="right">이벤트 제목</p>
				</td>
				<td width="400"><input type="text" name="title" value="${eveInfo.title }" >
				</td>
			</tr>
			<tr>
				<td width="200">
					<p align="right">이미지 주소</p>
				</td>
				<td width="400"><input type="text" name="firstimage" value="${eveInfo.firstimage }" >
				</td>
			</tr>
			<tr>
				<td width="200">
					<p align="right">첫번째 이미지내용(x)</p>
				</td>
				<td width="400"><input type="text" name="firstimagead" value="${eveInfo.firstimagead }" disabled>
				</td>
			</tr>
			<tr>
				<td width="200">
					<p align="right">두번째 이미지 주소</p>
				</td>
				<td width="400"><input type="text" name="secondimage" value="${eveInfo.secondimage }" >
				</td>
			</tr>
			<tr>
				<td width="200">
					<p align="right">두번째 이미지 주소</p>
				</td>
				<td width="400"><input type="text" name="eventday" value="${eveInfo.eventday }" >
				</td>
			</tr>
			<tr align="center">
				<td colspan="2" width="400"><input type="submit" value= "수정하기">
					<input type ="reset" value= "다시입력"> 
				</td>
			</tr>
		</table>
	
	
	</form>

</body>
</html>