package UserPage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MyPageDAO {

	//회원정보 수정
	public int changeInfor(UserVO user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = -1;
		
		try {
			conn = dataFactory.getConnection();
			String query = "SELECT * FROM USER SET pwd=?, name=?, email=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getPwd());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getEmail());
			result = pstmt.executeUpdate(); //int 값
		
			pstmt.close();
			conn.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return result;

}
	//회원 탈퇴
	public int deleteUser(String id, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		
		try {
			conn = dataFactory.getConnection();
			String query = "SELECT * FROM USER WHERE id=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
				if (rs.next()) {
					String dbpwd = rs.getString(pwd);
					if(dbpwd.equals(pwd)) {
						query="DELETE FROM USER WHER id=?";
						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, id);
						result = pstmt.executeUpdate(); 
					}else {
						result = 0;
					}
				}
			pstmt.close();
			conn.close();
			rs.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
public class MyPageDAO {

}
