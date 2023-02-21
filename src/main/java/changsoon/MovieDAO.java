package changsoon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MovieDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
//	db연결
	public MovieDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	practice 테이블 출력
	public List<MovieVO> listMovies(){
		List<MovieVO> list = new ArrayList<MovieVO>();
		try {
			con = dataFactory.getConnection();
			String query = "select * from practice";
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int articleNO =rs.getInt("articleNO");
				String title = rs.getString("title");
				String title_en = rs.getString("title_en");
				String age = rs.getString("age");
				String opendate = rs.getString("opendate");
				int like_num = rs.getInt("like_num");
				int rate = rs.getInt("rate");
				String explain = rs.getString("explain");
				String director = rs.getString("director");
				String genre = rs.getString("genre");
				String runningtime = rs.getString("runningtime");
				String actor = rs.getString("actor");
				String poster_back = rs.getString("poster_back");
				String poster_main = rs.getString("poster_main");
				MovieVO vo = new MovieVO();
				vo.setArticleNO(articleNO);
				vo.setTitle(title);
				vo.setTitle_en(title_en);
				vo.setAge(age);
				vo.setOpendate(opendate);
				vo.setLike_num(like_num);
				vo.setRate(rate);
				vo.setExplain(explain);
				vo.setDirector(director);
				vo.setGenre(genre);
				vo.setRunningtime(runningtime);
				vo.setActor(actor);
				vo.setPoster_back(poster_back);
				vo.setPoster_main(poster_main);
				list.add(vo);
			}
			con.close();
			rs.close();
			pstmt.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
//	articleNO별 테이블 출력
	public List<MovieVO> listMovies2(int articleNO0){
		List<MovieVO> list = new ArrayList<MovieVO>();
		try {
			con = dataFactory.getConnection();
			String query = "select * from practice where articleNO = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, articleNO0);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int articleNO =rs.getInt("articleNO");
				String title = rs.getString("title");
				String title_en = rs.getString("title_en");
				String age = rs.getString("age");
				String opendate = rs.getString("opendate");
				int like_num = rs.getInt("like_num");
				int rate = rs.getInt("rate");
				String explain = rs.getString("explain");
				String director = rs.getString("director");
				String genre = rs.getString("genre");
				String runningtime = rs.getString("runningtime");
				String actor = rs.getString("actor");
				String poster_back = rs.getString("poster_back");
				String poster_main = rs.getString("poster_main");
				MovieVO vo = new MovieVO();
				vo.setArticleNO(articleNO);
				vo.setTitle(title);
				vo.setTitle_en(title_en);
				vo.setAge(age);
				vo.setOpendate(opendate);
				vo.setLike_num(like_num);
				vo.setRate(rate);
				vo.setExplain(explain);
				vo.setDirector(director);
				vo.setGenre(genre);
				vo.setRunningtime(runningtime);
				vo.setActor(actor);
				vo.setPoster_back(poster_back);
				vo.setPoster_main(poster_main);
				
				list.add(vo);
			}
			con.close();
			rs.close();
			pstmt.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

//	영화 개수 출력
	public List<MovieVO> movie_count(){
		List<MovieVO> list = new ArrayList<MovieVO>();
		try {
			con = dataFactory.getConnection();
			String query = "select count(*) as count from practice";
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int count = rs.getInt("count");
				MovieVO vo = new MovieVO();
				vo.setCount(count);
				list.add(vo);
			}
			con.close();
			rs.close();
			pstmt.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
//	영화 추가
	public void addMoive(MovieVO movieVO) {
		try {
			con = dataFactory.getConnection();

			String getTitle = movieVO.getTitle();
			String getTitle_en = movieVO.getTitle_en();
			String getAge = movieVO.getAge();
			String getOpendate = movieVO.getOpendate();
			String getExplain = movieVO.getExplain();
			String getDirector = movieVO.getDirector();
			String getGenre = movieVO.getGenre();
			String getRunningtime = movieVO.getRunningtime();
			String getActor = movieVO.getActor();
			String getPoster_back = movieVO.getPoster_back();
			String getPoster_main = movieVO.getPoster_main();
        	String query = "insert into practice ";
        	query += " (title, title_en, age, opendate, explain, director, genre, runningtime, actor, poster_back, poster_main)";
        	query += " values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        	pstmt = con.prepareStatement(query);
        	pstmt.setString(1, getTitle);
        	pstmt.setString(2, getTitle_en);
        	pstmt.setString(3, getAge);
        	pstmt.setString(4, getOpendate);
        	pstmt.setString(5, getExplain);
        	pstmt.setString(6, getDirector);
        	pstmt.setString(7, getGenre);
        	pstmt.setString(8, getRunningtime);
        	pstmt.setString(9, getActor);
        	pstmt.setString(10, getPoster_back);
        	pstmt.setString(11, getPoster_main);
        	pstmt.executeUpdate();
        	pstmt.close();
		
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

//	영화 정보 수정
	public void updateMovie(MovieVO movieVO) {
		try {
			con = dataFactory.getConnection();
			String query = "update practice set title=?, title_en=?, age=?, "
					+ "like_num=null, rate=NULL, opendate=?, explain=?, "
					+ "director=?, genre=?, runningtime=?, actor=?, "
					+ "poster_back=?, poster_main=?";
			query += " where title=?";
			pstmt = con.prepareStatement(query);
			String getTitle = movieVO.getTitle();
			String getTitle_en = movieVO.getTitle_en();
			String getAge = movieVO.getAge();
			String getOpendate = movieVO.getOpendate();
			String getExplain = movieVO.getExplain();
			String getDirector = movieVO.getDirector();
			String getGenre = movieVO.getGenre();
			String getRunningtime = movieVO.getRunningtime();
			String getActor = movieVO.getActor();
			String getPoster_back = movieVO.getPoster_back();
			String getPoster_main = movieVO.getPoster_main();
	    	
			pstmt.setString(1, getTitle);
	    	pstmt.setString(2, getTitle_en);
	    	pstmt.setString(3, getAge);
	    	pstmt.setString(4, getOpendate);
	    	pstmt.setString(5, getExplain);
	    	pstmt.setString(6, getDirector);
	    	pstmt.setString(7, getGenre);
	    	pstmt.setString(8, getRunningtime);
	    	pstmt.setString(9, getActor);
	    	pstmt.setString(10, getPoster_back);
	    	pstmt.setString(11, getPoster_main);
	    	pstmt.setString(12, getTitle);
			pstmt.executeUpdate();
			pstmt.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
//  영화 정보 삭제
	public void delMovie(String title) {
		try {
			con = dataFactory.getConnection();
			System.out.println("삭제: "+title);
			String query = "delete from practice where title = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
//	좋아요 눌렀을때 1추가
	public void update_Like(int like_num){
		String query = "update practice set like_num=like_num+1 where like_num=?";

		try{
			con = dataFactory.getConnection();
			pstmt = con.prepareStatement(query);  // '?'바인드를 사용해서 sql문을 효과 적으로 사용할수있음
			pstmt.setInt(1,like_num);
			pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}	
	}
	
//	좋아요 개수 출력
	public int select_Like(int like_num){
		String query = "select like_num from practice where like_num=?";
		
		int like=0;
		try{
			con = dataFactory.getConnection();
			pstmt = con.prepareStatement(query);  // '?'바인드를 사용해서 sql문을 효과 적으로 사용할수있음
			pstmt.setInt(1,like_num);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				like = rs.getInt("like_num");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return like;
	}
	

	
	public MovieVO selectArticle(int articleNO) {
		MovieVO article = new MovieVO();
		
		try {
			con = dataFactory.getConnection();
			String query = "select * from practice where articleNO=?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int articleNO1 = rs.getInt("articleNO");
			String title = rs.getString("title");
			String title_en = rs.getString("title_en");
			String age = rs.getString("age");
			String opendate = rs.getString("opendate");
			int like_num = rs.getInt("like_num");
			int rate = rs.getInt("rate");
			String explain = rs.getString("explain");
			String director = rs.getString("director");
			String genre = rs.getString("genre");
			String runningtime = rs.getString("runningtime");
			String actor = rs.getString("actor");
			String poster_back = rs.getString("poster_back");
			String poster_main = rs.getString("poster_main");
			
			article.setArticleNO(articleNO1);
			article.setTitle(title);
			article.setTitle_en(title_en);
			article.setAge(age);
			article.setOpendate(opendate);
			article.setLike_num(like_num);
			article.setRate(rate);
			article.setExplain(explain);
			article.setDirector(director);
			article.setGenre(genre);
			article.setRunningtime(runningtime);
			article.setActor(actor);
			article.setPoster_back(poster_back);
			article.setPoster_main(poster_main);
			
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return article;
	}
	

	
//	댓글 전체 출력
	
//	public List<MovieVO> comment_list(){
//		List<MovieVO> list = new ArrayList<MovieVO>();
//		
//		try {
//			con = dataFactory.getConnection();
////			String query = "SELECT "
////					+ "	LEVEL, "
////					+ "	commentNO, "
////					+ "	parentNO, "
////					+ "	comment_id, "
////					+ "	LPAD(' ', 4*(LEVEL-1)) || comment_text AS comment_text "
////					+ "	FROM comment_1 "
////					+ "START WITH parentNO=0 "
////					+ "CONNECT BY PRIOR commentNO = parentNO "
////					+ "ORDER SIBLINGS BY commentNO DESC";
//			String query = "SELECT * FROM ("
//					+ "	SELECT rownum AS recnum, lvl, commentNO, parentNO, comment_text, comment_id"
//					+ "	FROM (SELECT LEVEL AS lvl, commentNO, parentNO, comment_text, comment_id "
//					+ "			FROM COMMENT_1"
//					+ "			START WITH parentNO=0"
//					+ "			CONNECT BY PRIOR commentNO = parentNO"
//					+ "			ORDER SIBLINGS BY commentNO DESC))"
//					+ " WHERE recnum BETWEEN (?-1)*100 + (?-1)*10+1 AND (?-1)*100+?*10";
//			pstmt = con.prepareStatement(query);
//			ResultSet rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				int level = rs.getInt("level");
//				int commentNO = rs.getInt("commentNO");
//				int parentNO = rs.getInt("parentNO");
//				String comment_text =rs.getString("comment_text");
//				String comment_id =rs.getString("comment_id");
//				MovieVO vo = new MovieVO();
//				vo.setLevel(level);
//				vo.setCommentNO(commentNO);
//				vo.setParentNO(parentNO);
//				vo.setComment_text(comment_text);
//				vo.setComment_id(comment_id);
//				list.add(vo);
//			}
//			con.close();
//			rs.close();
//			pstmt.close();
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
	
//	댓글 정보 출력
	public List<MovieVO> comment_list(){
		List<MovieVO> list = new ArrayList<MovieVO>();
		try {
			con = dataFactory.getConnection();
			String query = "SELECT "
					+ "	LEVEL, "
					+ "	commentNO, "
					+ "	parentNO, "
					+ "	comment_id, "
					+ "	LPAD(' ', 4*(LEVEL-1)) || comment_text AS comment_text, "
					+ "	comment_rate"
					+ "	FROM comment_1 "
					+ "START WITH parentNO=0 "
					+ "CONNECT BY PRIOR commentNO = parentNO "
					+ "ORDER SIBLINGS BY commentNO DESC";
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int level = rs.getInt("level");
				int commentNO = rs.getInt("commentNO");
				int parentNO = rs.getInt("parentNO");
				String comment_text =rs.getString("comment_text");
				String comment_id =rs.getString("comment_id");
				int comment_rate =rs.getInt("comment_rate");
				MovieVO vo = new MovieVO();
				vo.setLevel(level);
				vo.setCommentNO(commentNO);
				vo.setParentNO(parentNO);
				vo.setComment_text(comment_text);
				vo.setComment_id(comment_id);
				vo.setComment_rate(comment_rate);
				list.add(vo);
			}
			con.close();
			rs.close();
			pstmt.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
//	글번호 출력을 위한 최댓값구하는 메소드 (댓글 구현시 필요)
	private int getNewCommentNO() {
		try {
			con = dataFactory.getConnection();
			String query = "select max(commentNO) from comment_1";
			pstmt=con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
				return (rs.getInt(1) + 1);
			rs.close();
			con.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
//	댓글 정보 추가
	public void upComment(String comment_text, String comment_id, String comment_rate) {
		try {
			con = dataFactory.getConnection();
        	String query = "INSERT INTO comment_1 (commentNO, parentNO, comment_id, comment_text, comment_rate) VALUES (?, 0, ?, ?, ?)";
        	pstmt = con.prepareStatement(query);
        	int commentNO = getNewCommentNO();
        	
        	System.out.println(commentNO);
        	pstmt = con.prepareStatement(query);
        	pstmt.setInt(1, commentNO);
        	pstmt.setString(2, comment_id);
        	pstmt.setString(3, comment_text);
        	pstmt.setString(4, comment_rate);
        	pstmt.executeUpdate();
        	pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

//	대댓글 정보 추가
	public void upComment2(int commetNO2, String comment_text, String comment_id) {
		try {
			con = dataFactory.getConnection();
        	String query = "INSERT INTO comment_1 (commentNO, parentNO, comment_id, comment_text) VALUES (?, ?, ?, ?)";
        	pstmt = con.prepareStatement(query);
        	int commentNO = getNewCommentNO();
        	
        	System.out.println(commentNO);
        	int parentNO = commetNO2;
        	pstmt = con.prepareStatement(query);
        	pstmt.setInt(1, commentNO);
        	pstmt.setInt(2, parentNO);
        	pstmt.setString(3, comment_id);
        	pstmt.setString(4, comment_text);
        	pstmt.executeUpdate();
        	pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
//	페이징 메소드 오버라이드
	public List<MovieVO> listMovies(Map<String, Integer> pagingMap){
		List<MovieVO> articlesList = new ArrayList<MovieVO>();
		int section = (Integer) pagingMap.get("section");
		int pageNum = (Integer) pagingMap.get("pageNum");
		try {
			con = dataFactory.getConnection();
			String query = "SELECT * FROM ("
					+ "	SELECT rownum AS recnum, lvl, commentNO, parentNO, comment_text, comment_id, comment_rate"
					+ "	FROM (SELECT LEVEL AS lvl, commentNO, parentNO, comment_text, comment_id, comment_rate "
					+ "			FROM COMMENT_1"
					+ "			START WITH parentNO=0"
					+ "			CONNECT BY PRIOR commentNO = parentNO"
					+ "			ORDER SIBLINGS BY commentNO DESC))"
					+ " WHERE recnum BETWEEN (?-1)*100 + (?-1)*10+1 AND (?-1)*100+?*10";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, section);
			pstmt.setInt(2, pageNum);
			pstmt.setInt(3, section);
			pstmt.setInt(4, pageNum);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int level = rs.getInt("lvl");
				int commentNO = rs.getInt("commentNO");
				int parentNO = rs.getInt("parentNO");
				String comment_text = rs.getString("comment_text");
				System.out.println(comment_text);
				String comment_id = rs.getString("comment_id");
				int comment_rate = rs.getInt("comment_rate");
				
				MovieVO vo = new MovieVO();
				vo.setCommentNO(commentNO);
				vo.setParentNO(parentNO);
				vo.setComment_text(comment_text);
				vo.setComment_id(comment_id);
				vo.setComment_rate(comment_rate);
				articlesList.add(vo);
			}
			con.close();
			rs.close();
			pstmt.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return articlesList;
	}
	
//	(페이징 기능) 댓글 개수 구하기
	public int selectTotArticles() {
		try {
			con = dataFactory.getConnection();
			String query = "select count(commentNO) from comment_1";
			pstmt=con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next())
				return (rs.getInt(1));
			rs.close();
			pstmt.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
//	검색(수정예정)
	public List<MovieVO> searchMovies(String search_text){
		List<MovieVO> list = new ArrayList<MovieVO>();
		try {
			con = dataFactory.getConnection();
			String query = "select title from practice where title = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, search_text);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String title = rs.getString("title");
				MovieVO vo = new MovieVO();
				vo.setTitle(title);
				list.add(vo);
			}
			con.close();
			rs.close();
			pstmt.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
}

