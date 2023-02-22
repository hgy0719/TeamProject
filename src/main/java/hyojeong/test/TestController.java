package test;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/testmvc")
//http://localhost:8080/HumanStudy/testmvc 웹브라우저는 doGet 방식
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public TestController() {
        super();
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
		//전달연습을 해보자!!!!!!!!!!!!
		
		//패턴 1번 유형(controller > service > dao)정방향 호출
		// 1-1. "controller" 에서 service를 호출
		TestService service = new TestService();
			service.service();
			
//------------------------------------------------------------------------		
		
		//패턴 2번 유형(dao <  service < controller) 역방향 호출
		String a = request.getParameter("return");
		TestService service2 = new TestService();
		service2.service2(a);

//----------------------------------------------------------------------- 	
		//패턴 3번 유형 (mvc pattern2) 순방향으로 가서 return하고 jsp 호출까지
		String b = request.getParameter("key");
		//"key"값을 받아서 전달 가능하고 없으면 null값
		TestService service3 = new TestService();
		int result = service3.service3(b);
		// 3-1 getParameter "key" 값이 String "b"로 전달되고
		// 3-2 String "b"값이 TestService의 b
		// 3-3 service3 메소드의 string b값 전달
		
		//3-12. 'int service3'에서 리턴한 result 값을 int result로 받고 출력
		System.out.println("service에서 받은 int 값이 return되어 옴"+ result);
		 
		
		//jsp(view)로 전달해 봅시다
		//response.getWriter().println("<h1>"+result+"</h1>")
		// html로 바로 출력도 가능하지만, mcv로 나누어 표현할 때
		//SendRedirect 와 RequestDispatcher를 이용할 수 있다
		 
		//방법 1. RequestDispatcher
		request.setAttribute("key", result);
		//3-13. 위의 'int result' 값을 가져와서 
		RequestDispatcher rd = request.getRequestDispatcher("/folder/address.jsp");
		rd.forward(request, response);
		//3-14. jsp를 호출해서 출력하면 완성
	}
}








