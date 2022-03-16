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

	void insertOrder(OrderVO order, MemberVO user, OrderListVO orderList);

	List<OrderListVO> selectOrderList(MemberVO user);

	List<GoodsVO> selectGoodsList(List<OrderListVO> list);

	List<OptionVO> selectOptionList(List<OrderListVO> list);

	void deleteOrderList(OrderListVO orderList);

	void deleteOrder(OrderListVO orderList);

	List<OrderListVO> getOrderList(String ol_state);

	List<OrderVO> selectOrderList(List<OrderListVO> list);

	void updateState(OrderListVO orderList);

}
