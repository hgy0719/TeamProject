package hyojung;

import java.util.List;

public class UserService {
	
	//회원가입
	public void serSign(UserVO m) {
		System.out.println("serSigin이 VO를 다녀왔습니다");
		UserDAO actSigin = new UserDAO();
		 actSigin.addUser(m);

	}
	
	//중복체크
	public boolean setCheck(String id) {
		System.out.println("setCheck가 VO를 다녀왔습니다");
		UserDAO setCheck = new UserDAO();
		boolean result = setCheck.overlappedID(id);
		
		return result;
	}
	
	//회원리스트 생성
	public List<UserVO>  serList() {
		System.out.println("serList가 VO를 다녀왔습니다");
		UserDAO addlist = new UserDAO();
		List<UserVO>  list = addlist.listUser();
		
		return list;
	}
	//로그인
	public boolean servlog(String id, String pwd) {
		System.out.println("id, pwd 값을 들고 왔는지 확인");
		UserDAO actlogin = new UserDAO();
		boolean result = actlogin.loginDAO(id, pwd);
		
		return result;
	}
	//마이페이지
//		public void serPage(String pwd, String name, String email) {
//			System.out.println("serPage이 VO를 다녀왔습니다");
//			MypageDAO actpage= new MypageDAO();
//			String result = actpage.
//		}

	
}
