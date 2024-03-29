package web.dao.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import web.dto.member.MemberDto;
import web.dto.request.RequestDto;

@Component
public class MemberDao {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberDto selectMember(String m_id) {
		MemberDto member = sqlSessionTemplate.selectOne("member.selectMemberByMid",m_id);
		
		return member;
	}

	public int insert(MemberDto member) {
		logger.info("" + member.getPo_num());
		int rows = sqlSessionTemplate.insert("member.memberInsert", member);
		return rows;
	}

	public int deleteMember(int m_num) {
		int rows = sqlSessionTemplate.delete("member.memberDelte",m_num);
		return rows;
	}
	
	public int selectTotalRowNo() {
		int totalRowNo = sqlSessionTemplate.selectOne("member.selectTotalRowNum");
		return totalRowNo;
	}

	public List<MemberDto> selectList(int startRowNo, int endRowNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<MemberDto> memberList = sqlSessionTemplate.selectList("member.memberList", map);
		logger.info("DAO");
		return memberList;	
	}


	public MemberDto selectOneMember(int m_num) {
		MemberDto member = sqlSessionTemplate.selectOne("member.selectMember",m_num);
		return member;
	}

	public List<RequestDto> selectReportList(int m_num, int startRowNo, int endRowNo) {
		Map<String , Integer> map = new HashMap<>();
		map.put("m_num", m_num);
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<RequestDto> report = sqlSessionTemplate.selectList("member.memberReport", map);
		return report;
	}

	public void updateMember(MemberDto member) {
		sqlSessionTemplate.insert("memberUpdate",member);
	}


	public List<MemberDto> selectSearchMember(String searchThing, String things, int startRowNo, int endRowNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("searchThing", searchThing);
		map.put("things", things);
		map.put("startRowNo", startRowNo);
		map.put("endRowNo", endRowNo);
		List<MemberDto> searchList = null;
		if (searchThing.equals("m_name")) {
			searchList = sqlSessionTemplate.selectList("member.searchMemberListName", map);
		} else if (searchThing.equals("m_phone")) {
			searchList = sqlSessionTemplate.selectList("member.searchMemberListPhone", map);
		} else if (searchThing.equals("po_num")) {
			System.out.println("searchThing: " + searchThing);
			searchList = sqlSessionTemplate.selectList("member.searchMemberListPosition", map);
		} else if (searchThing.equals("m_num")) {
			searchList = sqlSessionTemplate.selectList("member.searchMemberListMemberNum", map);
		}
		return searchList;
	}

	public int selectSearchTotalRowNo(String searchThing , String things) {
		int totalRowNo = 0;
		if (searchThing.equals("m_num")) {
			totalRowNo = sqlSessionTemplate.selectOne("member.selectSearchTotalRowNo1",things);
		} else if (searchThing.equals("m_name")) {
			totalRowNo = sqlSessionTemplate.selectOne("member.selectSearchTotalRowNo2",things);
		} else if (searchThing.equals("m_phone")) {
			totalRowNo = sqlSessionTemplate.selectOne("member.selectSearchTotalRowNo3",things);
		} else if (searchThing.equals("po_num")) {
			totalRowNo = sqlSessionTemplate.selectOne("member.selectSearchTotalRowNo4",things);
		}
		return totalRowNo;
	}
	
	public MemberDto gcsLogin(String m_id) {
		MemberDto member = sqlSessionTemplate.selectOne("member.gcsLogin",m_id);
		
		return member;
	}

	public int getDetailTotalRowNo(int m_num) {
		int totalRowNo = sqlSessionTemplate.selectOne("member.getDetailTotalRowNo", m_num);
		return totalRowNo;
	}
	
	
}
