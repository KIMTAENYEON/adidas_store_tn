package kr.green.adidas.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.adidas.vo.ChoiceVO;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.MyListVO;
import kr.green.adidas.vo.OptionVO;

public interface ChoiceDAO {

	void insertChoice(@Param("choice") ChoiceVO choice);

	ChoiceVO getChoice(@Param("choice") ChoiceVO choice);

	void updateChoice(@Param("choice") ChoiceVO dbChoice);

	List<ChoiceVO> selectChoice(@Param("me_email") String me_email);

	GoodsVO getGoodsChoice(@Param("gd_num") Integer gd_num);

	MyListVO selectMyList(@Param("user") MemberVO user, @Param("op_num") Integer op_num);

	void insertMyList(@Param("user") MemberVO user, @Param("op_num") Integer op_num, @Param("op_amount") Integer op_amount);

	void updateMyList(@Param("myList") MyListVO dbMyList, @Param("op_amount") Integer op_amount);

	List<MyListVO> getMyList(@Param("user") MemberVO user);

	OptionVO getOptionOpNum(@Param("op_num") Integer op_num);

	void deleteMyList(@Param("my_num") Integer my_num);

	void deleteMyListOrder(@Param("me_email") String me_email, @Param("op_num") Integer op_num);

}
