package kr.green.adidas.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.adidas.service.OrderService;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.OptionVO;
import kr.green.adidas.vo.OrderListVO;
import kr.green.adidas.vo.OrderVO;

@Controller
public class AdminController {

	@Autowired
	OrderService orderService;
	
	@RequestMapping(value= "/admin")
	public ModelAndView admin(ModelAndView mv){		
	  mv.setViewName("/admin/admin");
	  return mv;
	}
	@RequestMapping(value= "/admin/orderAdmin")
	public ModelAndView orderAdminGet(ModelAndView mv, String ol_state){		
		List<OrderListVO> list = orderService.getOrderList(ol_state);
		List<GoodsVO> goods = orderService.selectGoodsList(list);
		List<OptionVO> option = orderService.selectOptionList(list);
		List<OrderVO> order = orderService.selectOrderList(list);
		mv.addObject("list", list);
		mv.addObject("goods", goods);
		mv.addObject("option", option);
		mv.addObject("order", order);
		mv.addObject("state", ol_state);
	  mv.setViewName("/admin/orderAdmin");
	  return mv;
	}
	@ResponseBody
	@RequestMapping(value= "/state/change")
	public boolean state(@RequestBody OrderListVO orderList){
		orderService.updateState(orderList);
	  return true;
	}
}
