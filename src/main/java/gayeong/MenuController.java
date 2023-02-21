package gayeong;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/menu/*")
public class MenuController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	MenuDAO menuDAO;

	public void init() throws ServletException{
		menuDAO = new MenuDAO();
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doHandle(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request,response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nextpage = null;
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String action = request.getPathInfo();
		System.out.println("action : " + action);
		
	
		// 메뉴 출력
		if(action == null || action.equals("/manager2.do")) {
			
			List<MenuVO> menu_list = menuDAO.listMenu();
			System.out.println(menu_list.size());
			request.setAttribute("menu_list", menu_list);
			
			nextpage = "/store/manager2.jsp";
			
		// 메뉴 등록 
		} else if ( action.equals("/manager.do")) {
			
			String menu_id = request.getParameter("menu_id");
			System.out.println(menu_id);
			String name = request.getParameter("name");
			int price = Integer.parseInt(request.getParameter("price"));
			String image = request.getParameter("image");
			int menu_type = Integer.parseInt(request.getParameter("menu_type"));
			
			MenuVO menuvo = new MenuVO(menu_id,name,price,image,menu_type);
			menuDAO.addMenu(menu_id,name,price,image,menu_type);
			
			request.setAttribute("msg", "addMenu");
			nextpage = "/menu/manager2.do";

		// 메뉴 수정창
		} else if( action.equals("/manager3.do")) {
			
			String id = request.getParameter("id");
			
			MenuVO menuInfo = MenuDAO.findMenu(id);
			
			request.setAttribute("menuInfo", menuInfo);
			nextpage = "/store/manager3.jsp";
		
		// 메뉴 수정
		} else if (action.equals("/modMenu.do")) {
			
			String menu_id = request.getParameter("menu_id");
			System.out.println(menu_id);
			String name = request.getParameter("name");
			int price = Integer.parseInt(request.getParameter("price"));
			String image = request.getParameter("image");
			int menu_type = Integer.parseInt(request.getParameter("menu_type"));
			
			MenuVO menuvo = new MenuVO(menu_id,name,price,image,menu_type);
			menuDAO.modMenu(menuvo);
			
			request.setAttribute("msg", "modified");
			nextpage = "/menu/manager2.do";
		
		// 메뉴 삭제
		} else if (action.equals("/delMenu.do")) {
			String id = request.getParameter("id");
			System.out.println(id);
			
			menuDAO.delMenu(id);
			
			request.setAttribute("msg", "deleted");
			nextpage = "/menu/manager2.do";
			
			
			// 스토어 -> 스낵창
		} else if (action.equals("/snack.do")) {
		
			int menu_type = Integer.parseInt(request.getParameter("menu_type"));
			System.out.println(menu_type);
			List<MenuVO> snack_list = (List<MenuVO>) menuDAO.store_snack(menu_type);
			
			
			request.setAttribute("snack_list", snack_list );
			
			
			nextpage = "/store_page/snack.jsp";
			
			
			
			
			
		}
		
		
		
	
		
		
		
	
		//jsp로 포워드 해준다
		RequestDispatcher dispatch = request.getRequestDispatcher(nextpage);
		dispatch.forward(request, response); 
				
	}
}
