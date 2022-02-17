package kr.green.adidas.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.green.adidas.dao.MemberDAO;
import kr.green.adidas.vo.EmailCheckVO;
import kr.green.adidas.vo.MemberVO;

@Service
public class MemberServiceImp implements MemberService{
	
	@Autowired
	MemberDAO memberDao;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public String emailCheck(EmailCheckVO emailCheck) {
		if(emailCheck == null)
			return "false";
		MemberVO dbMember = memberDao.selectMember(emailCheck.getEm_email());
		if(dbMember != null)
			return "false";
		memberDao.deleteEmailCheck(emailCheck.getEm_email());
		String code = createRandomCode(6);
		emailCheck.setEm_checknum(code);
		memberDao.insertEmailCheck(emailCheck);
		
		String from = "k9313308@gmail.com";     // 보내는 사람 이메일    
    String to  = emailCheck.getEm_email();     // 받는 사람 이메일
    String title   = "이메일 인증 코드";      // 제목
    String content = "인증코드는 "+ code + "입니다.";    // 내용

    sendEmail(from, to, title, content);
    
		return "true";
	}
	
	@Override
	public String checknumCheck(EmailCheckVO emailCheck) {
		if(emailCheck == null)
			return "false";
		EmailCheckVO dbEmailCheck = memberDao.selectEmailCheck(emailCheck.getEm_email());
		if(dbEmailCheck == null)
			return "false";
		if(!dbEmailCheck.getEm_checknum().equals(emailCheck.getEm_checknum()))
			return "false";
		return "true";
	}
	
	@Override
	public boolean insertMember(MemberVO member) {
		if(member == null)
			return false;
		if(member.getMe_email() == null || member.getMe_email().trim().length() == 0)
			return false;
		if(memberDao.selectMember(member.getMe_email()) != null)
			return false;
		if(member.getMe_pw() == null || member.getMe_pw().trim().length() == 0)
			return false;
		String encPw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(encPw);
		memberDao.insertMember(member);
		return true;
	}
	
	@Override
	public MemberVO login(MemberVO member) {
		if(member == null || member.getMe_email() == null || member.getMe_email().trim().length() == 0)
			return null;
		MemberVO dbMember = memberDao.selectMember(member.getMe_email());
		if(dbMember == null)
			return null;
		if(!passwordEncoder.matches(member.getMe_pw(), dbMember.getMe_pw()))
			return null;
		return dbMember;
	}
	
	@Override
	public String memberCheck(MemberVO member) {
		if(member == null)
			return "false";
		MemberVO dbMember = memberDao.selectMember(member.getMe_email());
		if(dbMember == null)
			return "false";
    
		return "true";
	}
	
	@Override
	public boolean findPw(MemberVO member) {
		if(member == null)
			return false;
		MemberVO dbMember = memberDao.selectMember(member.getMe_email());
		if(dbMember == null)
			return false;
		String newPw = createRandomCode(8);
		String encPw = passwordEncoder.encode(newPw);
		dbMember.setMe_pw(encPw);
		memberDao.updateMember(dbMember);
		
		
		String from = "k9313308@gmail.com";     // 보내는 사람 이메일    
		String to  = member.getMe_email();     // 받는 사람 이메일
		String title   = "새 비밀번호 발급";      // 제목
		String content = "새 비밀번호는 "+ newPw + "입니다.";    // 내용
		
		sendEmail(from, to, title, content);
		return true;
	}
	//메일보내기 메소드
	private boolean sendEmail (String from, String to, String title, String content) {
		try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	          = new MimeMessageHelper(message, true, "UTF-8");
	
	      messageHelper.setFrom(from);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(to);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);  // 메일 내용
	
	      mailSender.send(message);
	  } catch(Exception e){
	      System.out.println(e);
	      return false;
	  }
		return true;
	}
	// 랜덤 코드 생성 메소드 (입력한 숫자만큼)
	private String createRandomCode(int maxSize){
		String pw = "";
		for(int i = 0; i < maxSize; i++) {
			int max = 61, min = 0;
			int r = (int)(Math.random() * (max - min +1) +min);
			if(0 <= r && r <= 9) {
				pw += (char)('0' + r);
			}else if(r <= 35) {
				pw += (char)('a' + (r - 10));
			//랜덤 수가 36~61이면 문자 A~Z
			}else if(r <= 61) {
				pw += (char)('A' + (r - 36));
			}
		}
		return pw;
	}

	@Override
	public void updateAutoLogin(MemberVO user) {
		if(user == null)
			return;
		memberDao.updateAutoLogin(user);
	}

	@Override
	public MemberVO selectMemberBySessionId(String me_session_id) {	
		return memberDao.selectMemberBySessionId(me_session_id);
	}

}
