<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 수정창</title>
<c:set var = "contextPath" value = "${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("utf-8"); %>
</head>
<body>


<form method = "post" class = "menu1" action = "${contextPath }/menu/modMenu.do?menu_id=${menuInfo.menu_id}">


   <h3>메뉴 수정창</h3> 
    <hr>
      <a href = "/HumanCinema/menu/manager2.do">
      	<p class = "cls2"><strong>메뉴 목록</strong></p>
      </a>
    메뉴 아이디 : <input name = "menu_id" class = "menu_id" type="text" value = "${menuInfo.menu_id }"> <br>
    메뉴 이름 : <input name = "name" class = "name" type="text" value = "${menuInfo.name }"><br>
    가격 : <input name = "price" class = "price" type="text" value = "${menuInfo.price }"><br>
    이미지 주소 : <input name = "image" class = "image" type="text" value = "${menuInfo.image }"><br>
    메뉴타입 [스낵 : 10 , 음료 : 20 기프트카드 : 30]: <input name = "menu_type" class = "menu_type" type = "text" value = "${menuInfo.menu_type }"> <br> <!-- 누르면 사라지게 수정하기 -->
    <br>
    <input class="bt1" type="submit" value="저장">
   

</form>
</body>
</html>