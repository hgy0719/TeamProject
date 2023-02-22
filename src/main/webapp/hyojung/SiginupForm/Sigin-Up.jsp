<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
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
        outline: none;
    }
    .inputSet{
        font-size: 15px;
        font-weight: 500;
        align-items: center;
        margin: 10px 0px;
        padding: 10px;
        padding-left: 20px;
        border: 1px solid lightgray;
        border-radius: 20px;
        text-align: left;
    }
    .check{
        font-size: 12px;
        border-radius: 50%;
        border: none;
        color: #fff;
        background: darkred;
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
        
         function fn_process(){
             var _id=$("#inputId").val();
             if(_id==''){
            	 return;
             }
             $.ajax({
                type:"post",
                async:true,  
                url:"http://localhost:8080/HumanStudy/user",
                dataType:"text",
                data: {id:_id},
                success:function (data,textStatus){
             	   //alert(data);
             	   
                   if(data=='usable'){
                	   $('#message').text("사용할 수 있는 ID입니다.");
                	   $('#check').prop("disabled", true);
                   }else{
                	   $('#message').text("사용할 수 없는 ID입니다.");
                   }
                },
                error:function(data,textStatus){
                   alert("에러가 발생했습니다.");ㅣ
                },
                complete:function(data,textStatus){
                   //alert("작업을완료 했습니다");
                }
             });  //end ajax	 
          }	

        function fn_process() {
                var inputId = document.getElementById("inputId").value;
                var inputPwd1 = document.getElementById("inputPwd1").value;
                var inputPwd2 = document.getElementById("inputPwd2").value;
                var inputName = document.getElementById("inputName").value;
                var inputNumber = document.getElementById("inputNumber").value;
                console.log(inputPwd2.value, inputPwd1.value, inputPwd2.value != inputPwd1.value)

                if (inputId.length == 0 || inputId == "") {
                    alert("아이디를 입력하세요.");
                    return false;

                }else if (inputPwd1.length == 0 || inputPwd1 == "") {
                    alert("비밀번호를 입력하세요.");
                    return false;

                }else if (inputPwd2!= inputPwd1) {
                    alert("비밀번호가 일치하지 않습니다.");
                    return false;

                }else if (inputName.length == 0 || inputName == "") {
                    alert("이름을 입력하세요.");
                    return false;

                }else if (inputNumber.length == 0 || inputNumber == "") {
                    alert("연락처를 입력하세요.");
                    return false;
                }else { 
                    alert("회원가입을 환영합니다.");
                    document.submit.submit(); 
                }
            }
        
        	
        
    </script>
</head>
<body>
<jsp:include page="/SiginupForm/Header.jsp"></jsp:include>
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
                <div class="sign-in">
                <h2>Human Cinema</h2>
                <form method="post" action="/HumanStudy/SiginupForm/UserAction.jsp">
                  <div class="join_login">
                     <div class="inputSet"><input id="inputId" type="text" name="id" placeholder="아이디를 입력하세요" maxlength="20" >
                     <button class="check">&#128504;</button></div>
                     <div id="message"></div>
                     <div class="inputSet"><input id="inputPwd1" type="password" name="pwd1" placeholder="비밀번호를 입력하세요" maxlength="20" ></div>
                     <div class="inputSet"><input id="inputPwd2" type="password" name="pwd2" placeholder="한번 더 입력하세요" maxlength="20" ></div>
                     <div class="inputSet"><input id="inputName" type="text" name="name" placeholder="이름을 입력하세요"></div>
                     <div class="inputSet"><input id="inputEmail" type="text" name="email" placeholder="이메일를 입력하세요"></div>
                 </div>
                 <button class="submit" onclick="fn_process()">회원가입</button><br>
                 <div class="footer_link"><a href="#">바로 로그인 하기 &#128153;</a></div>
                 </form>
               </div>
            </div>
        </div>
    </section>       
</body>
</html>