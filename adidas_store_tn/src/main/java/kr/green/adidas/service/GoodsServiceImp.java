package kr.green.adidas.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.adidas.dao.GoodsDAO;
import kr.green.adidas.pagination.Criteria;
import kr.green.adidas.utils.UploadFileUtils;
import kr.green.adidas.vo.CategoryVO;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.LikesVO;
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.OptionVO;
import kr.green.adidas.vo.OrderListVO;
import kr.green.adidas.vo.ReviewVO;
import kr.green.adidas.vo.SelectVO;
import kr.green.adidas.vo.SubCategoryVO;

@Service
public class GoodsServiceImp implements GoodsService{

	@Autowired
	GoodsDAO goodsDao;

	String uploadPath = "D:\\JAVA_TN\\adidas_store_tn\\upload";
	
	@Override
	public void registerGoods(GoodsVO goods, MultipartFile file, MemberVO user) {
		if(goods == null || user == null) 
			return;
		if(!user.getMe_authority().equals("관리자")) 
			return;
		if(file == null)
			return;
		if(file != null && file.getOriginalFilename().length() != 0) {
			try {
				String fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				goods.setGd_img(fileName);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		goodsDao.insertGoods(goods);
	}
	@Override
	public List<CategoryVO> selectCategory(String gender) {
		return goodsDao.selectCategory(gender);
	}

	@Override
	public List<SubCategoryVO> selectSubCategory(Integer sub_ca_num) {
		if(sub_ca_num == null || sub_ca_num <= 0)
			return null;
		return goodsDao.selectSubCategory(sub_ca_num);
	}
	@Override
	public List<GoodsVO> getGoodsList(Criteria cri, SelectVO select) {
		if(select.getSe_gender() == null || select.getSe_gender().equals("성별"))
			select.setSe_gender("");
		if(select.getSe_lineup() == 4) {
			return goodsDao.getGoodsListPopular(cri, select);
		}else {
			return goodsDao.getGoodsList(cri, select);			
		}
	}
	@Override
	public int getTotalCount(Criteria cri, SelectVO select) {
		if(select.getSe_gender() == null || select.getSe_gender().equals("성별"))
			select.setSe_gender("");
		if(select.getSe_lineup() == 4) {
			return goodsDao.selectTotalCountPopular(cri, select);	
		}else {
			return goodsDao.selectTotalCount(cri, select);			
		}
	}
	@Override
	public List<OptionVO> getTotalAmount() {
		return goodsDao.getTotalAmount();
	}
	@Override
	public boolean insertOption(OptionVO option) {
		if(option == null)
			return false;
		if(option.getOp_gd_num() <= 0)
			return false;
		if(option.getOp_size().trim().length() >= 5 || option.getOp_size().trim().length() == 0 || option.getOp_size() == null)
			return false;
		if(option.getOp_amount() <= 0)
			return false;
		OptionVO dbOption = goodsDao.selectOption(option);
		if(dbOption != null) {		
			goodsDao.addAmount(option);
		}else{
			goodsDao.insertOption(option);			
		}
		return true;
	}
	@Override
	public GoodsVO getGoods(Integer gd_num) {
		if(gd_num == null || gd_num <= 0)
			return null;		
		return goodsDao.selectGoods(gd_num);
	}
	@Override
	public List<OptionVO> getOption(Integer gd_num) {
		if(gd_num == null || gd_num <= 0)
			return null;	
		return goodsDao.getOption(gd_num);
	}
	@Override
	public boolean modifyGoods(GoodsVO goods, MemberVO user, MultipartFile file) {
		if(goods == null || user == null) 
			return false;
		if(!user.getMe_authority().equals("관리자")) 
			return false;
		GoodsVO dbGoods = goodsDao.selectGoods(goods.getGd_num());
		if(dbGoods == null)
			return false;
		if(file != null && file.getOriginalFilename().length() != 0) {
			try {
				String fileName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
				goods.setGd_img(fileName);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			goods.setGd_img(dbGoods.getGd_img());
		}
		goodsDao.updateGoods(goods);
		return true;
	}
	@Override
	public void deleteGoods(Integer gd_num, MemberVO user) {
		if(gd_num == null || gd_num <= 0)
			return;
		if(!user.getMe_authority().equals("관리자")) 
			return;
		GoodsVO dbGoods = goodsDao.selectGoods(gd_num);
		if(dbGoods == null)
			return;
		List<OptionVO> option = goodsDao.getOption(gd_num);
		for(OptionVO tmp : option) {
			goodsDao.deleteMyListOption(tmp.getOp_num());
		}
		goodsDao.deleteChoice(gd_num);
		goodsDao.deleteGoods(gd_num);
	}
	@Override
	public List<GoodsVO> selectGroupbyCategory(String gender) {
		return goodsDao.selectGroupbyCategory(gender);
	}
	@Override
	public List<GoodsVO> selectNewGoods() {
		return goodsDao.selectNewGoods();
	}
	@Override
	public OptionVO selectOption(OptionVO option) {
		if(option == null)
			return null;
		return goodsDao.selectOption(option);
	}
	@Override
	public List<ReviewVO> getReviewList(Integer gd_num, Integer lineup) {
		if(gd_num == null)
			return null;
		return goodsDao.selectReviewList(gd_num, lineup);
	}
	@Override
	public ReviewVO getMyReview(MemberVO user, Integer gd_num) {
		if(user == null)
			return null;
		if(gd_num <= 0)
			return null;
		return goodsDao.selectMyReview(user.getMe_email(), gd_num);
	}
	@Override
	public boolean getGoodsOrderCheck(String me_email, Integer gd_num) {
		if(me_email == null || gd_num <= 0)
			return false;
		OrderListVO dbOrderList = goodsDao.getGoodsOrderCheck(me_email, gd_num);
		if(dbOrderList == null) {
			return false;
		}else {
			return true;
		}
	}
	@Override
	public boolean insertReview(ReviewVO review) {
		if(review == null) {
			return false;
		}
		if(review.getRe_title() == null || review.getRe_title().trim().length() == 0)
			return false;
		if(review.getRe_content() == null || review.getRe_content().trim().length() == 0)
			return false;
		if(review.getRe_star() <= 0)
			return false;
		if(review.getRe_gd_num() <= 0)
			return false;
		if(review.getRe_me_email() == null || review.getRe_me_email().trim().length() == 0)
			return false;
		ReviewVO dbReview = goodsDao.selectMyReview(review.getRe_me_email(), review.getRe_gd_num());
		if(dbReview == null) {
			goodsDao.insertReview(review);			
		}else {
			goodsDao.updateReview(review);
		}
		return true;
	}
	@Override
	public int setLikes(LikesVO likes) {
		if(likes == null)
			return 0;
		LikesVO dbLikes = goodsDao.selectLikes(likes);
		if(dbLikes == null) {
			goodsDao.insertLikes(likes);
		}else {
			goodsDao.updateLikes(likes);
		}
		int up = goodsDao.getLikesUpCount(likes.getLi_re_num());
		int down = goodsDao.getLikesDownCount(likes.getLi_re_num());
		goodsDao.updateReviewUpDown(likes.getLi_re_num(), up, down);
		return likes.getLi_state();
	}
	@Override
	public List<LikesVO> getLikesList(MemberVO user) {
		if(user == null)
			return null;
		return goodsDao.selectLikesList(user);
	}
	@Override
	public int setLikesUpCount(Integer re_num) {
		if(re_num <= 0)
			return 0;
		return goodsDao.getLikesUpCount(re_num);
	}
	@Override
	public int setLikesDownCount(Integer re_num) {
		if(re_num <= 0)
			return 0;
		return goodsDao.getLikesDownCount(re_num);
	}
	@Override
	public boolean deleteReview(Integer re_num) {
		if(re_num <= 0)
			return false;
		goodsDao.deleteLikes(re_num);
		goodsDao.deleteReview(re_num);
		return true;
	}
}
