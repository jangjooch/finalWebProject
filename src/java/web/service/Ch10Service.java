package web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import web.dao.Ch10BoardDao;
import web.dao.Ch10MemberDao;
//import web.dto.Ch10Board;
import web.dto.Ch10Member;

// 관리 객체화
@Service
public class Ch10Service {
	
	@Autowired
	private Ch10MemberDao ch10memberdao;
	
	public Ch10LoginResult login(String mid, String mpassword) {
		Ch10Member member = ch10memberdao.selectMember(mid);
		// DAO에서 DB에 접근하도록 한다.
		if(member == null) {
			return Ch10LoginResult.FailId;
		}
		else {
			if(mpassword.equals(member.getMpassword())) {
				return Ch10LoginResult.Succes;
			}
			else {
				return Ch10LoginResult.FailPw;
			}
		}
	}
	
	public boolean exists(String mid) {
		Ch10Member member = ch10memberdao.selectMember(mid);
		// 아이디로 가져올 것이 있는가
		if(member==null)
			return true;
		else
			return false;
	}

	public void join(Ch10Member member) {
		// TODO Auto-generated method stub
		ch10memberdao.insert(member);
	}
}
