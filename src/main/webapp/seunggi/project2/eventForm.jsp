<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 추가페이지</title>
</head>
<body>
<form method="post" action="/HumanCinema/event1/addEvent.do">
	 ID : <input type="text" name="id"><br>
	title: <input type="text" name="title"><br>
	첫번째 이미지:  <input type="text" name="firstimage"><br>
	첫번째 주소:  <input type="text" name="firstimagead"><br>
	두번째 이미지:  <input type="text" name="secondimage"><br>
	이벤트 날짜:  <input type="text" name="eventday"><br>
	<input type="submit" value="추가"><br>
</form>
</body>
</html>