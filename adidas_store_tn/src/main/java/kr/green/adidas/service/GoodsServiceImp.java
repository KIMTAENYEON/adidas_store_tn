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
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.OptionVO;
import kr.green.adidas.vo.SelectVO;
import kr.green.adidas.vo.SubCategoryVO;

@Service
public class GoodsServiceImp implements GoodsService{

	@Autowired
	GoodsDAO goodsDao;

	String uploadPath = "D:\\JAVA_TN\\upload";
	
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
}
