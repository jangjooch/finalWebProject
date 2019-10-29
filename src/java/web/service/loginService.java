package web.service;



import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.member.MemberDao;
import web.dto.member.MemberDto;
//import web.dto.Ch10Board;

// 관리 객체화
@Service
public class loginService {
	
	private static final Logger logger = LoggerFactory.getLogger(loginService.class);
	
	@Autowired
	private MemberDao memberDao;
	
	public loginResult login(String m_id, String m_pw, HttpSession session) {
		MemberDto member = memberDao.selectMember(m_id);
		// DAO에서 DB에 접근하도록 한다.
		if(member == null) {
			logger.info("member is NULL no Such Id");
			return loginResult.FailId;
		}
		else {
			if(m_pw.equals(member.getM_pw())) {
				logger.info("login SUCESS");
				session.setAttribute("member_logined", member);
				return loginResult.Success;
			}
			else {
				logger.info("login FailPW");
				return loginResult.FailPw;
			}
		}
	}
	
}
