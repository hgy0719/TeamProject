<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<% 
	String title =request.getParameter("title"); 
	String title_en =request.getParameter("title_en");
	String age =request.getParameter("age"); 
	String opendate =request.getParameter("opendate");
	String explain =request.getParameter("explain"); 
	String director =request.getParameter("director");
	String genre =request.getParameter("genre"); 
	String runningtime =request.getParameter("runningtime");
	String actor =request.getParameter("actor"); 
	String poster_back =request.getParameter("poster_back");
	String poster_main =request.getParameter("poster_main");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지(수정)</title>
</head>
<body>
    <h1>관리자 페이지(수정)</h1>
    <h1>영화수정</h1>
    <form action="../../movie/movieManager.do" method="post">
	    타이틀 : <input type="text" value="<%=title%>" name="title">
	   	관람연령 :	<input type="text" value="<%=title_en%>" name="title_en">
	   	개봉일 : <input type="text" value="<%=opendate%>" name="opendate">
		영화설명 : <input type="text" value="<%=explain%>" name="explain">
		감독 : <input type="text" value="<%=director%>" name="director">
	   	장르 : <input type="text" value="<%=genre%>" name="genre">
	   	러닝타임 :	<input type="text" value="<%=runningtime%>" name="runningtime">
	  	배우 : <input type="text" value="<%=actor%>" name="actor">
	   	포스터(배경) : <input type="text" value="<%=poster_back%>" name="poster_back">
	   	포스터(메인) :	<input type="text" value="<%=poster_main%>" name="poster_main">
	    <input type="submit">
	    <input type="reset">
	    <input type="hidden" name="command" value="update">
    </form>
</body>
</html>