package org.bookrental.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//작업 순서
	// 데이터 설계, 테이블 생성, VO객체 생성후 빈으로 등록
	// 화면 구현(모든 것x,form이나 버튼 등 먼저 구현할 것)
	// 컨트롤러를 servlet-context 등록
	// 컨트롤러의 메소드에서 어떤 url 요청을 처리할지 결정하기 -@RequestMapping
	// 요청에 해당하는 메소드명
	// 화면 처리인지 로직 처리인지 구분하여 데이터 전달방식을 정하기, 지정 안 하면 get
	// 화면처리인경우 어떤 페이지로 갈건지 지정(반환값 지정)(servlet-context에 프레픽스와 섭픽스가 지정되어 있음)
	// 다오까지 사용자가 입력한 데이터를 넘기고 마이바티스와 연동 작업을 하고 Mapping 작업을 해야한다.



//클래스 자체로는 의미가 없음 - 비닐봉투같은 것이당
//클래스 (패키지)명명 규칙을 정하는 이유는 공동개발과 유지보수를 위함이다.(추후에 이게 무슨 역할을 하는 클래스인지 알기 위해)
//핸들러 어댑터가 생략됨 
@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index"; // WEB-INF/views/index.jsp
	}
	// WEB-INF/views/index.jsp
	// 로직 처리x, 화면 처리 = get 방식
	// 로직 처리 =post 방식
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admHome() {
		return "admin/index"; // WEB-INF/views/admin/index.jsp
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String usHome() {
		return "user/index"; // WEB-INF/views/user/index.jsp
	}
	
}


//login 데이터 받아오는 순서
//- MemberVO > MemberDAOImpl > memberMapper.xml > MemberServicrImpl > MemberController
//- redirect:/ 재전송 뒤로가기 했을 떄 이전페이지가 안나온다
//<insert id="register" parameterType="org.member.vo.MemberVO"> <!-- parameterType = 파라미터가 핵심 -->
//</insert>
//<select id="login" resultType="org.member.vo.MemberVO"> <!-- resultType = select문은 반환값이 핵심 -->
//</select>



















