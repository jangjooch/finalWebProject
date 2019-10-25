package web.service;



import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.controller.HomeController;

//import web.dao.Ch10BoardDao;

import web.dao.membersDao;
import web.dto.members;
//import web.dto.Ch10Board;

// 관리 객체화
@Service
public class loginService {
	
	private static final Logger logger = LoggerFactory.getLogger(loginService.class);
	
	@Autowired
	private membersDao memberdao;
	
	public loginResult login(String m_id, String m_pw, HttpSession session) {
		logger.info("m_id = " + m_id + "\t m_pw = " + m_pw);
		logger.info("loginSerivce login() Activate");
		members member = memberdao.selectMember(m_id);
		logger.info("loginSerivce login() After memberdao.selectMember Activate");
		// DAO에서 DB에 접근하도록 한다.
		if(member == null) {
			logger.info("member is NULL no Such Id");
			return loginResult.FailId;
		}
		else {
			if(m_pw.equals(member.getM_pw())) {
				logger.info("login SUCESS");
				session.setAttribute("m_rate", member.getM_rate());
				return loginResult.Success;
			}
			else {
				logger.info("login FailPW");
				return loginResult.FailPw;
			}
		}
	}
	
	public boolean exists(String mid) {
		logger.info("loginSerivce exists() Activate");
		
		members member = memberdao.selectMember(mid);
		// 아이디로 가져올 것이 있는가
		if(member==null)
			return true;
		else
			return false;
	}

	public void join(members member) {
		logger.info("loginSerivce join() Activate");
		
		// TODO Auto-generated method stub
		memberdao.insert(member);
	}
}
