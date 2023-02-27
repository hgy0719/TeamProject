package seunggi;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import seunggi.LoggableStatement;
import seunggi.EventVO;



public class EventDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public EventDAO() {
		
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}		
	}
	public EventVO findEvent(String _id) {
		EventVO eveInfo = null;
		EventVO eventVO =new EventVO();
		try {
			con = dataFactory.getConnection();
			String query= "select * from event where id=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, _id);
			System.out.println(query);
			ResultSet rs= pstmt.executeQuery();
			rs.next();
			String id = rs.getString("id");
			String title = rs.getString("title");
			String firstimage = rs.getString("firstimage");
			String firstimagead = rs.getString("firstimagead");
			String secondimage = rs.getString("secondimage");
			String eventday = rs.getString("eventday");
			eveInfo = new EventVO(id,title,firstimage,firstimagead,secondimage,eventday);
			pstmt.close();
			con.close();
		} catch(Exception e) 
		
		{ 
			e.printStackTrace();
		}
		return eveInfo;
	}
		
		
	public void modEvent(EventVO eventVO) {
		
		String id = eventVO.getId();
		String title = eventVO.getTitle();
		String firstimage = eventVO.getFirstimage();
		String firstimagead = eventVO.getFirstimagead();
		String secondimage = eventVO.getSecondimage();
		String eventday = eventVO.getEventday();
		try {
			con = dataFactory.getConnection();
			String query = "update event set title=?,firstimage=?,firstimagead=?,secondimage=?,eventday=? where id=?";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, firstimage);
			pstmt.setString(3, firstimagead);
			pstmt.setString(4, secondimage);
			pstmt.setString(5, eventday);
			pstmt.setString(6, id);
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delEvent(String id) {
		try {
			con = dataFactory.getConnection();
			String query = "delete from event where id=?";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
	
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public List<EventVO> selectAllEvents() {
		System.out.println("selectAllEvents 호출");
		List<EventVO> eventsList = new ArrayList<EventVO>();
		try {
		con = dataFactory.getConnection();
		String query = "select * from event";
		pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		
		
		while(rs.next()) {
			String id = rs.getString("id");
			String title = rs.getString("title");
			String firstimage = rs.getString("firstimage");
			String firstimagead = rs.getString("firstimagead");
			
			String secondimage = rs.getString("secondimage");
			String eventday = rs.getString("eventday");
			
			EventVO  eventVO = new EventVO(id,title,firstimage,firstimagead,secondimage,eventday);
			eventsList.add(eventVO);
		}
			rs.close();
			pstmt.close();
			con.close();
			
		
		}catch (Exception e) {
		e.printStackTrace();
		}
//	return vo;
		return eventsList;
		}
	
	
	public void insertNewEvent(EventVO a) {
		System.out.println("addEvent 호출");
		try {
			con = dataFactory.getConnection();
			String id = a.getId();
			String title = a.getTitle();
			String firstimage = a.getFirstimage();
			String firstimagead = a.getFirstimagead();
			String secondimage = a.getSecondimage();
			String eventday = a.getEventday();
			
			String query = "INSERT INTO event(id,title,firstimage,firstimagead,secondimage,eventday)"+"VALUES(?,?,?,?,?,?)";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.setString(2, title);
			pstmt.setString(3, firstimage);
			pstmt.setString(4, firstimagead);
			pstmt.setString(5, secondimage);
			pstmt.setString(6, eventday);
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public EventVO selectEvent(String eNO) {
		EventVO vo = null;
		
		try {
			
			String query = "select  * from event where id = ?";
			
			con = dataFactory.getConnection();
			pstmt = new LoggableStatement(con, query);
			
			pstmt.setString(1, eNO);
			
			System.out.println(  ((LoggableStatement)pstmt).getQueryString()  );
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new EventVO();
				
				vo.setId( 		rs.getString("id") 			);
				vo.setTitle( 		rs.getString("title") 			);
				vo.setFirstimage( 			rs.getString("firstimage") 			);
				vo.setFirstimagead( 			rs.getString("firstimagead") 			);
				vo.setSecondimage( 			rs.getString("secondimage") 		);
				vo.setEventday( 	rs.getString("eventday") 	);
				System.out.println("vo.getTitle : "+ vo.getTitle());
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
//댓글
	public List<EventVO> selectAllArticles() {
		List<EventVO> articlesList = new ArrayList();
		try {
			con = dataFactory.getConnection();
			String query = "SELECT LEVEL, articleNO, parentNO, title, content, id, writeDate"
					+ " from e_board"
					+ " START WITH parentNO=0"
					+ "CONNECT BY PRIOR articleNO=parentNO"
					+ " ORDER SIBLINGS BY articleNO DESC";
			
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int level = rs.getInt("level");
				int articleNO = rs.getInt("articleNO");
				int parentNO = rs.getInt("parentNO");
				String replytitle = rs.getString("replytitle");
				String content = rs.getString("content");
				String replyid = rs.getString("replyid");
				Date writeDate = rs.getDate("writeDate");
				
				EventVO article = new EventVO();
				article.setLevel(level);
				article.setArticleNO(articleNO);
				article.setParentNO(parentNO);
				article.setReplytitle(replytitle);
				article.setContent(content);
				article.setReplyid(replyid);
				article.setWriteDate(writeDate);
				articlesList.add(article);
			}
			rs.close();
			pstmt.close();
			con.close();
			
		} catch( Exception e) {
			e.printStackTrace();
		}
	
	 return articlesList;
}
	//댓글
public void insertNewArticle(EventVO article){
		
		try {
			
			String query = "";
			query += " insert into e_board (articleno, parentno, title, content, id)";
			query += " values(e_board_seq.nextval, ?, ?, ?, ?)";

			con = dataFactory.getConnection();
			pstmt = new LoggableStatement(con, query);
			pstmt.setInt(1, article.getParentNO());
			pstmt.setString(2, article.getTitle());
			pstmt.setString(3, article.getContent());
			pstmt.setString(4, article.getId());
			System.out.println(  ((LoggableStatement)pstmt).getQueryString()  );
			
			int result = pstmt.executeUpdate();
			System.out.println("insertNewArticle : insert 결과 : "+ result);
			
			pstmt.close();
			con.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}

