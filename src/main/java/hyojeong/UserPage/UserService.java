package UserPage;

import java.util.List;

public class UserService {
	
	//회원가입(mvc pattern2)
	public void serSigin() {
		System.out.println("serSigin이 VO를 다녀왔습니다");
		UserDAO actSigin = new UserDAO();
		actSigin.listUser();
	}
	//회원리스트 생성
	public List<UserVO>  serList() {
		System.out.println("serList가 VO를 다녀왔습니다");
		UserDAO addlist = new UserDAO();
		List<UserVO>  list = addlist.listUser();
		
		return list;
	}
	
	//로그인(mvc patter2)
	public boolean servlog(String id, String pwd) {
		System.out.println("id, pwd 값을 들고 왔는지 확인");
		UserDAO actlogin = new UserDAO();
		boolean result = actlogin.loginDAO(id, pwd);
		
		return result;
	}
	
	
	
}
