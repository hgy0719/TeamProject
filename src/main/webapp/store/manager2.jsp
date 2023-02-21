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

<c:choose>
	<c:when test='${msg == "addMenu" }'>
		<script>
			window.onload = function(){
				alert("메뉴를 등록했습니다");
			}
		</script>
	</c:when>
	<c:when test='${msg=="modified" }'>
		<script>
			window.onload = function(){
				alert("메뉴 정보를 수정했습니다");
			}
		</script>
	</c:when>
	<c:when test='${msg=="deleted" }'>
		<script>
			window.onload = function(){
				alert("메뉴 정보를 삭제했습니다");
			}
		</script>
	</c:when>
</c:choose>


<meta charset="UTF-8">
<title>메뉴 수정/삭제</title>
</head>
<style>

a{
text-decoration: none;
color: aqua;
}
li{
    list-style: none;
}

.cls2{
	font-size: 20px;
	color : red;
}


</style>
<body>
 
    <h3>메뉴 목록</h3>
    <hr>
    
      <a href = "/HumanCinema/store/manager.jsp">
      	<p class = "cls2"><strong>메뉴 등록하기</strong></p>
      </a>
      
    <table alian = "center" border="1"> <!--DB연동 후 불러올때 border 지워주기-->

        <tr align = "center">
         <th>메뉴 아이디</th>
          <th colspan="2">상품명</th>
          <th>판매금액</th>
          <th>메뉴타입</th>
          <th colspan="2">수정/삭제</th>
        </tr>
        
        <c:choose>
       		<c:when test = "${empty menu_list }">
	        	<tr>
	        	<td colspan = "5">
	        		<b>등록된 메뉴가 없습니다</b>
	        	</td>
	        	</tr>
        	</c:when> 
        <c:when test="${!empty menu_list }">
         <c:forEach var = "menu" items = "${menu_list }">
			        <tr align = "center">
			     	  <td>${menu.menu_id }</td>
			          <td><img src="${menu.image }" width="200px" height= "200px";></td>
			          <td>${menu.name }</td>
			          <td>${menu.price}</td>
			          <td>${menu.menu_type }</td>
			          <td><a href = "/HumanCinema/menu/manager3.do?id=${menu.menu_id}">수정</a></td>
			          <td><a href = "/HumanCinema/menu/delMenu.do?id=${menu.menu_id}">삭제</a></td>
				
			        </tr>
       		  </c:forEach>
        	</c:when>
        </c:choose>
      </table>
      
   
      
</body>
</html>