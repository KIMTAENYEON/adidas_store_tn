package kr.green.adidas.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.green.adidas.dao.GoodsDAO;
import kr.green.adidas.utils.UploadFileUtils;
import kr.green.adidas.vo.CategoryVO;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.SubCategoryVO;

@Service
public class GoodsServiceImp implements GoodsService{

	@Autowired
	GoodsDAO goodsDao;

	String uploadPath = "D:\\JAVA_TN\\adidas_store_tn\\adidas_store_tn\\src\\main\\webapp";
	String imgUpload = "/resources/imgUpload";
	String imgUploadPath = uploadPath + File.separator + imgUpload;
	String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
	
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
				String fileName = UploadFileUtils.uploadFile(imgUploadPath, file.getOriginalFilename(), file.getBytes());
				goods.setGd_img(File.separator + imgUpload + File.separator + fileName);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		goodsDao.insertGoods(goods);
	}
	@Override
	public List<CategoryVO> selectCategory() {
		return goodsDao.selectCategory();
	}

	@Override
	public List<SubCategoryVO> selectSubCategory(Integer sub_ca_num) {
		if(sub_ca_num == null || sub_ca_num <= 0)
			return null;
		return goodsDao.selectSubCategory(sub_ca_num);
	}
	@Override
	public List<GoodsVO> getGoodsList() {
		return goodsDao.getGoodsList();
	}
}
