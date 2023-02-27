<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored= "false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var = "contextPath" value = "${pageContext.request.contextPath }" />
<% 
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
	<style>
		.cls1 {
			text-decoration: none;
		}
		.cls2 {
		 	text-align: center;
		 	font-size: 30px;
		}
	</style>
<meta charset="UTF-8">
<title>댓글 목록창</title>
</head>
<body>
	<table align="center" border="1" width="80%">
		<tr height="10" align="center" bgcolor= "ligntgreen">
			<td>글 번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
		<c: choose>
			<c:when test="${empty articlesList }">
				<tr height="10">
					<td colspan="4">
					 <p align="center">
						<b><span style= "font-size:9pt;">등록된 글이 없습니다</span></b>
					 </p>
					</td>
				</tr>
			</c:when>
			<c: when test= "${!empty articlesList }">
			  <c:forEach var="article" items= "${articlesList }"
	</table>
</body>
</html>