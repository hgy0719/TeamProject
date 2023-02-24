<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인관리자페이지</title>
    <style>
        body {
            text-align: center;
        }
        h1{
            font-size: 70px;
            margin-bottom: 100px;
        }
        .manager {
            
        }

        .manager div {
            display: inline-block;
            margin-left: 100px;
        }

        .manager a {
            text-decoration: none;
            color: black;
            font-size: 30px;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <h1>관리자페이지</h1>
    <div class="manager">
        <div><a href="">회원관리</a></div>
        <div><a href="../../movie1/movieManager.do">영화관리</a></div>
        <div><a href="">스토어관리</a></div>
        <div><a href="">이벤트관리</a></div>
    </div>
</body>
</html>