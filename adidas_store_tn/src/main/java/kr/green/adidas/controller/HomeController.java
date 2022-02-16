package kr.green.adidas.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.green.adidas.service.MemberService;
import kr.green.adidas.vo.EmailCheckVO;
import kr.green.adidas.vo.MemberVO;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value= {"/"})
	public ModelAndView home(ModelAndView mv) throws Exception{		
	  mv.setViewName("/main/home");
	  return mv;
	}
	@RequestMapping(value= {"/member/login"}, method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mv){		
	  mv.setViewName("/member/login");
	  return mv;
	}
	@RequestMapping(value= {"/member/signup"}, method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv){		
	  mv.setViewName("/member/signup");
	  return mv;
	}
	@RequestMapping(value= {"/member/signup"}, method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv){		
	  mv.setViewName("/main/home");
	  return mv;
	}
	@ResponseBody
	@RequestMapping(value= {"/email/check"}, method = RequestMethod.POST)
	public String emailCheck(@RequestBody EmailCheckVO emailCheck){	
	  return memberService.emailCheck(emailCheck);
	}
	@ResponseBody
	@RequestMapping(value= {"/checknum/check"}, method = RequestMethod.POST)
	public String checknumCheck(@RequestBody EmailCheckVO emailCheck){	
	  return memberService.checknumCheck(emailCheck);
	}
}
