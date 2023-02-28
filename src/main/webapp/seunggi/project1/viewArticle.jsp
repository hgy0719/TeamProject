<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<h1>이벤트 참여 목록</h1>	
</head>
<body>
<h1>
<a href="/HumanCinema/event1/event1.do">홈으로 돌아가기</a>
</h1>
<table class=event_mem border="1">
<c:forEach var="vo" items="${ list}">

<tr>
	<td>
글쓴이 ID : ${vo.id }	
	</td>
</tr>
<tr>
	<td>
글번호 : ${vo.articleNO }	
	</td>
</tr>
<tr>
	<td>
제목 : ${vo.title }	
	</td>
</tr>
<tr>
	<td>
내용 : ${vo.content}	
	</td>
</tr>
</c:forEach>
</table>


<%-- <a href="/HumanCinema/seunggi/project1/replyForm.jsp?parentNO=${vo.articleNO }">답글</a> --%>
</body>
</html>