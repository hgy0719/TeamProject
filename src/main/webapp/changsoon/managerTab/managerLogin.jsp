<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자페이지 로그인</title>
    <script>
        window.onload = () => {
            document.querySelector("#btn").addEventListener("click", function(){
                let id = document.querySelector("#id").value;
                let pwd = document.querySelector("#pwd").value;

                if(id=="admin" && pwd =="admin"){
                    alert(id+" 계정으로 로그인합니다.");
                    location.href="../managerTab/managerSelect.jsp";
                } else {
                    alert("계정정보를 확인해주세요.");
                }
            })
        }

    </script>
    <style>
        body {
            text-align: center;
        }
        .wrap{
            margin-top: 200px;
            height: 400px;
        }
    </style>
</head>
<body>
    <div class="wrap">
        <h1>관리자 페이지 로그인</h1>
        아이디 : <input id="id" type="text" placeholder="아이디를 입력하세요">
        비밀번호 : <input id="pwd" type="text" placeholder="비밀번호를 입력하세요">
        <input id="btn" type="button" value="로그인">
    </div>
</body>
</html>