<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<style>
* {
    margin: 0;
    padding: 0;
}
html{
    font-size: 10px;
}
ul, li {
    list-style: none;
}


a {
    text-decoration: none;
    color: inherit;
}
.board_wrap{
    width: 1000px;
    margin: 100px auto;
    font-size: 20px;
    
    
}
.board_title{
    margin-bottom: 50px;
   
}
.board_title strong{
    font-size: 3rem;
    border-bottom: 2px solid rgb(20, 20, 20);
   
}
.board_title{
    width: 100%;
    border-top: 2px solid #000;
}
.board_title > div{
    border-bottom: 2px solid #ddd;
    font-size: 20px;
    

}
.board_title > div.top1 {
    border-bottom: 2px solid #999;
}
.board_title > div:last-child {
    border-bottom: 1px solid #000;
}
.board_title > div > div {
    display: inline-block;
    margin-top: 18px;
    height: 50px;
    text-align: center;
    font-size: 2.5rem;
}
.board_title > div.top1 > div {
    font-weight: 740;
    
    
}
.board_title .FAQ{
    width: 100px;
   
}
.board_title .공지사항{
    width: 350px;
    
}
.bt_wrap{
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}
.bt_wrap a{
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid rgb(122, 115, 115);
    border-radius: 2px;
    font-size: 1.4rem;
}
.bt_wrap a:first-child{
    margin-left: 0;
}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="board_wrap">
<a href="#">고객센터</a><br>
<div class="board_title">
	<div class="top1">
	<div class="QnA"><a href="/team/board">QnA</a></div>
	<div class="공지사항"><a href="/team/board">공지사항</a></div>
	
</div>

<a href ="team/board01/articleForm.jsp"> Writing </a>
<table border=1>
<c:forEach var="vo" items="${ articlesList }">
<tr>
	<td>
		${ vo.level }
	</td>
	<td style="padding-left: ${(vo.level-1)*20 }px">
		<a href="/team/board/viewArticle.do?articleNO=${ vo.articleNO }">${vo.title}</a>	
	</td> 
	<td>
		${vo.content}
	</td>
</tr>
</c:forEach>		
</table>

<!--  페이징 구현하기 jsp -->
<%
	int totalCount = (int)request.getAttribute("totalCount");
	int pageNum = (int)request.getAttribute("pageNum");
	int countPerPage = (int)request.getAttribute("countPerPage");
	
	int lastPage = (int)Math.ceil( (double)totalCount / countPerPage);
	int section = 3;
	
	int sec_position = ( ( (int)Math.ceil((double)pageNum / section )) -1 );
	int firstSec = ( sec_position * section ) +1;
	int lastSec = firstSec + section -1;
	
	if(lastSec > lastPage){
		lastSec = lastPage;
	}
%>

<c:set var="pageNum2" value="<%= pageNum %>" />
<div>
<c:if test="<%= firstSec != 1 %>">
	<a href="/team/page?pageNum=<%= firstSec-1 %>">Turn</a>
</c:if>

<c:forEach var="i" begin="<%= firstSec %>" end="<%= lastSec %>" >
	<c:if test="${ i == pageNum2 }">
		[<a href="/team/page?pageNum=${i }"><strong>${i}</strong></a>] 
	</c:if>
	<c:if test="${ i != pageNum2 }">
		[<a href="/team/page?pageNum=${i }">${i}</a>] 
	</c:if>
</c:forEach>

<c:if test="<%= lastSec != lastPage %>">
	[<a href="/team/page?pageNum=<%= lastSec+1 %>"> Next </a>]
</c:if>
		

</div>
<div class="bt_wrap">
	<a href="/HumanCinema/board" class="on">목록</a>
	<a href="/team/board01/articleForm.jsp ">등록</a>
</body>
</html>