package project2;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.naming.Context;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/movie/*")
public class movieController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	movieService movieService;
	
	public void init(ServletConfig config) throws ServletException {
		movieService = new movieService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nextPage = null;
		String nextPage2 = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		String action = request.getPathInfo();
		System.out.println("action :"+ action);
		movieDAO movieDAO = new movieDAO();
		movieVO movieVO = new movieVO();
		movieService movieService = new movieService();
		
		
//		movieService.addMovie();
		PrintWriter out = response.getWriter();
		
		String datename = request.getParameter("datename");
		System.out.println("날짜 : "+ datename);
		String areaname = request.getParameter("areaname");
		System.out.println("지역 : "+ areaname);
		String choicename = request.getParameter("choicename");
		System.out.println("영화 : "+ choicename);
		String timename = request.getParameter("timename");
		System.out.println("시간 : "+ timename);
		String pnumname = request.getParameter("pnumname");
		System.out.println("인원수 : "+ pnumname);
		String aaname = request.getParameter("aaname");
		
//		int aaa = Integer.parseInt(pnumname);
//		int bbb = Integer.parseInt(aaname);
//		int ccc = aaa*bbb;
		
		movieVO.setDatename(datename);
		movieVO.setAreaname(areaname);
		movieVO.setChoicename(choicename);
		movieVO.setTimename(timename);
		movieVO.setPnumname(pnumname);
		movieVO.setAaname(aaname);

		if(datename!=null&&areaname!=null&& choicename!=null&&timename!=null&& pnumname!=null&&aaname!=null) {
			movieDAO.insertMovie(movieVO);
		}
//		else if (datename==null || areaname==null || choicename==null || timename==null || pnumname==null || aaname==null) {
//			action=("/alert.do");
//		}
//			
		
		System.out.println("movieVO :"+movieVO);
		
		String datename2 =request.getParameter("datename2");
		String areaname2 =request.getParameter("areaname2");
		String choicename2 =request.getParameter("choicename2");
		String timename2 =request.getParameter("timename2");
		String pnumname2 =request.getParameter("pnumname2");
		String aaname2 =request.getParameter("aaname2");
		movieVO vo = movieDAO.selectWriteDate();
		
//		action = "/listMovies.do";
		
		if(action.equals("/listMovies.do")) {
			nextPage = "/project2/listMovies.jsp";
		}else if(action.equals("/writedate.do")) {
			nextPage = "/project2/writedate.jsp";
		}
//		else if(action.equals("/alert.do")) {
//			nextPage = "/project2/alert.jsp";
//		}
//		
		System.out.println("출력"+vo);
//		System.out.println("출력"+vo.getTimename());
			request.setAttribute("abc", vo);
			
//		request.getAttribute(aaname);
		
		System.out.println(nextPage);
//		nextPage = "/project2/alert.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(nextPage);
		rd.forward(request, response);
	}

}
