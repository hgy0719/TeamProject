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
        
    .login_box .left_img{width: 600px ; height: 900px;}
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
     #mainImage{width: 100%;}

    
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
                $(".slider img:first-child").insertAfter(".slider img:last-child");
            });
        };
        setInterval(fnSlide, 3000);
    }
        
         function fn_process(){
             var _id=$("#inputId").val();
             //입력한 아이디 값을 가져와서
             if(_id==''){
            	 alert("아이디를 입력하세요.")
            //입력이 없으면 리턴
            	 return;
             }
             $.ajax({
	                type:"post",
	                async:true,  
	<%-- !!!!!!!!!!!!!!파일 이동 시 변경해야 하는 주소!!!!!!!!!!!!!!!--%>
	                url:"http://localhost:8080/HumanStudy/user/new",
	                dataType:"text",
	                data: {id:_id},
	                //아이디를 서블릿에 전송한다.
	                success:function (data,textStatus){
	             	   alert(data);
	             	   
	                   if(data=='usable'){
	                	   $('#message').text("사용할 수 있는 ID입니다.");
	                	   $('#idcheck').prop("disabled", true);
	                   }else{
	                	   $('#message').text("사용할 수 없는 ID입니다.");
	                   }
	                },
	                error:function(data,textStatus){
	                   alert("에러가 발생했습니다.");ㅣ
	                },
	                complete:function(data,textStatus){
	                   alert("환영합니다.");
	                }
             });  //end ajax	 
          }	

    </script>
</head>
<body>
<%-- !!!!!!!!!!!!!!파일 이동 시 변경해야 하는 주소!!!!!!!!!!!!!!!--%>
<jsp:include page="/hyojung/Header.jsp"></jsp:include>
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
<%-- !!!!!!!!!!!!!!파일 이동 시 변경해야 하는 주소!!!!!!!!!!!!!!!--%>
							<%-- if문이 작동하도록 nextpage 주소를 입력한다. --%>
                <form method="post" action="/HumanStudy/user/new">
                  <div class="join_login">
                     <div class="inputSet"><input id="inputId" type="text" name="id" placeholder="아이디를 입력하세요" maxlength="20" >
                     <button class="check"  id="idcheck" onclick="fn_process()">중복체크</button></div>
                     <div id="message"></div>
                     <div class="inputSet"><input id="inputPwd1" type="password" name="pwd1" placeholder="비밀번호를 입력하세요" maxlength="20" ></div>
                     <div class="inputSet"><input id="inputPwd2" type="password" name="pwd2" placeholder="한번 더 입력하세요" maxlength="20" ></div>
                     <div class="inputSet"><input id="inputName" type="text" name="name" placeholder="이름을 입력하세요"></div>
                     <div class="inputSet"><input id="inputEmail" type="text" name="email" placeholder="이메일를 입력하세요"></div>
                 </div>
                 <input type="button" class="submit"  value="회원가입" ><br>
<%-- !!!!!!!!!!!!!!파일 이동 시 변경해야 하는 주소!!!!!!!!!!!!!!!--%>
                 <div class="footer_link"><a href="/HumanStudy/hyojung/LogIn.jsp">바로 로그인 하기 &#128153;</a></div>
                 </form>
               </div>
            </div>
        </div>
    </section>       
</body>
</html>