package kr.green.adidas.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.adidas.vo.CategoryVO;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.SubCategoryVO;

public interface GoodsDAO {

	void insertGoods(@Param("goods")GoodsVO goods);

	List<CategoryVO> selectCategory();

	List<SubCategoryVO> selectSubCategory(@Param("sub_ca_num") Integer sub_ca_num);
}
