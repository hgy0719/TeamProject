package gayeong;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CinemaDAO {
	

	private static DataSource dataFactory;
	private static Connection conn;
	private static PreparedStatement pstmt;
	

	// DB 연결
		public CinemaDAO() {
			try {
				Context ctx = new InitialContext();
				Context envContext = (Context) ctx.lookup("java:/comp/env");
				dataFactory = (DataSource) envContext.lookup("jdbc/oracle2");
				
			} catch (NamingException e) {
			
				e.printStackTrace();
			}
			
		}
		
		// 테이블 불러오기 
		public List<CinemaVO> listCinema() {
			
			List<CinemaVO> cinema_list = new ArrayList<CinemaVO>();
			
		
			try {
				conn = dataFactory.getConnection();
				String query = "SELECT * FROM CINEMA_test";
				System.out.println(query);
				pstmt = conn.prepareStatement(query);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					String cinema_id = rs.getString("cinema_id");
					String cinema_name = rs.getString("cinema_name");
					String cinema_area = rs.getString("cinema_area");
					String cinema_image = rs.getString("cinema_image");
					String cinema_area_type = rs.getString("cinema_area_type");
				
					
					CinemaVO cinemaVO = new CinemaVO();
					
					cinemaVO.setCinema_id(cinema_id);
					cinemaVO.setCinema_name(cinema_name);
					cinemaVO.setCinema_area(cinema_area);
					cinemaVO.setCinema_image(cinema_image);
					cinemaVO.setCinema_area_type(cinema_area_type);
				
					cinema_list.add(cinemaVO);
				
				}
				rs.close();
				pstmt.close();
				conn.close();
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			return cinema_list;
		}
		
		
		// 극장 추가(관리자 페이지)
		
		public void addCinema(String cinema_id, String cinema_name, String cinema_area, String cinema_image,String cinema_area_type) {
			CinemaVO cinemavo = new CinemaVO();
		
		try {
			
			
			conn = dataFactory.getConnection();
			
		
			String query = "insert into store2(cinema_id,cinema_name,cinema_area,cinema_image,cinema_area_type)";
				query += " values(?,?,?,?,?)"; 
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, cinema_id);
			System.out.println("** :"+ cinema_id);
			
			pstmt.setString(2, cinema_name);
			pstmt.setString(3, cinema_area);
			pstmt.setString(4, cinema_image);
			pstmt.setString(5, cinema_area_type);
			
			int result = pstmt.executeUpdate();
			System.out.println("수정 결과 : " + result);
			
		
			pstmt.close();
			conn.close();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
		// 극장 페이지 (극장 정보 부분)
		
	public List<CinemaVO> cinema_list () {
		
			List<CinemaVO> cinema_list = new ArrayList<CinemaVO>();
			
			try {
				conn = dataFactory.getConnection();
				String query = "SELECT * from CINEMA_test";
				System.out.println(query);
				
				pstmt = conn.prepareStatement(query);
				
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
				
					String cinema_id = rs.getString("cinema_id");
					String cinema_image =rs.getString("cinema_image");
					String cinema_area_type = rs.getString("cinema_area_type");
					String cinema_area = rs.getString("cinema_area");
					String cinema_name = rs.getString("cinema_name");
					
				
					CinemaVO cinemavo = new CinemaVO();
					
					cinemavo.setCinema_id(cinema_id);
					cinemavo.setCinema_name(cinema_name);
					cinemavo.setCinema_image(cinema_image);
					cinemavo.setCinema_area(cinema_area);
					cinemavo.setCinema_area_type(cinema_area_type);
					
					cinema_list.add(cinemavo);
					
				}
				
				rs.close();
				pstmt.close();
				conn.close();	
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			return cinema_list;
			
			// 해당 지역 -> 극장명 선택시 나오는 페이지
		} // else {
//		
//			List<CinemaVO> cinema_list = new ArrayList<CinemaVO>();
//			
//			try {
//				conn = dataFactory.getConnection();
//				String query = "SELECT * from CINEMA_test where cinema_name = ?";
//				System.out.println(query);
//				
//				pstmt = conn.prepareStatement(query);
//				pstmt.setString(1, cinema_name1);
//				ResultSet rs = pstmt.executeQuery();
//				
//				while(rs.next()) {
//					
//					String cinema_id = rs.getString("cinema_id");
//					String cinema_area = rs.getString("cinema_area");
//					String cinema_image = rs.getString("cinema_image");
//					String cinema_area_type = rs.getString("cinema_area_type");
//					
//					cinema_list.add(new CinemaVO(cinema_id,cinema_name1,cinema_area,cinema_image,cinema_area_type));
//					
//				}
//				
//				
//				rs.close();
//				pstmt.close();
//				conn.close();
//				
//			} catch (SQLException e) {
//				
//				e.printStackTrace();
//			}
//			return cinema_list;
//			
//			}
		}

	

