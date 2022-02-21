package kr.green.adidas.service;

import org.springframework.web.multipart.MultipartFile;

import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.MemberVO;

public interface GoodsService {

	void registerGoods(GoodsVO goods, MultipartFile file, MemberVO user);

}
