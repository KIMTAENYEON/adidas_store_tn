package kr.green.adidas.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.green.adidas.dao.MemberDAO;
import kr.green.adidas.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{
	
	@Autowired
	MemberDAO memberDao;

	@Override
	public MemberVO selectMember() {
		return memberDao.selectMember();
	}

}
