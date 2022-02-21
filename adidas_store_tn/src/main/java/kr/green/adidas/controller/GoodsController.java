package kr.green.adidas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GoodsController {

	@RequestMapping(value= {"/goods/list"})
	public ModelAndView list(ModelAndView mv) throws Exception{		
	  mv.setViewName("/goods/list");
	  return mv;
	}
	@RequestMapping(value= {"/goods/register"}, method = RequestMethod.GET)
	public ModelAndView registerGet(ModelAndView mv) throws Exception{		
	  mv.setViewName("/goods/register");
	  return mv;
	}
}
