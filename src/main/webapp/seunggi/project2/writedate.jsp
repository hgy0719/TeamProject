<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="project2.movieDAO"%>
<%@ page import="project2.movieVO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script type="text/javascript">
</script>

<style>
table {

			background-size: 100%;
			width: 100%;
			height: 650px;
			text-align: center;
			border-radius: 20px;
			padding: 10px;
		/* 	solid: lightblue; */
			 border: 2px solid lightblue;
}
 #homebtn {
            background-color:pink;
            color: #fff;
            border-radius:10px;
            padding:5px;
            min-height:80px; 
            min-width: 200px;
            font-size: 200%;
            display: inline-block;
            border:solid plum;
            margin-top: 50px;
         
        }

        body {
            text-align: center;
            
           
        }
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	${abc.datename }  --%>
<%-- 	${abc.areaname }  --%>
<%-- 	${abc.choicename }  --%>
<%-- 	${abc.timename }  --%>
<%-- 	${abc.pnumname }  --%>
<%-- 	${abc.aaname }  --%>
	<table align="center" border="1">
	<h1 align="center" border="1">예매내역</h1>
		<tr>
			<td>예매일: ${abc.datename } </td>
		</tr>
		<tr>
			<td>지역: ${abc.datename } </td>
		</tr>
		<tr>
			<td>영화: ${abc.choicename }</td>
		</tr>
		<tr>
			<td>시간: ${abc.timename }</td>
		</tr>
		<tr>
			<td>인원수: ${abc.pnumname }</td>
		</tr>
		<tr>
			<td>총 결제금액: ${abc.aaname }</td>
		</tr>
	</table>
	 <a href="https://www.naver.com/" ><input type="button" id="homebtn" value="홈으로 돌아가기"></a>	
</body>
</html>