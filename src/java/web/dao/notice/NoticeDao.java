package web.dao.notice;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import web.dao.member.MemberDao;


@Component
public class NoticeDao {

	private static final Logger logger = LoggerFactory.getLogger(MemberDao.class);

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
