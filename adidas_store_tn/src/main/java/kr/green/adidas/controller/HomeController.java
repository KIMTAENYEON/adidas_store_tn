package kr.green.adidas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.green.adidas.service.MemberService;
import kr.green.adidas.vo.MemberVO;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value= {"/"})
	public ModelAndView home(ModelAndView mv) throws Exception{		
		MemberVO m = memberService.selectMember();
		mv.addObject("m", m);
	    mv.setViewName("/main/home");
	    return mv;
	}
	
}