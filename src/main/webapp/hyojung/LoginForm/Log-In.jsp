<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
    * {top: 0; margin: 0; box-sizing: border-box;}
    a { text-decoration: none; }
    li { list-style: none; }
    /* h1, h2, h3, h4, h5, h6, p {margin: 10px 5px;} */
    /* h1 { font-size: 1.8em; } */

    body {
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        color: #58666e;
        background-color: #f0f3f4;
        -webkit-font-smoothing: antialiased;
        -webkit-text-size-adjus: 100%;  
    }

    .wrap {
        width: 100%; 
        margin-top: 80px;
        position:relative;
        /* background:url() no-repeat center; */
    }
    
    header {
        width: 100%;
        height: 80px;
        z-index: 2000;
        position: fixed;/*z-index 값으로 fixed*/
        background-color: #fff;
        /* box-shadow: 0 2px 2px rgba(0, 0, 0, 0.05),
                       0 1px 0 rgba(0, 0, 0, 0.05); */
    }
    .logo {
      display: inline-block;
      height: 5px;
      margin: 12px 0 12px 25px;}
    .logo > img { height: 50px;}
    nav {
    display: flex;
    justify-content: space-around;
    }
    .nav-items {margin-right: 20px;}
    .nav-items > li {display: inline-block;}
    .nav-items > li > a {
      /* for Vertical Centering */
      line-height: 80px;
      padding: 0 30px;
      color: rgb(0, 0, 0);}
    .nav-items > li > a:hover {color: gold;}

    .login {
        height: 100vh;
        width: 100%;
        background: radial-gradient(red, black);
        position: relative;
    }
    .login_box {
        width: 900px;
        height: 600px;
        position: absolute;
        top: 45%;
        left: 50%;
        transform: translate(-50%,-50%);/*Horizontal alignment*/
        background: #fff;
        border-radius: 5px;
        box-shadow: 1px 4px 22px -8px rgb(147, 146, 146);
        display: flex;
        overflow: hidden;}
        
    .login_box .left_img{width: 60%; height: 100%;}
    .login_box .right_login{width: 65%; height: 100%; padding: 25px 25px;}
    
    
    .right_login .top_link a{color: darkred; font-weight: 400;}
    .right_login .top_link{height: 20px; }

    .footer_link a{color: black; font-weight: 500;}
    .footer_link{text-align: center;}
   
    .right_login .sign-in{
        display: flex;
        align-items: center;
        justify-content: center;
        align-self: center;
        height: 100%;
        width: 80%;
        flex-direction: column;
        margin: auto;
    }
    .right_login h2{
        text-align: center; 
        margin-bottom: 50px;
    }
    .right_login input {
        border: none;
        border-bottom: 1px solid darkred;
        margin: 15px 0px;
        padding: 10px 10px;
        width: 100%;
        overflow: hidden;
        background: transparent;
        font-weight: 600;
        font-size: 17px;
    }
    .right{background: linear-gradient(-45deg, #dcd7e0, #fff);}

    .submit {
        margin: auto;
        margin-top: 30px;
        padding: 15px 120px;
        width: 100%;
        border: none;
        border-radius: 15px;
        display: block;
        font-weight: 600;
        font-size: 17px;
        color: #fff;
        background: darkred;
        -webkit-box-shadow: 0px 9px 15px -11px rgb(114, 54, 54);
        -moz-box-shadow: 0px 9px 15px -11px rgb(114, 54, 54);
        box-shadow: 0px 9px 15px -11px rgb(114, 54, 54);
    }
    .left_img {
        background: linear-gradient(212.38deg, /*각도*/
        rgba(121, 13, 13, 0.7) 0%,
        rgba(8, 7, 8, 0.71) 50%);
        background-color: black;
        color: #fff;
        position: relative;
        background-size: 100%;
    }
    section {display: flex; overflow: hidden;}
    img{width: 100%;}
    </style>
    <script>
        window.onload = function(){
            init();
            bind();
        }   
            function init(){    }
            function bind(){

            function fnSlide() {
                $(".slider").animate({ "margin-left": "0px" }, 3000, function () {
                    $(".slider").css({ "margin-left": "0px" });
                    $("img:first-child").insertAfter("img:last-child");
                });
            };
            setInterval(fnSlide, 3000);
        }
       
        function fn_loginMember(){

            var inputId = document.getElementById("inputId").value;
            var inputPwd = document.getElementById("inputPwd").value;
            var submit = document.getElementById("submit");
            // var login_findPw = document.getElementById('login_findPw');
            // var login_findid = document.getElementById('login_findid');

            // login_btn.addEventListener('click',(fn_loginMember))
            console.log(submit);

            if (inputId.length == 0 || inputId == "") {
                alert("아이디를 입력하세요.");
                return false;

            }else if (inputPwd.length == 0 || inputPwd == "") {
                alert("비밀번호를 입력하세요.");
                return false;

            }else if (inputId == "admin" && inputPwd == '0000') {
                alert("로그인 되었습니다.")
            } else {
                alert("아이디와 비밀번호를 다시 확인해주세요.")
            }
        } 
    </script>
</head>
<body>
<div class="wrap">
    <header>
        <nav id="nav">
        <ul class="nav-items">
            <li><a href="#">영화</a></li>
            <li><a href="#">예매</a></li>
            <li><a href="#">극장</a></li>
            <a class="logo" href="#home">로고</a>
            <li><a href="#">스토어</a></li>
            <li><a href="#">고객센터</a></li>
            <li><a href="#">로그인</a></li>
        </ul></nav>
    </header></div>
    <section class="login">
        <div class="login_box">
            <div class="left_img">
                <div class="slider">
                    <img id="mainImage" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86799/86799_1000.jpg">
                    <img id="mainImage" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86756/86756_1000.jpg">
                    <img id="mainImage" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86072/86072_1000.jpg">
                    <img id="mainImage" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86796/86796_1000.jpg">
                    <img id="mainImage" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86829/86829_1000.jpg">
                    <img id="mainImage" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86701/86701_1000.jpg">
                    <img id="mainImage" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86800/86800_1000.jpg">
                    <img id="mainImage" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86748/86748_1000.jpg">
                    <img id="mainImage" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86793/86793_1000.jpg">
                    <img id="mainImage" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86797/86797_1000.jpg">
                    <img id="mainImage" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000086/86341/86341_1000.jpg">
                </div>
            </div>
            <div class="right_login">
                <div class="top_link">
                <a href="#">Return home</a></div>
                <div class="sign-in">
                <h2>Human Cinema</h2>
                <form action="">
                <input id="inputId" type="text" placeholder="아이디를 입력하세요" maxlength="20">
                <input id="inputPwd" type="password" placeholder="비밀번호를 입력하세요" maxlength="20">
                <button class="submit">로그인</button><br>
                <div class="footer_link"><a href="http://localhost:8080/HomePage/Sign-Up.jsp">회원가입 하고 싶어요&#128155;</a></div>
                <!-- <img src="경로" alt="" class="btn" onclick="clickBtn(); /> -->
                </form></div>
            </div>
        </div>
    </section>  
</body>
</html>