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

	public void addEvent(EventVO vo) {
		System.out.println("addEvent 실행");
		eventDAO.insertNewEvent(vo);
		
	}
	
	public EventVO viewEvent(String eventNO) {
		return eventDAO.selectEvent(eventNO);
		
	}
	
	
}
