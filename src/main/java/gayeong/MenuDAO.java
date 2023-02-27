package gayeong;

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

public class MenuDAO {
	
	private static DataSource dataFactory;
	private static Connection conn;
	private static PreparedStatement pstmt;
	
	// DB 연결
	public MenuDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle2");
			
		} catch (NamingException e) {
		
			e.printStackTrace();
		}
		
	}

	// 테이블 불러오기
	public List<MenuVO> listMenu() {
		
		List<MenuVO> menu_list = new ArrayList<MenuVO>();
		
	
		try {
			conn = dataFactory.getConnection();
			String query = "SELECT * FROM store2 "
					+ "ORDER BY MENU_TYPE";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				String menu_id = rs.getString("menu_id");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String image = rs.getString("image");
				int menu_type = rs.getInt("menu_type");
				
				
			
				
				MenuVO menuVO = new MenuVO();
				
				menuVO.setMenu_id(menu_id);
				menuVO.setName(name);
				menuVO.setPrice(price);
				menuVO.setImage(image);
				menuVO.setMenu_type(menu_type);
				
				
				menu_list.add(menuVO);
			
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return menu_list;
	}

	// 메뉴 추가
	
	public void addMenu(String menu_id, String name, int price, String image, int menu_type) {
			MenuVO menuvo = new MenuVO();
		
		try {
			
			
			conn = dataFactory.getConnection();
			
		
			String query = "insert into store2(menu_id,name,price,image,menu_type)";
				query += " values(?,?,?,?,?)"; 
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, menu_id);
			System.out.println("** :"+ menu_id);
			
			pstmt.setString(2, name);
			pstmt.setInt(3, price);
			pstmt.setString(4, image);
			pstmt.setInt(5, menu_type);
			
			int result = pstmt.executeUpdate();
			System.out.println("수정 결과 : " + result);
			
		
			pstmt.close();
			conn.close();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	// 정보 조회
	public static MenuVO findMenu(String menu_name) {
		
		MenuVO menuInfo = null;
		
		try {
			conn = dataFactory.getConnection();
			String query = "SELECT * from store2 where menu_id = ? "; 
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, menu_name);
			
			System.out.println(query);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			
			String menu_id = rs.getString("menu_id");
			String name = rs.getString("name");
			int price = rs.getInt("price");
			String image = rs.getString("image");
			int menu_type = rs.getInt("menu_type");
			
			menuInfo = new MenuVO(menu_id,name,price,image,menu_type);
			
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return menuInfo;
	}

	// 메뉴 수정
	public void modMenu(MenuVO menuvo) {
		
		String menu_id = menuvo.getMenu_id();
		String name = menuvo.getName();
		int price = menuvo.getPrice();
		String image = menuvo.getImage();
		int menu_type = menuvo.getMenu_type();
		
		try {
			conn = dataFactory.getConnection();
			String query = "update store2 set name=?, price=?, image=?, menu_type=?";
				query += " where menu_id = ? ";
			System.out.println(query);
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, image);
			pstmt.setInt(4, menu_type);
			pstmt.setString(5, menu_id);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	
		
		
	}
	// 메뉴 삭제
	public void delMenu(String menu_id) {
		
		try {
			conn = dataFactory.getConnection();
			String query = "delete from store2 where menu_id = ?";
			System.out.println(query);
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, menu_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	
	
	// 스토어 -> 스낵창 (menu_type = 10)
	
	public static List<MenuVO> store_snack(int menu_type_) {
		
		List<MenuVO> snack_list = new ArrayList<MenuVO>();
		
		try {
			conn = dataFactory.getConnection();
			String query = "SELECT NAME , price, IMAGE,menu_id  from store2 where MENU_TYPE = ?";
			System.out.println(query);
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, menu_type_);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String image = rs.getString("image");
				String menu_id = rs.getString("menu_id");
				snack_list.add(new MenuVO(name,price,image,menu_id));
				
			}

//			snack_list = (List<MenuVO>) new MenuVO(name,price,image);
			
			
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return snack_list;
		
	}
			
	// 스토어 -> 음료창 (menu_type = 20)
	
	public static List<MenuVO> store_drink(int menu_type_) {
		
		List<MenuVO> drink_list = new ArrayList<MenuVO>();
		
		try {
			conn = dataFactory.getConnection();
			String query = "SELECT NAME , price, IMAGE, menu_id  from store2 where MENU_TYPE = ?";
			System.out.println(query);
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, menu_type_);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String name = rs.getString("name");
				int price = rs.getInt("price");
				String image = rs.getString("image");
				String menu_id = rs.getString("menu_id");
				drink_list.add(new MenuVO(name,price,image,menu_id));
				
			}
		
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		  return drink_list;	
	
	}		
	
		// 스토어 -> 음료 메뉴 3개만
//	public static List<MenuVO> store_drink3(int menu_type_) {
//		
//		List<MenuVO> drink_list3 = new ArrayList<MenuVO>();
//		
//		try {
//			conn = dataFactory.getConnection();
//			String query = "SELECT NAME , price, IMAGE, menu_id  from store2 where MENU_TYPE = ?";
//			System.out.println(query);
//			
//			pstmt = conn.prepareStatement(query);
//			pstmt.setInt(1, menu_type_);
//			ResultSet rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				String name = rs.getString("name");
//				int price = rs.getInt("price");
//				String image = rs.getString("image");
//				String menu_id = rs.getString("menu_id");
//				drink_list3.add(new MenuVO(name,price,image,menu_id));
//				
//			}
//		
//			rs.close();
//			pstmt.close();
//			conn.close();
//			
//		} catch (SQLException e) {
//			
//			e.printStackTrace();
//		}
//		  return drink_list3;	
//	
//	}	
//	
	
		// 스토어 -> 영화관람권창 (menu_type = 30)
	
			public static List<MenuVO> store_card(int menu_type_) {
				
				List<MenuVO> card_list = new ArrayList<MenuVO>();
				
				try {
					conn = dataFactory.getConnection();
					String query = "SELECT NAME , price, IMAGE,menu_id from store2 where MENU_TYPE = ?";
					System.out.println(query);
					
					pstmt = conn.prepareStatement(query);
					pstmt.setInt(1, menu_type_);
					ResultSet rs = pstmt.executeQuery();
					
					while(rs.next()) {
						String name = rs.getString("name");
						int price = rs.getInt("price");
						String image = rs.getString("image");
						String menu_id = rs.getString("menu_id");
						card_list.add(new MenuVO(name,price,image,menu_id));
						
					}
				
					rs.close();
					pstmt.close();
					conn.close();
					
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
				
				  return card_list;	
			}
			
			
			// 제품 클릭 -> 정보 페이지
			
			public static List<MenuVO> info_page(String menu_id) {
				
				List<MenuVO> info_list = new ArrayList<MenuVO>();
				
				try {
					conn = dataFactory.getConnection();
					String query = "SELECT NAME , price, IMAGE  from store2 where MENU_ID = ?";
					System.out.println(query);
					
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, menu_id);
					ResultSet rs = pstmt.executeQuery();
					
					while(rs.next()) {
						String name = rs.getString("name");
						int price = rs.getInt("price");
						String image = rs.getString("image");
				
						info_list.add(new MenuVO(name,price,image,menu_id));
						
					}
				
					rs.close();
					pstmt.close();
					conn.close();
					
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
				
				  return info_list;	
			}
			
			// 장바구니에 추가
			public void addCart(String user_id,String menu_id, String name, int total) {
				MenuVO menuvo = new MenuVO();
			
			try {
				
				
				conn = dataFactory.getConnection();
				
			
				String query = "insert into store2(menu_id,name,price,image,menu_type)";
					query += " values(?,?,?,?,?)"; 
				System.out.println(query);
				pstmt = conn.prepareStatement(query);
				
				pstmt.setString(1, menu_id);
				System.out.println("** :"+ menu_id);
				
				pstmt.setString(2, name);
				pstmt.setInt(3, price);
				pstmt.setString(4, image);
				pstmt.setInt(5, menu_type);
				
				int result = pstmt.executeUpdate();
				System.out.println("수정 결과 : " + result);
				
			
				pstmt.close();
				conn.close();
				
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
		}
		
			
			
			
			
			
			
//			// 장바구니 목록
//	public static List<MenuVO> cart_list (String user_id ) {
//				
//				List<MenuVO> cart_list = new ArrayList<MenuVO>();
//				
//				try {
//					conn = dataFactory.getConnection();
//					String query = "SELECT NAME , price, IMAGE  from store2, cart"
//							+ " where user_id = ?" 
//							+ "	and store2.menu_id = cart.menu_id";
//					System.out.println(query);
//					
//					pstmt = conn.prepareStatement(query);
//					pstmt.setString(1, menu_id);
//					ResultSet rs = pstmt.executeQuery();
//					
//					while(rs.next()) {
//						String name = rs.getString("name");
//						int price = rs.getInt("price");
//						String image = rs.getString("image");
//				
//						cart_list.add(new MenuVO(name,price,image,menu_id));
//						
//					}
//				
//					rs.close();
//					pstmt.close();
//					conn.close();
//					
//				} catch (SQLException e) {
//					
//					e.printStackTrace();
//				}
//				
//				  return cart_list;	
//			}
	

	
	
	
	
			
}
