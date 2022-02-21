package kr.green.adidas.dao;

import org.apache.ibatis.annotations.Param;

import kr.green.adidas.vo.GoodsVO;

public interface GoodsDAO {

	void insertGoods(@Param("goods")GoodsVO goods);

}
