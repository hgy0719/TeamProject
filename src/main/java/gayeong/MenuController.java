package gayeong;

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
			
			nextpage = "/gayeong/store/manager2.jsp";
			
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
			nextpage = "/gayeong/store/manager3.jsp";
		
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
			
			
		// 스토어 페이지
		} else if (action.equals("/store.do")) {

			for (int menu_type = 10; menu_type <= 30; menu_type += 10 ) {
				
	
				if(menu_type == 10) {
					
					List<MenuVO> store_list_snack = menuDAO.store_snack(menu_type);
					System.out.println(store_list_snack.size());
					
		
					request.setAttribute("store_list_snack", store_list_snack);
					
	
						
				} else if (menu_type == 20) {
					
					List<MenuVO> store_list_drink = menuDAO.store_drink(menu_type);
					System.out.println(store_list_drink.size());
					request.setAttribute("store_list_drink", store_list_drink);
					
				
				} else if (menu_type == 30) {
					
					List<MenuVO> store_list_card = menuDAO.store_card(menu_type);
					System.out.println(store_list_card.size());
					request.setAttribute("store_list_card", store_list_card);
					
		
				}
				
			}
			
			
			
			nextpage = "/gayeong/store_page/store.jsp";
			
			
			
			
			
			// 스토어 -> 스낵창
		} else if (action.equals("/snack.do")) {
		
			int menu_type = Integer.parseInt(request.getParameter("menu_type"));
			System.out.println(menu_type);
			List<MenuVO> snack_list = (List<MenuVO>) menuDAO.store_snack(menu_type);
			
			
			request.setAttribute("snack_list", snack_list );
			
			
			nextpage = "/gayeong/store_page/snack.jsp";
			
		 // 스토어 -> 음료창
		} else if (action.equals("/drink.do")) {
			
			int menu_type = Integer.parseInt(request.getParameter("menu_type"));
			System.out.println(menu_type);
			List<MenuVO> drink_list = (List<MenuVO>) menuDAO.store_drink(menu_type);
			
			
			request.setAttribute("drink_list", drink_list );
			
			
			nextpage = "/gayeong/store_page/drink.jsp";
		
			// 스토어 -> 영화관람권창 
		} else if (action.equals("/card.do")) {
			
			int menu_type = Integer.parseInt(request.getParameter("menu_type"));
			System.out.println(menu_type);
			List<MenuVO> card_list = (List<MenuVO>) menuDAO.store_card(menu_type);
			
			
			request.setAttribute("card_list", card_list );
			
			
			nextpage = "/gayeong/store_page/card.jsp";
		
			// 제품 선택 -> 정보창
		} else if (action.equals("/info_page.do")) {
			
			String menu_id = request.getParameter("menu_id");
			System.out.println(menu_id);
			List<MenuVO> info_list = (List<MenuVO>) menuDAO.info_page(menu_id);
			
			request.setAttribute("info_list", info_list);
			
			nextpage = "/gayeong/store_page/infoPage.jsp";
		
			// 장바구니
		} else if (action.equals("/cart.do")) {
			
			// 로그인 정보 불러오기
			HttpSession session = request.getSession();	
			PrintWriter out =response.getWriter();
			
			String user_id = (String) session.getAttribute("id");
			if(user_id != null && user_id.length() != 0) {
				
				out.print("장바구니에 메뉴가 담김");
				
				String menu_id = request.getParameter("menu_id");
				System.out.println(menu_id);
				List<MenuVO> cart_list = (List<MenuVO>) menuDAO.cart_list(menu_id);
				
				request.setAttribute("cart_list", cart_list);
				
				nextpage = "/gayeong/store_page/cart.jsp";
				
			} else {
				// id 값이 없으면 로그인 페이지로 이동
				
				out.print("로그인 해주셈");
				
				request.setAttribute("msg", "null_id");
				nextpage = "/gayeong/store_page/infoPage.jsp";
				
				session.invalidate();
			}
			
		
			
		}
		
		
		
	
		//jsp로 포워드 해준다
		RequestDispatcher dispatch = request.getRequestDispatcher(nextpage);
		dispatch.forward(request, response); 
				
	}
}
