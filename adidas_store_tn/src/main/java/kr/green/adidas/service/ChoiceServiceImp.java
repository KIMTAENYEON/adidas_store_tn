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
import kr.green.adidas.vo.MyListVO;
import kr.green.adidas.vo.OptionVO;

@Service
public class ChoiceServiceImp implements ChoiceService{
	@Autowired
	ChoiceDAO choiceDao;
	@Autowired
	OrderDAO orderDao;

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

	@Override
	public void putMyList(Integer op_num, MemberVO user, Integer op_amount) {
		if(op_num == null || op_num <= 0 || user == null || op_amount == null || op_amount <= 0)
			return;
		MyListVO dbMyList = choiceDao.selectMyList(user, op_num);
		if(dbMyList == null) {
			choiceDao.insertMyList(user, op_num, op_amount);
		}else {
			int my_amount = dbMyList.getMy_amount() + op_amount; 
			choiceDao.updateMyList(dbMyList, my_amount);
		}
	}

	@Override
	public List<MyListVO> getMyList(MemberVO user) {
		if(user == null)
			return null;
		return choiceDao.getMyList(user);
	}

	@Override
	public List<OptionVO> myListOptionList(List<MyListVO> myList) {
		if(myList == null)
			return null;
		List<OptionVO> optionList = new ArrayList<OptionVO>();
		for(MyListVO tmpMyList : myList) {
			optionList.add(choiceDao.getOptionOpNum(tmpMyList.getMy_op_num()));
		}
		return optionList;
	}

	@Override
	public List<GoodsVO> optionGoodsList(List<OptionVO> option) {
		if(option == null)
			return null;
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
		for(OptionVO tmpOptionList : option) {
			int equals = 0;
			GoodsVO dbGoods = orderDao.getGoods(tmpOptionList.getOp_num());
			for(GoodsVO tmpGoodsList : goodsList) {
				if(tmpGoodsList.equals(dbGoods)) {
					equals += 1;
				}
			}
			if(equals == 0) {
				goodsList.add(dbGoods);			
			}
		}
		return goodsList;
	}

	@Override
	public void updateMyList(MyListVO myList) {
		if(myList == null)
			return;
		choiceDao.updateMyList(myList, myList.getMy_amount());
	}

	@Override
	public void deleteMyList(Integer my_num) {
		choiceDao.deleteMyList(my_num);
	}
}
