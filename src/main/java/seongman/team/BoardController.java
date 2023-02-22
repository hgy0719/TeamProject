package team;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("/board/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BoardService boardService;
	ArticleVO articleVO;

	public BoardController() {
		boardService = new BoardService();
	}
	
	private Map<String, String> upload(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);

	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		String nextPage = "/board/listArticles.do";
		String action = request.getPathInfo();
		System.out.println("action : "+ action);
		
		try {
			
			if("/listArticles.do".equals(action)) {
				
				List list = boardService.listArticles();
				request.setAttribute("articlesList", list);
				nextPage = "/board01/listArticles.jsp";
			
				
				// 글 수정하기
			} else if ("/modArticle.do".equals(action)) {
				Map<String, String> articleMap = upload(request, response);
				int articleNO = Integer.parseInt(articleMap.get("articleNO"));
				
				articleVO.setArticleNO(articleNO);
				
				String title = articleMap.get("title");
				String content = articleMap.get("content");
				String id = articleMap.get("id");
				
				articleVO.setParentNO(0);
				articleVO.setId(id);
				articleVO.setTitle(title);
				articleVO.setContent(content);
				
				// 전송된 글 정보를 이용해 글을 수정
				boardService.modArticle(articleVO);
				
				// 글 수정 후 location 객체의 href 속성을 이용해 글 상세 화면을 나타낸다
				PrintWriter pw = response.getWriter();
				
				pw.print("<script>"+
				" alert('글을 수정했습니다.');"+" location.href='"
						+ request.getContextPath()
						+ "/board/viewArticle.do?articleNO="
						+ articleNO + "';" + "</script>");
				return;
				
				
				
						
				
			} else if ("/addArticle.do".equals(action)) {
				
				String id = request.getParameter("id");
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				
				
				System.out.println("id : "+id);
				System.out.println("title : "+title);
				System.out.println("content : "+content);
				
				
				ArticleVO vo = new ArticleVO();
				vo.setId(id);
				vo.setTitle(title);
				vo.setContent(content);
				
				
				boardService.addArticle(vo);
				
				nextPage = "/board/listArticles.do";
				
			} else if ("/viewArticle.do".equals(action)) {
				
				String articleNO = request.getParameter("articleNO");
				System.out.println("articleNO : "+articleNO);
				
				int aNO = Integer.parseInt(articleNO);
				ArticleVO vo = boardService.viewArticle(aNO);
				request.setAttribute("vo",vo);
				
				nextPage = "/board01/viewArticle.jsp";
				
			} else if ("/addReply.do".equals(action)) {
				
				String id = request.getParameter("id");
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String parentNO = request.getParameter("parentNO");
				
				System.out.println("id : "+id);
				System.out.println("title : "+title);
				System.out.println("content : "+content);
				System.out.println("parentNO : "+parentNO);
				
				ArticleVO vo = new ArticleVO();
				vo.setId(id);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setParentNO( Integer.parseInt(parentNO));
				
				boardService.addArticle(vo);
				
				nextPage = "/board/listArticles.do";
			
				
			} else {
				nextPage = "/board/listArticles.do";
			}
			System.out.println("nextPage : "+nextPage);
						
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		// 페이징 구현 하기
		
//		int pageNum = 1; // 현재 페이지
//		int countPerPage = 5; // 한 페이지당 표시 수
//		
//		String tmp_pageNum = request.getParameter("pageNum");
//		if(tmp_pageNum != null) {
//			pageNum = Integer.parseInt(tmp_pageNum);
//		}
//		
//		BoardService boardService = new BoardService();
//		Map map = boardService.getPagingList(pageNum, countPerPage);
//		
//		request.setAttribute("articlesList", map.get("list"));
//		request.setAttribute("totalCount", map.get("totalCount"));
//		request.setAttribute("pageNum",pageNum);
//		request.setAttribute("countPerPage", countPerPage);
//		
//		RequestDispatcher rd = request.getRequestDispatcher("/page/listArticles.jsp");
//		 rd.forward(request, response);
	}

	

	

	

	
	
}
