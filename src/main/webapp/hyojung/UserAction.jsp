<%@ page language="java" contentType="text/html; charset=UTF-8"
     import=" java.util.*,hyojung.*"
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
<%-- !!!!!!!!!!!!!!파일 이동 시 변경해야 하는 주소!!!!!!!!!!!!!!!--%>
<jsp:useBean  id="m" class="hyojung.UserVO" />
<jsp:setProperty name="m" property="*"  />
<%
   UserDAO userDAO= new UserDAO();
	userDAO.addUser(m);
   List<UserVO> userList = userDAO.listUser();
   request.setAttribute("userList", userList);
%> 
</head>
<body>
<%-- !!!!!!!!!!!!!!파일 이동 시 변경해야 하는 주소!!!!!!!!!!!!!!!--%>
<jsp:forward  page="/HumanStudy/hyojung/UserList.jsp" />
</body>
</html>