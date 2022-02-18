package kr.green.adidas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GoodsController {

	@RequestMapping(value= {"/goods/list"})
	public ModelAndView home(ModelAndView mv) throws Exception{		
	  mv.setViewName("/goods/list");
	  return mv;
	}
}
