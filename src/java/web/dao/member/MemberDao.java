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
		System.out.println("DAO 주입" + m_num);
		int rows = sqlSessionTemplate.delete("member.memberDelte",m_num);
		System.out.println("DAO rows"+rows);
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

	public List<Object> selectReportList(int m_num) {
		List<Object> report = sqlSessionTemplate.selectList("member.memberReport", m_num);
		return report;
	}

	public void updateMember(MemberDto member) {
		System.out.println("디에이오");
		sqlSessionTemplate.insert("memberUpdate",member);
	}
	
	
}
