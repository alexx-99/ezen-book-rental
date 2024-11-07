package org.bookrental.admin.service;

import java.util.List;

import org.bookrental.user.vo.AddressVO;
import org.bookrental.user.vo.MemberVO;

public interface AdminMemberService {
	
	public MemberVO idCheck(String user_id);

	public MemberVO nickCheck(String user_nickname);

	public List<AddressVO> getAddrList(AddressVO addr);
	
	public int insertMember(MemberVO member);
	
}
