package kr.green.adidas.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.adidas.dao.OrderDAO;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.OptionVO;
import kr.green.adidas.vo.OrderListVO;

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
		return orderDao.getGoods(orderList);
	}

	@Override
	public OptionVO getOption(OrderListVO orderList) {
		if(orderList.getOl_op_num() <= 0 || orderList.getOl_amount() <= 0)
			return null;
		return orderDao.getOption(orderList);
	}

	@Override
	public int getTotalPrice(OrderListVO orderList) {
		if(orderList.getOl_op_num() <= 0 || orderList.getOl_amount() <= 0)
			return 0;
		return orderDao.getTotalPrice(orderList);
	}
	
}
