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
</head>
<body>
<h1>답글쓰기</h1>
<form method="post" action="/HumanCinema/event1/addReply.do">
	글쓴이 ID : <input type="text" name="id"><br>
	제목: <input type="text" name="title"><br>
	내용
	<textarea name="content" rows="10" cols="65"></textarea>
	<br><input type="submit" value="글쓰기"><br>
	<input type="hidden" name="parentNO" value="${param.parentNO }">
</form>
</body>
</html>