package UserPage;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
	
	public class UserDAO {
		private Connection con;
		private PreparedStatement pstmt;
		private DataSource dataFactory;

		//DB접속
		public UserDAO() {
			try {
				Context ctx = new InitialContext();
				Context envContext = (Context) ctx.lookup("java:/comp/env");
				dataFactory = (DataSource) envContext.lookup("jdbc/oracle2");
				System.out.println("DB접속 성공");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("DB접속 실패");
			}
		}
		
		//로그인(mvc patter2)
		public boolean loginDAO(String id, String pwd) {
			System.out.println("loginDAO 실행");
			boolean result = false;
			try {
               Connection con = dataFactory.getConnection();
               String query = "SELECT * FROM t_user WHERE id=? AND pwd=?";
               pstmt = con.prepareStatement(query);
               pstmt.setString(1, id);
               pstmt.setString(2, pwd);
               
               ResultSet rs = pstmt.executeQuery();
               	if(rs.next()){
               		result = true;
               	}
               pstmt.close();
               con.close();
               rs.close();
            } catch (SQLException e) {
            	System.out.println("UserDAO의");
               e.printStackTrace();
            }
            return result;
	}
				
		//회원가입(mvc pattern2)
		public void addUser(UserVO m) {
			try {
				Connection con = dataFactory.getConnection();
				String id = m.getId();
				String pwd = m.getPwd1();
				String name = m.getName();
				String email = m.getEmail();
				String query = "insert into t_user";
				query += " (id,pwd,name,email)";
				query += " values(?,?,?,?)";
				System.out.println("prepareStatememt: " + query);
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, id);
				pstmt.setString(2, pwd);
				pstmt.setString(3, name);
				pstmt.setString(4, email);
				pstmt.executeUpdate(); 
				//executeUpdate: 반환타입int, 데이터를 추가(Insert), 삭제(Delete), 수정(Update)하는 SQL 문을 실행
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//회원가입 정보를 가지고 UserList 생성(UserAction.jsp)
		public List<UserVO> listUser( ) {
			System.out.println("UserDAO의 listUser를 실행함");
			List<UserVO> list = new ArrayList<UserVO>();
			try {
				Connection con = dataFactory.getConnection();
				String query = "select * from t_user order by name desc";
				System.out.println("prepareStatememt: " + query);
				pstmt = con.prepareStatement(query);
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					String id = rs.getString("id");
					String pwd = rs.getString("pwd");
					String name = rs.getString("name");
					String email = rs.getString("email");
					UserVO vo = new UserVO();
					vo.setId(id);
					vo.setPwd(pwd);
					vo.setName(name);
					vo.setEmail(email);
					list.add(vo);
				}
				rs.close();
				pstmt.close();
				con.close();
			} catch (Exception e) {
				System.out.println("UserDAO listUser 오류");
				e.printStackTrace();
			}
			return list;
		}
		
		//회원가입 중복확인
//		public boolean overlappedID(String id){
//			boolean result = false;
//			try {
//				con = dataFactory.getConnection();
//				String query = "select decode(count(*),1,'true','false') as result from t_user";
//				query += " where id=?";
//				System.out.println("prepareStatememt: " + query);
//				pstmt = con.prepareStatement(query);
//				pstmt.setString(1, id);
//				ResultSet rs = pstmt.executeQuery();
//				rs.next();
//				result = Boolean.parseBoolean(rs.getString("result"));
//				pstmt.close();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			
//			return result;
//		}



				
}