package seunggi;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;

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
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<movieVO> listMovies(String choicename){
		List<movieVO> list = new ArrayList<movieVO>();
		try {
			con = dataFactory.getConnection();
			String query = "select choicename from movie where choicename=?";
			
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
