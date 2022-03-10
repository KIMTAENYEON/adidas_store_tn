package kr.green.adidas.service;

import java.util.List;

import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.OptionVO;
import kr.green.adidas.vo.OrderListVO;
import kr.green.adidas.vo.OrderVO;

public interface OrderService {

	int selectOption(OptionVO option);

	GoodsVO getGoods(OrderListVO orderList);

	OptionVO getOption(OrderListVO orderList);

	int getTotalPrice(OrderListVO orderList);

	void insertOrder(OrderVO order, MemberVO user, OrderListVO orderList);

	List<OrderListVO> selectOrderList(MemberVO user);

	List<GoodsVO> selectGoodsList(List<OrderListVO> list);

	List<OptionVO> selectOptionList(List<OrderListVO> list);

}
