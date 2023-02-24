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
<body>

    <h3>극장 목록</h3>
    <hr>
    
      <a href = "/HumanCinema/gayeong/cinema/cinema_manager1.jsp">
      	<p class = "cls2"><strong>극장 등록하기</strong></p>
      </a>
      
    <table alian = "center" border="1"> <!--DB연동 후 불러올때 border 지워주기-->

        <tr align = "center">
         <th>극장 아이디</th>
          <th colspan="2">극장이름</th>
          <th>극장위치</th>
          <th>극장이미지</th>
           <th>극장타입</th>
          <th colspan="2">수정/삭제</th>
        </tr>
        
        <c:choose>
       		<c:when test = "${empty cinema_list }">
	        	<tr>
	        	<td colspan = "5">
	        		<b>등록된 메뉴가 없습니다</b>
	        	</td>
	        	</tr>
        	</c:when> 
        <c:when test="${!empty cinema_list }">
         <c:forEach var = "cinema" items = "${cinema_list }">
			        <tr align = "center">
			     	  <td>${cinema.cinema_id }</td>
			          <td>${cinema.cinema_name }</td>
			          <td>${cinema.cinema_area }</td>
			          <td><img src = "${cinema.cinema_image }"  width="200px" height= "200px"></td>
			          <td>${cinema.cinema_area_type }</td>
			          <td><a href = "/HumanCinema/cinema3/cinema_manager3.do?id=${cinema.cinema_id}">수정</a></td>
			          <td><a href = "/HumanCinema/cinema3/delCinema.do?id=${cinema.cinema_id}">삭제</a></td>
				
			        </tr>
       		  </c:forEach>
        	</c:when>
        </c:choose>
      </table>
</body>
</html>