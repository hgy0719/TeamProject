<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"    
    isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예매탭</title>
    <style>
    	
        
/* 상단바 */
        header{
            margin-top: 30px;
        }
        .header_list {
            background-color: black;
            display: flex;
            justify-content: space-around;
            text-align: center;
            height: 100px;
        }
        .header_list >div{
            width: 100px;
            line-height: 100px;
            font-weight: 600;
            color: white;
            font-size: 20px;
        }
        #logo_human{
            width: 150px;
            height: 100px;
        }
        #logo_human > img{
            width: 150px;
            height: 100px;
        }
        .login_signup {
            margin-top: 10px;
            display: flex;
            justify-content: flex-end;
                       
        }
        .login_signup div{
            margin-left: 20px;
            font-weight: 600;

        }


        /* 선택상자 */
        .box{
            border: 1px solid red;
            height: 700px;
            margin-top : 30px;
        }
        .select_box{
            border:1px solid red;
            height: 600px;
            font-size: 0;
        }
        .btn0{
            height: 100%;
        }
        .select_box > div{
            display: inline-block;
            font-size: 20px;
            height: 100%;
            vertical-align:top;
        }
        .movie {
            width: 25%;
            
            background-color: lightblue;
        }
        .theater{
            width: 35%;
           
            background-color: lightgray;
        }
        .date {
            width: 10%;
            background-color: lightgreen;
        }
        .time{
            width: 30%;
            background-color: lightyellow;
        }
    </style>
</head>
<body>
    <div class="wrap">
        <!-- 상단바 -->
        <header>
            <div class="header_list">
                <div>
                    영화
                </div>
                <div>
                    예매
                </div>
                <div>
                    극장
                </div>
                <div id="logo_human">
                    <img src="../changsoon/image/logo.png">
                </div>
                <div>
                    스토어
                </div>
                <div>
                    이벤트
                </div>
                <div>
                    고객센터
                </div>
            </div>
            <div class="login_signup">
                <div>
                    로그인
                </div>
                <div>
                    회원가입
                </div>
            </div>
        </header>
        <!-- 선택상자 -->
        <div class="box">
            <div class="select_box">
                <div class="movie">
                    <c:forEach var="movie" items="${movieList }" varStatus="status">
                    	<div>${movie.title }</div>
                    </c:forEach>
                </div>
                <div class="theater">
                    <c:forEach var="listTheater" items="${listTheater }" varStatus="status">
                    	<div>${listTheater.theater_name }</div>
                    </c:forEach>
                </div>
                <div class="date">
                    날짜
                </div>
                <div class="time">
                    시간
                </div>
            </div>
            <div class="btn0">
                좌석선택 버튼
            </div>
        </div>
        
    </div>
</body>
</html>