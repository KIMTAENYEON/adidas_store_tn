package kr.green.adidas.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public ModelAndView orderBuyPost(ModelAndView mv, HttpServletRequest request){	
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if(user == null) {
			mv.setViewName("redirect:/member/login");
		}
	  return mv;
	}
	@ResponseBody
	@RequestMapping(value= "/order/pay/order")
	public int orderPayOrder(HttpServletRequest request, @RequestBody OrderVO order) {
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		return orderService.insertOrder(order, user);
	}
	@ResponseBody
	@RequestMapping(value= "/order/pay/orderList")
	public boolean orderPayOrderList(HttpServletRequest request, @RequestBody OrderListVO orderList, Integer basket) {
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		orderService.insertOrderList(orderList, basket);
		if(basket == 1) {
			choiceService.deleteMyListOrder(user.getMe_email(), orderList.getOl_op_num());
		}
		return true;
	}
	@ResponseBody
	@RequestMapping(value="/order/inicis/cancel")
	public String inicisCancel(@RequestBody OrderListVO orderList) throws IOException, ParseException {
		//access_token 발급
		HttpURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/users/getToken");
		conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Content-Type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setDoOutput(true);
		JSONObject obj = new JSONObject();
		obj.put("imp_key", "8420494889116139");
		obj.put("imp_secret", "d9dc6c5b3e484cdee7a145bf2b7b577bbd5f6142c0f6d9f450c7f44126852d2d26b010c5bd176b1e");
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		bw.write(obj.toString());
		bw.flush();
		bw.close();
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		StringBuilder sb = new StringBuilder();
		String line = null;
		while((line = br.readLine()) != null) {
		sb.append(line + "\n");
		}
		br.close();
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = (JSONObject)jsonParser.parse(sb.toString());
		JSONObject responseData = (JSONObject)jsonObj.get("response");
		String access_token = (String)responseData.get("access_token");

		//REST API(결제환불) 호출
		HttpURLConnection conn2 = null;
		URL url2 = new URL("https://api.iamport.kr/payments/cancel");
		conn2 = (HttpURLConnection)url2.openConnection();
		conn2.setRequestMethod("POST");
		conn2.setRequestProperty("Content-Type", "application/json");
		conn2.setRequestProperty("Authorization", access_token);
		conn2.setDoOutput(true);
		JSONObject obj2 = new JSONObject();
		obj2.put("reason", "테스트 환불");
		obj2.put("imp_uid", orderList.getOl_uid());
		obj2.put("amount", orderList.getOl_total_price());
		BufferedWriter bw2 = new BufferedWriter(new OutputStreamWriter(conn2.getOutputStream()));
		bw2.write(obj2.toString());
		bw2.flush();
		bw2.close();
		BufferedReader br2 = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
		StringBuilder sb2 = new StringBuilder();
		String line2 = null;
		while((line2 = br2.readLine()) != null) {
		sb2.append(line2 + "\n");
		}
		br2.close();
		return "OK";
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
