<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>��ܹ�jsp</title>
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
                ��ȭ
            </div>
            <div>
                ����
            </div>
            <div>
                ����
            </div>
            <div id="logo_human">
                <img src="logo2.png">
            </div>
            <div>
                �����
            </div>
            <div>
                �̺�Ʈ
            </div>
            <div>
                ������
            </div>
        </div>
        <div class="login_signup">
            <div>
                �α���
            </div>
            <div>
                ȸ������
            </div>
        </div>
    </header>
</body>
</html>