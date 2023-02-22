package changsoon;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/movie1/*")
public class MovieServlet extends HttpServlet {

	MovieService movieService;
	MovieVO movieVO;
	
	public void init(ServletConfig config) throws ServletException {
		movieService = new MovieService();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 좋아요 서블릿
		String command1 = request.getParameter("command");
		String a = request.getParameter("like_num");
		if(a != null) {
			int like_num = Integer.parseInt(a);
			if(command1 == null || command1.equals("like_it")) {
				movieService.uplike(like_num);
				int like = movieService.selike(like_num+1);
				System.out.println(like);
				request.setAttribute("like", like);
				JSONObject obj = new JSONObject();
				obj.put("like",like);
				response.setContentType("application/x-json; charset=UTF-8");
				response.getWriter().print(obj);
				return;
			}
		}
		
		
		
		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getPathInfo();
		System.out.println("action : " + action);
		
		
//		영화 출력
		if(action==null || action.equals("/movieTab.do")) {
			request.setAttribute("movieList", movieService.list1());
			request.setAttribute("movieList2", movieService.list2());
			nextPage="/changsoon/영화탭/movieTab.jsp";
			
		} else if(action==null || action.equals("/main.do")) {
			request.setAttribute("movieList", movieService.list1());
			request.setAttribute("movieList2", movieService.list2());
			nextPage="/changsoon/메인탭/main.jsp";
		}
		
		
		else if(action.equals("/movieInfo.do") ) {
//		영화 상세창 출력
			
//			movieTab에서 articleNO 전달 후 articleNO에 맞는 테이블 포워딩
			String articleNO = request.getParameter("articleNO");
			movieVO = movieService.viewArticle(Integer.parseInt(articleNO));
			request.setAttribute("article", movieVO);
			request.setAttribute("movieList", movieService.list0(Integer.parseInt(articleNO)));
			
//			댓글 화면에 출력 (페이징하면서 필요없음)
//			List<MovieVO> comment_list = movieService.comment_list();
//			request.setAttribute("comment_list", comment_list);
			
//			페이징 기능 및 출력
			String _section = request.getParameter("section");
			String _pageNum = request.getParameter("pageNum");
			int section = Integer.parseInt(((_section==null) ? "1" : _section));
			int pageNum = Integer.parseInt(((_pageNum==null) ? "1" : _pageNum));
			Map<String, Integer> pagingMap = new HashMap<String, Integer>();
			pagingMap.put("section", section);
			pagingMap.put("pageNum", pageNum);
			Map articlesMap = movieService.list4(pagingMap);
			articlesMap.put("section", section);
			articlesMap.put("pageNum", pageNum);
			request.setAttribute("articlesMap", articlesMap);
			
			
			nextPage="/changsoon/영화상세탭/movieInfo.jsp";
			
//			관리자페이지
		} else if(action.equals("/movieManager.do")) {
			MovieVO vo = new MovieVO();
			String command = request.getParameter("command");
			System.out.println(command);
			if(command != null && command.equals("add")){
				String title = request.getParameter("title");
				String title_en = request.getParameter("title_en");
				String age = request.getParameter("age");
				String opendate = request.getParameter("opendate");
				String explain = request.getParameter("explain");
				String director = request.getParameter("director");
				String genre = request.getParameter("genre");
				String runningtime = request.getParameter("runningtime");
				String actor = request.getParameter("actor");
				String poster_back = request.getParameter("poster_back");
				String poster_main = request.getParameter("poster_main");
				vo.setTitle(title);
				vo.setTitle_en(title_en);
				vo.setAge(age);
				vo.setOpendate(opendate);
				vo.setExplain(explain);
				vo.setDirector(director);
				vo.setGenre(genre);
				vo.setRunningtime(runningtime);
				vo.setActor(actor);
				vo.setPoster_back(poster_back);
				vo.setPoster_main(poster_main);
				movieService.add(vo);
				
			} else if(command != null && command.equals("update")){
				String title = request.getParameter("title");
				String title_en = request.getParameter("title_en");
				String age = request.getParameter("age");
				String opendate = request.getParameter("opendate");
				String explain = request.getParameter("explain");
				String director = request.getParameter("director");
				String genre = request.getParameter("genre");
				String runningtime = request.getParameter("runningtime");
				String actor = request.getParameter("actor");
				String poster_back = request.getParameter("poster_back");
				String poster_main = request.getParameter("poster_main");
				vo.setTitle(title);
				vo.setTitle_en(title_en);
				vo.setAge(age);
				vo.setOpendate(opendate);
				vo.setExplain(explain);
				vo.setDirector(director);
				vo.setGenre(genre);
				vo.setRunningtime(runningtime);
				vo.setActor(actor);
				vo.setPoster_back(poster_back);
				vo.setPoster_main(poster_main);
				movieService.up(vo);
			} else if(command != null && command.equals("del")) {
				String title = request.getParameter("title");
				System.out.println("서블릿 삭제:" + title);
				movieService.del(title);
			} else if(command != null && command.equals("sel")) {
				
			}
			nextPage="/changsoon/관리자탭/movieManager.jsp";
		}
		
		
		
//		댓글 서블릿
		if(action.equals("/reply.do")) {
			String articleNO = request.getParameter("articleNO");
			movieVO = movieService.viewArticle(Integer.parseInt(articleNO));
			request.setAttribute("article", movieVO);
			request.setAttribute("movieList", movieService.list0(Integer.parseInt(articleNO)));
			
			
			String comment_text = request.getParameter("comment_text");
			String comment_id = request.getParameter("comment_id");
			String comment_rate = request.getParameter("comment_rate");
			movieService.upComment(comment_id, comment_text, comment_rate);
			
			String _section = request.getParameter("section");
			String _pageNum = request.getParameter("pageNum");
			int section = Integer.parseInt(((_section==null) ? "1" : _section));
			int pageNum = Integer.parseInt(((_pageNum==null) ? "1" : _pageNum));
			Map<String, Integer> pagingMap = new HashMap<String, Integer>();
			pagingMap.put("section", section);
			pagingMap.put("pageNum", pageNum);
			Map articlesMap = movieService.list4(pagingMap);
			articlesMap.put("section", section);
			articlesMap.put("pageNum", pageNum);
			request.setAttribute("articlesMap", articlesMap);
			
//			List<MovieVO> comment_list = movieService.comment_list();
//			request.setAttribute("comment_list", comment_list);
			
			
			nextPage="/changsoon/영화상세탭/movieInfo.jsp";
			
//			대댓글 서블릿
		} else if(action.equals("/reply2.do")) {
			String articleNO = request.getParameter("articleNO");
			movieVO = movieService.viewArticle(Integer.parseInt(articleNO));
			request.setAttribute("article", movieVO);
			request.setAttribute("movieList", movieService.list0(Integer.parseInt(articleNO)));
			
			int commentNO = Integer.parseInt(request.getParameter("commentNO"));
			String comment_text = request.getParameter("recomment_text");
			String comment_id = request.getParameter("recomment_id");
			movieService.upComment2(commentNO, comment_id, comment_text);
			
			String _section = request.getParameter("section");
			String _pageNum = request.getParameter("pageNum");
			int section = Integer.parseInt(((_section==null) ? "1" : _section));
			int pageNum = Integer.parseInt(((_pageNum==null) ? "1" : _pageNum));
			Map<String, Integer> pagingMap = new HashMap<String, Integer>();
			pagingMap.put("section", section);
			pagingMap.put("pageNum", pageNum);
			Map articlesMap = movieService.list4(pagingMap);
			articlesMap.put("section", section);
			articlesMap.put("pageNum", pageNum);
			request.setAttribute("articlesMap", articlesMap);
			
			
//			List<MovieVO> comment_list = movieService.comment_list();
//			request.setAttribute("comment_list", comment_list);
			
			
			nextPage="/changsoon/영화상세탭/movieInfo.jsp";
		}
		
		
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
	}
}