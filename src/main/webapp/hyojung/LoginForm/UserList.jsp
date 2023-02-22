<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<body>
	<table align="center" border=”1” align="center" >
   <tr align="center" bgcolor="lightgreen" >
      <td width="7%" ><b>아이디</b></td>
      <td width="7%" ><b>비밀번호</b></td>
      <td width="7%" ><b>이름</b></td>
      <td width="7%"><b>이메일</b></td>
      <td width="7%" ><b>가입일</b></td>
   </tr>  
	<c:choose>
	<c:when test="${ userList==null}" >
	   <tr>
	    <td colspan=5>
	      <b>등록된 회원이 없습니다.</b>
	    </td>  
	  </tr>
	</c:when>  
	<c:when test="${userList!= null}" >
	  <c:forEach  var="user" items="${userList }" >
	   <tr align="center">
	     <td>${user.id }</td>
	     <td>${user.pwd}</td>
	     <td>${user.name}</td>     
	     <td>${user.email}</td>     
	     <td>${user.joinDate}</td>     
	   </tr>
	   </c:forEach>
	</c:when>
	</c:choose>
	</table>  
</body>
</html>