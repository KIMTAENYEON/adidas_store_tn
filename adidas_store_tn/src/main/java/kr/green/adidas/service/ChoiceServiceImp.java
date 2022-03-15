package kr.green.adidas.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.adidas.dao.ChoiceDAO;
import kr.green.adidas.dao.OrderDAO;
import kr.green.adidas.vo.ChoiceVO;
import kr.green.adidas.vo.GoodsVO;
import kr.green.adidas.vo.MemberVO;

@Service
public class ChoiceServiceImp implements ChoiceService{
	@Autowired
	ChoiceDAO choiceDao;

	@Override
	public boolean insertChoice(ChoiceVO choice) {
		if(choice == null)
			return false;
		if(choice.getCh_state() > 2 || choice.getCh_state() < 0)
			return false;
		ChoiceVO dbChoice = choiceDao.getChoice(choice);
		if(dbChoice == null) {
			choiceDao.insertChoice(choice);
		}else {
			choiceDao.updateChoice(choice);
		}
		return true;
	}

	@Override
	public List<ChoiceVO> selectChoice(MemberVO user) {
		if(user == null)
			return null;
		return choiceDao.selectChoice(user.getMe_email());
	}

	@Override
	public List<GoodsVO> choiceGoodsList(List<ChoiceVO> choice) {
		if(choice == null)
			return null;
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
		for(ChoiceVO tmpChoiceList : choice) {
			if(tmpChoiceList.getCh_state() == 1) {
				goodsList.add(choiceDao.getGoodsChoice(tmpChoiceList.getCh_gd_num())) ;				
			}
		}
		return goodsList;
	}
}
