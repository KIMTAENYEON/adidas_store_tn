package kr.green.adidas.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.adidas.vo.ChoiceVO;
import kr.green.adidas.vo.GoodsVO;

public interface ChoiceDAO {

	void insertChoice(@Param("choice") ChoiceVO choice);

	ChoiceVO getChoice(@Param("choice") ChoiceVO choice);

	void updateChoice(@Param("choice") ChoiceVO dbChoice);

	List<ChoiceVO> selectChoice(@Param("me_email") String me_email);

	GoodsVO getGoodsChoice(@Param("gd_num") Integer gd_num);

}
