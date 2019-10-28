package web.dao.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import web.dao.membersDao;
import web.dto.members;

@Component
public class memberDao {
	
	private static final Logger logger = LoggerFactory.getLogger(membersDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public members selectMember(String m_id) {
		logger.info("membersDao selectMember() Activate");
		members member = sqlSessionTemplate.selectOne("members.selectMemberByMid",m_id);
		logger.info("membersDao selectMember() After sqlSessionTemplate.selectOne");
		if(member==null) {
			logger.info("member is Null didnt bring anything");
		}
		else {
			logger.info("m_id : " + member.getM_id() + "\t m_pw : " + member.getM_pw());
			logger.info("m_num : " + member.getM_num() + "\t m_phone : " + member.getM_phone());
		}
		
		// sqlSessionTemplate에 등록된 Mybatis파일의 member.xml의 
		// namespace.sql생성문 id, 변수에 넣을 값
		// 
		return member;
	}

	public int insert(members member) {
		// TODO Auto-generated method stub
		int rows = sqlSessionTemplate.insert("members.insertMember", member);
		return rows;
	}
	
}
