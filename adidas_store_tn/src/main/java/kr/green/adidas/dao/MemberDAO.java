package kr.green.adidas.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.adidas.vo.EmailCheckVO;
import kr.green.adidas.vo.MemberVO;

public interface MemberDAO {

	MemberVO selectMember(@Param("me_email")String email);

	void insertEmailCheck(@Param("emailCheck")EmailCheckVO emailCheck);

}
