package seunggi;

import java.util.List;

public class EventService {

	EventDAO eventDAO;
	
	public EventService() {
		eventDAO= new EventDAO();
	}

	public List<EventVO> listEvents() {
		List<EventVO> list = eventDAO.selectAllEvents();
		return list;
		
	}
	
	public List<EventVO> listArticles() {
		 List<EventVO> articlesList = eventDAO.selectAllArticles();
		 return articlesList;
	}

	public void addEvent(EventVO vo) {
		System.out.println("addEvent 실행");
		eventDAO.insertNewEvent(vo);
		
	}
	
	public EventVO viewEvent(String eventNO) {
		return eventDAO.selectEvent(eventNO);
		
	}
	
	public void addArticle(EventVO vo) {
		eventDAO.insertNewArticle(vo);
	}
	
//	public list<EventVO>  viewArticle() {
//		list<EventVO> v
//		eventDAO.selectAllArticles();
//		
//	}
}
