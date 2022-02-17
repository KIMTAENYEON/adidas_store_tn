package kr.green.adidas.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

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
	public ModelAndView loginGet(ModelAndView mv){		
	  mv.setViewName("/member/login");
	  return mv;
	}
	@RequestMapping(value= {"/member/login"}, method = RequestMethod.POST)
	public ModelAndView loginPost(ModelAndView mv, MemberVO member, HttpServletResponse response) throws IOException {
		MemberVO loginMember = memberService.login(member);
		if(loginMember == null) {
			response.setContentType("text/html; charset=utf-8");
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
      out.println("<script>alert('회원정보를 다시 입력하세요.');</script> ");
      out.flush();
      mv.setViewName("/member/login");
		}else {
			mv.addObject("user",loginMember);
			mv.setViewName("redirect:/");
		}
	  return mv;
	}
	@RequestMapping(value= {"/member/signup"}, method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv){		
	  mv.setViewName("/member/signup");
	  return mv;
	}
	@RequestMapping(value= {"/member/signup"}, method = RequestMethod.POST)
	public ModelAndView signupPost(ModelAndView mv, MemberVO member){		
		boolean signup = memberService.insertMember(member);
		if(signup) {
			mv.setViewName("redirect:/");			
		}else {
			mv.setViewName("redirect:/member/signup");
		}
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
	@RequestMapping(value= {"/member/find"}, method = RequestMethod.GET)
	public ModelAndView findGet(ModelAndView mv){		
	  mv.setViewName("/member/find");
	  return mv;
	}
}
