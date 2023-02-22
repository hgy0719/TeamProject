package UserPage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import test.TestService;

//http://localhost:8080/HumanStudy/user 웹브라우저는 doGet
@WebServlet("/user")
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
		
		//회원가입
		UserService actSigin = new UserService();
		actSigin.serSigin();
		
		//회원리스트 생성
		//List<UserVO> UserList = List.??();//회원정보 조회할 때 사용할 수 있음
		//request.setAttribute("userList", UserList);//조회한 정보를 request에 바인딩
		RequestDispatcher dispatchA = request.getRequestDispatcher("/HumanStudy/SiginupForm/Sigin-up.jsp");
		dispatchA.forward(request, response); //jsp로 포워딩
		
		//회원가입 중복확인(service를 거치지 않음)
		PrintWriter writer = response.getWriter();
		String id = (String) request.getParameter("id");
		System.out.println("id = " + id);
		UserDAO userDAO = new UserDAO();
		boolean overlappedID = userDAO.overlappedID(id);
		//회원가입 중복확인에 대한 결과 메시지 전송
		if (overlappedID == true) {
			writer.print("not_usable");
		} else {
			writer.print("usable");
		}
				
		//로그인(mvc pattern2)
		String actlogin = request.getParameter("logkey");
		UserService logServ = new UserService();
		boolean result = logServ.servlog(actlogin);
		System.out.println("return되어 최종 돌려받은 값:"+result);
		
		request.setAttribute("logkey", result);
		String page = "";
		if(result) {
			page = "메인.jsp";
		} else {
			page = "다시로그인.jsp";
		}
		RequestDispatcher dispatchB = request.getRequestDispatcher(page);
		dispatchB.forward(request, response);
		
		
		
		
				
	}
}
