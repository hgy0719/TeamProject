package test;

public class TestDAO {
	
	void daocall() {
		System.out.println("TestDAO의  daocall 실행");
	}
	//1-3. service에서 dao 호출까지가 직진 방법1개 완성
//---------------------------------------------------------------
	
	void daocall2 (String strdao2) {
		System.out.println("TestDAO daocall2를 실행함");
		System.out.println("전달인자 str값: "+strdao2);
	}
	//2-1 실행할 dao를 만들고 service로 넘어감
//---------------------------------------------------------------

	int daocall3(String d) {
		System.out.println("TestDAO daocall3를 실행함");
		System.out.println("전달인자 str값: "+d);
	//3-7 TestService의 에서 전달 받은 c값을 String d값으로 받고 출력
			int result = 123;
	//3-8 123 값을에 맞는 전달인자 int값을 맞춰주고 변수result에 담아 
		System.out.println("null 값으로 오던 string을 123 값을 담아 return");
			
			return result;
	//3-9 result 값을 리턴하여 int daocall3에 다시 전달
	}
	
}
