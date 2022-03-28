package kr.green.adidas.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.green.adidas.pagination.Criteria;
import kr.green.adidas.vo.CategoryVO;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.LikesVO;
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.OptionVO;
import kr.green.adidas.vo.ReviewVO;
import kr.green.adidas.vo.SelectVO;
import kr.green.adidas.vo.SubCategoryVO;

public interface GoodsService {

	void registerGoods(GoodsVO goods, MultipartFile file, MemberVO user);

	List<CategoryVO> selectCategory(String gender);

	List<SubCategoryVO> selectSubCategory(Integer sub_ca_num);

	List<GoodsVO> getGoodsList(Criteria cri, SelectVO select);

	int getTotalCount(Criteria cri, SelectVO select);

	List<OptionVO> getTotalAmount();

	boolean insertOption(OptionVO option);

	GoodsVO getGoods(Integer gd_num);

	List<OptionVO> getOption(Integer gd_num);

	boolean modifyGoods(GoodsVO goods, MemberVO user, MultipartFile file);

	void deleteGoods(Integer gd_num, MemberVO user);

	List<GoodsVO> selectGroupbyCategory(String gender);

	List<GoodsVO> selectNewGoods();

	OptionVO selectOption(OptionVO option);

	List<ReviewVO> getReviewList(Integer gd_num, Integer lineup);

	ReviewVO getMyReview(MemberVO user, Integer gd_num);

	boolean getGoodsOrderCheck(String me_email, Integer gd_num);

	boolean insertReview(ReviewVO review);

	int setLikes(LikesVO likes);

	List<LikesVO> getLikesList(MemberVO user);

	int setLikesUpCount(Integer re_num);

	int setLikesDownCount(Integer re_num);

	boolean deleteReview(Integer re_num);

}
