package hyojung;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//http://localhost:8080/HumanCinema/user 웹브라우저는 doGet
@WebServlet("/user/*")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO; //이것의 역할이 무엇인지 질문하기
	
    public void init() throws ServletException {
    	//userDAO = new UserDAO(); //userDAO 생성
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserController doget 호출");
		doHandle(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserController dopost 호출");
		doHandle(request, response);
	}
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("UserController doHandle 호출");
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
//<%-- !!!!!!!!!!!!!!파일 이동 시 변경해야 하는 주소!!!!!!!!!!!!!!!--%>
		String page = "/hyojung/Login.jsp"; 
		//다음에 내가 가야할 곳으로 보냄
		String action = request.getPathInfo();
		System.out.println("action : " + action);
		// /user/* 상단 들어온 주소 값을 결정함? '/*' 해당하는 action값
		
		//회원가입
		if (action==null|| action.equals("/new")) {
			System.out.println("회원가입 출력");
			String id = request.getParameter("id");
			String pwd1 = request.getParameter("pwd1");
			String pwd2 = request.getParameter("pwd2");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			System.out.println(id+"/"+pwd1+"/"+name+"/"+email);
			
				if(pwd1.equals(pwd2)) {
					UserService actSign = new UserService();
					UserVO m = new UserVO();
					m.setId(id);
					m.setPwd(pwd1);
					m.setName(name);
					m.setEmail(email);
					actSign.serSign(m);
	
					page ="/hyojung/LogIn.jsp";
				} else {
	//				request.setAttribute("message:", value);
					page ="/hyojung/SignUp.jsp";
				}

		//회원 중복확인
		}else if(action.equals("/check")) {
			String id = (String) request.getParameter("id");
			System.out.println("id = " + id);
			UserService nameCheck = new UserService();
			boolean overlappedID = nameCheck.setCheck(id);
			
			//회원 중복확인에 대한 결과 메시지 전송
			PrintWriter writer = response.getWriter();
				if (overlappedID == true) {
					writer.print("not_usable");
				} else {
					writer.print("usable");
				}
				
		//회원리스트 생성
		} else if (action.equals("/userlist")) {
			UserService actList = new UserService();
			List<UserVO> UserList = actList.serList();//회원정보 조회할 때 사용할 수 있음
			request.setAttribute("UserList", UserList);//조회한 정보를 request에 바인딩
			System.out.println("회원리스트 생성 출력");
//<%-- !!!!!!!!!!!!!!파일 이동 시 변경해야 하는 주소!!!!!!!!!!!!!!!--%>
			page ="/hyojung/LogIn.jsp";
			
		//로그인
		}else if (action.equals("/login")) {
				HttpSession session = request.getSession();
				System.out.println("session:" +session.getAttribute("id"));
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				System.out.println(id + pwd);
				
				UserService servlog = new UserService();
				boolean result = servlog.servlog(id, pwd);
				System.out.println("return되어 최종 돌려받은 값:"+result);
				System.out.println(id+pwd);
				
				if( result ) {
						session.setAttribute("id",id);
	//<%-- !!!!!!!!!!!!!!파일 이동 시 변경해야 하는 주소!!!!!!!!!!!!!!!--%>
						//창순씨 메인페이지 주소로 이동해야함.
						page = "/hyojung/Mypage.jsp";
						//
						System.out.println("session:"+session);
	
				} else {
	//<%-- !!!!!!!!!!!!!!파일 이동 시 변경해야 하는 주소!!!!!!!!!!!!!!!--%>
					page = "/hyojung/LogIn.jsp";
					System.out.println("로그인 실패");
				}
				System.out.println("로그인 출력");
			
		//마이페이지 내 정보 출력
		} else if (action.equals("/mypage")){
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			System.out.println("session id값:" +id);
					if(id!=null) {
						UserService mypage = new UserService();
						UserVO result = mypage.serPage(id);
						request.setAttribute("result", result);
						System.out.println(result);					
						
						page="/hyojung/Mypage.jsp";
					} else {
						System.out.println("session id값이 없습니다.");
						page="/hyojung/LogIn.jsp";
					}
		
		//마이페이지 내 정보 수정
		} else if (action.equals("/update")) {
			System.out.println("회원정보수정 출력");
		
			UserService actupdate = new UserService();
			String id = request.getParameter("id");
			String pwd1 = request.getParameter("pwd1");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			System.out.println("update getParam:"+id+"/"+pwd1+"/"+"/"+name+"/"+email);
			
			String pwd2 = request.getParameter("pwd2");
			if(pwd1.equals(pwd2)) {
				UserVO vo = new UserVO();
				vo.setId(id);
				vo.setPwd(pwd1);
				vo.setName(name);
				vo.setEmail(email);
				actupdate.serUpdate(vo);
				page="/hyojung/Mypage.jsp";
				}
				
		//회원탈퇴
 		}else if(action.equals("/delete")){
 				String delid = request.getParameter("id");
				//delid.serDel();
				page="/hyojung/Mypage.jsp";
			
 		}
	
		
		if(!action.equals("/check")) {
			RequestDispatcher dispatch = request.getRequestDispatcher(page);
			dispatch.forward(request, response);
		}
		

//창순씨 로그인 구현
////	로그인 세션
//	HttpSession session = request.getSession();
////	request.getParameter("")에 id 전달하는 name값
//	String id = request.getParameter("");
////	request.getParameter("")에 pwd 전달하는 name값
//	String pwd = request.getParameter("");
//	
//	if(session.isNew()) {
//		if(id != null) {
//			session.setAttribute("id", pwd);
//		} else {
//			session.invalidate();
//		}
//	} else {
//		id = (String) session.getAttribute("");
//		if(id != null && id.length() != 0) {
//			System.out.println("로그인성공");
//		} else {
//			session.invalidate();
//		}
//	}

		
		
		
	}
}
