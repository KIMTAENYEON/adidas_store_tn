package kr.green.adidas.service;

import java.util.List;

import kr.green.adidas.vo.ChoiceVO;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.MemberVO;

public interface ChoiceService {

	boolean insertChoice(ChoiceVO choice);

	List<ChoiceVO> selectChoice(MemberVO user);

	List<GoodsVO> choiceGoodsList(List<ChoiceVO> choice);

}
