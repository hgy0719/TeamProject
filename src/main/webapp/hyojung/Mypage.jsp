<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지(회원정보)</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<style>
	#mypage(margin: 35px 0 50px 20px; }
	
	body {
	    background: #f5f5f5
	    /* font-family: 'Dongle', sans-serif; */
	    /* font-family: 'East Sea Dokdo', cursive; */
	    font-family:'Poor Story', cursive;
	    text-decoration: none;
	}
	
	table {
	  border: 1px #49443f solid;
	  font-size: .9em;
	  box-shadow: 0 2px 5px rgba(0,0,0,.25);
	  margin-left: auto;
	  margin-right: auto;
	  width: 850px;
	  border-collapse: collapse;
	  border-radius: 5px;
	  overflow: hidden;
	}
	th {
	    text-align: left;
	    letter-spacing: 1px;
	    font-size: large;
	    background-color: black;
	    opacity: 0.85;/* 투명도 */
	    color: white;
	}
	#inputset1{
	    outline: none;
	}
	input{
	    border: none;
	}
	
	 td, th {
	    padding: 15px 50px;
	    vertical-align: middle;
	}
	td {border-bottom: 1px solid rgba(0,0,0,.1);  background: #fff;}
	
	
	#btn input {
	width: 100%;
	height: 35px;
	border: 0;
	outline: none;
	border-radius: 10px;
	background: black;
	color: white;
	opacity: 0.85;/* 투명도 */
	letter-spacing: 1px;
	}

</style>
</head>
<body>
  <form>
<%-- !!!!!!!!!!!!!!파일 이동 시 변경해야 하는 주소!!!!!!!!!!!!!!!--%>
<jsp:include page="/hyojung/Header.jsp"></jsp:include>
    <div id="content-wrap">
      <aside id="mypage"><h1>마이페이지</h1></aside>
            </div>
              <section>
                <article class="UserInformation">
                   <form method="post" action="  ${contextPath}/user/update?id=${result.id}" >
                        <table>
                            <th colspan="3">회원정보</th>
                            <tr>
                                <td id="inputset1">아이디</td>
                                <td><input id="inputset2" name="changeId" value='${result.id}' disabled></td>
                                <td id="btn"><input class="btnSlide" type="submit" value="수정하기" ></td> 
                            </tr>
                            <tr>
                                <td id="inputset1">비밀번호</td>
                                <td><input id="inputSet2" name="changePwd" type="password" size="40" value='${result.pwd1}' placeholder="비밀번호를 입력하세요"></td>
                                <td id="btn"><input class="btnSlide" type="reset" value="다시입력" ></td>
                            </tr>
                            <tr>
                                <td id="inputset1">비밀번호 확인</td>
                                <td colspan="2"><input id="inputSet2" name="changePwd2" type="password" size="40" value='${result.pwd2}'placeholder="다시 한번 입력하세요"></td>
                            </tr>
                            <tr>
                                <td id="inputset1">이름</td>
                                <td colspan="2"><input id="inputSet2" name="changeName" value='${result.name}'></td>
                            </tr>
                            <tr>
                                <td id="inputset1">이메일</td>
                                <td colspan="2"><input id="inputSet2" name="email" value='${result.email}'></td>
                            </tr>
                      </table>
                    </form>
<%-- !!!!!!!!!!!!!!파일 이동 시 변경해야 하는 주소!!!!!!!!!!!!!!!--%>
	         		<form action="/HumanCinema/user/del">
                        <table>
                        <th colspan="2">회원탈퇴</th>
                        <tr>
                            <td><input type="password" name="pwd" placeholder="비밀번호를 입력하세요"></td>
                            <td id="btn"><input class="button" type="submit" value="입력"></td>
                        </tr>
                        </table>
                    </form>
                </article>
              </section>
            </form>
        </article>
        </section>
    </form>
</body>
</html>