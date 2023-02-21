<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지(추가)</title>
</head>
<body>
    <h1>관리자 페이지(추가)</h1>
    <h1>영화추가</h1>
    <form action="../../movie/movieManager.do" method="post">
	    타이틀 : <input type="text" name="title"> <br>
	    타이틀(영문) : <input type="text" name="title_en"> <br>
	    관람연령 : <input type="text" name="age"> <br>
	    개봉일 : <input type="text" name="opendate"> <br>
	    좋아요 수 : <input type="text" readonly> <br>
	    평점 : <input type="text" readonly> <br>
	    영화설명 : <input type="text" name="explain"> <br>
	    감독 : <input type="text" name="director"> <br>
	    장르 : <input type="text" name="genre"> <br>
	    러닝타임 : <input type="text" name="runningtime"> <br>
	    배우 : <input type="text" name="actor"> <br>
	    포스터(배경) : <input type="text" name="poster_back"> <br>
	    포스터(메인) : <input type="text" name="poster_main"> <br>
	    <input type="hidden" name="command" value="add">
	    <input type="submit">
	    <input type="reset">
    </form>
</body>
</html>