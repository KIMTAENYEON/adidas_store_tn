package kr.green.adidas.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.green.adidas.pagination.Criteria;
import kr.green.adidas.pagination.PageMaker;
import kr.green.adidas.service.GoodsService;
import kr.green.adidas.vo.CategoryVO;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.OptionVO;
import kr.green.adidas.vo.SelectVO;
import kr.green.adidas.vo.SubCategoryVO;

@Controller
public class GoodsController {
	
	@Autowired
	GoodsService goodsService;

	@RequestMapping(value= "/goods/list")
	public ModelAndView list(ModelAndView mv, Criteria cri, SelectVO select){	
		List<GoodsVO> list = goodsService.getGoodsList(cri, select);
		int totalCount = goodsService.getTotalCount(cri, select);
		PageMaker pm = new PageMaker(totalCount, cri);
		if(select.getSe_gender().equals("")) {
			select.setSe_gender("성별");			
		}
		List<OptionVO> option = goodsService.getTotalAmount();
		mv.addObject("option", option);
		mv.addObject("select", select);
		mv.addObject("pm", pm);
		mv.addObject("list", list);
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
	@ResponseBody
	@RequestMapping(value= "/category")
	public Map<String, Object> category(){	
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<CategoryVO> list = goodsService.selectCategory();
		map.put("list", list);
	  return map;
	}
	@ResponseBody
	@RequestMapping(value= "/subcategory")
	public Map<String, Object> subCategory(Integer sub_ca_num){	
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<SubCategoryVO> list = goodsService.selectSubCategory(sub_ca_num);
		map.put("list", list);
	  return map;
	}
	@RequestMapping(value= "/goods/add")
	public ModelAndView addAmountGet(ModelAndView mv, Integer op_gd_num){	
		mv.addObject("op_gd_num",op_gd_num);
	  mv.setViewName("/goods/option/add");
	  return mv;
	}
	@ResponseBody
	@RequestMapping(value= "/add/option")
	public boolean addOption(@RequestBody OptionVO option){
	  return goodsService.insertOption(option);
	}
}
