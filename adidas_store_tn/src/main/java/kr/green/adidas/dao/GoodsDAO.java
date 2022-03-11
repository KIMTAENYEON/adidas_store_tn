package kr.green.adidas.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.adidas.pagination.Criteria;
import kr.green.adidas.vo.CategoryVO;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.OptionVO;
import kr.green.adidas.vo.SelectVO;
import kr.green.adidas.vo.SubCategoryVO;

public interface GoodsDAO {

	void insertGoods(@Param("goods")GoodsVO goods);

	List<CategoryVO> selectCategory();

	List<SubCategoryVO> selectSubCategory(@Param("sub_ca_num") Integer sub_ca_num);

	List<GoodsVO> getGoodsList(@Param("cri") Criteria cri, @Param("select") SelectVO select);

	int selectTotalCount(@Param("cri") Criteria cri, @Param("select") SelectVO select);

	List<OptionVO> getTotalAmount();

	void insertOption(@Param("option") OptionVO option);

	OptionVO selectOption(@Param("option") OptionVO option);

	void addAmount(@Param("option") OptionVO option);

	GoodsVO selectGoods(@Param("gd_num") Integer gd_num);

	List<OptionVO> getOption(@Param("gd_num") Integer gd_num);

	void updateGoods(@Param("goods") GoodsVO goods);

	void deleteGoods(@Param("gd_num") Integer gd_num);

	List<GoodsVO> selectGroupbyCategory(@Param("gender") String gender);

	List<GoodsVO> selectNewGoods();
}
