package team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public BoardDAO() {
		
		try {
			// 커넥션풀 세팅; DB 접속과 관련 됨
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env"); // JNDI 사용을 위한 설정
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle4");
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}

	public List<ArticleVO> selectAllArticles(){
		List<ArticleVO> list = new ArrayList<ArticleVO>();
		
		try {
			
			String query = "";
			query += " WITH board_recu (lv, articleno, parentno, title, content, writedate, imagefilename, id,n) AS (";
			query += " 	SELECT";
			query += " 		1 AS lv,";
			query += " 		articleno,";
			query += " 		parentno,";
			query += " 		title,";
			query += " 		content,";
			query += " 		writedate,";
			query += " 		imagefilename,";
			query += " 		id,";
			query += " 		n";
			query += " 	FROM t_board";
			query += " 	WHERE n = 1";
			query += " 	UNION ALL";
			query += " 	SELECT";
			query += " 		br.lv + 1 AS lv,";
			query += " 		t.articleno,";
			query += " 		t.parentno,";
			query += " 		t.title,";
			query += " 		t.content,";
			query += " 		t.writedate,";
			query += " 		t.imagefilename,";
			query += " 		t.id,";
			query += " 		t.n";
			query += " 	FROM board_recu br";
			query += " 	LEFT OUTER JOIN t_board t ON t.parentno = br.articleno";
			query += " 	WHERE t.n != 2";
			query += " )";
			query += " SEARCH DEPTH FIRST BY articleno desc SET sort_ano \n";
			query += " SELECT * FROM board_recu \n";
			query += " ORDER BY sort_ano";
			
			con = dataFactory.getConnection();
			pstmt = new LoggableStatement(con, query);
			System.out.println(  ((LoggableStatement)pstmt).getQueryString()  );
			ResultSet rs = pstmt.executeQuery();
			while( rs.next() ) {
				ArticleVO vo = new ArticleVO();
				vo.setLevel( 			rs.getInt("lv") 				);
				vo.setArticleNO( 		rs.getInt("articleno") 			);
				vo.setParentNO( 		rs.getInt("PARENTNO") 			);
				vo.setN( 		        rs.getInt("N") 		        	);
				vo.setTitle( 			rs.getString("title") 			);
				vo.setContent( 			rs.getString("content") 		);
				vo.setImageFileName( 	rs.getString("imagefilename") 	);
				vo.setId( 				rs.getString("id") 				);
				vo.setWriteDate( 		rs.getDate("writedate") 		);
				
				list.add(vo);
			}
			
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// Qna 페이지
	public List<ArticleVO> selectAllArticles1(){
		List<ArticleVO> list = new ArrayList<ArticleVO>();
		
		try {
			
			String query = "";
			query += " WITH board_recu (lv, articleno, parentno, title, content, writedate, imagefilename, id,n) AS (";
			query += " 	SELECT";
			query += " 		1 AS lv,";
			query += " 		articleno,";
			query += " 		parentno,";
			query += " 		title,";
			query += " 		content,";
			query += " 		writedate,";
			query += " 		imagefilename,";
			query += " 		id,";
			query += " 		n";
			query += " 	FROM t_board";
			query += " 	WHERE n = 2";
			query += " 	UNION ALL";
			query += " 	SELECT";
			query += " 		br.lv + 1 AS lv,";
			query += " 		t.articleno,";
			query += " 		t.parentno,";
			query += " 		t.title,";
			query += " 		t.content,";
			query += " 		t.writedate,";
			query += " 		t.imagefilename,";
			query += " 		t.id,";
			query += " 		t.n";
			query += " 	FROM board_recu br";
			query += " 	LEFT OUTER JOIN t_board t ON t.parentno = br.articleno";
			query += " 	WHERE t.n != 1";
			query += " )";
			query += " SEARCH DEPTH FIRST BY articleno desc SET sort_ano \n";
			query += " SELECT * FROM board_recu \n";
			query += " ORDER BY sort_ano";
			
			con = dataFactory.getConnection();
			pstmt = new LoggableStatement(con, query);
			System.out.println(  ((LoggableStatement)pstmt).getQueryString()  );
			ResultSet rs = pstmt.executeQuery();
			while( rs.next() ) {
				ArticleVO vo = new ArticleVO();
				vo.setLevel( 			rs.getInt("lv") 				);
				vo.setArticleNO( 		rs.getInt("articleno") 			);
				vo.setParentNO( 		rs.getInt("PARENTNO") 			);
				vo.setN( 		        rs.getInt("N") 		        	);
				vo.setTitle( 			rs.getString("title") 			);
				vo.setContent( 			rs.getString("content") 		);
				vo.setImageFileName( 	rs.getString("imagefilename") 	);
				vo.setId( 				rs.getString("id") 				);
				vo.setWriteDate( 		rs.getDate("writedate") 		);
				
				list.add(vo);
			}
			
			rs.close();
			pstmt.close();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
	
	public void insertNewArticle(ArticleVO article){
		
		try {
			
			String query = "";
			query += " insert into t_board (articleno, parentno, title, content, id,n, writdate)";
			query += " values(t_board_seq.nextval, ?, ?, ?, ?, ?, ?)";

			con = dataFactory.getConnection();
			pstmt = new LoggableStatement(con, query);
			pstmt.setInt(1, article.getParentNO());
			pstmt.setInt(5, article.getN());
			pstmt.setString(2, article.getTitle());
			pstmt.setString(3, article.getContent());
			pstmt.setString(4, article.getId());
			pstmt.setDate(6, article.getWriteDate());
			System.out.println(  ((LoggableStatement)pstmt).getQueryString()  );
			
			int result = pstmt.executeUpdate();
			System.out.println("insertNewArticle : insert 결과 : "+ result);
			
			pstmt.close();
			con.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArticleVO selectArticle(int aNO) {
		ArticleVO vo = null;
		
		try {
			
			String query = "";
			query += " select * from t_board";
			query += " where articleno = ?";

			con = dataFactory.getConnection();
			pstmt = new LoggableStatement(con, query);
			
			pstmt.setInt(1, aNO);
			
			System.out.println(  ((LoggableStatement)pstmt).getQueryString()  );
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new ArticleVO();
				
				vo.setArticleNO( 		rs.getInt("articleno") 			);
				vo.setParentNO( 		rs.getInt("parentno") 			);
				vo.setN( 		        rs.getInt("N") 			        );
				vo.setTitle( 			rs.getString("title") 			);
				System.out.println("vo.getTitle : "+ vo.getTitle());
				vo.setContent( 			rs.getString("content") 		);
				vo.setImageFileName( 	rs.getString("imagefilename") 	);
				vo.setId( 				rs.getString("id") 				);
				vo.setWriteDate( 		rs.getDate("writedate") 		);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	
	// 수정기능과 삭제 기능 입니다
	
	public void addMember(ArticleVO vo) {
		try {
			int articleNO = vo.getArticleNO();
			String id = vo.getId();
			String title = vo.getTitle();
			String content = vo.getContent();
			
			
			// DB 접속
			con = dataFactory.getConnection();
			
			// SQL 준비
			String query = " insert into t_member";
			query 		+= " (id, articleNO, title, content)"; 
			query 		+= " values (?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, id);
			pstmt.setInt(2, articleNO);
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			
			// SQL 실행
			int result = pstmt.executeUpdate();
			
			// SQL 실행 결과 활용
			System.out.println("excuteUpdate 결과 : "+ result);
			
			pstmt.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delMember(int articleNO) {
		
		try {
			// DB 접속
			con = dataFactory.getConnection();
			
			// SQL 준비
			String query = " delete from t_board";
			query += 	   " where articleNO = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, articleNO);
			
			// SQL 실행
			int result = pstmt.executeUpdate();
			// 실행 결과 활용
			System.out.println("삭제 결과 : "+ result);
			
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	// 업데이트 (수정 기능)
	public void update(ArticleVO vo) {
		
		try {
			
			int articleNO = vo.getArticleNO();
//			int parentNO = vo.getParentNO();
			String title = vo.getTitle();
			String content = vo.getContent();
			String id = vo.getId();
			System.out.println("articleNO :"+articleNO);
//			System.out.println("parentNO :"+parentNO);
			System.out.println("title :"+title);
			System.out.println("contnet :"+content);
			System.out.println("id :"+id);
			
			// DB 접속
			con = dataFactory.getConnection();
			
			//SQL 준비
			/* UPDATE T_BOARD 
			SET articleno = '20',
				title = '삭제예정'
				WHERE articleNO = 62;
			*/
			String query =" UPDATE t_board ";
			query +=      "        set id = ?";
			query +=      "        ,title = ?";
			query +=      "      ,content = ?";
			query +=      "      where articleNO = ?";
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(4, articleNO);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(1, id);
			
			// SQL 실행
			int result = pstmt.executeUpdate();
			System.out.println("executeUpdate 결과 : "+ result);
			
			pstmt.close();
			con.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//	public List<ArticleVO> selectPagingList(int start, int end){
//		List<ArticleVO> list = new ArrayList<ArticleVO>();
//		
//		try {
//			
//			String query = "";
//			query += "select t2.* from (";
//			query += "select rownum as rnum, t1.* from (";
//			query += " WITH board_recu (lv, articleno, parentno, title, content, writedate, imagefilename, id) AS (";
//			query += " 	SELECT";
//			query += " 		1 AS lv,";
//			query += " 		articleno,";
//			query += " 		parentno,";
//			query += " 		title,";
//			query += " 		content,";
//			query += " 		writedate,";
//			query += " 		imagefilename,";
//			query += " 		id";
//			query += " 	FROM t_board";
//			query += " 	WHERE parentno = 0";
//			query += " 	UNION ALL";
//			query += " 	SELECT";
//			query += " 		br.lv + 1 AS lv,";
//			query += " 		t.articleno,";
//			query += " 		t.parentno,";
//			query += " 		t.title,";
//			query += " 		t.content,";
//			query += " 		t.writedate,";
//			query += " 		t.imagefilename,";
//			query += " 		t.id";
//			query += " 	FROM board_recu br";
//			query += " 	LEFT OUTER JOIN t_board t ON t.parentno = br.articleno";
//			query += " 	WHERE t.parentno != 0";
//			query += " )";
//			query += " SEARCH DEPTH FIRST BY articleno SET sort_ano\n";
//			query += " SELECT * FROM board_recu \n";
//			query += " ORDER BY sort_ano";
//			query += " ) t1";
//			query += " ) t2";
//			query += " where rnum >= ? and rnum <= ?";
//
//			con = dataFactory.getConnection();
//			pstmt = new LoggableStatement(con, query);
//			pstmt.setInt(1, start);
//			pstmt.setInt(2, end);
//			System.out.println(  ((LoggableStatement)pstmt).getQueryString()  );
//			
//			ResultSet rs = pstmt.executeQuery();
//			while( rs.next() ) {
//				ArticleVO vo = new ArticleVO();
//				vo.setLevel( 			rs.getInt("lv") 				);
//				vo.setArticleNO( 		rs.getInt("articleno") 			);
//				vo.setParentNO( 		rs.getInt("PARENTNO") 			);
//				vo.setTitle( 			rs.getString("title") 			);
//				vo.setContent( 			rs.getString("content") 		);
//				vo.setImageFileName( 	rs.getString("imagefilename") 	);
//				vo.setId( 				rs.getString("id") 				);
//				vo.setWriteDate( 		rs.getDate("writedate") 		);
//				
//				list.add(vo);
//			}
//			
//			rs.close();
//			pstmt.close();
//			con.close();
//			
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		
//		return list;
//	}
	
	public int selectTotalList(){
		int totalCnt = 0;
		try {
			
			String query = "";
			query += "select count(*) cnt from t_board";
			
			con = dataFactory.getConnection();
			pstmt = new LoggableStatement(con, query);
			System.out.println(  ((LoggableStatement)pstmt).getQueryString()  );
			
			ResultSet rs = pstmt.executeQuery();
			while( rs.next() ) {
				totalCnt = rs.getInt("cnt");
			}
			
			rs.close();
			pstmt.close();
			con.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return totalCnt;
	}
}
	
//	// 수정기능
//	public void updateArticle(ArticleVO article) {
//		int articleNo = article.getArticleNO();
//		String title = article.getTitle();
//		String content = article.getContent();
//		String query ="";
//		
//		try {
//			
//			con = dataFactory.getConnection();
//			
//		System.out.println(query);	
//		pstmt = con.prepareStatement(query);
//		pstmt.setString(1, title);
//		pstmt.setString(2, content);
//		pstmt.setInt(3, articleNo);
//		
//		pstmt.executeUpdate();
//		pstmt.close();
//		con.close();
//		
//		
//			
//		} catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//	}
//	
//
//	}
//
