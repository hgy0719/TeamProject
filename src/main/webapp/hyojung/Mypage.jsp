<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지(회원정보)</title>
<style>
  * {margin: 0; padding: 0; box-sizing: border-box;}

  body {
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    color: #58666e;
    background-color: #f0f3f4;
    -webkit-font-smoothing: antialiased;
    -webkit-text-size-adjus: 100%;  /* iphone font size 변경 방지 */
  }
  li { list-style: none; }
  a { text-decoration: none; }
  h1, h2, h3, h4, h5, h6, p {margin: 10px 5px;}
  h1 { font-size: 1.8em; }

  #wrap {
    width: 100%;
    /* margin-top = header height */
    margin-top: 80px; /*상단 탭이랑 사이즈 잘 맞춰야함*/
  }

  /* Navigation bar */
  header {
    /* for sticky header */
    position: fixed;
    top: 0;
    width: 100%;
    height: 80px;
    z-index: 2000;
    background-color: #fff;
    box-shadow: 0 2px 2px rgba(0, 0, 0, 0.05), 0 1px 0 rgba(0, 0, 0, 0.05);
  }
  .logo {
    display: inline-block;
    height: 5px;
    margin: 12px 0 12px 25px;
  }
  .logo > img { height: 50px; }
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

  /* contents */
  /* clearfix */
  #content-wrap:after {
    content: "";
    display: block;
    clear: both;
  }
  aside {
    /* for fixed side bar */
    position: fixed;
    top: 60px;
    bottom: 0;
    width: 180px;  /* 너비 고정 */
    padding-top: 30px;
    background-color: #333;
  }
  /* aside navigation */
  aside > ul {width: 180px;}
  aside > ul > li > a {display: block; color: #fff; padding: 10px 0 10px 20px;}
  aside > ul > li > a.active {background-color: gold;}
  aside > ul > li > a:hover:not(.active) {background-color: #555;}
  aside > h1 {padding: 20px 0 20px 20px; color: #fff;}

  /* aside width */
  section {float: left; margin-left: 190px;}    
  article {margin: 10px; padding: 25px; background-color: white;}


  /* table */
  table {
    width: 700px;
    text-align: center;
    border: 1px solid #fff;
    border-spacing: 1px;
    font-family: 'Cairo', sans-serif;
    margin: auto;
    border: 1px solid black;
  }
  caption { font-weight: bold; }
  table td { padding: 10px; background-color: #eee; }
  table th {background-color: #333; color: #fff; padding: 10px; }
  img { width: 90px; height: 90px; }
  

  /* 아직 수정 중 백엔드 하고 다시 돌아올 예정 */
  
  #inputSet2{
    border: none;
    border-bottom: 1px solid darkred;
    margin: 10px 0px;
    width: 80%;
    overflow: hidden;
    background: transparent;
    font-weight: 550;
    font-size: 16px;
  }


  /*꼬리말*/
  footer{float: left;}

</style>
</head>
<body>
  <form>
<jsp:include page="/hyojung/Header.jsp"></jsp:include>
    <div id="content-wrap">
      <aside>
        <h1>My Page</h1>
        <ul>
          <li><a href="#a" class="active">회원정보</a></li>
          <li><a href="#b">예매내역</a></li>
          <li><a href="#c">문의내역</a></li>
        </ul>
      </aside>
    </div>
      <section>
        <article class="UserInformation">
          <table><h1>회원정보</h1></table>
         
           <form action=".do" method="dohandle" name="frm">
	        <table>
	            <tr>
	              <th rowspan="8"><img src="" alt="프로필사진"></td>
	            </tr>
	            <tr>
	              <td id="inputset1">아이디</td>
	              <td></td>
	            </tr>
	            <tr>
	              <td id="inputset1">비밀번호</td>
	              <td><input id="inputSet2" name="changePwd" typle="password"  size="40"></td>
	            </tr>
	            <tr>
	              <td id="inputset1">비밀번호 확인</td>
	              <td><input id="inputSet2" name="changePwd2" typle="password" size="40"></td>
	            </tr>
	            <tr>
	              <td id="inputset1">이름</td>
	              <td><input id="inputSet2" name="changeName"></td>
	            </tr>
	            <tr>
	              <td id="inputset1">전화번호</td>
	              <td><input id="inputSet2" name="number"></td>
	            </tr>
	            <tr>
	              <td id="inputset1">이메일</td>
	              <td><input id="inputSet2" name="email"></td>
	            </tr>
	            <tr>
	              <td colspan="2">
	                <input class="button" type="button" value="수정하기"/>
	                <input class="button" type="reset" value="다시쓰기"/>
	              </td>
	            </tr>
	          </table>
	          </form>
	          
	          	<form action="mypage.do">
					<br />
					<table>
					<tr>
					<td colspan="2">회원탈퇴</td>
					</tr>
					<tr>
						<td><input type="password" name="pwd"></td>
						<td ><input class="button" type="submit" value="입력"></td>
					</tr>			
					<input type="hidden" name="co_id" value="${loginUser}">
					</tr>
					</table>
				</form>
        </article>
        </section>
    
    </form>
</body>
</html>