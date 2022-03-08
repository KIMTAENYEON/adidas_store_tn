package kr.green.adidas.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.adidas.service.OrderService;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.OptionVO;
import kr.green.adidas.vo.OrderListVO;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value= "/order/buy", method = RequestMethod.GET)
	public ModelAndView orderBuy(ModelAndView mv, HttpServletRequest request, OrderListVO orderList){	
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		GoodsVO goods = orderService.getGoods(orderList);
		OptionVO option = orderService.getOption(orderList);
		int totalPrice = orderService.getTotalPrice(orderList);
		mv.addObject("goods", goods);
		mv.addObject("option", option);
		mv.addObject("ol_amount", orderList.getOl_amount());
		mv.addObject("totalPrice", totalPrice);
	  mv.setViewName("/goods/buy");
	  return mv;
	}
	@ResponseBody
	@RequestMapping(value= "/option/select")
	public int optionSelect(@RequestBody OptionVO option) {
		return orderService.selectOption(option);
	}
}
