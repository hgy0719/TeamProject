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
.bt_wrap{
    margin-top: 30px;
    text-align: center;
    font-size: 0;
}
.bt_wrap a{
    display: inline-block;
    width: 60px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid rgb(122, 115, 115);
    border-radius: 2px;
    font-size: 1.4rem;
 
    
}
.bt_wrap input{
	display: inline-block;
    min-width: 80px;
    margin-left: 10px;
    padding: 10px;
    border: 1px solid rgb(122, 115, 115);
    border-radius: 2px;
    font-size: 1.4rem;
    cursor:pointer;
    background:white;
    
}
.bt_wrap a:first-child{
    margin-left: 0;
}

.board_write{
    border-top: 2px solid #000;
}
.board_write .title,
.board_write .info{
    padding: 15px;
}
.board_write .info{
    border-top: 1px dashed #ddd;
    border-bottom:  1px solid #000;
    font-size: 0;
}
.board_write .title dl{
    font-size: 0;
}
.board_write .info dl{
    display: inline-block;
    width: 50%;
    vertical-align: middle;
}
.board_write .title dt,
.board_write .title dd,
.board_write .info dt,
.board_write .info dd{
    display: inline-block;
    vertical-align: middle;
    font-size:  1.4rem;
}
.board_write .title dt,
.board_write .info dt{
    width: 100px;
}
.board_write .title dd{
    width: calc(100% - 100px);
}
.board_write .title input[type="text"],
.board_write .info input[type="text"]{
    padding: 10px;
    box-sizing: border-box;
}
.board_write .title input[type="text"]{
    width: 80%;
}
.board_write .cont{
    border-bottom: 1px solid;
}

.board_write .cont textarea {
    display: block;
    width: 100%;
    height: 300px;
    padding: 15px;
    box-sizing: border-box;
    border: solid 1px;
    resize: vertical;
    
  
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
</div>
<!--  답글쓰기 jsp 구현 -->
<form method="post" action="/team/board/addReply.do">
<div class="board_write_wrap">
<div class="board_write">
<div class="title">

<div class="info">
<dl>
<dt>WriterID</dt> 
<dd><input type="text" name="id" placeholder="ID 입력"></dd>
</dl>

<dl>
<dt>Title</dt>
<dd><input type="text" name="title" placeholder="제목입력"><dd>
</dl>
</div>
<div class="cont">
	<dt>Contents</dt>
	<textarea name="content"></textarea>
	<br>
	</div>
	</div>
</div>
</div>



	<input type="hidden" name="parentNO" value="${ param.parentNO }">
	<div class="bt_wrap">
	<a href="/team/board" class="on">목록</a>
	<input type="submit" value="등록">


</div>

</form>
</div>
	
</body>
</html>