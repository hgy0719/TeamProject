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
	
	//마이페이지 내 정보 출력
	public UserVO serPage(String id) {
		System.out.println("serPage이 VO를 다녀왔습니다");
		UserDAO actpage= new UserDAO();
		UserVO result = actpage.mypage(id);
		
		return result;
	}
	
	//내 정보 업데이트
	public void serUpdate(UserVO userVO) {
		System.out.println("serUpdate가 VO를 다녀왔습니다");
		UserDAO actupdate = new UserDAO();
		actupdate.update(userVO);
	}
	
	//회원삭제
	public void serDel(String id) {
		System.out.println("serDel이 VO를 다녀왔습니다");
		UserDAO actdel= new UserDAO();
		actdel.delete(id);
	}
	
}
