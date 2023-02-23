<%@ page language="java" 
contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    
    isELIgnored="false"%>
    <%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="changsoon.MovieDAO"%>
<%@ page import="changsoon.MovieVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지(메인)</title>
   	<script>
	    window.onload = () => {
	    	document.querySelector("#add").addEventListener("click",function(){
	            
	    		location.href="../changsoon/managerTab/movieAdd.jsp"
	        })
	    }
	</script>
</head>
<body>
    <h1>관리자 페이지(메인)</h1>
    <input id="add" type="button" value="추가">
    <%
    request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
	MovieDAO dao = new MovieDAO();
	MovieVO vo = new MovieVO();
	List<MovieVO> list = dao.listMovies();
	for (int i=0; i<list.size();i++){
		MovieVO movieVO=(MovieVO) list.get(i);;
		String getTitle = movieVO.getTitle();
		String getTitle_en = movieVO.getTitle_en();
		String getAge = movieVO.getAge();
		String getOpendate = movieVO.getOpendate();
		String getExplain = movieVO.getExplain();
		String getDirector = movieVO.getDirector();
		String getGenre = movieVO.getGenre();
		String getRunningtime = movieVO.getRunningtime();
		String getActor = movieVO.getActor();
		String getPoster_back = movieVO.getPoster_back();
		String getPoster_main = movieVO.getPoster_main();
    %>
    	<hr>
	    <div><%=getTitle%></div>
		<form name=updateForm action="../changsoon/managerTab/movieUpdate.jsp" method="post">
	   		<input type="hidden" value="<%=getTitle%>" name="title">
	   		<input type="hidden" value="<%=getTitle_en%>" name="title_en">
	   		<input type="hidden" value="<%=getOpendate%>" name="opendate">
	   		<input type="hidden" value="<%=getExplain%>" name="explain">
	   		<input type="hidden" value="<%=getDirector%>" name="director">
	   		<input type="hidden" value="<%=getGenre%>" name="genre">
	   		<input type="hidden" value="<%=getRunningtime%>" name="runningtime">
	   		<input type="hidden" value="<%=getActor%>" name="actor">
	   		<input type="hidden" value="<%=getPoster_back%>" name="poster_back">
	   		<input type="hidden" value="<%=getPoster_main%>" name="poster_main">
	   		<input type="submit" value="수정">		
		</form>
		<form name=deleteForm action="../movie1/movieManager.do" method="post">
			<input type="hidden" value="<%=getTitle%>" name="title">
			<input type="hidden" name="command" value="del">
			<input type="submit" value="삭제">
		</form>
	<%
    	}
    %>
</body>
</html>