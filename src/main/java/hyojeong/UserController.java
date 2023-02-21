package hyojeong;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/user.do")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO userDAO;
	
    public void init() throws ServletException {
    	userDAO = new UserDAO();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<UserVO> UserList = userDAO.UserList();
		
//		if() {
//			
//		}
		
		//sql 출력 확인용
		//		userDAO.test();
		
		request.setAttribute("userList", UserList);
		
		//서블릿에서 context path는 적지 않고, 자동으로 붙여준다(jsp로 바로 보여준다는건가?)
		RequestDispatcher dispatchUserlist = request.getRequestDispatcher("/MypageForm/UserList.jsp");
		dispatchUserlist.forward(request, response);
				
	}
	
	

}
