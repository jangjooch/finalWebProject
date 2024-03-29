package web.service.member;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.controller.HomeController;
import web.dao.member.MemberDao;
import web.dto.member.MemberDto;
import web.dto.request.RequestDto;

@Service
public class MemberSerivce {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	MemberDao memberDao;

	
	
	public void deleteMember(int m_num) {
		memberDao.deleteMember(m_num);
	}

	// 페이징
	public int getTotalRowNo() {
		int totalRowNum = memberDao.selectTotalRowNo();
		return totalRowNum;
	}

	public List<MemberDto> getMemberList(int startRowNo, int endRowNo) {
		List<MemberDto> memberList = memberDao.selectList(startRowNo, endRowNo);
		logger.info("SERVICE");
		return memberList;
	}
	
	
	// 멤버 등록
	public void insertMember(MemberDto member) {
		memberDao.insert(member);
	}


	public MemberDto getMember(int m_num) {
		MemberDto member = memberDao.selectOneMember(m_num);
		return member;
	}

	public List<RequestDto> getReport(int m_num, int startRowNo, int endRowNo) {
		List<RequestDto> report = memberDao.selectReportList(m_num, startRowNo, endRowNo);
		return report;
	}


	public boolean checkMid(String m_id) {
		MemberDto member = memberDao.selectMember(m_id);
		if (member == null) {
			return true;
		} else {
			return false;
		}
	}

	public void updateMember(MemberDto member) {
		memberDao.updateMember(member);
	}


	public List<MemberDto> getSearchList(String searchThing ,String things, int startRowNo, int endRowNo) {
		List<MemberDto> searchList = memberDao.selectSearchMember(searchThing,things,startRowNo, endRowNo);
		return searchList;
	}

	public int getSearchTotalRowNo(String searchThing,String things) {
		int totalRowNum = memberDao.selectSearchTotalRowNo(searchThing, things);
		return totalRowNum;
	}
	
	// 형철이가 손댐 - gcs 에서 회원 정보 가져오기
	public MemberDto getGcsLogin(String msgid) {
		
		MemberDto member = memberDao.gcsLogin(msgid);
		return member;
	}

	public int getDetailTotalRowNo(int m_num) {
		int totalRowNum = memberDao.getDetailTotalRowNo(m_num);
		return totalRowNum;
	}

}
