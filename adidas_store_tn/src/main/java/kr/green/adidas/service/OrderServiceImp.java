package kr.green.adidas.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.adidas.dao.OrderDAO;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.OptionVO;
import kr.green.adidas.vo.OrderListVO;
import kr.green.adidas.vo.OrderVO;

@Service
public class OrderServiceImp implements OrderService{
	@Autowired
	OrderDAO orderDao;

	@Override
	public int selectOption(OptionVO option) {
		if(option.getOp_gd_num() <= 0)
			return 0;
		if(option.getOp_size() == null || option.getOp_size().trim().length() == 0)
			return 0;
		return orderDao.selectOpNum(option);
	}

	@Override
	public GoodsVO getGoods(OrderListVO orderList) {
		if(orderList.getOl_op_num() <= 0 || orderList.getOl_amount() <= 0)
			return null;
		return orderDao.getGoods(orderList.getOl_op_num());
	}

	@Override
	public OptionVO getOption(OrderListVO orderList) {
		if(orderList.getOl_op_num() <= 0 || orderList.getOl_amount() <= 0)
			return null;
		return orderDao.getOption(orderList);
	}

	@Override
	public void insertOrder(OrderVO order, MemberVO user, OrderListVO orderList) {
		if(user == null)
			return;
		if(order == null)
			return;
		if(orderList == null)
			return;
		if(orderList.getOl_op_num() <= 0)
			return;
		if(orderList.getOl_amount() <= 0)
			return;
		if(order.getOr_name() == null || order.getOr_name().trim().length() == 0)
			return;
		if(order.getOr_address() == null || order.getOr_address().trim().length() == 0)
			return;
		if(order.getOr_address_detail() == null || order.getOr_address_detail().trim().length() == 0)
			return;
		if(order.getOr_postnum() == null || order.getOr_postnum().trim().length() == 0)
			return;
		if(order.getOr_phone() == null || order.getOr_phone().trim().length() == 0)
			return;
		order.setOr_me_email(user.getMe_email());
		orderDao.insertOrder(order);
		orderList.setOl_or_num(order.getOr_num());
		orderDao.insertOrderList(orderList);
	}

	@Override
	public List<OrderListVO> selectOrderList(MemberVO user) {
		if(user == null)
			return null;
		return orderDao.selectOrderList(user);
	}

	@Override
	public List<GoodsVO> selectGoodsList(List<OrderListVO> list) {
		if(list == null)
			return null;
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
		for(OrderListVO tmpOrderList : list) {
			int equals = 0;
			GoodsVO dbGoods = orderDao.getGoods(tmpOrderList.getOl_op_num());
			for(GoodsVO tmpGoodsList : goodsList) {
				if(tmpGoodsList.equals(dbGoods)) {
					equals += 1;
				}
			}
			if(equals == 0) {
				goodsList.add(dbGoods);			
			}
		}
		return goodsList;
	}

	@Override
	public List<OptionVO> selectOptionList(List<OrderListVO> list) {
		if(list == null)
			return null;
		List<OptionVO> optionList = new ArrayList<OptionVO>();
		for(OrderListVO tmpOrderList : list) {
			int equals = 0;
			OptionVO dbOption = orderDao.getOption(tmpOrderList);
			for(OptionVO tmpOption : optionList) {
				if(tmpOption.equals(dbOption)) {
					equals += 1;
				}
			}
			if(equals == 0) {
				optionList.add(orderDao.getOption(tmpOrderList));				
			}
		}
		return optionList;
	}

	@Override
	public void deleteOrderList(OrderListVO orderList) {
		if(orderList == null)
			return;
		if(orderList.getOl_num() <= 0)
			return;
		orderDao.deleteOrderList(orderList);
	}

	@Override
	public void deleteOrder(OrderListVO orderList) {
		if(orderList == null)
			return;
		if(orderList.getOl_num() <= 0)
			return;
		orderDao.deleteOrder(orderList);
	}

	@Override
	public List<OrderListVO> getOrderList(String ol_state) {
		return orderDao.getOrderList(ol_state);	
	}

	@Override
	public List<OrderVO> selectOrderList(List<OrderListVO> list) {
		if(list == null)
			return null;
		List<OrderVO> orderList = new ArrayList<OrderVO>();
		for(OrderListVO tmpOrderList : list) {
			int equals = 0;
			OrderVO dbOrder = orderDao.getOrder(tmpOrderList);
			for(OrderVO tmpOrder : orderList) {
				if(tmpOrder.equals(dbOrder)) {
					equals += 1;
				}
			}
			if(equals == 0) {
				orderList.add(orderDao.getOrder(tmpOrderList));				
			}
		}
		return orderList;
	}

	@Override
	public void updateState(OrderListVO orderList) {
		if(orderList == null)
			return;
		orderDao.updateState(orderList);
	}
	
}
