<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
.bt_wrap {
    margin-top: 30px;
    text-align: center;
    font-size: 0;
   
}
.bt_wrap a {
    display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid rgb(122, 115, 115);
    border-radius: 2px;
    font-size: 1.4rem;
    position: relative;
    top: 30px;
}
.bt_wrap a:first-child{
    margin-left: 0;
}


.board_list{
    width: 100%;
    
    
}
.board_list > div{
   
    font-size: 20px;

}

.board_list > div.top {
    border-bottom: 2px solid #999;
}

.board_list > div > div {
    display: inline-block;
    padding: 15px 0;
    text-align: center;
    font-size: 1.7rem;
}
.board_list > div.top > div {
    font-weight: 740;
}
.board_list .num{
    width: 10%;
}
.board_list .division{
    width: 10%;
}
.board_list .title{
    width: 70%;
    text-align: center;
}
.board_list .top .title{
    text-align: center;
}
.board_list .content{
    display: block;
    width: 100%;
    height: 300px;
    padding: 15px;
    box-sizing: border-box;
    border: solid 1px;
    resize: vertical;
    text-align: left;
}

.board_list_wrap{
	height: 450px;

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
	<div class="QnA"><a href="/team/board/qna.do">QnA</a></div>
	<div class="공지사항"><a href="/team/board">공지사항</a></div>
	
</div>
<div class="board_list_wrap">
         <div class="board_list">
             <div class="top">
                 <div class="num">작성자</div>
                 <div class="division">NO</div>
                 <div class="title">제목</div>
                 
             </div>
         
<div class="con">
<div class="num"> ${ vo.id }</div>

<div class="division">${ vo.articleNO }</div>

<div class="title"> ${ vo.title }</div>


</div>
<div class="content">${ vo.content } </div> 

<div class="bt_wrap">
	<a href="/team/board" class="on">목록</a>
	<a href="/team/board01/replyForm.jsp?parentNO=${ vo.articleNO }"> 답글달기 </a>
	<a href="/team/board01/update.jsp?articleNO=${ vo.articleNO }&id=${vo.id}&parentNO=${vo.parentNO }&title=${vo.title}&content=${vo.content}">수정</a>
	<a href="/team/board/delMember.do?articleNO=${ vo.articleNO }">삭제</a>
	
</div>
</div>	
</div>
</div>

</body>
</html>