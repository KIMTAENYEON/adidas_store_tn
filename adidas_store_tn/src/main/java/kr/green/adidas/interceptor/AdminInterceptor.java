package kr.green.adidas.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.green.adidas.vo.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if(user == null) {
			response.sendRedirect(request.getContextPath() + "/member/login");
			return false;
		}
		if(user != null) {
			if(!user.getMe_authority().equals("관리자")) {
				response.sendRedirect(request.getContextPath() + "/");
				return false;				
			}
		}
		return true;
	}
}
