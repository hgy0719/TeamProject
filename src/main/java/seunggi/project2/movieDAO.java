package project2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class movieDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public movieDAO() {
		
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	
	}
	public List<movieVO> selectChoiceNames(String choicename){
		
		List<movieVO> list = new ArrayList<movieVO>();
		try {
			con = dataFactory.getConnection();
			String query = "select * from movie where choicename=?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, choicename);
			ResultSet rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				String datename2 = rs.getString("datename");
				String areaname2 = rs.getString("areaname");
				String choicename2 = rs.getString("choicename");
				String pnumname2 = rs.getString("pnumname");
				String aaname2 = rs.getString("aaname");
//				String title2 = rs.getString("title");
				movieVO vo = new movieVO();
				vo.setAreaname2(areaname2);
				vo.setChoicename2(choicename2);
				vo.setPnumname2(pnumname2);
				vo.setAaname2(aaname2);
//				vo.setTitle2(title2);
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
	
	public void insertMovie(movieVO vo) {
		Context ctx;
		try {
			//db접속
			ctx = new InitialContext();
			
			Context envContext = (Context) ctx.lookup("java:/comp/env"); // JNDI 사용을 위한 설정
			DataSource dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
				String sql = "insert into movie (datename,areaname,choicename,timename,pnumname,aaname,writedate) "; //create table 해야함
				sql		  += " values (?,?,?,?,?,?,sysdate)";
	
				Connection con = dataFactory.getConnection();
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, vo.getDatename());
				ps.setString(2, vo.getAreaname());
				ps.setString(3, vo.getChoicename());
				ps.setString(4, vo.getTimename());
				ps.setString(5, vo.getPnumname());
				ps.setInt(6, Integer.parseInt(vo.getPnumname())*10000);
//				ps.setInt(6, vo.getCccname());
				System.out.println("getAaname :"+vo.getAaname());
				//query sql?
				
				//sql 실행
				int result = ps.executeUpdate();
				// 실행 결과를 활용
				System.out.println("insert된 recode의 수 :"+ result);
				
				ps.close();
				con.close();
				
		} catch (Exception e) {
			
			e.printStackTrace();
		} 
	}
		
		public movieVO selectWriteDate() {
			movieVO vo= null;
			
			try {
				con = dataFactory.getConnection();
				String sql = "SELECT * FROM MOVIE \r\n"
						+ "WHERE writedate =(SELECT max(writedate) FROM movie)";
				PreparedStatement ps = con.prepareStatement(sql);
				ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
			
				while( rs.next() ) {
					String datename2 = rs.getString("datename");
					String areaname2 = rs.getString("areaname");
					String choicename2 = rs.getString("choicename");
					String timename2 = rs.getString("timename");
					System.out.println(timename2);
					String pnumname2 = rs.getString("pnumname");
					String aaname2 = rs.getString("aaname");
					
					vo=new movieVO();
					vo.setDatename(datename2);
					vo.setAreaname(areaname2);
					vo.setChoicename(choicename2);
					vo.setTimename(timename2);
					vo.setPnumname(pnumname2);
					vo.setAaname(aaname2);
					
				}
		
			}catch (Exception e) {
				e.printStackTrace();
			}
			return vo;
				
		}
				
}				
//				a.println("<br>날짜 :"+ datename2);
//				a.println("<br>지역 :"+ areaname2);
//				a.println("<br>영화 :"+ choicename2);
//				a.println("<br>상영시간 :"+ timename2);
//				a.println("<br>예매인원 :"+ pnumname2);
//				a.println("<br>가격 :"+ aaname2);

				
				
				
			
			
			
		
	
	
	
	
	
	
	
	
	
	
	
