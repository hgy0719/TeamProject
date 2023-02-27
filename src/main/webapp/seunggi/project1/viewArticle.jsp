<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
글쓴이 : ${vo.id }<br>
글번호 : ${vo.articleNO }<br>
제목 : ${vo.title }<br>
내용 : ${vo.content}<br>
<a href="/HumanCinema/seunggi/project1/replyForm.jsp?parentNO=${vo.articleNO }">답글</a>
</body>
</html>