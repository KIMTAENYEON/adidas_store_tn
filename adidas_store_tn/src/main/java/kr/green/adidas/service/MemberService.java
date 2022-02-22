package kr.green.adidas.service;

import java.util.List;

import kr.green.adidas.vo.CategoryVO;
import kr.green.adidas.vo.EmailCheckVO;
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.SubCategoryVO;

public interface MemberService {

	String emailCheck(EmailCheckVO emailCheck);

	String checknumCheck(EmailCheckVO emailCheck);

	boolean insertMember(MemberVO member);

	MemberVO login(MemberVO member);

	void updateAutoLogin(MemberVO user);

	MemberVO selectMemberBySessionId(String value);

	String memberCheck(MemberVO member);

	boolean findPw(MemberVO member);

	MemberVO updateMember(MemberVO input, MemberVO user);

	List<CategoryVO> selectCategory();

	List<SubCategoryVO> selectSubCategory(Integer sub_ca_num);

}
