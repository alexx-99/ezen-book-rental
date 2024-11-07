package org.bookrental.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//관리자 직원관리 컨트롤러
@Controller
@RequestMapping(value="/admin/staff/*")
public class AdminStaffController {
	// 회원 등록 화면 처리
	@RequestMapping(value = "/join", method = RequestMethod.GET) // 화면을 보여주는 요청이라 GET
	public void join() { // 메소드명은 요청 오는 것과 같게
		
	}

}	