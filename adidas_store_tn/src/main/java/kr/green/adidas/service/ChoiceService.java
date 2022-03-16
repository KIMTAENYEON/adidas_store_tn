package kr.green.adidas.service;

import java.util.List;

import kr.green.adidas.vo.ChoiceVO;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.MyListVO;
import kr.green.adidas.vo.OptionVO;

public interface ChoiceService {

	boolean insertChoice(ChoiceVO choice);

	List<ChoiceVO> selectChoice(MemberVO user);

	List<GoodsVO> choiceGoodsList(List<ChoiceVO> choice);

	void putMyList(Integer op_num, MemberVO user, Integer op_amount);

	List<MyListVO> getMyList(MemberVO user);

	List<OptionVO> myListOptionList(List<MyListVO> myList);

	List<GoodsVO> optionGoodsList(List<OptionVO> option);

	void updateMyList(MyListVO myList);

	void deleteMyList(Integer my_num);

	void deleteMyListOrder(String me_email, Integer op_num);

}
