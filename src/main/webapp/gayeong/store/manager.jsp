<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 등록</title>
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
<form method = "post" class = "menu1" action = "/HumanCinema/menu/manager.do">

   <h3>메뉴 등록창</h3> 
    <hr>
      <a href = "/HumanCinema/menu/manager2.do">
      	<p class = "cls2"><strong>메뉴 목록</strong></p>
      </a>
    메뉴 아이디 : <input name = "menu_id" class = "menu_id" type="text"> <br>
    메뉴 이름 : <input name = "name" class = "name" type="text"><br>
    가격 : <input name = "price" class = "price" type="text"><br>
    이미지 주소 : <input name = "image" class = "image" type="text"><br>
    메뉴타입 [스낵 : 10 , 음료 : 20 기프트카드 : 30]: <input name = "menu_type" class = "menu_type" type = "text"> <br> <!-- 누르면 사라지게 수정하기 -->
    <br>
    <input class="bt1" type="submit" value="저장">
   

</form>
</body>
</html>