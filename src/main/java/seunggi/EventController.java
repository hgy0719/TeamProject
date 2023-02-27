package seunggi;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/event1/*")
public class EventController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	EventService eventService;
	
	public void init(ServletConfig config) throws ServletException {
		eventService = new EventService();
//		 EventDAO EventDAO = new EventDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	protected void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String nextPage = null;
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
	
		String nextPage="/seunggi/project2/event1.do";
		String action = request.getPathInfo();
		System.out.println("action : " + action);
	
	try {	
		List<EventVO> articlesList = new ArrayList<EventVO>();
		if("/event1.do".equals(action)) {
			EventService eventService = new EventService();
			List list =eventService.listEvents();
			System.out.println(list.size());
			request.setAttribute("eventsList", list);
			nextPage = "/seunggi/project2/listEvent.jsp";	
			
//댓글			 
		}	else if (action == null) {
			articlesList = eventService.listArticles();
			request.setAttribute("articlesList", articlesList);
			nextPage = "/seunggi/project1/listArticles.jsp";
			
		} else if (action.equals("/listArticles.do")) {
			articlesList = eventService.listEvents();
			request.setAttribute("articlesList", articlesList);
			System.out.println("listArticles 호출");
			nextPage = "/seunggi/project1/listArticles.jsp";
			//끝
			
		} else if ("/addEvent.do".equals(action)) {
			
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String firstimage = request.getParameter("firstimage");
			String firstimagead = request.getParameter("firstimagead");
			String secondimage = request.getParameter("secondimage");
			String eventday = request.getParameter("eventday");
			
			System.out.println("id : "+ id);
			System.out.println("title : "+ title);
			System.out.println("firstimage : "+ firstimage);
			System.out.println("firstimagead : "+ firstimagead);
			System.out.println("secondimage : "+ secondimage);
			System.out.println("eventday : "+ eventday);
			
			EventVO vo = new EventVO();
			vo.setId(id);
			vo.setTitle(title);
			vo.setFirstimage(firstimage);
			vo.setFirstimagead(firstimagead);
			vo.setSecondimage(secondimage);
			vo.setEventday(eventday);
			
			eventService.addEvent(vo);
			List list =eventService.listEvents();
			System.out.println(list.size());
			request.setAttribute("eventsList", list);
			nextPage = "/seunggi/project2/addEvent.jsp"; //add끝
		 
		
	} else if("/viewEvent.do".equals(action)) {
		
		String eventNO = request.getParameter("id");
		System.out.println("eventNO :"+eventNO);
		String eNO = eventNO;
		
		EventVO vo = eventService.viewEvent(eNO);
		request.setAttribute("vo", vo);
		
		nextPage = "/seunggi/project2/viewEvent.jsp";
		
//	} else if ("/addReply.do".equals(action)) {
//		
//		String id = request.getParameter("id");
//		String title = request.getParameter("title");
//		String firstimage = request.getParameter("firstimage");
//		String firstimagead = request.getParameter("firstimagead");
//		String secondimage = request.getParameter("secondimage");
//		String eventday = request.getParameter("eventday");
//	
//		
//		System.out.println("id : "+ id);
//		System.out.println("title : "+ title);
//	
//		EventVO vo = new EventVO();
//		vo.setId(id);
//		vo.setTitle(title);
//		vo.setFirstimage(firstimage);
//		vo.setFirstimagead(firstimagead);
//		vo.setSecondimage(secondimage);
//		vo.setEventday(eventday);
//
//		
//		eventService.addEvent(vo);
//		
//		nextPage = "/seunggi/project2/replyForm.jsp";
		
	} else if(action.equals("/modEventForm.do")) {
		String id = request.getParameter("id");
		EventDAO eventDAO = new EventDAO();
		EventVO eveInfo = eventDAO.findEvent(id);
		request.setAttribute("eveInfo", eveInfo);
		nextPage = "/seunggi/project2/modEventForm.jsp";
		
	} else if (action.equals("/modEvent.do")) {
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String firstimage = request.getParameter("firstimage");
		String firstimagead = request.getParameter("firstimagead");
		String secondimage = request.getParameter("secondimage");
		String eventday = request.getParameter("eventday");
		
		EventDAO eventDAO = new EventDAO();
		EventVO eventVO = new EventVO(id,title,firstimage,firstimagead,secondimage,eventday);
		eventDAO.modEvent(eventVO);
		
		request.setAttribute("msg", "modified");
		nextPage = "/event1/event1/addEvent.do";
		
	} else if (action.equals("/delEvent.do")) {
		String id = request.getParameter("id");
		EventDAO eventDAO = new EventDAO();
		eventDAO.delEvent(id);
		System.out.println("delEvent 실행");
		request.setAttribute("msg", "deleted");
		nextPage = "/event1/event1/addEvent.do";
		
	} else if(action.equals("/eventForm.do")) {
		
		nextPage= "/seunggi/project2/eventForm.jsp";
	}
		
    //보드 컨트롤러
//		
//	else if("/listArticles.do".equals(action)) {
//		BoardService boardService = new BoardService();
//			List list = boardService.listArticles();
//			request.setAttribute("articlesList", list);
//			nextPage = "/seunggi/project1/listArticles.jsp";
//			
		 else if ("/addArticle.do".equals(action)) {
			
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			System.out.println("id : "+ id);
			System.out.println("title : "+ title);
			System.out.println("content : "+ content);
			
			EventVO vo = new EventVO();
			vo.setId(id);
			vo.setTitle(title);
			vo.setContent(content);
			EventService eventService = new EventService();
			eventService.addArticle(vo);
			
			nextPage = "/event1/listArticles.do";
		}
//댓글
		
		 else if ("/viewArticle.do".equals(action)) {
			
			String articleNO = request.getParameter("articleNO");
			System.out.println("articleNO : "+ articleNO);

			int aNo = Integer.parseInt(articleNO);
			
			EventService eventService = new EventService();
			EventService eventSevice;
			EventVO vo = eventSevice.viewArticle(aNo);
			request.setAttribute("vo", vo);
			
			nextPage = "/seunggi/project1/viewArticle.jsp";
			
		} else if ("/addReply.do".equals(action)) {
			
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String parentNO = request.getParameter("parentNO");
			
			System.out.println("id : "+ id);
			System.out.println("title : "+ title);
			System.out.println("content : "+ content);
			System.out.println("parentNO : "+ parentNO);
			
			EventVO vo = new EventVO();
			vo.setId(id);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setParentNO( Integer.parseInt(parentNO) );
			
			eventService.addArticle(vo);
			
			nextPage = "/event1/listArticles.do";
			
		}
			
	
	else {
		EventDAO eventDAO = new EventDAO();
		
		List<EventVO> eventsList = eventDAO.selectAllEvents();
		request.setAttribute("eventsList", eventsList);
		nextPage = "/seunggi/project2/listEvent.jsp";
	}
	System.out.println("nextPage : "+ nextPage);
			
			
		RequestDispatcher dispatch = request.getRequestDispatcher(nextPage);
		dispatch.forward(request, response);
		
	}catch (Exception e) {
		e.printStackTrace();
	}
	
}
}



//		if(action==null || action.equals("/event.do")) {
//			EventDAO eventDAO=new EventDAO();
//			List<EventVO> eventsList = eventDAO.listEvents();
//			EventVO eventVO=new EventVO();
//			eventVO.setId("id1");
//			eventVO.setTitle("setTitle");
//			eventVO.setFirstimage("setImage");
//			eventVO.setSecondimage("setImage");
//			eventVO.setEventday("setEventday");
//			
//			eventDAO.insertEvent(eventVO);
//			request.setAttribute("eventsList", eventsList);