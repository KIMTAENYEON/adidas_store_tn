package kr.green.adidas.service;

import kr.green.adidas.vo.EmailCheckVO;
import kr.green.adidas.vo.MemberVO;

public interface MemberService {

	String emailCheck(EmailCheckVO emailCheck);

	String checknumCheck(EmailCheckVO emailCheck);

	boolean insertMember(MemberVO member);

	MemberVO login(MemberVO member);

	void updateAutoLogin(MemberVO user);

	MemberVO selectMemberBySessionId(String value);

	String memberCheck(MemberVO member);

	boolean findPw(MemberVO member);

}
