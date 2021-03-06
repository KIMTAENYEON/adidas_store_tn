package kr.green.adidas.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.adidas.vo.EmailCheckVO;
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.SubCategoryVO;

public interface MemberDAO {

	MemberVO selectMember(@Param("me_email")String email);

	void insertEmailCheck(@Param("emailCheck")EmailCheckVO emailCheck);

	EmailCheckVO selectEmailCheck(@Param("em_email") String em_email);

	void deleteEmailCheck(@Param("em_email") String em_email);

	void insertMember(@Param("member") MemberVO member);

	void updateAutoLogin(@Param("user") MemberVO user);

	MemberVO selectMemberBySessionId(@Param("me_session_id") String me_session_id);

	void updateMember(@Param("member") MemberVO dbMember);

	List<SubCategoryVO> selectSubCategory();

}
