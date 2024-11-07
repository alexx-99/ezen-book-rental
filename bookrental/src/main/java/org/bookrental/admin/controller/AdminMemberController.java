package org.bookrental.admin.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.bookrental.admin.service.AdminMemberServiceImpl;
import org.bookrental.user.vo.AddressVO;
import org.bookrental.user.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

// 관리자 회원관리 컨트롤러
@Controller
@RequestMapping(value = "/admin/member/*")
public class AdminMemberController {

	@Autowired // 서비스객체 의존성 주입
	AdminMemberServiceImpl service;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	// 회원등록 화면 처리
	@GetMapping("/join")
	public void join() { } // 메소드명은 요청과 관련성 있게

	// 아이디 중복처리
	@PostMapping("/idcheck")
	@ResponseBody // 요청한 곳으로 반환값을 전달
	public String idCheck(HttpServletRequest request) {
		String user_id = request.getParameter("user_id");
		// System.out.println("=========== presentation member user_id : "+ user_id);
		// ajax 비동기식으로 데이터를 전달하는 이유
		// 스프링은 화면 전환 또는 새로고침으로 데이터를 처리함 같은 페이지 내의 데이터를 처리하려면 ajax를 활용한다.
		// 페이지 전환: 반환값이 void 요청한 url로 이동-- WEB-INF/views/admin/member/idCheck.jsp
		// 새로고침 : Stirng 동일한 페이지의 url 반환 return "admin/member/join "
		// 뷰를 반환하는게 아니라 결과값을 반환(@ResponseBody, return "success")
		// 전달되는 위치: ajax()의 success 속성의 data 파라미터로 전달
		// ajax({succuss: function(data)}) : 객체의 속성
		MemberVO mvo = service.idCheck(user_id);
		String result=null;
		
		
		if(mvo != null) result ="success";// 중복되는 아이디가 있음
		
		return result;

	}

	// 닉네임 중복처리
	@PostMapping("/nickcheck")
	@ResponseBody
	public String nickCheck(HttpServletRequest request) {
		
		String user_nickname = request.getParameter("user_nickname");
		// System.out.println("=========== presentation user_nickname : "+ user_nickname);
		MemberVO mvo = service.nickCheck(user_nickname);
		String result=null;
		
		
		if(mvo != null) result ="success";// 중복되는 아이디가 있음
		
		return result;
		
	}

	// 우편번호 찾기로 우편번호와 주소 처리
	@PostMapping("/zipcode")
	public String getAddrList(AddressVO addr,Model model) {		
		System.out.println("=========== presentation AddresssVO: "+ addr);
		List<AddressVO> addrList = service.getAddrList(addr);// select 
		model.addAttribute("addrList", addrList);
		// 모델 객체 : 데이터를 담는 그릇 역할, map 구조로 저장됨 // key와 value로 구성
		// 화면 단으로 처리된 데이터의 결과를 저장하여 전달하는 객체 (request 객체와 비슷함)
		// 사용법 모델 객체를 사용하는 방법 : 컨트롤러의 메소드 파라미터로 전달 받아서 사용한다.
        // model.addAttribute("변수명", 값)
		// 클래스를 전달하면 화면에서 클래스형의 첫 글자를 소문자로 반환한다.
		// 그러나 일반 자료형은 화면에 값이 출력이 되지 않고 key값이 반환된다.
		return "admin/member/join";
	}
	
	// /admin/member/admin/member/join
	// 회원등록 데이터 처리
	@PostMapping("/join")
	public String insertMember(MemberVO member) {// 어떻게 VO에 자동 저장되는데?
		// System.out.println("=========== presentation member name : "+
		// member.getUser_name());
		String pwd = member.getUser_pwd();
		String encodePwd = bCryptPasswordEncoder.encode(pwd);
		// System.out.println("=========== presentation member name : " + encodePwd);
		member.setUser_pwd(encodePwd);
		
		String url = null;
		int result = service.insertMember(member);

		if (result == 1) {
			url = "admin/member/list";
		} else {
			
			url = "admin/member/insertEx";
		}
		
		return url;
	}
	
	@GetMapping("/list")
	public void getMemberList() { }

}