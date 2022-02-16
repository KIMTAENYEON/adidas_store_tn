package kr.green.adidas.service;

import kr.green.adidas.vo.EmailCheckVO;

public interface MemberService {

	String emailCheck(EmailCheckVO emailCheck);

	String checknumCheck(EmailCheckVO emailCheck);

}
