package org.bookrental.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession; // 마이바티스
import org.bookrental.user.vo.AddressVO;
import org.bookrental.user.vo.MemberVO;
import org.springframework.stereotype.Repository;

@Repository // dao 역할 객체, 데이터 연결객체 = 영속 계층
public class AdminMemberPersistenceImpl implements AdminMemberPersistence {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace="org.admin.mappers.member";
	// mapper.xml에서 지정한 namespace 속성을 클래스 영역(private)에 상수(static)로 선언한다.(객체 간 공유 - 마이바티스와 연동(mapping)을 위해서) 
	@Override
	public MemberVO idCheck(String user_id) {
		// System.out.println("=========== Persistence member name : "+ user_id);
		return sql.selectOne(namespace + ".idcheck", user_id);
		// selectList : ArrayList  레코드 여러개, 목록을 가져 올때
		// selectOne : VO 하나
	}
		
		
	@Override
	public MemberVO nickCheck(String user_nickname) {
		// System.out.println("=========== Persistence user_nickname : "+ user_nickname);
		return sql.selectOne(namespace + ".nickcheck", user_nickname);
	}


	@Override
	public List<AddressVO> getAddrList(AddressVO addr) {
		System.out.println("=========== Persistence area3 : "+ addr);
		
		return sql.selectList(namespace+ ".address", addr); 
	}


	@Override
	public int insertMember(MemberVO member) {
		//System.out.println("=========== Repository member name : "+ member.getUser_name());
		// 다오까지 데이터를 넘기고 ①마이바티스와 연동 작업(root-context.xml > mapper.xml 파일 생성)을 하고 
		//② 다오클래스과 mapper.xml을 Mapping 작업을 해야한다. (namespace="org.admin.mappers.member" 일치 해야한다.)
		return sql.insert(namespace + ".register", member);
		// 반환값은 int형이다. insert문과 mapping작업 namespace + .id속성값
		// memberVO 전달
		
	}


	
}
