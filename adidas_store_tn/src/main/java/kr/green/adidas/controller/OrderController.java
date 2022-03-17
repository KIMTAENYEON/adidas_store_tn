package kr.green.adidas.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.adidas.pagination.Criteria;
import kr.green.adidas.pagination.PageMaker;
import kr.green.adidas.service.ChoiceService;
import kr.green.adidas.service.OrderService;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.ListOrderListVO;
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.MyListVO;
import kr.green.adidas.vo.OptionVO;
import kr.green.adidas.vo.OrderListVO;
import kr.green.adidas.vo.OrderVO;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	@Autowired
	ChoiceService choiceService;
	
	@RequestMapping(value= "/order/buy", method = RequestMethod.GET)
	public ModelAndView orderBuyGet(ModelAndView mv, HttpServletRequest request, OrderListVO orderList){	
		if(orderList.getOl_op_num() <= 0) {
			MemberVO user = (MemberVO) request.getSession().getAttribute("user");
			List<MyListVO> myList = choiceService.getMyList(user);
			List<OptionVO> option = choiceService.myListOptionList(myList);
			List<GoodsVO> goods = choiceService.optionGoodsList(option);
			mv.addObject("myList", myList);
			mv.addObject("option", option);
			mv.addObject("goods", goods);
			mv.setViewName("/goods/buy");
		}else{
			GoodsVO goods = orderService.getGoods(orderList);
			OptionVO option = orderService.getOption(orderList);
			mv.addObject("goods", goods);
			mv.addObject("option", option);
			mv.addObject("ol_amount", orderList.getOl_amount());
		  mv.setViewName("/goods/buy");
		}
		
	  return mv;
	}
	@RequestMapping(value= "/order/buy", method = RequestMethod.POST)
	public ModelAndView orderBuyPost(ModelAndView mv, HttpServletRequest request, OrderVO order
			, @ModelAttribute(value="ListOrderListVO") ListOrderListVO list, Integer basket){	
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if(user == null) {
			mv.setViewName("redirect:/member/login");
		}else {
			for(OrderListVO tmpOrderList : list.getList()) {				
				orderService.insertOrder(order, user, tmpOrderList);
				if(basket == 1) {
					choiceService.deleteMyListOrder(user.getMe_email(), tmpOrderList.getOl_op_num());
				}
			}
			mv.setViewName("redirect:/member/orderCheck");
		}
	  return mv;
	}
	@ResponseBody
	@RequestMapping(value= "/option/select")
	public int optionSelect(@RequestBody OptionVO option) {
		return orderService.selectOption(option);
	}
	@RequestMapping(value= "/member/orderCheck", method = RequestMethod.GET)
	public ModelAndView orderCheckGet(ModelAndView mv, HttpServletRequest request, Criteria cri, String ol_state){	
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		List<OrderListVO> list = orderService.selectOrderList(user, cri);
		List<GoodsVO> goods = orderService.selectGoodsList(list);
		List<OptionVO> option = orderService.selectOptionList(list);
		int totalCount = orderService.getTotalCountOrder(cri, ol_state);
		PageMaker pm = new PageMaker(totalCount, cri);
		mv.addObject("pm", pm);
		mv.addObject("goods", goods);
		mv.addObject("option", option);
		mv.addObject("list",list);
		mv.setViewName("/member/orderCheck");
	  return mv;
	}
	@ResponseBody
	@RequestMapping(value= "/order/cancle")
	public boolean orderCancle(@RequestBody OrderListVO orderList) {
		orderService.deleteOrderList(orderList);
		orderService.deleteOrder(orderList);
		return true;
	}
}
