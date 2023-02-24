<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*,gayeong.*"
    isELIgnored = "false"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
   a{
        text-decoration: none;
        color: aqua;
    }
    li{
        list-style: none;
    }

    .bt1{
        width: 150px;
        height: 30px;
    }
    
    .cls2{
	font-size: 20px;
	color : red;
}
  
</style>
<body>
<form method = "post" class = "cinema" action = "/HumanCinema/cinema/cinema_manager1.do">

   <h3>극장 등록창</h3> 
    <hr>
      <a href = "/HumanCinema/cinema/cinema_manager2.do">
      	<p class = "cls2"><strong>극장 목록</strong></p>
      </a>
   	극장 아이디 : <input name = "cinema_id" class = "cinema_id" type="text"> <br>
    극장 이름 : <input name = "cinema_name" class = "cinema_name" type="text"><br>
    극장 위치: <input name = "cinema_area" class = "cinema_area" type="text"><br>
    극장 이미지 주소 : <input name = "cinema_image" class = "cinema_image" type="text"><br>
    극장 타입 : <input name = "cinema_area_type" class = "cinema_type" type = "text"> <br> <!-- 누르면 사라지게 수정하기 -->
    <br>
    <input class="bt1" type="submit" value="저장">
   

</form>
</body>
</html>