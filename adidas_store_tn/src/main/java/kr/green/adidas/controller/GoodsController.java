package kr.green.adidas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.adidas.vo.GoodsVO;

@Controller
public class GoodsController {

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
	public ModelAndView registerPost(ModelAndView mv, GoodsVO goods, MultipartFile file){		
		System.out.println(file);
	  mv.setViewName("/goods/register");
	  return mv;
	}
}
