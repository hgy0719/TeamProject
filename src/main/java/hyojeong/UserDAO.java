package hyojeong;

import java.io.PrintWriter;
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

	public class UserDAO {
		
		public List UserList() {
			List userList = new ArrayList();
					try {
							Context ctx = new InitialContext();
							Context envContext = (Context) ctx.lookup("java:/comp/env"); // JNDI 사용을 위한 설정
							DataSource dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
							Connection con = dataFactory.getConnection();
												
							String sql = " select * from t_member ";							//생성하고
							sql 	  += " order by joindate desc";
							PreparedStatement ps = con.prepareStatement(sql); //준비하고
							ResultSet rs = ps.executeQuery();										//실행하고
						
								while( rs.next() ) {																	//결과처리
									String id = rs.getString("id");
									String pwd = rs.getString("pwd");
									String name = rs.getString("name");
									String number = rs.getString("number");
									String email = rs.getString("email");
									Date joindate = rs.getDate("joindate");
									
									UserVO vo = new UserVO();											//vo을 담고
									vo.setId(id);
									vo.setPwd(pwd);
									vo.setName(name);
									vo.setNumber(number);
									vo.setEmail(email);
									vo.setJoinDate(joindate);
									
									userList.add(vo);														//vo를 List에 담고
								}		
							rs.close();
							ps.close();
							con.close();
								
					} catch(Exception e) {
							e.printStackTrace();
					}
				return userList; 
				}
		}