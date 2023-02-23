<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상단바jsp</title>
<style>
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
</style>
</head>
<body>
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
                <img src="logo2.png">
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
</body>
</html>