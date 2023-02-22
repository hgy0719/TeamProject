package test;

public class TestService {
	
	void service() {
		System.out.println("testservice의 serivce(call)를 실행함");
		
		TestDAO testservice = new TestDAO();
		testservice.daocall();
	}
	//1-2. controller에서 service 호출
//---------------------------------------------------------------

	void service2(String aa) {
		System.out.println("testservice의 dao2 실행");

		TestDAO testservice2 = new TestDAO();
		testservice2.daocall2(aa);
	}
	//---------------------------------------------------------------	
	
	int service3 (String C) {
		System.out.println("testservice의 service3 3-11실행");
	//3-4 String인 b값을 service로 C받아옴
		TestDAO dao = new TestDAO();
		int result = dao.daocall3(C);
	//3-5 String C받은 값을 daocall3(C)로 전달
	//3-6 C값은 TestDAO의 daocall3 String(d)값으로 전달
		System.out.println("daocall3에서 받은 값: "+ result);
	//3-10 리턴되어 'int daocall3' 전달되어 온 int가 'int result'로 타고 들어옴
	//3-11 'int result'를 호출한 'int service3' 위로 되돌아가 출력이 됨
		return result;
	}
	
//----------------------------------------------------------
}










