<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
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


<a href="/pro17/board01/articleForm.jsp">글쓰기</a>
<table border=1>
<c:forEach var="vo" items="${ articlesList}">
<tr>
	<td>
		${vo.level }
	</td>
	<td style="padding-left: ${(vo.level-1) * 20 }px">
		<a href="/pro17/board/viewArticle.do?articleNO=${vo.articleNO }">${vo.title }</a>
	</td>
	<td>
		${vo.content }
	</td>
</tr>
</c:forEach>
</table>
<%
	int totalCount = (int)request.getAttribute("totalCount");
	int pageNum = (int)request.getAttribute("pageNum");
	int countPerPage = (int)request.getAttribute("countPerPage");
	// int / int = int
	// double / int = double
	int lastPage = (int)Math.ceil( (double)totalCount / countPerPage);
	int section = 3;
	
	int sec_position = ( ((int) Math.ceil( (double)pageNum / section )) -1 );
	int firstSec = ( sec_position * section ) + 1;
	int lastSec = firstSec + section - 1;
	if(lastSec > lastPage){
		lastSec = lastPage;
	}
%>
<c:set var="pageNum2" value="<%= pageNum %>" />
<div>

<c:if test="<%= firstSec != 1 %>">
	[<a href="/pro17/page?pageNum=<%= firstSec-1 %>">이전</a>] 
</c:if>

<c:forEach var="i" begin="<%= firstSec %>" end="<%= lastSec %>" >
	<c:if test="${ i == pageNum2 }">
		[<a href="/pro17/page?pageNum=${i }"><strong>${i}</strong></a>] 
	</c:if>
	<c:if test="${ i != pageNum2 }">
		[<a href="/pro17/page?pageNum=${i }">${i}</a>] 
	</c:if>
</c:forEach>

<c:if test="<%= lastSec != lastPage %>">
	[<a href="/pro17/page?pageNum=<%= lastSec+1 %>">다음</a>]
</c:if>

</div>
<%--
<hr>
totalCount : ${totalCount}<br>
pageNum : ${pageNum}<br>
countPerPage : ${countPerPage}<br>
마지막 페이지 번호 : totalCount / countPerPage : ${totalCount / countPerPage}<br>
한 섹션당 표시할 페이지 수 : 3<br>
<br>
만약 지금 페이지가 5번이면<br>
5/3 = 1.6666<br>
floor(5/3) = 1<br>
ceil(5/3) = 2<br>
<br>
섹션의 처음 값 : 1*3 + 1 : 4<br>
섹션의 마지막 값 : 2*3 : 6<br>
<br>
<br>
만약 지금 페이지가 7번이면<br>
7/3 = 2.3333<br>
floor(7/3) = 2<br>
ceil(7/3) = 3<br>
<br>
섹션의 처음 값 : 2*3 + 1 : 7<br>
섹션의 마지막 값 : 3*3 : 9<br>
단, 9가 마지막 페이지 번호보다 큰 경우 섹션의 마지막 값은 마지막 페이지 번호로 한다
<hr>
 --%>
</body>
</html>
















