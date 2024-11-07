package org.bookrental.admin.service;

import java.util.List;

import org.bookrental.admin.persistence.AdminMemberPersistenceImpl;
import org.bookrental.user.vo.AddressVO;
import org.bookrental.user.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	
	@Autowired // 스프링 빈으로 생성된 객체를 자동으로 주입해주는 애너테이션
	AdminMemberPersistenceImpl persistence;
	
	@Override
	public MemberVO idCheck(String user_id) {
		// System.out.println("=========== Service user_id : "+user_id);
		return persistence.idCheck(user_id);
	}

	@Override
	public MemberVO nickCheck(String user_nickname) {
		// System.out.println("=========== Service user_nickname : "+user_nickname);
		return persistence.nickCheck(user_nickname);
	}
	

	@Override
	public List<AddressVO> getAddrList(AddressVO addr) {
		System.out.println("=========== Sercice area3 : "+addr);
		return persistence.getAddrList(addr);
	}

	@Override
	public int insertMember(MemberVO member) {
		//System.out.println("=========== Service member name : "+ member.getUser_name());
		return persistence.insertMember(member);	
	}


	
}
