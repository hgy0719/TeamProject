package gayeong;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/cinema/*")
public class CinemaController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	CinemaDAO cinemaDAO;
	
	public void init() throws ServletException{
		cinemaDAO = new CinemaDAO();
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
		
		
		

				
		// 극장 관리자페이지(목록)
	 			
			if(action == null || action.equals("/cinema_manager2.do")) {
				
				List<CinemaVO> cinema_list = cinemaDAO.listCinema();
				System.out.println(cinema_list.size());
				request.setAttribute("cinema_list", cinema_list);
				
				nextpage = "/gayeong/cinema/cinema_manager2.jsp";
				
				
				
				
				// 극장 등록(관리자 페이지)
			}  else if(action.equals("/cinema_manager1.do")) {
				

				String cinema_id = request.getParameter("cinema_id");
				System.out.println(cinema_id);
				String cinema_name = request.getParameter("cinema_name");
				String cinema_area = request.getParameter("cinema_area");
				String cinema_image = request.getParameter("cinema_image");
				String cinema_type = request.getParameter("cinema_type");
				
				
				CinemaVO cinemavo = new CinemaVO(cinema_id,cinema_name,cinema_area,cinema_image,cinema_type);
				cinemaDAO.addCinema(cinema_id,cinema_name,cinema_area,cinema_image,cinema_type);
				
				
				nextpage = "/cinema/cinema_manager2.do";
				
				
				// 극장 페이지 (극장 정보 부분)
				
			} else if (action.equals("/cinema.do")) {
				
				
				List<CinemaVO> cinema_list = cinemaDAO.cinema_list();
				System.out.println(cinema_list.size());
				request.setAttribute("cinema_list", cinema_list);
				
				nextpage = "/gayeong/cinema/cinema.jsp";
				
			}
	
			
				RequestDispatcher dispatch = request.getRequestDispatcher(nextpage);
				dispatch.forward(request, response); 
		
	}
	
}
