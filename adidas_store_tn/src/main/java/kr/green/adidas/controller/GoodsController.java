package kr.green.adidas.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.adidas.service.GoodsService;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.MemberVO;

@Controller
public class GoodsController {
	
	@Autowired
	GoodsService goodsService;

	@RequestMapping(value= "/goods/list")
	public ModelAndView list(ModelAndView mv){		
	  mv.setViewName("/goods/list");
	  return mv;
	}
	@RequestMapping(value= "/goods/register", method = RequestMethod.GET)
	public ModelAndView registerGet(ModelAndView mv){		
	  mv.setViewName("/goods/register");
	  return mv;
	}
	@RequestMapping(value= "/goods/register", method = RequestMethod.POST)
	public ModelAndView registerPost(ModelAndView mv, GoodsVO goods, HttpServletRequest request, MultipartFile file){	
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		goodsService.registerGoods(goods, file, user);
	  mv.setViewName("redirect:/goods/list");
	  return mv;
	}
}
