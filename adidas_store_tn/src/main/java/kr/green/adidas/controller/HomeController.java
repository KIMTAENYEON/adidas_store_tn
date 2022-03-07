package kr.green.adidas.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import kr.green.adidas.service.GoodsService;
import kr.green.adidas.service.MemberService;
import kr.green.adidas.vo.EmailCheckVO;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.SubCategoryVO;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	GoodsService goodsService;
	
	@RequestMapping(value= "/")
	public ModelAndView home(ModelAndView mv){
	  List<GoodsVO> list =	goodsService.selectGroupbyCategory();
	  mv.addObject("list", list);
	  mv.setViewName("/main/home");
	  return mv;
	}
	@RequestMapping(value= "/member/login", method = RequestMethod.GET)
	public ModelAndView loginGet(ModelAndView mv){		
	  mv.setViewName("/member/login");
	  return mv;
	}
	@RequestMapping(value= "/member/login", method = RequestMethod.POST)
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
			loginMember.setMe_auto_login(member.getMe_auto_login());
			mv.addObject("user",loginMember);
			mv.setViewName("redirect:/");
		}
	  return mv;
	}
	@RequestMapping(value= "/member/signup", method = RequestMethod.GET)
	public ModelAndView signupGet(ModelAndView mv){		
	  mv.setViewName("/member/signup");
	  return mv;
	}
	@RequestMapping(value= "/member/signup", method = RequestMethod.POST)
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
	@RequestMapping(value= "/email/check", method = RequestMethod.POST)
	public String emailCheck(@RequestBody EmailCheckVO emailCheck){	
	  return memberService.emailCheck(emailCheck);
	}
	@ResponseBody
	@RequestMapping(value= "/checknum/check", method = RequestMethod.POST)
	public String checknumCheck(@RequestBody EmailCheckVO emailCheck){	
	  return memberService.checknumCheck(emailCheck);
	}
	@RequestMapping(value= "/member/mypage", method = RequestMethod.GET)
	public ModelAndView mypageGet(ModelAndView mv){		
	  mv.setViewName("/member/mypage");
	  return mv;
	}
	@RequestMapping(value= "/member/logout", method = RequestMethod.GET)
	public ModelAndView logoutGet(ModelAndView mv, HttpServletRequest request, HttpServletResponse response){		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if(user != null) {
			//세션에 있는 유저 정보를 삭제
			request.getSession().removeAttribute("user");
			//request에 있는 쿠키 들 중에서 loginCookie 정보를 가져옴
			Cookie cookie = WebUtils.getCookie(request, "loginCookie");
			//loginCookie 정보가 있으면 => 자동로그인 했다가 로그아웃하는 경우
			if(cookie != null) {
				cookie.setMaxAge(0);
				response.addCookie(cookie);
				//자동로그인 해제를 위해 세션 아이디에 none을 저장하고, 만료시간을 현재시간으로 설정
				user.setMe_session_id("none");
				user.setMe_session_limit(new Date());
				memberService.updateAutoLogin(user);
			}
		}
	  mv.setViewName("redirect:/member/login");
	  return mv;
	}
	@RequestMapping(value= "/member/find", method = RequestMethod.GET)
	public ModelAndView findGet(ModelAndView mv){		
	  mv.setViewName("/member/find");
	  return mv;
	}
	@RequestMapping(value= "/member/find", method = RequestMethod.POST)
	public ModelAndView findPost(ModelAndView mv, MemberVO member){		
		boolean find = memberService.findPw(member);
		if(find) {
			mv.setViewName("redirect:/member/login");
		}else {
			mv.setViewName("redirect:/member/find");
		}
	  return mv;
	}
	@ResponseBody
	@RequestMapping(value= "/member/check", method = RequestMethod.POST)
	public String memberCheck(@RequestBody MemberVO member){	
	  return memberService.memberCheck(member);
	}
	@RequestMapping(value= "/member/privacy")
	public ModelAndView privacy(ModelAndView mv, HttpServletRequest request, MemberVO input){		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		MemberVO userMod = memberService.updateMember(input, user);
		if(userMod != null)
			request.getSession().setAttribute("user", userMod);
	  mv.setViewName("/member/privacy");
	  return mv;
	}
	@ResponseBody
	@RequestMapping(value= "/subcategory/all")
	public Map<String, Object> subcategoryAll(){	
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<SubCategoryVO> list = memberService.selectSubCategory();
		map.put("list", list);
	  return map;
	}
}
