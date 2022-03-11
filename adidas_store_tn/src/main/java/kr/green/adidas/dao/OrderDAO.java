package kr.green.adidas.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.OptionVO;
import kr.green.adidas.vo.OrderListVO;
import kr.green.adidas.vo.OrderVO;

public interface OrderDAO {

	int selectOpNum(@Param("option") OptionVO option);

	GoodsVO getGoods(@Param("orderList") OrderListVO orderList);

	OptionVO getOption(@Param("orderList") OrderListVO orderList);

	int getTotalPrice(@Param("orderList") OrderListVO orderList);

	void insertOrder(@Param("order") OrderVO order);

	void insertOrderList(@Param("orderList") OrderListVO orderList);

	List<OrderListVO> selectOrderList(@Param("user") MemberVO user);

	void deleteOrderList(@Param("orderList") OrderListVO orderList);

	void deleteOrder(@Param("orderList") OrderListVO orderList);

	List<OrderListVO> getOrderList(@Param("ol_state") String ol_state);

	OrderVO getOrder(@Param("orderList") OrderListVO tmpOrderList);

	void updateState(@Param("orderList") OrderListVO orderList);

}
