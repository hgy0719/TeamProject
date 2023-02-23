package hyojeong;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//http://localhost:8080/HumanStudy/user 웹브라우저는 doGet
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
		String page = "/UserForm/Login.jsp"; 
		//다음에 내가 가야할 곳으로 보냄
		String action = request.getPathInfo();
		// /user/* 상단 들어온 주소 값을 결정함? '/*' 해당하는 action값
		
		//회원가입
		if (action==null|| action.equals("/new")) {
			UserService actSigin = new UserService();
			actSigin.serSigin();
			System.out.println("회원가입 출력");
			page = "/UserForm/SiginUp.jsp";
			
		//회원리스트 생성
		} else if (action.equals("/UserList")) {
			
			UserService actList = new UserService();
			List<UserVO> UserList = actList.serList();//회원정보 조회할 때 사용할 수 있음
			request.setAttribute("UserList", UserList);//조회한 정보를 request에 바인딩
			System.out.println("회원리스트 생성 출력");
			page ="/UserForm/LogIn.jsp";
			
			//로그인(mvc pattern2)
		}else if (action.equals("/Login")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			System.out.println(id + pwd);
			
			UserService servlog = new UserService();
			boolean result = servlog.servlog(id, pwd);
			System.out.println("return되어 최종 돌려받은 값:"+result);
			request.setAttribute(id, pwd);
			System.out.println(id+pwd);
			
			if( result ) {
				
//				if(action==true) {
//					String id = request.getParameter("id");
//					String pwd = request.getParameter("pwd");
//					String name = request.getParameter("name");
//					String email = request.getParameter("email");
//					MypageService mypage = new MypageService(id, pwd, name, email);
//					mypage.serPage()
//					
//				//회원 삭제(Mypage delete)
//				}else if(action==del)) {
//					String id = request.getParameter("id");
//					MypageDAO.delete(id);
//					request.setAttribute(", action)
//				}	
				
				page = "/UserForm/Mypage.jsp";
				System.out.println("로그인 성공");
			} else {
				page = "/UserForm/LogIn.jsp";
				System.out.println("로그인 실패");
			}
			System.out.println("로그인 출력");
		
		}
		
		RequestDispatcher dispatch = request.getRequestDispatcher(page);
		dispatch.forward(request, response);
		
//		//회원가입 중복확인(service를 거치지 않음)
//		PrintWriter writer = response.getWriter();
//		String id = (String) request.getParameter("id");
//		System.out.println("id = " + id);
//		UserDAO userDAO = new UserDAO();
//		boolean overlappedID = userDAO.overlappedID(id);
//		
//		//회원가입 중복확인에 대한 결과 메시지 전송
//			if (overlappedID == true) {
//				writer.print("not_usable");
//			} else {
//				writer.print("usable");
//			}
		
		
		
	}
}
