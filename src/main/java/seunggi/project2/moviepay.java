package seunggi.project2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;




@WebServlet("/moviepay")
public class moviepay extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8;");
		PrintWriter out = response.getWriter();
		
		String datename = request.getParameter("datename");
		System.out.println("날짜 : "+ datename);
		String areaname = request.getParameter("areaname");
		System.out.println("지역 : "+ areaname);
		String choicename = request.getParameter("choicename");
		System.out.println("영화 : "+ choicename);
		String timename = request.getParameter("timename");
		System.out.println("시간 : "+ timename);
		String pnumname = request.getParameter("pnumname");
		System.out.println("인원수 : "+ pnumname);
		String aaname = request.getParameter("aaname");
		int aaa = Integer.parseInt(pnumname);
		int bbb = Integer.parseInt(aaname);
		int ccc = aaa*bbb;
		System.out.println("영화결제 금액 : "+ aaa*bbb);
//		String title = request.getParameter("title");
	
//		String title = request.getParameter("title");
//		System.out.println("영화 : "+ title);
		//db기록
		Context ctx;
		try {
			//db접속
			ctx = new InitialContext();
			
			Context envContext = (Context) ctx.lookup("java:/comp/env"); // JNDI 사용을 위한 설정
			DataSource dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
			Connection con = dataFactory.getConnection();
			
//		<img src="<%=asljdfljaslfdaoslfd%>"	
			//sql 준비
			String sql = "insert into movie (datename,areaname,choicename,timename,pnumname,aaname) "; //create table 해야함
			sql		  += " values (?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, datename);
			ps.setString(2, areaname);
			ps.setString(3, choicename);
			ps.setString(4, timename);
			ps.setString(5, pnumname);
			ps.setInt(6, ccc);
//			ps.setString(7, title);
		
			
			//sql 실행
			int result = ps.executeUpdate();
			// 실행 결과를 활용
			System.out.println("insert된 recode의 수 :"+ result);
			
			ps.close();
			con.close();
			
			con = dataFactory.getConnection();
			sql = "select * from movie";
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			PrintWriter a = response.getWriter();
			while( rs.next() ) {
				String datename2 = rs.getString("datename");
				String areaname2 = rs.getString("areaname");
				String choicename2 = rs.getString("choicename");
				String timename2 = rs.getString("timename");
				String pnumname2 = rs.getString("pnumname");
				String aaname2 = rs.getString("aaname");
//				String title2 = rs.getString("title");
				
				
				
				
				
//				String image2 = rs.getString("image");
				
				a.println("<br>datename :"+ datename2);
				a.println("<br>areaname :"+ areaname2);
				a.println("<br>choicename :"+ choicename2);
				a.println("<br>timename :"+ timename2);
				a.println("<br>pnumname :"+ pnumname2);
				a.println("<br>aaname :"+ aaname2);
//				a.println("<br>title2 :"+ title2);
				
//				a.println("<div><img src=\"https://t1.daumcdn.net/movie/d331d74e425a3c71989ab14d9cbe83241377daa5\"></div>");
				
				a.println("<hr>");
//				if(title.equals("교섭")){
//					title = "https://t1.daumcdn.net/movie/d331d74e425a3c71989ab14d9cbe83241377daa5";
//				} else if (title.equals("아바타")){
//					title = "https://w.namu.la/s/e4518552dff291d24661ea0694b239fb1c7421a2f60152da3534456514a68184aabb58498e1e28e126f555735af6eef4dd8b0a3ae7394169f2bc5288a3ad9e28ce12c27fa4c3ddfa62f20a428e8b0cd99b399559775ab1f2b2730730edaed985316ccf1e1cbbc02e5471aa6364c10a78";
//				} else if (title.equals("덩크")){
//					title = "https://w.namu.la/s/e9087ce212e90a308f001d76c120a00e48964393021393c7c7af8181c8b47ec4d44e44591a009fb37146c924ec20d2c6505795e83b270d66d53e774d9e44a6c37613dcb27b4dbcc7ad11e4673be0b4bfa844a7232cc534d5b1ab2ee357e66535";
//				} else if (title.equals("유령")){
//					title = "https://t1.daumcdn.net/movie/04a53a2b94d62ba8a1fabd956545cda3d4d3a500";
//				}
			}
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("/project1/moviepay.html");
	}


	

}
