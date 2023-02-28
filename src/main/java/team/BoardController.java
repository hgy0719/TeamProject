package team;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);

	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		
		BoardDAO dao = new BoardDAO();
		
//		String command = request.getParameter("command");
//		System.out.println("command : "+command);
		
		
		String nextPage = "/board/listArticles.do";
		String action = request.getPathInfo();
		System.out.println("action : "+ action);
		
		
		
		
		
		try {
			
			if("/listArticles.do".equals(action)) {
				
				List list = boardService.listArticles();
				request.setAttribute("articlesList", list);
				nextPage = "/seongman/board01/listArticles.jsp";
			
				
				// QnA 화면으로 갈수 있게
			} else if("/qna.do".equals(action)) {
				
				List list = boardService.listArticles1();
				request.setAttribute("articlesList1", list);
				nextPage = "/seongman/board01/qna.jsp";
				
				
				// 삭제기능
			} else if(action != null && action.equals("/delMember.do")) {
				
				int articleNO = Integer.parseInt(request.getParameter("articleNO"));
				System.out.println("delMember : articleNO = "+articleNO);
				
				dao.delMember(articleNO);
				
				// 글 수정하기
			} else if("/update.do".equals(action)) {
				
				// 전달 받음
				int _articleNO = Integer.parseInt(request.getParameter("articleNO"));
				String _title = request.getParameter("title");
				String _content = request.getParameter("content");
				String _id = request.getParameter("id");
				System.out.println("articleNO : "+_articleNO);
				System.out.println("title : "+_title);
				System.out.println("content : "+_content);
				System.out.println("id : "+_id);
				
				// vo 클래스에 저장
				ArticleVO vo = new ArticleVO();
				vo.setArticleNO(_articleNO);
				vo.setTitle(_title);
				vo.setContent(_content);
				vo.setId(_id);
				
				// 수정 메소드 실행
				dao.update(vo);
				
				nextPage = "/seongman/board/listArticles.do";
				
//			} else if ("/modArticle.do".equals(action)) {
//				// 수정할건데  
//				// 내용이을 수정한다
//				// 원래 글을 
//				// 새로운 내용으로
//				// 수정한다
//				int articleNO = Integer.parseInt("articleNO");
//				
////				articleVO.setArticleNO(articleNO);
//				
//				String id = request.getParameter("id");
//				String title = request.getParameter("title");
//				String content = request.getParameter("content");
//				
//				
//				articleVO.setParentNO(0);
//				articleVO.setId(id);
//				articleVO.setTitle(title);
//				articleVO.setContent(content);
////				articleVO.setArticleNO(articleNO);
//				
//				// 전송된 글 정보를 이용해 글을 수정
//				boardService.modArticle(articleVO);
//				
//				// 글 수정 후 location 객체의 href 속성을 이용해 글 상세 화면을 나타낸다
////				PrintWriter pw = response.getWriter();
//				
////				pw.print("<script>"+
////				" alert('글을 수정했습니다.');"+" location.href='"
////						+ request.getContextPath()
////						+ "/board/viewArticle.do?articleNO="
////						+ articleNO + "';" + "</script>");
//				return ;
				
				
				
						
				
			} else if ("/addArticle.do".equals(action)) {
				
				String id = request.getParameter("id");
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				String writeDate = request.getParameter("writeDate");
				
				// 날짜 기능
				
				int n = Integer.parseInt(request.getParameter("n"));
				
				System.out.println("n : "+n);
				System.out.println("id : "+id);
				System.out.println("title : "+title);
				System.out.println("content : "+content);
				System.out.println("writeDate : "+writeDate);
				
				
				ArticleVO vo = new ArticleVO();
				vo.setId(id);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setN(n);
				vo.setWriteDate(writeDate);
				
				
				boardService.addArticle(vo);
				
				nextPage = "/seongman/board/listArticles.do";
				
				
				
			} else if ("/viewArticle.do".equals(action)) {
				
				String articleNO = request.getParameter("articleNO");
				System.out.println("articleNO : "+articleNO);
				
				int aNO = Integer.parseInt(articleNO);
				ArticleVO vo = boardService.viewArticle(aNO);
				request.setAttribute("vo",vo);
				
				nextPage = "/seongman/board01/viewArticle.jsp";
				
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
				
				nextPage = "/seongman/board/listArticles.do";
			
				
			} else {
				nextPage = "/seongman/board/listArticles.do";
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
