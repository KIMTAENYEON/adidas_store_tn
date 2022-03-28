package kr.green.adidas.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.green.adidas.pagination.Criteria;
import kr.green.adidas.vo.CategoryVO;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.LikesVO;
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.OptionVO;
import kr.green.adidas.vo.OrderListVO;
import kr.green.adidas.vo.ReviewVO;
import kr.green.adidas.vo.SelectVO;
import kr.green.adidas.vo.SubCategoryVO;

public interface GoodsDAO {

	void insertGoods(@Param("goods")GoodsVO goods);

	List<CategoryVO> selectCategory(@Param("gender") String gender);

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

	List<GoodsVO> getGoodsListPopular(@Param("cri") Criteria cri, @Param("select") SelectVO select);

	int selectTotalCountPopular(@Param("cri") Criteria cri, @Param("select") SelectVO select);

	List<ReviewVO> selectReviewList(@Param("gd_num") Integer gd_num);

	ReviewVO selectMyReview(@Param("me_email") String me_email, @Param("gd_num") Integer gd_num);

	OrderListVO getGoodsOrderCheck(@Param("me_email") String me_email, @Param("gd_num") Integer gd_num);

	void insertReview(@Param("review") ReviewVO review);

	LikesVO selectLikes(@Param("likes") LikesVO likes);

	void insertLikes(@Param("likes") LikesVO likes);

	void updateLikes(@Param("likes") LikesVO likes);

	List<LikesVO> selectLikesList(@Param("user") MemberVO user);

	int getLikesUpCount(@Param("re_num") Integer re_num);

	int getLikesDownCount(@Param("re_num") Integer re_num);

	void updateReview(@Param("review") ReviewVO review);

	void deleteLikes(@Param("re_num") Integer re_num);

	void deleteReview(@Param("re_num") Integer re_num);
}
