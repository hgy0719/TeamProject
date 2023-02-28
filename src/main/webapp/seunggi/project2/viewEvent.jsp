<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored= "false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
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
.secondimg {
	 width: 100%;
	display: center;
	
	 margin-top: 20px;
 text-align:center;
}
 
 </style>   
</head>
<body>

	<div class="secondimg"> 
		<h1>
			<a href="/HumanCinema/seunggi/project1/articleForm.jsp">이벤트 참여 댓글쓰기</a>
		</h1>
		<img src ="${vo.secondimage }">
	</div>
	
<!-- 	<div class="reply"> -->
	
<!-- 	<h1>댓글창</h1> -->
	
<%--  <a href="/HumanCinema/project2/replyForm.jsp?=${vo.eventNO }">글쓰기</a>  --%>
<!-- 	</div> -->
</body>
</html>