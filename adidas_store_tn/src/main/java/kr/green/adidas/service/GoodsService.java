package kr.green.adidas.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.green.adidas.pagination.Criteria;
import kr.green.adidas.vo.CategoryVO;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.MemberVO;
import kr.green.adidas.vo.OptionVO;
import kr.green.adidas.vo.SelectVO;
import kr.green.adidas.vo.SubCategoryVO;

public interface GoodsService {

	void registerGoods(GoodsVO goods, MultipartFile file, MemberVO user);

	List<CategoryVO> selectCategory();

	List<SubCategoryVO> selectSubCategory(Integer sub_ca_num);

	List<GoodsVO> getGoodsList(Criteria cri, SelectVO select);

	int getTotalCount(Criteria cri, SelectVO select);

	List<OptionVO> getTotalAmount();

}
