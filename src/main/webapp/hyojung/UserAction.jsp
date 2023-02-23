<%@ page language="java" contentType="text/html; charset=UTF-8"
     import=" java.util.*,hyojeong.UserPage.*"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%>    
<html>
<head>
<meta charset="UTF-8">
<jsp:useBean  id="m" class="hyojeong.UserPage.UserVO" />
<jsp:setProperty name="m" property="*"  />
<%
   UserDAO userDAO= new UserDAO();
	userDAO.addUser(m);
   List<UserVO> userList = userDAO.listUser();
   request.setAttribute("userList", userList);
%> 
</head>
<body>
<jsp:forward  page="/HumanStudy/hyojung/UserList.jsp" />
</body>
</html>